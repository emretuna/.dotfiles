#!/bin/bash
for ext in `cat ~/.vscode-profiles/laravel/extensions.txt`;do 
code --user-data-dir ~/.vscode-profiles/laravel/data --extensions-dir ~/.vscode-profiles/laravel/extensions --install-extension $ext 
done