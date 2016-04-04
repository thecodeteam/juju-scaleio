#!/bin/bash
test_name=$0

function status-set() {
  if [ $1 != 'active' ]; then
    echo -e "\e[31mError in $test_name: Incorrect status-set call.\e[0m"
    echo -e "\e[31m    Args: $@\e[0m"
  fi
}
export -f status-set
function apt-get() {
  sleep 0
}
export -f apt-get
function apt-key() {
  sleep 0
}
export -f apt-key

calls_count=0
function puppet() {
  local args=$@
  ((++calls_count))
  if [ $1 == 'apply' ] ; then
    if echo "$args" | grep -P '=>' ; then
      echo -e "\e[31mError in $test_name: puppet has called with incorrent args.\e[0m"
      echo -e "\e[31m    Args: $args\e[0m"
      return 1
    fi
    if echo "$args" | grep -Eq '^apply.*scaleio::gui_server.*$' ; then
      return 0
    fi
  elif [ $1 == 'module' ] ; then
    return 0
  fi
  echo -e "\e[31mError in $test_name: puppet has called with incorrent args.\e[0m"
  echo -e "\e[31m    Args: $args\e[0m"
  return 1
}
export -f puppet

cd hooks

source ./install

if [[ $calls_count != 4 ]]; then
  echo -e "\E[31mPuppet should be called 1 time. But it has called $calls_count times\E[0m"
  exit 2
fi
