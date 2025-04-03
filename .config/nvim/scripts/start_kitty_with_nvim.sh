#!/bin/bash
kitty --class=gdscript -e nvim --listen /tmp/godot.pipe --server /tmp/godot.pipe $1
