#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_forecast() {
  local format=$(get_tmux_option @forecast-format "%C+%t+%w")
  local city=$(get_tmux_option @forecast-city "")
  echo $(curl http://wttr.in/${city}?format=$format)
}

main() {
  print_forecast
}

main
