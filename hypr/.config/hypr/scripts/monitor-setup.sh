#!/usr/bin/env bash

# Esperar a que hyprctl esté disponible
wait_for_hyprctl() {
    while ! hyprctl monitors >/dev/null 2>&1; do
        sleep 0.5
    done
}

wait_for_hyprctl

# Configuración para el monitor LG
configure_monitors() {
    if hyprctl monitors -j | jq -e '.[] | select(.model == "LG ULTRAWIDE")' >/dev/null; then
        echo "Configurando monitor LG arriba del notebook"
        
        LAPTOP_INFO=$(hyprctl monitors -j | jq '.[] | select(.name == "eDP-1")')
        LAPTOP_WIDTH=$(jq -r '.width' <<< "$LAPTOP_INFO")
        LAPTOP_HEIGHT=$(jq -r '.height' <<< "$LAPTOP_INFO")
        
        # Posición vertical (monitor LG arriba, notebook abajo)
        hyprctl keyword monitor "HDMI-A-1, 2560x1080@60, $(( (2560 - LAPTOP_WIDTH) / 2 ))x-$LAPTOP_HEIGHT, 1.0"
        hyprctl keyword monitor "eDP-1, ${LAPTOP_WIDTH}x${LAPTOP_HEIGHT}@60, $(( (2560 - LAPTOP_WIDTH) / 2 ))x0, 1.0"
		  sleep 0.3
        # Workspaces
        hyprctl keyword workspace 1, monitor:eDP-1
        hyprctl keyword workspace 2, monitor:eDP-1
        hyprctl keyword workspace 0, monitor:HDMI-A-1
		  hyprctl hyprpaper wallpaper HDMI-A-1, ~/Imágenes/Wallpaper/dragon.jpg
    else
        echo "Configuración solo para notebook"
        hyprctl keyword monitor "eDP-1, preferred, auto, 1"
        hyprctl keyword workspace 1, monitor:eDP-1
    fi
}

configure_monitors
