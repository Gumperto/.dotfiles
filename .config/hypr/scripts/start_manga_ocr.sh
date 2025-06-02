#!/bin/bash

VENV_PATH="$HOME/test"  # Change to your venv path
PID_FILE="/tmp/manga_ocr.pid"
LOG_FILE="/tmp/manga_ocr.log"
OCR_COMMAND='manga_ocr "/home/gumperto/Pictures/JP-Trans/"'  # Or replace with correct entrypoint if different


get_mode() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p "$PID" > /dev/null; then
            echo "{\"text\": \"Manga_OCR on\", \"alt\": \"on\"}"
        else
            echo "{\"text\": \"Manga_OCR off\", \"alt\": \"off\"}"
        fi
    else
        echo "{\"text\": \"Manga_OCR off\", \"alt\": \"off\"}"
    fi
}

# === FUNCTION TO START MANGA_OCR ===
start_manga_ocr() {
    echo "Starting manga_ocr..."
    source "$VENV_PATH/bin/activate"
    nohup $OCR_COMMAND > "$LOG_FILE" 2>&1 &
    echo $! > "$PID_FILE"
    echo "manga_ocr started with PID $(cat $PID_FILE)"
}

# === FUNCTION TO STOP MANGA_OCR ===
stop_manga_ocr() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        echo "Stopping manga_ocr (PID $PID)..."
        kill "$PID"
        rm "$PID_FILE"
        echo "manga_ocr stopped."
    else
        echo "No PID file found. Is manga_ocr running?"
    fi
}

# === TOGGLE LOGIC ===
if [[ "$1" == "--toggle" ]]; then
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p "$PID" > /dev/null; then
            stop_manga_ocr
            notify-send "📕 Stopped Manga OCR"
        else
            echo "PID file exists but process not running. Cleaning up."
            rm "$PID_FILE"
            start_manga_ocr
            notify-send "📖 Started Manga OCR" "ちょっと待ってください"
        fi
    else
        start_manga_ocr
        notify-send "📖 Started Manga OCR" "ちょっと待ってください"
    fi
fi

get_mode | jq --unbuffered --compact-output
