#!/usr/bin/env bash
set -euo pipefail

echo "Uninstalling all Flatpak applications..."

# Uninstall all user-installed Flatpaks
flatpak list --app --columns=application | while read app; do
    flatpak uninstall -y --user "$app"
done

# Uninstall all system-installed Flatpaks
flatpak list --app --system --columns=application | while read app; do
    sudo flatpak uninstall -y --system "$app"
done

echo "Removing Flatpak data directories..."

# Remove user Flatpak data
rm -rf ~/.var/app
rm -rf ~/.local/share/flatpak
rm -rf ~/.cache/flatpak
rm -rf ~/.config/flatpak

# Remove system Flatpak data (requires sudo)
sudo rm -rf /var/lib/flatpak
sudo rm -rf /etc/flatpak

echo "Flatpak cleanup complete."
