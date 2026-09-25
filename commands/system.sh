#!/bin/bash

system_info() {
    clear

    echo "=== INFORMACIÓN DEL TELÉFONO ==="
    echo

    echo "Modelo:"
    $RISH -c "getprop ro.product.model"

    echo
    echo "Fabricante:"
    $RISH -c "getprop ro.product.manufacturer"

    echo
    echo "Android:"
    $RISH -c "getprop ro.build.version.release"

    echo
    echo "SDK:"
    $RISH -c "getprop ro.build.version.sdk"

    echo
    read -p "Presioná Enter para continuar..."
}
