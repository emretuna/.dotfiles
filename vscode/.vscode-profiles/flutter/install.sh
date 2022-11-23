#!/bin/bash
for ext in `cat ~/.vscode-profiles/flutter/extensions.txt`;do 
code --user-data-dir ~/.vscode-profiles/flutter/data --extensions-dir ~/.vscode-profiles/flutter/extensions --install-extension $ext 
done