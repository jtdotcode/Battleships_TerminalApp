#!/bin/bash
# Battleships install run script

echo "Welcome to **Battleships Terminal App**"

echo "Lets begin the install now so the game can run"

#Checking if git is installed 
git --version 2>&1 >/dev/null 
GIT_IS_AVAILABLE=$?

if [ $GIT_IS_AVAILABLE -eq 0 ]; then
echo "cloning game from Git"
git clone "https://github.com/jtdotcode/Battleships_TerminalApp.git"

else
echo "Please install Git before trying to install the game"
echo "It can be downloaded from here:"
echo "https://git-scm.com/download/"
exit 1
fi


cd ./Battleships_TerminalApp/src

echo "Time to ensure all required gems are installed"

#check if bundle is installed
bundle --version 2>&1 >/dev/null 
BUNDLE_IS_AVAILABLE=$?

if [ $BUNDLE_IS_AVAILABLE -eq 0 ]; then
bundle install --gemfile="Gemfile"
echo "All gems have been installed, running application for the first time now"
ruby battleships.rb
else
echo "Please install \"bundle gem\" before trying to run the game"
echo "bundler can be install by running the:" 
echo "\"gem install bundler\" commmand"
exit 1
fi