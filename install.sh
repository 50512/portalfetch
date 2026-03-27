#!/bin/bash
echo "Installing portalfetch..."

# Create config directory if it doesn't exist
mkdir -p ~/.config/fastfetch

# Copy the quotes database
cp quotes.txt ~/.config/fastfetch/

# Install the executable script globally
sudo cp portalfetch /usr/local/bin/portalfetch
sudo chmod +x /usr/local/bin/portalfetch

echo "HUGE SUCCESS. Type 'portalfetch' to run."
