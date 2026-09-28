#!/bin/bash

battery_info() {
    clear

    echo "=== BATERÍA ==="
    echo

    local battery_info
    battery_info=$(run_rish "dumpsys battery")

    local level
    level=$(echo "$battery_info" | grep "level:" | awk '{print $2}')

    local status
    status=$(echo "$battery_info" | grep "status:" | awk '{print $2}')

    local health
    health=$(echo "$battery_info" | grep "health:" | awk '{print $2}')

    local voltage
    voltage=$(echo "$battery_info" | grep "voltage:" | awk '{print $2}')

    local temperature
    temperature=$(echo "$battery_info" | grep "temperature:" | awk '{print $2}')

    local ac
    ac=$(echo "$battery_info" | grep "AC powered:" | awk '{print $3}')

    local usb
    usb=$(echo "$battery_info" | grep "USB powered:" | awk '{print $3}')

    local wireless
    wireless=$(echo "$battery_info" | grep "Wireless powered:" | awk '{print $3}')

    case "$status" in
        1) status_text="Desconocido" ;;
        2) status_text="Cargando" ;;
        3) status_text="Descargando" ;;
        4) status_text="No está cargando" ;;
        5) status_text="Carga completa" ;;
        *) status_text="Desconocido" ;;
    esac

    case "$health" in
        1) health_text="1 Desconocida" ;;
        2) health_text="2 Buena" ;;
        3) health_text="3 Sobrecalentada" ;;
        4) health_text="4 Dañada" ;;
        5) health_text="5 Sobrevoltaje" ;;
        6) health_text="6 Fallo no especificado" ;;
        7) health_text="7 Fría" ;;
        *) health_text="Desconocida" ;;
    esac

    local power_source="No conectado"

    if [ "$ac" = "true" ]; then
        power_source="Cargador AC"
    elif [ "$usb" = "true" ]; then
        power_source="USB"
    elif [ "$wireless" = "true" ]; then
        power_source="Carga inalámbrica"
    fi

    echo "Porcentaje:   ${level}%"
    echo "Estado:       $status_text"
    echo "Salud:        $health_text"

    if [ -n "$temperature" ]; then
        local temperature_c
        temperature_c=$(awk "BEGIN {printf \"%.1f\", $temperature / 10}")
        echo "Temperatura:  ${temperature_c} °C"
    fi

    echo "Voltaje:      ${voltage} mV"
    echo "Alimentación: $power_source"

    echo
    read -p "Presioná Enter para continuar..."
}
