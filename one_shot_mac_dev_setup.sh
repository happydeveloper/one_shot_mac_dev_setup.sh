#!/bin/zsh

# Zsh 기본 쉘로 설정
echo "Setting Zsh as the default shell..."
chsh -s /bin/zsh

# Xcode Command Line Tools 설치
echo "Installing Xcode Command Line Tools..."
xcode-select --install

# Homebrew 설치
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed"
  echo "Current Homebrew version: $(brew --version | head -n 1)"
fi

