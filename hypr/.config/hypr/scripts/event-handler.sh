#!/usr/bin/env bash

# 1. Esperar a que Hyprland esté completamente inicializado
wait_for_hyprland() {
    while [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ] || [ ! -S "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" ]; do
		  echo "In the wait hyprland"
        sleep 1
    done
}


# 2. Función principal
# Función principal que se ejecuta continuamente
main_loop() {
    while true; do
		  echo "Doing something I guess"
        wait_for_hyprland
        
        SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
        echo "Conectando al socket: $SOCKET_PATH"
        
        # Configuración inicial
        ~/.config/hypr/scripts/monitor-setup.sh
        
        # Conexión al socket con gestión de errores
        socat -u "UNIX-CONNECT:$SOCKET_PATH" - | while read -r line; do
            case "$line" in
                monitoradded*|monitorremoved*)
                    echo "Evento detectado: $line"
                    ~/.config/hypr/scripts/monitor-setup.sh
                    ;;
            esac
        done
        
        # Si llegamos aquí, la conexión se perdió
        echo "Conexión perdida, reconectando en 2 segundos..."
        sleep 2
    done
}

# Ejecutar en segundo plano
main_loop & disown
