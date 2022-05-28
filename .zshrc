# .zshrc
C_INCLUDE_PATH=/usr/local/include
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'

# required for pure prompt
fpath+=/home/tgamache/.zsh/pure

autoload -U promptinit; promptinit
prompt pure

# For a full list of active aliases, run `alias`.
alias py="python3"
alias tree='tree -C'	# print dir tree with colors
# use fzf to preivew files
alias pf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# always typing got when i mean to type go
alias got='go'
alias l='ls -la'
alias ls='ls -G' # enable colorized optput


## stuff for goto script
export GOTO_DIR=$HOME/projects/
alias goto='. goto'

# usage: gitignore <language>
gitignore() {  curl -L -s https://www.toptal.com/developers/gitignore/api/"$1" > .gitignore }

# mkdir and cd into it
mkcdir() { mkdir -p -- "$1" && cd -P -- "$1" }

code() { touch $1 && open $1 -a "visual studio code" }

# PYTHON STUFF
# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH=/usr/local/share/python:$PATH
# for some reason this below is required for the terminal to recognize latest python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#export PATH="/usr/local/opt/binutils/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/binutils/lib"
#export CPPFLAGS="-I/usr/local/opt/binutils/include"
#export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
# add homemade scripts to path
export PATH="$HOME/bin:$PATH"
# mspdebug looks for this environment variable
export MSPDEBUG_TILIB_PATH=~/ti/msp430-gcc/bin/

# homemade scripts
export PATH="/usr/local/sbin:$PATH"

