#!/bin/bash
print_formatted_ip() {
  local FILE="$1"
  echo "$(jq -r ".ip" "$FILE") ($(jq -r ".city" "$FILE"), $(jq -r ".country" "$FILE"))"
}

CACHE_DIR="$HOME/.cache/portalfetch"
CACHE_IP="$CACHE_DIR/public_ip.json"

mkdir -p $CACHE_DIR

# Check internet connection
if ! host google.com 1.1.1.1 > /dev/null 2>&1; then
  rm -f "$CACHE_IP"
  echo "Offline (no connection)"
  exit 0
fi

if [[ -f "$CACHE_IP" ]]; then

  expire_seconds=3600
  last_modified=$(stat -c %Y "$CACHE_IP")
  current_time=$(date +%s)
  age=$((current_time - last_modified))

  if [[ ! "$age" -gt "$expire_seconds" ]]; then
    print_formatted_ip "$CACHE_IP"
    exit 0
  else
    rm "$CACHE_IP"
  fi
fi

FETCH_IP=$(curl -s -f -4 --max-time 3 https://ipinfo.io/json)

if [[ -n "$FETCH_IP" ]]; then
  echo "$FETCH_IP" > "$CACHE_IP"
  print_formatted_ip "$CACHE_IP"
else
  echo "Offline (cannot get ipinfo.io)"
fi