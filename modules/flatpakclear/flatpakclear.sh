#!/usr/bin/env bash
set -euo pipefail

echo "Uninstalling all Flatpak applications..."

# Uninstall all user-installed Flatpaks
flatpak uninstall -y --delete-data

echo "Flatpak cleanup complete."
