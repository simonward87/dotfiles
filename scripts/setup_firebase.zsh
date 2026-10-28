#!/usr/bin/env zsh

echo "\n<<< Installing Firebase CLI >>>\n"

if exists firebase; then
    sudo curl -sL https://firebase.tools | upgrade=true bash
else
    sudo curl -sL https://firebase.tools | bash
fi
