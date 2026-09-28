#!/bin/bash

stats_info() {
    clear

    echo "=== ESTADÍSTICAS ==="
    echo

    local uptime_info
    uptime_info=$(run_rish "uptime")

    local uptime_text
    uptime_text=$(echo "$uptime_info" | sed -E 's/.*up (.*), +[0-9]+ users,.*/\1/')

    echo "Tiempo encendido: $uptime_text"

    echo
    echo "RAM:"

    local mem_info
    mem_info=$(run_rish "dumpsys meminfo")

    local total_ram
    total_ram=$(echo "$mem_info" | grep "^Total RAM:" | awk '{gsub(/,|K/, "", $3); print $3}')

    local free_ram
    free_ram=$(echo "$mem_info" | grep "^ Free RAM:" | awk '{gsub(/,|K/, "", $3); print $3}')

    local used_ram
    used_ram=$(echo "$mem_info" | grep "^ Used RAM:" | awk '{gsub(/,|K/, "", $3); print $3}')

    if [ -n "$total_ram" ]; then
        echo "  Total:       $(awk "BEGIN {printf \"%.2f GiB\", $total_ram / 1024 / 1024}")"
    fi

    if [ -n "$used_ram" ]; then
        echo "  Usada:       $(awk "BEGIN {printf \"%.2f GiB\", $used_ram / 1024 / 1024}")"
    fi

    if [ -n "$free_ram" ]; then
        echo "  Disponible:  $(awk "BEGIN {printf \"%.2f GiB\", $free_ram / 1024 / 1024}")"
    fi

    local zram
    zram=$(echo "$mem_info" | grep "^     ZRAM:")

    if [ -n "$zram" ]; then
        echo
        echo "ZRAM:"
        echo "$zram"
    fi

    echo
    echo "Carga del sistema:"

    local load_average
    load_average=$(echo "$uptime_info" | sed 's/.*load average: //')

    if [ -n "$load_average" ]; then
        local load_1
        local load_5
        local load_15

        load_1=$(echo "$load_average" | cut -d',' -f1 | xargs)
        load_5=$(echo "$load_average" | cut -d',' -f2 | xargs)
        load_15=$(echo "$load_average" | cut -d',' -f3 | xargs)

        echo "  1 minuto:    $load_1"
        echo "  5 minutos:   $load_5"
        echo "  15 minutos:  $load_15"
    fi

    echo
    read -p "Presioná Enter para continuar..."
}
