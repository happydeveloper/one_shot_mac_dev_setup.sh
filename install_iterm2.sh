
#!/bin/zsh

# iTerm2 설치 / Install iTerm2
echo "iTerm2를 설치합니다. / Installing iTerm2..."
if brew list --cask iterm2 &>/dev/null; then
  echo "iTerm2가 이미 설치되어 있습니다. / iTerm2 is already installed"
  echo "현재 iTerm2 버전: $(brew info --cask iterm2 | grep 'iterm2: ' | awk '{print $2}') / Current iTerm2 version: $(brew info --cask iterm2 | grep 'iterm2: ' | awk '{print $2}')"
else
  brew install --cask iterm2
fi

# 테마 설정 / Set up theme
# https://80000coding.oopy.io/e79660e8-e77b-48d2-8a8c-01ce6b916d9c
