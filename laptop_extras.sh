echo "installing laptop tools..."
		sudo apt install -y wmctrl \
				 xdotool \
				 libinput-tools \
                 tlp \
				 
		sudo gpasswd -a $USER input

echo "pulling libinput-gestures"
		cd ${HOME}/Downloads
		git clone https://github.com/bulletmark/libinput-gestures.git
		cd libinput-gestures
		sudo ./libinput-gestures-setup install

        libinput-gestures-setup autostart start


        stow gestures
