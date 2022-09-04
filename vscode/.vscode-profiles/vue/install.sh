#!/bin/bash
for ext in `cat ~/.vscode-profiles/vue/extensions.txt`;do 
code --user-data-dir ~/.vscode-profiles/vue/data --extensions-dir ~/.vscode-profiles/vue/extensions --install-extension $ext 
done