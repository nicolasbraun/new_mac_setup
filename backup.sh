#!/bin/bash

BACKUP_VOLUME="/Volumes/NICO"
BACKUP_FOLDER="backup"
BACKUP_PATH="$BACKUP_VOLUME/$BACKUP_FOLDER"

###########################################
#                                         #
#    Dev .env files and secrets 		  #
#                                         #
###########################################

SOURCES_DIR="$HOME/Sources"
ENV_FILES_BACKUP_FOLDER="Sources_backup"

# Check if the source directory exists
if [ ! -d "$SOURCES_DIR" ]; then
    echo "Error: Source directory $SOURCE_DIR does not exist."
    exit 1
fi

# Check if the backup path exists, create if not
if [ ! -d "$BACKUP_PATH" ]; then
    echo "Backup path does not exist, creating it..."
    mkdir -p "$BACKUP_PATH"
fi

find "$SOURCES_DIR" -type f -name ".env*" | while read -r env_file; do
    relative_path="${env_file#$SOURCES_DIR/}"
    backup_dir="$BACKUP_VOLUME/$BACKUP_FOLDER/$ENV_FILES_BACKUP_FOLDER/$(dirname "$relative_path")"
    mkdir -p "$backup_dir"
    cp "$env_file" "$backup_dir/"
    echo "Backed up $env_file to $backup_dir/"
done

find "$SOURCES_DIR" -type d -name "secrets" | while read -r secrets_dir; do
    relative_path="${secrets_dir#$SOURCES_DIR/}"
    backup_dir="$BACKUP_VOLUME/$BACKUP_FOLDER/$ENV_FILES_BACKUP_FOLDER/$relative_path"
    mkdir -p "$backup_dir"
    cp -r "$secrets_dir/" "$backup_dir/"
    echo "Backed up $secrets_dir to $backup_dir/"
done

echo "Backup complete."

###########################################
#                                         #
#           Firefox profile   		      #
#                                         #
###########################################

FF_PROFILES_DIR="$HOME/Library/Application Support/Firefox/Profiles"
FF_DEFAULT_PROFILE_PATH=$(find "$FF_PROFILES_DIR" -type d -name "*.default-release" | head -n 1)
FF_PROFILE_BACKUP_FOLDER="Firefox_profile"
cp -r "$FF_DEFAULT_PROFILE_PATH" "$BACKUP_PATH/$FF_PROFILE_BACKUP_FOLDER"
echo "Backed up Firefox profile to $BACKUP_PATH/$FF_PROFILE_BACKUP_FOLDER"

###########################################
#                                         #
#           Foundry VTT       		      #
#                                         #
###########################################

# TODO

###########################################
#                                         #
#                 SSH       		      #
#                                         #
###########################################

SSH_BACKUP_FOLDER="SSH"
SSH_BACKUP_PATH="$BACKUP_PATH/$SSH_BACKUP_FOLDER/.ssh"
mkdir -p "$SSH_BACKUP_PATH"
cp -r "$HOME/.ssh" "$SSH_BACKUP_PATH"
