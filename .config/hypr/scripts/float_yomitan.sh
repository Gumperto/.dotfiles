#!/bin/sh

# File to keep track of floated windows so we don't re-float them
# floated_file="/tmp/yomitan_floated_windows"
# touch "$floated_file"

handle() {
  line="$1"
  case "$line" in
    openwindow*)
      # Extract the window address from the event string, e.g. createwindow>>0x1e00007
      raw_addr=$(echo "$line" | cut -d'>' -f3 | cut -d',' -f1)
      
      addr="0x$raw_addr"

      # If already floated, skip
      # if grep -q "$addr" "$floated_file"; then
      #   return
      # fi

      # Short delay so window info is populated
      sleep 0.25

      # Query only the window with this address
      info=$(hyprctl clients -j | jq -c --arg addr "$addr" '.[] | select(.address == $addr)')
      [ -z "$info" ] && return

      class=$(echo "$info" | jq -r '.class')
      title=$(echo "$info" | jq -r '.title')

      echo $class
      echo $title

      # Match Firefox windows with Yomitan popup title
      if [ "$class" = "firefox" ] && echo "$title" | grep -q "Yomitan Popup Dictionary"; then
        print_addr="address:$addr"
        echo "Floating Yomitan popup: $title ($addr)"
        hyprctl dispatch setfloating "$print_addr"
        echo "$addr" >> "$floated_file"
      fi
      ;;
  esac
}

# Connect to Hyprland's IPC socket and handle events line-by-line
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | \
while read -r line; do
  handle "$line"
done
