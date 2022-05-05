if [ ! -d ~/.nvm ]; then
  echo "nvm install started..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  . ${HOME}/.nvm/nvm.sh
  . ${HOME}/.profile
  . ${HOME}/.bashrc
fi
# install node
nvm install node --lts

curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

curl -sLO https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb && sudo dpkg -i nvim-linuxx64.deb

curl -sLO https://github.com/wfxr/code-minimap/releases/download/v0.6.4/code-minimap_0.6.4_amd64.deb && sudo dpkg -i code-minimap_0.6.4_amd64.deb

curl -sLO https://github.com/lando/lando/releases/download/v3.6.5/lando-x64-v3.6.5.deb && sudo dpkg -i lando-x64-v3.6.5.deb

  # install packages
    sudo apt install zsh \
    stow \
    yarn \
    fzf \
    fd-find \
    ripgrep \
    bat \
    direnv \
    bpytop \
    ranger \
    trash-cli 
     	
	      

		cd ${HOME}/.dotfiles
		echo "stowing files..."
		# stow dotfiles
		stow git
		stow zsh
		stow nvim
		stow bpytop
		stow fonts
		stow ranger

 	#install required dependencies for building packages mostly
 	echo "installing bunch of packages to your `uname -n` desktop"
  
  	echo "installing packages using default package manager"
	sudo apt install -y gcc \
	       make \
	       python3 \
	       python3-pip \
	       imagemagick \
	       ffmpeg \
	       git \

		echo "installing zsh and setting up things..."
		# add zsh as a login shell
		command -v zsh | sudo tee -a /etc/shells

		echo "changing default shell"
		# use zsh as default shell
		sudo chsh -s $(which zsh) $USER

		echo "tweaking zsh..."
		# bundle zsh plugins 
		antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

		echo "started installing node packages..."
		# install neovim plugins and requirements
		npm i -g vscode-langservers-extracted
		npm i -g typescript typescript-language-server

		echo "finish nvim set up..."
		nvim --headless +PlugInstall +qall

		echo "finishing..."
		# Use kitty or Alacritty terminal on Linux
		[ `uname -s` = 'Linux' ] && stow kitty 
		
		cd wallpapers
		sudo mkdir /usr/share/backgrounds/wallpapers/
		sudo find . -name "*.png" -exec cp '{}' /usr/share/backgrounds/wallpapers/ \;
    #install rust cargo
	curl https://sh.rustup.rs -sSf | sh
	echo "DONE BOSS!SEE YA!"
