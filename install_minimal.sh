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

 # install homebrew
if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  pretty_print "You already have Homebrew installed...good job!"
fi

# install packages
brew install zsh \
              antibody \
              neovim \
              stow \
              yarn \
              fzf \
              fd \
              ripgrep \
              bat \
              direnv \
              bpytop \
              ranger \
              trash-cli \
              code-minimap \
              lua-language-server \
              vale \
              zoxide \





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
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  	echo "installing packages using default package manager"
    sudo apt install -y gcc \
	       make \
	       python3 \
	       python3-pip \
	       imagemagick \
	       ffmpeg \
	       git \
         xlip \


cd wallpapers
		sudo mkdir /usr/share/backgrounds/wallpapers/
		sudo find . -name "*.png" -exec cp '{}' /usr/share/backgrounds/wallpapers/ \;

else
        echo "Os unknown, Install some packages by yourself" # Unknown.
fi

		echo "installing zsh and setting up things..."
		# add zsh as a login shell
		command -v zsh | sudo tee -a /etc/shells

		echo "changing default shell"
		# use zsh as default shell
		sudo chsh -s $(which zsh) $USER

		echo "tweaking zsh..."
		# bundle zsh plugins
		antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
		echo "started installing node packages..."
		# install neovim plugins and requirements
    npm i -g intelephense bash-language-server dockerfile-language-server-nodejs yaml-language-server typescript typescript-language-server vscode-langservers-extracted @fsouza/prettierd

		echo "finish nvim set up..."
		nvim --headless +PlugInstall +qall

		pip3 install pynvim \
                 pywal \

		echo "finishing..."
		# Use kitty or Alacritty terminal on Linux
		[ `uname -s` = 'Linux' ] && stow kitty

		    #install rust cargo
	curl https://sh.rustup.rs -sSf | sh
	echo "DONE BOSS!SEE YA!"

  echo "Install stylua"
  cargo install stylua
