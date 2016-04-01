#!/usr/bin/env bash

set -e

default_fg='colour255'
default_bg='colour34'


tmux_option() {
    local -r value=$(tmux show-option -gqv "@$1")
    local -r default="$2"

    if [ ! -z "$value" ]; then
        echo "$value"
    else
        echo "$default"
    fi
}


badges() {
    tmux show-option -g | cut -f 1 -d ' ' | grep '@badge' | grep -v '_(fg|bg|cmd)'
}


generate() {
    local option=$1
    local name=$(tmux_option "$option" "$(option | cut -f 2 -d '_')")
    local cmd=$(tmux_option "${option}_cmd")
    local fg_color=$(tmux_option "${option}_fg" "$default_fg")
    local bg_color=$(tmux_option "${option}_fg" "$default_bg")

    return "#[fg=$fg_color]$[bg=$bg_color] $name #[bg=colour236] #($cmd) #[fg=default]#[bg=default]"
}


highlight() {
    local option="$1"
    local status="$2"
    local genstr="$3"
    local status_value=$(tmux_option "$status")
    local place_holder="${option}_badge"
    tmux set-option -gq "$status" "${status_value/$place_holder/$str}"
}


main() {
    for badge in badges; do
        local option=$(generate "$badge")
        local genstr=$(generate "$option")
        highlight "status-right" "$option" "$genstr"
        highlight "status-left"  "$option" "$genstr"
    done
}
main
