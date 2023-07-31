#!/usr/bin/env zsh

echo -e "\n<<< Installing Go CLI Tools >>>\n"


if exists go; then
    packages=(
        github.com/spf13/cobra-cli
        github.com/kisielk/errcheck
        golang.org/x/tools/cmd/godoc
        golang.org/x/tools/cmd/goimports
        google.golang.org/protobuf/cmd/protoc-gen-go
        github.com/cespare/reflex
        honnef.co/go/tools/cmd/staticcheck
    )

    echo "go executable found, continuing with installs"

    # install global packages
    for package in ${packages[@]}
    do
        go install "$package@latest"
    done
else
    echo "go executable not found — is it installed and added to PATH?"
fi
