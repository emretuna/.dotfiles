if [ ! -d ~/.nvm ]; then
  echo "nvm install started..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  . ${HOME}/.nvm/nvm.sh
  . ${HOME}/.profile
  . ${HOME}/.bashrc
fi
# install node
nvm install node --lts


echo "Installing Brave repository key"
		sudo apt install apt-transport-https curl		
		sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
		echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list		
		echo "adding i3-gaps repo"
		sudo add-apt-repository ppa:regolith-linux/release

        sudo apt install brave-browser

        # add u launcher
        sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher && sudo apt install plank

        

   # install nix
  curl -L https://nixos.org/nix/install | sh

  # source nix
  . ~/.nix-profile/etc/profile.d/nix.sh

  nix-env -iA nixpkgs.glibcLocales
  export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"

  # install packages
    nix-env -iA nixpkgs.zsh \
    nixpkgs.antibody \
    nixpkgs.neovim \
    nixpkgs.stow \
    nixpkgs.yarn \
    nixpkgs.fzf \
    nixpkgs.fd \
    nixpkgs.ripgrep \
    nixpkgs.bat \
    nixpkgs.direnv \
    nixpkgs.bpytop \
    nixpkgs.ranger \
    nixpkgs.trash-cli \
    nixpkgs.code-minimap
    
    
    
     	
	      

		cd ${HOME}/.dotfiles
		echo "stowing files..."
		# stow dotfiles
		stow git
		stow zsh
		stow nvim
		stow bpytop
		stow fonts
		stow ranger
        stow ulauncher
        stow mpv
        stow plank

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
