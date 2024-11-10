#!/bin/zsh

# 관리자 권한 요청 / Request for administrator privileges
echo "이 스크립트는 관리자 권한이 필요합니다. / This script requires administrator privileges."
sudo -v

# 관리자 권한 갱신 (설치 과정에서 만료되지 않도록 유지) / Refresh administrator privileges to avoid expiration during installation
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Zsh 기본 쉘로 설정 / Set Zsh as the default shell
echo "Zsh를 기본 쉘로 설정합니다. / Setting Zsh as the default shell..."
chsh -s /bin/zsh

# Xcode Command Line Tools 설치 / Install Xcode Command Line Tools
echo "Xcode Command Line Tools를 설치합니다. / Installing Xcode Command Line Tools..."
xcode-select --install

# Homebrew 설치 / Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Homebrew를 설치합니다. / Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Homebrew 경로를 환경 변수에 추가 / Add Homebrew to PATH
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew가 이미 설치되어 있습니다. / Homebrew is already installed"
  echo "현재 Homebrew 버전: $(brew --version | head -n 1) / Current Homebrew version: $(brew --version | head -n 1)"
fi

# Brew 업데이트 및 필수 프로그램 설치 / Update Brew and install essential programs
echo "Homebrew 업데이트 및 필수 프로그램을 설치합니다. / Updating Homebrew and installing essential programs..."
brew update
brew install vim python node nvm wget htop

# 쉘 프로필 파일 설정 / Set shell profile file
SHELL_PROFILE="$HOME/.zshrc"

# Vim 설정 추가 / Configure Vim settings
echo "Vim 설정을 추가합니다. / Configuring Vim..."
cat <<EOL >>~/.vimrc
set number            " 줄 번호 표시 / Display line numbers
set tabstop=4         " 탭 간격 설정 / Set tab spacing
set expandtab         " 탭을 스페이스로 변환 / Convert tabs to spaces
EOL

# Git 설치 및 설정 / Install and configure Git
if ! command -v git &>/dev/null; then
  echo "Git을 설치합니다. / Installing Git..."
  brew install git
  
  # Git 사용자 정보 설정 / Configure Git user information
  echo "Git 사용자 이름을 입력하세요: / Please enter your Git user name:" # Git 사용자 이름 입력 요청
  read GIT_NAME
  echo "Git 이메일 주소를 입력하세요: / Please enter your Git email address:" # Git 이메일 주소 입력 요청
  read GIT_EMAIL

  git config --global user.name "$GIT_NAME"
  git config --global user.email "$GIT_EMAIL"
  git config --global core.editor "vim"
else
  echo "Git이 이미 설치되어 있습니다. / Git is already installed"
  echo "현재 Git 버전: $(git --version) / Current Git version: $(git --version)"
fi

# NVM 설정 추가 / Configure NVM
echo "NVM 설정을 추가합니다. / Configuring NVM..."
cat <<EOL >>$SHELL_PROFILE

# NVM 설정 / NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion"
EOL

# iTerm2 설치 / Install iTerm2
echo "iTerm2를 설치합니다. / Installing iTerm2..."
brew install --cask iterm2

# Visual Studio Code 설치 / Install Visual Studio Code
echo "Visual Studio Code를 설치합니다. / Installing Visual Studio Code..."
brew install --cask visual-studio-code

# 'code' 명령어 사용 설정 / Set up 'code' command for Visual Studio Code
echo "'code' 명령어를 설정하여 터미널에서 Visual Studio Code를 바로 실행할 수 있게 합니다. / Setting up 'code' command for Visual Studio Code..."
ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code

# GitHub Copilot 설치 / Install GitHub Copilot extension
echo "GitHub Copilot 확장을 설치합니다. / Installing GitHub Copilot extension for Visual Studio Code..."
code --install-extension GitHub.copilot

# 마무리 메시지 / Completion message
echo "설정이 완료되었습니다! 이제 터미널에서 'code .' 명령어로 Visual Studio Code를 실행할 수 있습니다. / Setup complete! You can now use 'code .' to open Visual Studio Code from the terminal."
echo "변경 사항을 적용하려면 터미널을 재시작하거나 'source $SHELL_PROFILE'을 실행하세요. / Please restart your terminal or run 'source $SHELL_PROFILE' to apply changes."
  