#!/usr/bin/env zsh

# Install Rosetta2 if using M1
if [[ $(uname -p) == 'arm' ]]; then
	echo -e "\n<<< Starting Rosetta2 Setup >>>\n"
	/usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi
