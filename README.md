# 원샷 맥 개발 환경 설정 (One Shot Mac Development Setup)

이 스크립트는 macOS 머신에서 개발 환경을 설정하는 과정을 자동화합니다. 개발에 필요한 필수 도구와 애플리케이션을 설치합니다.

This script automates the setup of a development environment on a macOS machine. It installs essential tools and applications required for development.

## 사전 준비 사항 (Prerequisites)

- macOS
- 관리자 권한 (Administrator privileges)

## 기능 (Features)

- Zsh를 기본 쉘로 설정 (Sets Zsh as the default shell)
- Xcode 명령어 도구 설치 (Installs Xcode Command Line Tools)
- Homebrew 및 필수 패키지 설치 (vim, python, node, nvm, wget, htop) (Installs Homebrew and essential packages (vim, python, node, nvm, wget, htop))
- Vim 설정 구성 (Configures Vim settings)
- Git 설치 및 설정 (Installs and configures Git)
- NVM (Node Version Manager) 설정 (Configures NVM (Node Version Manager))
- iTerm2 설치 (Installs iTerm2)
- Visual Studio Code 설치 및 `code` 명령 설정 (Installs Visual Studio Code and sets up the `code` command)
- Visual Studio Code용 GitHub Copilot 확장 설치 (Installs GitHub Copilot extension for Visual Studio Code)

## 사용법 (Usage)

1. 리포지토리를 클론하거나 스크립트를 다운로드합니다. (Clone the repository or download the script.)
2. 터미널을 열고 스크립트가 있는 디렉토리로 이동합니다. (Open a terminal and navigate to the directory containing the script.)
3. 다음 명령어를 사용하여 스크립트를 실행합니다: (Run the script with the following command:)
    ```shell
    ./one_shot_mac_dev_setup.sh
    ```
4. 프롬프트에 따라 Git 사용자 이름과 이메일 주소를 입력합니다. (Follow the prompts to enter your Git user name and email address.)

## 설치 후 (Post-Installation)

- 터미널을 재시작하거나 `source ~/.zshrc` 명령을 실행하여 변경 사항을 적용합니다. (Restart your terminal or run `source ~/.zshrc` to apply the changes.)
- 이제 터미널에서 `code .` 명령을 사용하여 Visual Studio Code를 열 수 있습니다. (You can now use `code .` to open Visual Studio Code from the terminal.)

## 참고 사항 (Notes)

- 스크립트는 관리자 권한이 필요하며 비밀번호를 묻습니다. (The script requires administrator privileges and will prompt for your password.)
- 스크립트가 다양한 도구와 애플리케이션을 다운로드하고 설치하므로 안정적인 인터넷 연결을 확인하세요. (Ensure you have a stable internet connection as the script will download and install various tools and applications.)

## 라이선스 (License)

이 프로젝트는 MIT 라이선스에 따라 라이선스가 부여됩니다. (This project is licensed under the MIT License.)