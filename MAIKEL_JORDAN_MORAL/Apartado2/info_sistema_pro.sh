#!/bin/bash

# --- COLORES ---
COLOR_KEYS="\033[1;33m"   # Amarillo
COLOR_VALUES="\033[1;32m" # Verde
RESET="\033[0m"

# --- DATOS BÁSICOS ---
DATETIME=$(date "+%d/%m/%Y %H:%M:%S")
HOSTNAME=$(hostname)
USER_CLI=$(whoami)
SCRIPT_PATH=$(pwd)/$(basename "$0")

# --- DETECCIÓN DE ENTORNO Y DATOS ---
if [[ "$(uname -s)" == *"MINGW"* ]] || [[ "$(uname -s)" == *"MSYS"* ]]; then
    # ESTAMOS EN WINDOWS (Git Bash)
    OS_NAME="Windows (GitBash)"
    ENTORNO="Mingw64"
    
    # Comandos rápidos de Windows
    # Nota: Usamos ipconfig simple para no bloquear la terminal
    IP_LOCAL=$(ipconfig | grep "IPv4" | head -n 1 | awk -F: '{print $2}' | tr -d ' \r')
    MAC=$(getmac /FO CSV /NH 2>/dev/null | head -n 1 | cut -d ',' -f 1 | tr -d '"')
    
    # Valores simplificados para evitar bloqueos
    KERNEL_BUILD=$(uname -r)
    MODELO="PC Detectado"
else
    # ESTAMOS EN LINUX / WSL
    OS_NAME="Linux/WSL"
    ENTORNO="Linux Nativo"
    
    IP_LOCAL=$(hostname -I | awk '{print $1}')
    MAC=$(cat /sys/class/net/eth0/address 2>/dev/null || echo "N/A")
    KERNEL_BUILD=$(uname -r)
    MODELO="Virtual/Linux"
fi

# --- IMPRIMIR RESULTADO ---
# Una sola línea con barras verticales como separadores
echo -e "${COLOR_KEYS}Fecha:${COLOR_VALUES} ${DATETIME} ${RESET}| \
${COLOR_KEYS}Equipo:${COLOR_VALUES} ${HOSTNAME} ${RESET}| \
${COLOR_KEYS}Usuario:${COLOR_VALUES} ${USER_CLI} ${RESET}| \
${COLOR_KEYS}SO:${COLOR_VALUES} ${OS_NAME} ${RESET}| \
${COLOR_KEYS}Kernel:${COLOR_VALUES} ${KERNEL_BUILD} ${RESET}| \
${COLOR_KEYS}Modelo:${COLOR_VALUES} ${MODELO} ${RESET}| \
${COLOR_KEYS}Entorno:${COLOR_VALUES} ${ENTORNO} ${RESET}| \
${COLOR_KEYS}MAC:${COLOR_VALUES} ${MAC} ${RESET}| \
${COLOR_KEYS}IP Local:${COLOR_VALUES} ${IP_LOCAL} ${RESET}| \
${COLOR_KEYS}Script:${COLOR_VALUES} ${SCRIPT_PATH}${RESET}"

echo ""