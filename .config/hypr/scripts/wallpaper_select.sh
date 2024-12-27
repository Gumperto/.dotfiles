#!/bin/bash

# WALLPAPERS PATH
wallDIR="$HOME/wallpaper"

# variables
SCRIPTSDIR="$HOME/.config/hypr/scripts"
# focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')

# Retrieve image files
PICS=($(find "${wallDIR}" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))
RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_NAME=". random"


rofi_command="rofi -i -show -dmenu -config ~/.config/rofi/config-wallpaper.rasi"

menu() {
  sorted_options=($(printf '%s\n' "${PICS[@]}" | sort))
  # Place ". random" at the beginning
  printf "%s\n" "$RANDOM_PIC_NAME"
  for pic_path in "${sorted_options[@]}"; do
    pic_name=$(basename "$pic_path")
    # Check if the file is a .gif
    if [[ "$pic_name" == *.gif ]]; then
      # Print .gif filenames without icon metadata
      printf "%s\n" "$pic_name"
    else
      # Print other files with icon metadata
      printf "%s\x00icon\x1f%s\n" "$pic_name" "$pic_path"
    fi
  done
}

# Choice of wallpapers
main() {
  choice=$(menu | ${rofi_command})
  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # Random choice case
  if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
    $SCRIPTSDIR/random_wallpaper.sh
    exit 0
  fi

  # Find the index of the selected file
  pic_index=-1
  for i in "${!PICS[@]}"; do
    filename=$(basename "${PICS[$i]}")
    if [[ "$filename" == "$choice"* ]]; then
      pic_index=$i
      break
    fi
  done

  if [[ $pic_index -ne -1 ]]; then
    $SCRIPTSDIR/change_wallpaper.sh "${PICS[$i]}"
  else
    echo "Image not found."
    exit 0
  fi
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

main

sleep 0.5
