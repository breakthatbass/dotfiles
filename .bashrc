###   Aliases
alias got='git'
alias gut='git'
alias maek='make'
alias meak='make'
alias mkae='make'
alias py='python'
alias h='cd ~'
alias brc='vim ~/projects/dotfiles/.bashrc'
alias vimrc='vim ~/projects/dotfiles/.vimrc'
alias c="cd ~/projects/c_book"
alias dsa="cd ~/projects/dsa"
alias dot='cd ~/projects/dotfiles'
alias crap="cd ~/projects/crap"
alias prj='cd ~/projects'
alias ls='ls -GFh'  # ls colors
alias tend='tmux kill-session'


### Prompt
# \u		- username
# \h		- hostname
# \w		- pwd
# colors
# \e[		- indicates the start of the color
# x;ym		- indicates the color code. x is 1 or 0. 1 = dark, 0 = light, y = 30 - 36, m = m
# \e[m		- indicates end of color

sim_term=0	# toggle switch for default prompt
if [ $sim_term == 1 ]
then
	export PS1="\e[0;33m\w\e[m\e[1;31m$\e[m "
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

### functions

function vs
{
  open $1 -a "visual studio code"
}

function mkcdir
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

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

