#!/usr/bin/env bash

DIR=$(find . -maxdepth 1 -type d ! -name "." | sed 's|./||' | fzf --prompt="Select project directory: ")

if [ -z "$DIR" ]; then
    echo "No Directory selected."
    exit 1
fi

SESSION=$(basename "$DIR")

echo "Opening project: $DIR"

if  tmux has-session -t "$SESSION" 2>/dev/null; then
	echo "Session '$SESSION' already exists. Reattaching..."
	tmux attach-session -t "$SESSION" \; select-window -t editor
	exit 0
fi

tmux new-session -d -s "$SESSION" -c "$DIR" -n editor "nvim"

if [ -f "$DIR/composer.json" ]; then
    tmux new-window -t "$SESSION:" -n server -c "$DIR" "composer run dev"
fi

tmux new-window -t "$SESSION:" -n database -c "$DIR"

tmux select-window -t "$SESSION":editor

tmux attach -t "$SESSION"
