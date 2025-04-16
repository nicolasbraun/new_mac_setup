#	                ██
#	               ░██
#	 ██████  ██████░██      ██████  █████
#	░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#	   ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#	  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#	 ██████ ██████ ░██  ░██░███   ░░█████
#	░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_UPDATE=true
HYPHEN_INSENSITIVE=true

unsetopt nomatch
unsetopt flowcontrol

setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS

typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red' 'trash' 'underline,fg=red')

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:git-checkout:*' sort false

DOTFILES_PATH=$HOME/new_mac_setup
ZSH_CUSTOM=$DOTFILES_PATH/zsh-custom
ZSH_THEME="dpoggi"


PATH="/bin"
path+=($DOTFILES_PATH/bin)
path+=($DOTFILES_PATH/bin/misc)
path+=($DOTFILES_PATH/bin/git)
path+=(/usr/local/bin)
path+=(/usr/local/opt)
path+=(/usr/local/share/npm/bin)
path+=(/usr/local/git/bin)
path+=(/usr/local/bin)
path+=(/usr/bin)
path+=(/bin)
path+=(/usr/local/sbin)
path+=(/usr/sbin)
path+=(/sbin)
path+=(/opt/homebrew/bin)
path+=($ANDROID_HOME/emulator)
path+=($ANDROID_HOME/platform-tools)
path+=($ANDROID_HOME/tools)
path+=($ANDROID_HOME/tools/bin)
path+=($ANDROID_HOME/cmdline-tools/latest/bin)
path+=($HOME/Development/flutter/bin)
path+=($HOME/.pub-cache/bin)
path+=($PYENV_ROOT/bin)
export PATH

eval "$(pyenv init --path)" # PyEnv

plugins=(
    zsh-nvm # Keep first for dependencies needing nvm
    aliases
    aws
    brew
    common-aliases
    copyfile
    docker
    dotenv
    encode64
    flutter
    forgit
#    fzf
    git
    git-extras
    git-prompt
    gradle
    jenv
    node
    pyenv
    qrcode
    rbenv
    ruby
    rvm
    terraform
    xcode
    zsh-syntax-highlighting
    z
)

source $DOTFILES_PATH/.oh-my-zsh/oh-my-zsh.sh
source $ZSH_CUSTOM/zshrc-loaded
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicolasbraun/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nicolasbraun/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nicolasbraun/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nicolasbraun/google-cloud-sdk/completion.zsh.inc'; fi
