#!/bin/sh

# Kill switch combo
setxkbmap -option terminate:ctrl_alt_bksp

# Disable screen blanking / DPMS (optional, keeps screen active)
xset s off
xset -dpms
xset s noblank

# Set keyboard layout (adjust if needed)
setxkbmap be

# Enable NVIDIA PRIME offload if using Intel + NVIDIA hybrid
# This will make NVIDIA the offload GPU for apps using DRI_PRIME=1
export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0

# Load background or compositor (optional)
# feh --bg-scale /usr/share/backgrounds/your-wallpaper.jpg &
# picom &

# Start DE session, uncomment to choose:
#exec dwm
#exec startxfce4
#exec startlxqt
#exec startplasma-x11
#exec openbox-session
#exec <your Desktop Environment here>
