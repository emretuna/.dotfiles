#!/bin/bash
for ext in `cat ~/.vscode-profiles/wordpress/extensions.txt`;do 
code --user-data-dir ~/.vscode-profiles/wordpress/data --extensions-dir ~/.vscode-profiles/wordpress/extensions --install-extension $ext 
done