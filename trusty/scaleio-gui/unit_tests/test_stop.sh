#!/bin/bash
test_name=$0

calls_count=0
function puppet() {
  local args=$@
  ((++calls_count))
  if echo $args | grep -Eq '^apply.*scaleio::gui_server.*ensure[ \t]*=>[ \t]*absent.*$' ; then
    return 0
  fi
  echo -e "\e[31mError in $test_name: puppet has called with incorrent args.\e[0m"
  echo -e "\e[31m    Args: $args\e[0m"
  exit 1
}
export -f puppet

cd hooks

source ./stop

if [[ $calls_count != 1 ]]; then
  echo -e "\E[31mPuppet should be called 1 time. But it has called $calls_count times\E[0m"
  exit 2
fi
