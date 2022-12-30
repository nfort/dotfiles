#!/usr/bin/env bash
polybar-msg cmd quit
polybar mybar 2>$HOME/.logs/polybar/log &

echo "Bars launched"
