#!/bin/bash
my_dir="$(dirname "$0")"

source $my_dir/common
export JUJU_UNIT_NAME='scaleio-gui'
export PS4='+ ${BASH_SOURCE:-}:${FUNCNAME[0]:-}:L${LINENO:-}:   '

# test helpers
errors=0

function test() {
  $my_dir/$1
  if [[ $? != 0 ]]; then
    ((++errors))
    echo "$1 has errors"
  else
    echo "$1 run successful"
  fi
}


# tests
test test_stop.sh
test test_install.sh

if [[ $errors > 0 ]]; then exit 1; fi
