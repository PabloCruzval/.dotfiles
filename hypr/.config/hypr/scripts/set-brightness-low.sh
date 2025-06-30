#!/bin/bash

# Obtener el brillo actual
current=$(ddcutil getvcp 10 | awk '/current value/ { gsub(/.*= |,.*/, "", $0); print $0 }')


# Guardar el valor
echo $current > /tmp/last-brightness

# Establecer brillo bajo
ddcutil setvcp 10 10

