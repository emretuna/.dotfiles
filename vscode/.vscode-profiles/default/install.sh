#!/bin/bash
for ext in `cat ~/.vscode-profiles/default/extensions.txt`;do 
code --user-data-dir ~/.vscode-profiles/default/data --extensions-dir ~/.vscode-profiles/default/extensions --install-extension $ext 
done