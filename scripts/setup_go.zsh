#!/usr/bin/env zsh

echo "\n<<< Installing Go CLI Tools >>>\n"


# TODO: remove plugins managed by Mason
if exists go; then
    packages=(
        github.com/cespare/reflex
        github.com/fatih/gomodifytags
        github.com/jackc/tern/v2
        github.com/skip2/go-qrcode/...
        github.com/spf13/cobra-cli
        golang.org/x/telemetry/cmd/gotelemetry
        golang.org/x/tools/cmd/goimports
        google.golang.org/protobuf/cmd/protoc-gen-go
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
