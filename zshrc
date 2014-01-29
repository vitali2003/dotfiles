# autojump and tab completion for it
source /usr/share/autojump/autojump.zsh 
autoload -U compinit && compinit
# aliases
source $HOME/.bash_aliases


# Oh-my-zsh
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$HOME/.cabal/bin:$PATH

#begin numenta
# Installation path
 export NTA=$HOME/nta/eng
 # Target source/repo path. Defaults to $PWD
 # Don't forget change the /PATH/
 export NUPIC=$HOME/Documents/nupic/nupic
 # Convenience variable for temporary build files
 export BUILDDIR=/tmp/ntabuild
 # Number of jobs to run in parallel (optional)
 export MK_JOBS=3

 # Set up the rest of the necessary env variables. Must be done after
 # setting $NTA.
 source $NUPIC/env.sh
 #end numenta

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# For virtual env obv.
export WORKON_HOME=$HOME/.virtualenvs 
source /usr/local/bin/virtualenvwrapper.sh 
export PIP_VIRTUALENV_BASE=$WORKON_HOME
