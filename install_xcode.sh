
#!/bin/zsh

# Xcode Command Line Tools 설치 / Install Xcode Command Line Tools
echo "Xcode Command Line Tools를 설치합니다. / Installing Xcode Command Line Tools..."
if xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools가 이미 설치되어 있습니다. / Xcode Command Line Tools are already installed"
else
  xcode-select --install
fi

# Xcode 최신 버전 설치 / Install the latest version of Xcode
echo "Xcode 최신 버전을 설치합니다. / Installing the latest version of Xcode..."
if ! xcodebuild -version &>/dev/null; then
  echo "Xcode를 설치합니다. / Installing Xcode..."
  mas install 497799835
else
  echo "Xcode가 이미 설치되어 있습니다. / Xcode is already installed"
  echo "현재 Xcode 버전: $(xcodebuild -version | head -n 1) / Current Xcode version: $(xcodebuild -version | head -n 1)"
fi

