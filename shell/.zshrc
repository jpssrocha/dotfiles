# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# . "$HOME/.profile"
. "$HOME/.cargo/env"

# Path to your oh-my-zsh installation.
export ZSH="/home/jpsrocha/.oh-my-zsh"
export PATH=$PATH:$HOME/MEGA/System_Setup/bin

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jpsrocha/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jpsrocha/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/jpsrocha/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jpsrocha/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/jpsrocha/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/jpsrocha/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# Custom environment variables

# It's better to set the PATH variable on .profile !!!
#export PATH="$HOME/Dropbox/scripts:/home/joaopedro/eclipse/java-2020-03/eclipse:/home/joaopedro/.joplin:$PATH"
#export PATH="$HOME/Dropbox/stand-alone:$HOME/Dropbox/scripts:$HOME/anaconda3:$PATH"
#
export PKG_CONFIG_PATH="$HOME/anaconda3/lib/pkgconfig"
export PJT="$HOME/MEGA/Projects"
export WD="$HOME/MEGA/WD"
export ARCHIVE="$HOME/MEGA/Archive"
export REF="$HOME/MEGA/Reference"
export WDP="$PJT/active/Research_Wild-Duck-Pipeline_1-1-2019/res/WildDuckPipe"
export PYTHONPATH="$HOME/Dropbox/py_quick_access:$WDP:$PJT/active/Research_RRLyr-Completeness_25-04-2021/res/gaia_getter"
export EDITOR="nvim"
export NOTES="$HOME/Dropbox/Notebooks"
export DATA="$HOME/Documents/Data" # Data of data-intensive projects

# Aliases

#   Vim
alias vi="nvim"
alias vrc="nvim ~/dotfiles/vim/.config/nvim/init.lua -c 'cd %:p:h'"
alias vf='vi -c Files'
alias vw='vi -c VimwikiIndex'
alias vs='cd  ~/.local/state/nvim/swap/'

#   Filesystem
alias t='tree -L 2'
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -l --icons'
alias d='du -sh * | sort -rh'
alias md='mkdir -p'
alias cp="cp -r"
alias rr="rm -r"
alias sudo='sudo '
alias op="xdg-open"

#   Python
alias p='python -i'
alias python="python3"
alias ipy="ipython"
alias acb="conda activate base"
alias jn="jupyter notebook"

#   Utils
alias ds9="ds9 -scale mode zscale -zoom .25"
export md2pdf="pandoc --pdf-engine=xelatex --variable geometry:\"top=2cm, bottom=1.5cm, left=2.5cm, right=2.5cm\" --variable fontsize:12pt -o"
alias scc="ffmpeg -y -f x11grab -s $(xdpyinfo | grep dimensions | awk '{print $2}') -i :0.0  -f alsa -i default  -c:v libx264 -r 30 -c:a flac"

# Easy access
alias flow="loffice $WD/finances/res/legacy_system/flow_11-05-2022.csv"
alias savings="vi -c 'norm G' /home/joaopedro/Dropbox/eBrain/finances/res/legacy_system/flow_savings.csv"
alias balance="vi -c 'norm G' /home/joaopedro/Dropbox/eBrain/finances/res/legacy_system/accounts.csv"

# Functions
pjt () {cd $(find $PJT -type d -not -path '*/.*' -not -path '*/node_modules*' |  fzf)};
ref () {cd $(find $REF -type d |  fzf)};
arc () {cd $(find $ARCHIVE -type d |  fzf)};
docs () {cd $(find $PJT/active $PJT/parked $PJT/incubation -type d -name docs |  fzf) && vi -c Files}
cnt () {cd $(find $NOTES -type d | fzf)};
fh () {cd $(find . -type d -not -path '*/.*' -not -path '*/node_modules*'| fzf)};

function cd {
 builtin cd $@
 pwd > ~/.last_dir
}

if [ -f ~/.last_dir ]
 then cd `cat ~/.last_dir`
fi

# Plugins

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Development variables

# Python stuff
export PIPENV_VENV_IN_PROJECT=1

# Node stuff
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


[ -f "/home/joaopedro/.ghcup/env" ] && source "/home/joaopedro/.ghcup/env" # ghcup-env

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
