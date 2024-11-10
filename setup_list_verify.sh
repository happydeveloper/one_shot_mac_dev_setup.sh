#!/bin/zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# 설치된 프로그램 정보 출력 / Display installed program information
echo "설치된 프로그램 정보: / Installed Program Information:"
echo "------------------------------------------------------------"
printf "| %-30s | %-30s | \n" "Program Name" " Version" 
echo "------------------------------------------------------------"
if command -v awk &>/dev/null && command -v brew &>/dev/null && command -v du &>/dev/null; then
  brew list --versions | while read -r line; 
  do
    program=$(echo $line | awk '{print $1}')
    version=$(echo $line | awk '{print $2}')
    printf "| %-30s | %-30s | \n" "$program" "$version" ""
  done
else
  echo "awk, brew, 또는 du 명령어를 찾을 수 없습니다. / awk, brew, or du command not found."
fi
echo "------------------------------------------------------------"