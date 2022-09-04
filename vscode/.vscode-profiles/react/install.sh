#!/bin/bash
for ext in `cat ~/.vscode-profiles/react/extensions.txt`;do 
code --user-data-dir ~/.vscode-profiles/react/data --extensions-dir ~/.vscode-profiles/react/extensions --install-extension $ext 
done