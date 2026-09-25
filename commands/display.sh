#!/bin/bash

display_info() {
    clear

    echo "=== INFORMACIÓN DE PANTALLA ==="
    echo

    run_rish "wm size"

    echo

    run_rish "wm density"

    echo
    read -p "Presioná Enter para continuar..."
}

display_brightness() {
    clear

    echo "=== BRILLO ==="
    echo

    echo "Brillo actual:"
    run_rish "settings get system screen_brightness"

    echo
    read -p "Presioná Enter para continuar..."
}
