#!/bin/bash
echo "Installing portalfetch..."

# Create config directory if it doesn't exist
sudo mkdir -p /usr/local/share/portalfetch

# Copy the quotes database
sudo cp quotes.txt /usr/local/share/portalfetch/
sudo cp -r logos/ /usr/local/share/portalfetch/logos/

# Install the executable script globally
sudo cp portalfetch /usr/local/bin/portalfetch
sudo chmod +x /usr/local/bin/portalfetch

echo "HUGE SUCCESS. Type 'portalfetch' to run."
