#!/bin/bash

lock_screen() {
    $RISH -c "input keyevent 26"
}

reboot_device() {
    echo
    read -p "¿Reiniciar el teléfono? [s/N]: " confirmar

    if [[ "$confirmar" == "s" || "$confirmar" == "S" ]]; then
        echo "Reiniciando..."
        sleep 1
        $RISH -c "reboot"
    fi
}

shutdown_device() {
    echo
    read -p "¿Apagar el teléfono? [s/N]: " confirmar

    if [[ "$confirmar" == "s" || "$confirmar" == "S" ]]; then
        echo "Apagando..."
        sleep 1
        $RISH -c "reboot -p"
    fi
}
