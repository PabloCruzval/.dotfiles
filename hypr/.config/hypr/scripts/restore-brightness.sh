#!/bin/bash

# Leer valor guardado
if [ -f /tmp/last-brightness ]; then
    value=$(cat /tmp/last-brightness)
    ddcutil setvcp 10 $value
fi

