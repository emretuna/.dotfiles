# install homebrew
if ! command -v brew &>/dev/null; then
	pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bash_profile
	echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile

else
	pretty_print "You already have Homebrew installed...good job!"
fi

echo 'PATH="/usr/local/bin:$PATH"' >>~/.bash_profile

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
	mpv \
	trash-cli \
	code-minimap \
	lua-language-server \
	vale \
	zoxide \
	shellcheck \
	stylua \
	languagetool \
	lazygit \
	xclip \
	navi \
	volta

brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font

brew cleanup

cd ${HOME}/.dotfiles
echo "stowing files..."
# stow dotfiles
stow git
stow zsh
stow nvim
stow bpytop
stow fonts
stow ranger
stow mpv
stow wezterm

#install required dependencies for building packages mostly
echo "installing bunch of packages to your $(uname -n) desktop"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "installing packages using default package manager"
	sudo apt install -y gcc \
		make \
		python3 \
		python3-pip \
		imagemagick \
		ffmpeg \
		git \
		xclip

else
	echo "Os unknown, Installing packages with brew" # Unknown.
	brew install python@3.11 \
		gcc \
		make \
		imagemagick \
		ffmpeg
	brew cleanup

fi

echo "installing zsh and setting up things..."
# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

echo "changing default shell"
# use zsh as default shell
sudo chsh -s $(which zsh) $USER

echo "tweaking zsh..."
# bundle zsh plugins
antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins.sh
echo 'PATH="/usr/local/bin:$PATH"' >>~/.zshrc
echo "started installing node packages..."
# install neovim plugins and requirements
npm i -g neovim intelephense bash-language-server dockerfile-language-server-nodejs yaml-language-server typescript typescript-language-server vscode-langservers-extracted @fsouza/prettierd

echo "finish nvim set up..."
nvim --headless "+Lazy! sync" +qa

pip3 install pynvim

#install rust cargo
curl https://sh.rustup.rs -sSf | sh
echo "DONE BOSS!SEE YA!"

echo "Installing stylua"
cargo install stylua
