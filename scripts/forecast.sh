#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_forecast() {
  local format=$(get_tmux_option @forecast-format "%C+%t+%w")
  local city=$(get_tmux_option @forecast-city "")
  local unit=$(get_tmux_option @forecast-temperature-unit "m")
  echo $(curl http://wttr.in/${city}?${unit}\&format=$format)
}

main() {
  print_forecast
}

main
