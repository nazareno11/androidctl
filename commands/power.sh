#!/bin/bash

lock_screen() {
    clear

    echo "=== BLOQUEAR PANTALLA ==="
    echo

    run_rish "input keyevent 26"

    echo "Pantalla bloqueada."
    sleep 2
}

reboot_device() {
    clear

    echo "=== REINICIAR TELÉFONO ==="
    echo

    read -p "¿Seguro que querés reiniciar? [s/N]: " confirm

    if [[ "$confirm" =~ ^[Ss]$ ]]; then
        run_rish "reboot"
    else
        echo "Operación cancelada."
        sleep 2
    fi
}

shutdown_device() {
    clear

    echo "=== APAGAR TELÉFONO ==="
    echo

    read -p "¿Seguro que querés apagar? [s/N]: " confirm

    if [[ "$confirm" =~ ^[Ss]$ ]]; then
        run_rish "reboot -p"
    else
        echo "Operación cancelada."
        sleep 2
    fi
}
