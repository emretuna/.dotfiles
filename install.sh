cd ~

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
if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

else
  pretty_print "You already have Homebrew installed...good job!"
fi

echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
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
              languagetool \
              shellcheck \
              stylua



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

    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
		echo "started installing node packages..."
		# install neovim plugins and requirements

     npm i -g intelephense bash-language-server dockerfile-language-server-nodejs yaml-language-server typescript typescript-language-server vscode-langservers-extracted @fsouza/prettierd

		echo "finish nvim set up..."
		nvim --headless +PlugInstall +qall

		echo "finishing..."
		# Use kitty or Alacritty terminal on Linux
		[ `uname -s` = 'Linux' ] && stow kitty



		echo "Installing Brave repository key"
		sudo apt install apt-transport-https curl
		sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
		echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
		echo "adding i3-gaps repo"
		wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

		#continue
		echo "Updating package lists"
		sudo apt update
		sudo apt install -y i3-gaps \
				    brave-browser \
                    polybar \
				    policykit-1-gnome \
				    pavucontrol \
            		scrot

		echo "Install picom dependencies..."
		sudo apt install -y libxext-dev \
				libxcb1-dev \
				libxcb-damage0-dev \
				libxcb-xfixes0-dev \
				libxcb-shape0-dev \
				libxcb-render-util0-dev \
				libxcb-render0-dev \
				libxcb-randr0-dev \
				libxcb-composite0-dev \
				libxcb-image0-dev \
				libxcb-present-dev \
				libxcb-xinerama0-dev \
				libxcb-glx0-dev \
				libpixman-1-dev \
				libdbus-1-dev \
				libconfig-dev \
				libgl1-mesa-dev \
				libpcre2-dev \
				libpcre3-dev \
				libevdev-dev \
				uthash-dev \
				libev-dev \
				libx11-xcb-dev \
				meson
		echo "compiling picom"
		cd ${HOME}/Downloads &&	git clone https://github.com/ibhagwan/picom.git

		cd ${HOME}/Downloads/picom
		git submodule update --init --recursive
		meson --buildtype=release . build
		ninja -C build install

		echo "installing i3wm tools and required apps..."
		sudo apt install -y rofi \
				 nitrogen \
         		 feh \
				 arandr \
				 playerctl \
				 lxappearance \
				 kitty \
				 flameshot \
				 light \
				 libnotify-bin \
				 wmctrl \
				 xdotool \
                 trash-cli \
				 libinput-tools \
				 numlockx

		sudo gpasswd -a $USER input && sudo gpasswd -a $USER video



		echo "stow i3 apps"
		cd ${HOME}/.dotfiles
		# Extra stuff for tiling wm

		pip3 install pywal

		stow wal
		stow themes
		stow gestures
		stow dunst
		stow greenclip
		stow i3
		stow polybar
		stow picom
		stow rofi

		cd wallpapers
		sudo mkdir /usr/share/backgrounds/wallpapers/
		sudo find . -name "*.png" -exec cp '{}' /usr/share/backgrounds/wallpapers/ \;
	#install rust cargo
	curl https://sh.rustup.rs -sSf | sh
	echo "DONE BOSS!SEE YA!"

  echo "Install stylua"
  cargo install stylua

