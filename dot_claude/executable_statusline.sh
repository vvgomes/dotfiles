#!/bin/bash

RESET="\033[0m"
ORANGE="\033[38;2;255;138;76m"
MAGENTA="\033[38;2;176;148;241m"

dir_name=$(basename "$PWD")
git_branch=$(git branch --show-current 2>/dev/null)

dir_section="${ORANGE} ${dir_name}${RESET}"
git_section=""

if [ -n "$git_branch" ]; then
  git_section="${MAGENTA}${git_branch}${RESET}"
fi

#  celcius main
echo -e "${dir_section} ${git_section}"
