function box()
{
  local s=("$@") b w
  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done
  tput setaf $purple
  echo " -${b//?/-}-
| ${b//?/ } |"
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf $water)" "-$w" "$l" "$(tput setaf $purple)"
  done
  echo "| ${b//?/ } |
 -${b//?/-}-"
  tput sgr 0
}

# debug
box "Package name: content" \
    "Next package version: content" \
    "Current package version: content"