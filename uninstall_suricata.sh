#!/bin/bash

# --- Script para Desinstalar y Erradicar Suricata ---

# 1. Validar que se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script debe ejecutarse como root. Usa: sudo ./uninstall_suricata.sh" >&2
  exit 1
fi

echo "Este script detendrá y eliminará Suricata y TODOS sus archivos de forma definitiva."
read -p "¿Estás seguro de que quieres continuar? (s/n): " confirm

if [[ "$confirm" != "s" ]]; then
  echo "Operación cancelada."
  exit 0
fi

# 2. Detener y deshabilitar el servicio
echo "Deteniendo y deshabilitando el servicio de Suricata..."
systemctl stop suricata > /dev/null 2>&1
systemctl disable suricata > /dev/null 2>&1

# 3. Desinstalar los paquetes
echo "Desinstalando Suricata (purge)..."
apt-get purge -y suricata suricata-oinkmaster
apt-get autoremove -y

# 4. Eliminar el repositorio PPA
echo "Eliminando el repositorio PPA de Suricata..."
add-apt-repository --remove -y ppa:oisf/suricata-stable

# 5. PASOS ADICIONALES: Eliminar directorios residuales
echo "Eliminando directorios de configuración, logs y datos para una limpieza completa..."
rm -rf /etc/suricata
rm -rf /var/log/suricata
rm -rf /var/lib/suricata

echo ""
echo "🗑️ ¡Erradicación completada!"
echo "Suricata ha sido eliminado por completo del sistema."
