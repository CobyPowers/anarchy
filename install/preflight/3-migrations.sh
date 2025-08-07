#!/bin/bash

ANARCHY_MIGRATIONS_STATE_PATH=~/.local/state/anarchy/migrations

mkdir -p $ANARCHY_MIGRATIONS_STATE_PATH

for file in ~/.local/share/anarchy/migrations/*.sh; do
  touch "$ANARCHY_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
