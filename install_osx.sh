if [ ! -d ~/.nvm ]; then
  echo "nvm install started..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  . ${HOME}/.nvm/nvm.sh
  . ${HOME}/.profile
  . ${HOME}/.bashrc
fi
# install node
nvm install node --lts

 # install homebrew
 
	 # install nix
  curl -L https://nixos.org/nix/install | sh

  # source nix
  . ~/.nix-profile/etc/profile.d/nix.sh
  export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive"

  # install packages
    nix-env -iA nixpkgs.wget \
    nixpkgs.antibody \
    nixpkgs.neovim \
    nixpkgs.stow \
    nixpkgs.yarn \
    nixpkgs.fd \
    nixpkgs.ripgrep \
    nixpkgs.bat \
    nixpkgs.ranger \
    nixpkgs.fzf \
    nixpkgs.direnv \
    nixpkgs.trash-cli \
    nixpkgs.code-minimap     	
	      

		cd ${HOME}/.dotfiles
		echo "stowing files..."
		# stow dotfiles
		stow git
		stow zsh
		stow nvim
		stow ranger
		stow fonts
		stow kitty

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
                        
    #install rust cargo
	curl https://sh.rustup.rs -sSf | sh
	echo "DONE BOSS!SEE YA!"
