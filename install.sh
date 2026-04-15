#!/bin/bash
echo "Installing portalfetch..."

# Create config directory if it doesn't exist
sudo mkdir -p /usr/local/share/portalfetch

# Copy the quotes database
sudo cp quotes.txt /usr/local/share/portalfetch/
sudo cp -r logos/ /usr/local/share/portalfetch/logos/
sudo cp -r lib/ /usr/local/share/portalfetch/lib/
sudo cp -r config/ /usr/local/share/portalfetch/config/

sudo chmod +x /usr/local/share/portalfetch/lib/get_ssh_client.sh
sudo chmod +x /usr/local/share/portalfetch/lib/get_terminal.sh

# Install the executable script globally
sudo cp portalfetch /usr/local/bin/portalfetch
sudo chmod +x /usr/local/bin/portalfetch

echo "HUGE SUCCESS. Type 'portalfetch' to run."
