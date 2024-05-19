#!/bin/bash
output=$(playerctl metadata --player=spotify --format '{{title}} - %{F#b4befe}{{artist}}%{F-}' 2>&1)

if [[ "$output" != "No players found" && "$output" != "No player could handle this command" && "$(playerctl status 2>&1)" == "Playing" ]]; then
    echo $output
else
    echo ""
fi
