#!/bin/sh

# install script --> detect the OS and install all the necessary goodies

# colors for printing
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
PURP='\033[0;35m'
NC='\033[0m' # No Color

DEBUG=1
OS=$(uname)

if [ "$DEBUG" > 0 ]; then
	echo -e "	${RED}DEBUG mode${NC}"
fi

# print this when we're done installing something
done_task() {
  echo -e "   ${RED}-->${NC} done"
}


if [ "$OS" = "Linux" ]; then
	echo -e "	OS --> ${BLUE}$OS${NC}"
	echo -e "🍬  Installing the goodies"

  # run the linux script remotely
  /bin/bash -c "$(curl -fsSl https://raw.githubusercontent.com/breakthatbass/dotfiles/main/linux)"
  done_task

elif [ "$OS" == "Darwin" ];
then
	echo -e "	OS --> ${BLUE}$OS${NC}"
	if [ DEBUG -gt 0 ];
	then
    echo "in DEBUG branch"
    # this section is for testing stuff in the script
    # without having to go through the homebrew nonsense
    # and other installation stuff
		
		echo -e "🍬  Installing the goodies"
    done_task
	
	else
		echo -e "🍬  Installing the goodies"

		# install homebrew
    echo -e "installing ${PURP}HomeBrew${NC} 🍺"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    done_task		
    
		echo -e "🍬  Installing the goodies"
# run the brew file to install all the goodies
		brew bundle
    done_task
	fi

else
	# if we're here then you got a job that probably requires windows...womp womp
	echo -e "${RED}$OS${NC} is not supported...womp womp"
	echo "exiting..."
	exit 1
fi


if [ "$DEBUG" < 1 ];
then
  # here we pput all the stuff we want to do that works
  # on both Darwin and Linux

	echo -e "creating symlinked ${PURP}dotfiles${NC}"
# create the symlinks for the config files
	ln -sfn ~/projects/dotfiles/.zshrc ~
	ln -sfn ~/projects/dotfiles/.vimrc ~
	ln -sfn ~/projects/dotfiles/.tmux.conf ~
  # bin directory
  ln -s ~/projects/dotfiles/bin ~
  # terminal stuff
  ln -s ~/projects/dotfiles/terminal ~
  done_task
  
  # make ZSH default shell
  echo -e "setting ${PURP}ZSH${NC} as default shell"
  sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
  done_task

  echo -e "installing ${PURP}oh-my-zsh${NC}"
  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  done_task

  # configure fzf for vim
  set rtp+=/usr/local/opt/fzf
fi
