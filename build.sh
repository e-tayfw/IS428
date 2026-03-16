#!/usr/bin/env bash
set -e

QUARTO_VERSION="1.7.34"

mkdir -p .quarto-bin
cd .quarto-bin
curl -L -o quarto.tar.gz "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
tar -xzf quarto.tar.gz
cd ..

export PATH="$PWD/.quarto-bin/quarto-${QUARTO_VERSION}/bin:$PATH"

quarto --version
quarto render