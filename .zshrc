C_INCLUDE_PATH=/usr/local/include
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME"/.oh-my-zsh
# make fzf recognize hidden files but not git stuff
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ "$OSTYPE" == "darwin"* ]]; then
	# loading this causes problems in Linux, only load if on MacOS
	autoload -U promptinit; promptinit
	prompt pure
fi

# For a full list of active aliases, run `alias`.
alias py="python3"
alias tend="tmux kill-session"
alias otool="otool -tvV"  # make default flags for otool
alias vi='vim'
alias tree='tree -C'	# print dir tree with colors
# use fzf to preivew files
alias pf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# C & C++ cross-compilers for compiling programs for ARM Cortex architecture on MacOS
alias arm-gcc='arm-none-eabi-gcc'
alias arm-g++='arm-none-eabi-g++'

export BAT_THEME=Nord  # color them for bat (cat replacement)

##
## stuff for goto script
export GOTO_DIR=$HOME/projects/
alias goto='. goto'


######################################################
# FUNCTIONS                                          #
######################################################
# quickly add testing framework file to project
# usage: $ minunit > minunit.h
minunit() { curl https://raw.githubusercontent.com/breakthatbass/minunit/master/minunit.h }
# .gitignore generator script
# usage: gitignore <language>
gitignore() {  curl -L -s https://www.toptal.com/developers/gitignore/api/"$1" > .gitignore	}

# mkdir and cd into it
mkcdir() {
  mkdir -p -- "$1" &&
	cd -P -- "$1"
}
# open a file in vs code. if it doesn't exist, create it
# usage: vs <file>
vs() { touch $1 && open $1 -a "visual studio code" }
# clean out those annoying swp files
cleanvim() { rm ~/.vim/tmp/*.*.swp && rm ~/.vim/tmp/*.swp}
### the cd function above prevents cd from going to the home directory
function home() { cd "$HOME" }

######################################################
# $PATH STUFF AND ENV VARIABLES                     #
######################################################
# PYTHON STUFF
# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
#export PATH
export PATH=/usr/local/share/python:$PATH
# for some reason this below is required for the terminal to recognize latest python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="/usr/local/opt/binutils/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/binutils/lib"
export CPPFLAGS="-I/usr/local/opt/binutils/include"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
# add homemade scripts to path
export PATH="$HOME/bin:$PATH"
# mspdebug looks for this environment variable
export MSPDEBUG_TILIB_PATH=~/ti/msp430-gcc/bin/

# homemade scripts
export PATH="/usr/local/sbin:$PATH"

#/System/Library/Frameworks/Python.framework/Versions/Current/Headers
