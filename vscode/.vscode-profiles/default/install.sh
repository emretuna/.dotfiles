#!/usr/local/bin/zsh
for ext in `cat extensions.txt`;do 
codewordpress --install-extension $ext 
done