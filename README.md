# Usage

Used to setup a new Mac quickly.

## To backup the existing Max

- Ensure this repo is fully pushed to remot
- Check [`backup.sh`](./backup.sh) to enable what you want and change vars. This will backup:
  - `Firefox`: Profile
  - `SSH`: Keys
  - `Sources`: env files
- `Firefox` : Backup Sideberry Settings to JSON (bottom of the settings)
  - `Raycast` : Export settings to JSON
    `FoundryVTT`: Backup files

## To Install

```shell
# Clone this repository to ~/new_mac_setup (with submodules)
# Use HTTPs URL if you SSH is not set yet!
$ git clone --recursive https://github.com/nicolasbraun/new_mac_setup.git ~/new_mac_setup
# Run the installer
$ sh ~/new_mac_setup/install.sh
# Do the manual stuff
```

Mostly inspired from : https://github.com/bradp/dotfiles
