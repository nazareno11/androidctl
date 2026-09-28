#!/bin/bash

battery_info() {
    clear

    echo "--- BATERÍA INFORMACION  ---"
    echo

    local battery_info
    battery_info=$(run_rish "dumpsys battery")

    local level
    level=$(echo "$battery_info" | grep "level:" | awk '{print $2}')

    local status
    status=$(echo "$battery_info" | grep "status:" | awk '{print $2}')

    local temperature
    temperature=$(echo "$battery_info" | grep "temperature:" | awk '{print $2}')

    local voltage
    voltage=$(echo "$battery_info" | grep "voltage:" | awk '{print $2}')

    local health
    health=$(echo "$battery_info" | grep "health:" | awk '{print $2}')

    local plugged
    plugged=$(echo "$battery_info" | grep "AC powered:")

    echo "Porcentaje: $level%"

    echo
    echo "Estado: $status"

    echo
    if [ -n "$temperature" ]; then
        echo "Temperatura: $(awk "BEGIN {printf \"%.1f\", $temperature / 10}") °C"
    fi

    echo
    echo "Voltaje: $voltage mV"

    echo
    echo "Salud: $health"

    echo
    echo "Alimentación:"
    echo "$plugged"

    echo
    read -p "Presioná Enter para continuar..."
}
