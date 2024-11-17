
#!/bin/zsh

# Visual Studio Code 설치 / Install Visual Studio Code
echo "Visual Studio Code를 설치합니다. / Installing Visual Studio Code..."
if brew list --cask visual-studio-code &>/dev/null; then
  echo "Visual Studio Code가 이미 설치되어 있습니다. / Visual Studio Code is already installed"
  echo "현재 Visual Studio Code 버전: $(brew info --cask visual-studio-code | grep 'visual-studio-code: ' | awk '{print $2}') / Current Visual Studio Code version: $(brew info --cask visual-studio-code | grep 'visual-studio-code: ' | awk '{print $2}')"
else
  brew install --cask visual-studio-code
fi

# 'code' 명령어 사용 설정 / Set up 'code' command for Visual Studio Code
echo "'code' 명령어를 설정하여 터미널에서 Visual Studio Code를 바로 실행할 수 있게 합니다. / Setting up 'code' command for Visual Studio Code..."
ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code

# GitHub Copilot 설치 / Install GitHub Copilot extension
echo "GitHub Copilot 확장을 설치합니다. / Installing GitHub Copilot extension for Visual Studio Code..."
code --install-extension GitHub.copilot

# openapi 설치 / Install openapi extension
# code --install-extension openai-chatgpt