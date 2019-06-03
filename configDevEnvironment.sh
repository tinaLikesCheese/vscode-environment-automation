#!/bin/bash
#this is called a shebang, given to the shell indicating what program is used to interpret the script. In this case, it is /bin/bash. Other scripting languages such as Perl, awk, tcl, Tk, and python also use this mechanism.

#clear terminal
clear

#print to screen
echo "---------------------------------------------------"
echo "Hi $USER! Commencing dev environment configuration:"
echo "---------------------------------------------------"

#define user vars
#echo What is your .gitconfig username?
#read GITUSERNAME
#echo What is your .gitconfig email?
#read EMAIL

#configure .gitconfig
#if git config --global user.name $GITUSERNAME ; then
#    echo "Configured .gitconfig with username: $GITUSERNAME"
#else
#    echo "FAILED to configure .gitconfig with username: $GITUSERNAME"
#fi
#
#if git config --global user.email $EMAIL ; then
#    echo "Configured .gitconfig with email: $EMAIL"
#else
#    echo "FAILED to configure .gitconfig with email: $EMAIL"
#fi

#(unsure about this part)
#echo "Configuring .gitconfig with default editor VSCode"
#git config --global core.editor code

#copy .bashrc
#if you only need to know if the command succeeded or failed, don't bother testing $? variable, just test the command directly
if yes | cp -f ./data/.bashrc ~/ ; then
    echo "Replaced .bashrc"
else
    echo "FAILED to replace .bashrc"
fi

#copy .bash_profile
if yes | cp -f ./data/.bash_profile ~/ ; then
    echo "Replaced .bash_profile"
else
    echo "FAILED to replace .bash_profile"
fi

#reload .bashrc
if . ~/.bashrc ; then
    echo "Reloaded .bashrc"
else
    echo "FAILED to reload .bashrc"
fi

#reload .bash_profile
if . ~/.bash_profile ; then
    echo "Reloaded .bash_profile"
else
    echo "FAILED to reload .bash_profile"
fi

#print to screen and install vscode extensions - need to make sure "code" command is working before the below, that's why you need to reload the bash configurations before this point
echo "Installing my favorite VSCode extensions:"
code --install-extension esbenp.prettier-vscode
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension dbaeumer.vscode-eslint
code --install-extension formulahendry.auto-close-tag
code --install-extension wallabyjs.quokka-vscode

#copy vscode user settings
#VSCode settings location for Linux: ~/.config/Code/User
#VSCode settings location for MacOS use ~/Library/Application Support/Code
if yes | cp -f ./data/settings.json "/Users/student/Library/Application Support/Code/User/settings.json" ; then
    echo "Replaced settings.json with my VSCode User Settings"
else
    echo "FAILED to replace settings.json with my VSCode User Settings"
fi

#copy vscode user keybindings
if yes | cp -f ./data/keybindings.json "/Users/student/Library/Application Support/Code/User/keybindings.json" ; then
    echo "Replaced keybindings.json with my VSCode User Keybindings"
else
    echo "FAILED to replace keybindings.json with my VSCode User Keybindings"
fi

#copy vscode user snippets
if yes | cp -f ./data/javascript.json "/Users/student/Library/Application Support/Code/User/snippets/javascript.json" ; then
    echo "Replaced javascript.json with my VSCode User Snippets"
else
    echo "FAILED to replace javascript.json with my VSCode User Snippets"
fi

#launch vscode
if code ; then
    echo "Launched VSCode"
else
    echo "FAILED to launch VSCode"
fi

#print exit message to screen
echo "---------------------------------------------------"
echo "Happy hacking - AVH"
echo "---------------------------------------------------"
