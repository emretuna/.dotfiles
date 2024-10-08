cd ~

# install homebrew
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew, an OSX package manager, follow the instructions..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bash_profile
	echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile

else
	echo "You already have Homebrew installed...good job!"
fi

echo 'PATH="/usr/local/bin:$PATH"' >>~/.bash_profile


# install packages
brew install fish \
	neovim \
	stow \
	yarn \
	fzf \
	fd \
	ripgrep \
	bat \
	direnv \
	bpytop \
	yazi \
	ffmpegthumbnailer \
	unar \
	jq \
	trash-cli \
	lua-language-server \
	vale \
	zoxide \
	shellcheck \
	stylua \
	languagetool \
	xclip \
	navi \
	tree \
	poppler \
	gitui \
	eza \
	volta \
	starship

brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font
brew cleanup


cd ${HOME}/.dotfiles
echo "stowing files..."
# stow dotfiles
stow git
stow fish
stow nvim
stow btop
stow mpv
stow plank
stow yazi
stow wezterm
stow starship


# starship init
echo "starship init fish | source" >> ~/.config/fish/config.fish

# volta init
echo 'set -gx VOLTA_HOME "$HOME/.volta"' >> ~/.config/fish/config.fish


echo 'set -gx PATH "$VOLTA_HOME/bin" $PATH"' >> ~/.config/fish/config.fish
#install required dependencies for building packages mostly
echo "installing bunch of packages to your $(uname -n) desktop"

echo "installing packages using default package manager"
sudo apt install -y gcc \
	make \
	python3 \
	python3-pip \
	imagemagick \
	ffmpeg \
	git

echo "installing fish and setting up things..."
# add fish as a login shell
command -v fish | sudo tee -a /etc/shells

echo "changing default shell"
# use fish as default shell
sudo chsh -s $(which fish) $USER

fish

if ! command -v volta &>/dev/null; then
	volta install node
else
	echo "You already have node installed with volta ...good job!"
fi

if ! command -v npm &>/dev/null; then
echo "started installing node packages..."
# install neovim plugins and requirements

npm i -g neovim intelephense bash-language-server dockerfile-language-server-nodejs yaml-language-server typescript typescript-language-server vscode-langservers-extracted @fsouza/prettierd

echo "finish npm set up..."
else
	echo "You already have npm installed...good job!"
fi

nvim --headless "+Lazy! sync" +qa

echo "finishing..."

echo "adding i3-gaps repo"
wget -qO - https://regolith-desktop.org/regolith.key |
	gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg >/dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" |
	sudo tee /etc/apt/sources.list.d/regolith.list

#continue
echo "Updating package lists"
sudo apt update
sudo apt install -y i3-gaps \
	polybar \
	policykit-1-gnome \
	pavucontrol \
	scrot

echo "Install picom dependencies..."
sudo apt install -y libxext-dev \
	libxcb1-dev \
	libxcb-damage0-dev \
	libxcb-dpms0-dev \
	libxcb-xfixes0-dev \
	libxcb-shape0-dev \
	libxcb-render-util0-dev \
	libxcb-render0-dev \
	libxcb-randr0-dev \
	libxcb-composite0-dev \
	libxcb-image0-dev \
	libxcb-present-dev \
	libxcb-glx0-dev \
	libpixman-1-dev \
	libdbus-1-dev \
	libconfig-dev \
	libgl-dev \
	libegl-dev \
	libpcre2-dev \
	libevdev-dev \
	uthash-dev \
	libev-dev \
	libx11-xcb-dev \
	meson

echo "compiling picom"
cd ${HOME}/Downloads && git clone https://github.com/FT-Labs/picom.git

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
	numlockx \
	i3lock \
	lazygit

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
stow ulauncher

#install rust cargo
curl https://sh.rustup.rs -sSf | sh
echo "DONE BOSS!SEE YA!"

echo "Install stylua"
cargo install stylua
