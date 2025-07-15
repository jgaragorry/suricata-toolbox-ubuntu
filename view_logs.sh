#!/bin/bash

# --- Script para Visualizar Logs de Suricata ---

LOG_DIR="/var/log/suricata"

if [ ! -d "$LOG_DIR" ]; then
  echo "El directorio de logs de Suricata no existe. ¿Está instalado Suricata?" >&2
  exit 1
fi

echo "Selecciona el log que quieres ver:"
echo "1) Alertas Detalladas (eve.json - Recomendado)"
echo "2) Alertas Rápidas (fast.log)"
echo "3) Estado del Servicio (suricata.log)"
echo "4) Salir"

read -p "Elige una opción [1-4]: " choice

case $choice in
  1)
    echo "Mostrando eve.json (Ctrl+C para salir)..."
    sudo tail -f $LOG_DIR/eve.json | jq '.'
    ;;
  2)
    echo "Mostrando fast.log (Ctrl+C para salir)..."
    sudo tail -f $LOG_DIR/fast.log
    ;;
  3)
    echo "Mostrando suricata.log (presiona 'q' para salir)..."
    sudo less $LOG_DIR/suricata.log
    ;;
  4)
    echo "Saliendo."
    exit 0
    ;;
  *)
    echo "Opción no válida."
    exit 1
    ;;
esac
