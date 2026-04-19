#!/bin/bash
echo "Installing portalfetch..."

# Create config directory if it doesn't exist
sudo mkdir -p /usr/local/share/portalfetch

# Copy the quotes database
sudo cp quotes.txt /usr/local/share/portalfetch/
sudo cp --parents logos/* /usr/local/share/portalfetch/
sudo cp --parents lib/* /usr/local/share/portalfetch/
sudo cp --parents config/* /usr/local/share/portalfetch/

sudo chmod +x /usr/local/share/portalfetch/lib/get_ssh_client.sh
sudo chmod +x /usr/local/share/portalfetch/lib/get_terminal.sh
sudo chmod +x /usr/local/share/portalfetch/lib/get_public_ip.sh

# Install the executable script globally
sudo cp portalfetch /usr/local/bin/portalfetch
sudo chmod +x /usr/local/bin/portalfetch

echo "HUGE SUCCESS. Type 'portalfetch' to run."
