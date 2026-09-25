#!/bin/bash

system_info() {
    clear

    echo "=== INFORMACIÓN DEL TELÉFONO ==="
    echo

    echo "Modelo:"
    run_rish "getprop ro.product.model"

    echo
    echo "Fabricante:"
    run_rish "getprop ro.product.manufacturer"

    echo
    echo "Android:"
    run_rish "getprop ro.build.version.release"

    echo
    echo "SDK:"
    run_rish "getprop ro.build.version.sdk"

    echo
    read -p "Presioná Enter para continuar..."
}
