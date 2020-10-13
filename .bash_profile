###########################################
#   ALIASES
###########################################

# my commonly mistyped commands
alias got='git'
alias gut='git'
alias ptyhon='python'
alias pyhton='python'
alias pythin='python'
alias maek='make'
alias meak='make'
alias mkae='make'

# helpful shortcuts
alias home='cd ~'

# open specific dotfiles in vim
alias bp='vim ~/projects/bash_profile'
alias vimrc='vim ~/projects/vimrc'

# quick access to project directories
alias c="cd ~/projects/c_book"
alias dsa="cd ~/projects/dsa"
alias crap="cd ~/projects/crap"
alias prj='cd ~/projects'

# for ls colors
alias ls='ls -GFh'
############################################



# switch to toggle terminal directory details
# 0 enables showing of current directory
# 1 will hide and just show $
sim_term=0
if [ $sim_term == 1 ]
then
  export PS1='\u$ '
fi


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH


# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
#export PATH
export PATH=/usr/local/share/python:$PATH

# PATH for twine
export PATH="/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/twine-pypi.rb:${PATH}"

# for some reason this below is required for the terminal to recognize latest python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## FUNCTIONS

# shortcut to open a file in visual studio code
function vs
{
  open $1 -a "visual studio code"
}

# create directory and automaticaly cd into it
function mkcdir
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# touch file and automatically open it in vs code
function create
{
  touch $1 &&
  open $1 -a "visual studio code"
}

# stage, commit, and push to github in one go
function gitgo
{
  git add . && git commit -m "$1" && git push
}

# basic c project boilerplate
function boilerplate
{
  touch .gitignore && touch Makefile && touch README.md
}

