#!/bin/bash

display_info() {
    clear

    echo "=== INFORMACIÓN DE PANTALLA ==="
    echo

    $RISH -c "wm size"

    echo

    $RISH -c "wm density"

    echo
    read -p "Presioná Enter para continuar..."
}

display_brightness() {
    clear

    echo "=== BRILLO ==="
    echo

    echo "Brillo actual:"
    $RISH -c "settings get system screen_brightness"

    echo
    read -p "Presioná Enter para continuar..."
}
