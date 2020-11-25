# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/taylorgamache/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# For a full list of active aliases, run `alias`.
alias zshconfig="vim  ~/projects/dotfiles/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias bashconfig="vim ~/.bashrc"
alias py="python3"
alias h="cd ~"
alias vimconfig="vim ~/projects/dotfiles/.vimrc"
alias tend="tmux kill-session"
##### dir shortcuts
alias c="cd ~/projects/c_book"
alias pop="cd ~/projects/pop"
alias dsa="cd ~/projects/dsa"
alias dot="cd ~/projects/dotfiles"
alias crap="cd ~/projects/crap"
alias prj="cd ~/projects"
alias ostep="cd ~/projects/ostep"

mkcdir() {
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

# stage, commit, and push to git in one go
gitgo() {
	git add . && git commit -m "$1" && git push
}

vs() {
	open $1 -a "visual studio code"
}

# clean out those annoying swp files
cleanvim() {
	cd ~/.vim/tmp && rm *.*.swp && rm *.swp
}

# PYTHON STUFF
# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
#export PATH
export PATH=/usr/local/share/python:$PATH

# for some reason this below is required for the terminal to recognize latest python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

