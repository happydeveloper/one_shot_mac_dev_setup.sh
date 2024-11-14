#!/bin/zsh

# 관리자 권한 요청 / Request for administrator privileges
echo "이 스크립트는 관리자 권한이 필요합니다. / This script requires administrator privileges."
sudo -v

# 관리자 권한 갱신 (설치 과정에서 만료되지 않도록 유지) / Refresh administrator privileges to avoid expiration during installation
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Zsh 기본 쉘로 설정 / Set Zsh as the default shell
echo "Zsh를 기본 쉘로 설정합니다. / Setting Zsh as the default shell..."
chsh -s /bin/zsh


# Xcode 설치 스크립트 실행 / Execute Xcode installation script
./install_xcode.sh

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
brew install vim python node nvm wget htop mas

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

# Oh My Zsh 설치 / Install Oh My Zsh
echo "Oh My Zsh를 설치합니다. / Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# iTerm2 설치 / Install iTerm2
echo "iTerm2를 설치합니다. / Installing iTerm2..."
if brew list --cask iterm2 &>/dev/null; then
  echo "iTerm2가 이미 설치되어 있습니다. / iTerm2 is already installed"
  echo "현재 iTerm2 버전: $(brew info --cask iterm2 | grep 'iterm2: ' | awk '{print $2}') / Current iTerm2 version: $(brew info --cask iterm2 | grep 'iterm2: ' | awk '{print $2}')"
else
  brew install --cask iterm2
fi

# Visual Studio Code 설치 스크립트 실행 / Execute Visual Studio Code installation script
./install_vscode.sh


# Postman 설치 / Install Postman
echo "Postman을 설치합니다. / Installing Postman..."
if brew list --cask postman &>/dev/null; then
  echo "Postman이 이미 설치되어 있습니다. / Postman is already installed"
  echo "현재 Postman 버전: $(brew info --cask postman | grep 'postman: ' | awk '{print $2}') / Current Postman version: $(brew info --cask postman | grep 'postman: ' | awk '{print $2}')"
else
  brew install --cask postman
fi

# Docker 설치 / Install Docker
echo "Docker를 설치합니다. / Installing Docker..."
if brew list --cask docker &>/dev/null; then
  echo "Docker가 이미 설치되어 있습니다. / Docker is already installed"
  echo "현재 Docker 버전: $(brew info --cask docker | grep 'docker: ' | awk '{print $2}') / Current Docker version: $(brew info --cask docker | grep 'docker: ' | awk '{print $2}')"
else
  brew install --cask docker
fi

# Notion 설치 / Install Notion
echo "Notion을 설치합니다. / Installing Notion..."
if brew list --cask notion &>/dev/null; then
  echo "Notion이 이미 설치되어 있습니다. / Notion is already installed"
  echo "현재 Notion 버전: $(brew info --cask notion | grep 'notion: ' | awk '{print $2}') / Current Notion version: $(brew info --cask notion | grep 'notion: ' | awk '{print $2}')"
else
  brew install --cask notion
fi

# Slack 설치 / Install Slack
echo "Slack을 설치합니다. / Installing Slack..."
if brew list --cask slack &>/dev/null; then
  echo "Slack이 이미 설치되어 있습니다. / Slack is already installed"
  echo "현재 Slack 버전: $(brew info --cask slack | grep 'slack: ' | awk '{print $2}') / Current Slack version: $(brew info --cask slack | grep 'slack: ' | awk '{print $2}')"
else
  brew install --cask slack
fi

# Message 설치 / Install Message
mas install 1480068668
echo "Message 설치 설치합니다. / Messagen..."


# Google Chrome 설치 / Install Google Chrome
echo "Google Chrome을 설치합니다. / Installing Google Chrome..."
if brew list --cask google-chrome &>/dev/null; then
  echo "Google Chrome이 이미 설치되어 있습니다. / Google Chrome is already installed"
  echo "현재 Google Chrome 버전: $(brew info --cask google-chrome | grep 'google-chrome: ' | awk '{print $2}') / Current Google Chrome version: $(brew info --cask google-chrome | grep 'google-chrome: ' | awk '{print $2}')"
else
  brew install --cask google-chrome
fi

# NVM 설치 / Install NVM
echo "NVM을 설치합니다. / Installing NVM..."
brew install nvm

# RVM 설치 / Install RVM
echo "RVM을 설치합니다. / Installing RVM..."
\curl -sSL https://get.rvm.io | bash -s stable

# SDKMAN 설치 / Install SDKMAN
echo "SDKMAN을 설치합니다. / Installing SDKMAN..."
curl -s "https://get.sdkman.io" | bash

# SDKMAN 초기화 스크립트 추가 / Add SDKMAN initialization script
echo 'source "$HOME/.sdkman/bin/sdkman-init.sh"' >> $SHELL_PROFILE

# 마무리 메시지 / Completion message
echo "설정이 완료되었습니다! 이제 터미널에서 'code .' 명령어로 Visual Studio Code를 실행할 수 있습니다. / Setup complete! You can now use 'code .' to open Visual Studio Code from the terminal."
echo "변경 사항을 사용하려면 터미널을 재시작하거나 'source $SHELL_PROFILE'을 실행하세요. / Please restart your terminal or run 'source $SHELL_PROFILE' to apply changes."

# D2Coding 폰트 설치 및 설정 / Install and configure D2Coding font
echo "D2Coding 폰트를 설치하시겠습니까? (y/n) / Do you want to install the D2Coding font? (y/n)"
read INSTALL_FONT

if [ "$INSTALL_FONT" = "y" ]; then
  # D2Coding 폰트 저장소를 클론합니다. / Clone the D2Coding font repository
  git clone https://github.com/naver/d2codingfont.git

  # 디렉토리로 이동합니다. / Navigate to the directory
  cd d2codingfont

  # 최신 버전의 폰트를 압축 해제합니다. / Extract the latest version of the font
  unzip D2Coding-Ver1.3.2-20180524.zip -d D2CodingAll

  # 폰트를 시스템 폰트 디렉토리로 이동합니다. / Move the font to the system fonts directory
  sudo mv D2CodingAll/D2CodingAll/D2Coding-Ver1.3.2-20180524-all.ttc /Library/Fonts/D2Coding-Ver1.3.2-20180524-all.ttc

  # 정리 작업 / Clean up
  cd ..
  rm -rf d2codingfont

  echo "D2Coding 폰트가 설치되고 iTerm2에 설정되었습니다. / D2Coding font installed and set in iTerm2 successfully."
else
  echo "D2Coding 폰트 설치가 건너뛰어졌습니다. / D2Coding font installation skipped."
fi


brew install discord --appdir=~/Applications

# 관리자 권한 갱신 종료 / Stop refreshing administrator privileges
sudo -k

# setup_list_verify.sh 실행 / Execute setup_list_verify.sh
echo "설치된 프로그램 정보를 확인합니다. / Verifying installed program information..."
./setup_list_verify.sh
