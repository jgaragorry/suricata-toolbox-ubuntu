#!/bin/bash

# --- Script para Desinstalar y Erradicar Suricata (Versión Corregida) ---

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

# 3. Desinstalar los paquetes (CORREGIDO)
echo "Desinstalando Suricata (purge)..."
apt-get purge -y suricata
apt-get purge -y suricata-oinkmaster > /dev/null 2>&1 || true # Oculta el error si no existe

# 4. Limpiar dependencias no usadas
apt-get autoremove -y

# 5. Eliminar el repositorio PPA
echo "Eliminando el repositorio PPA de Suricata..."
add-apt-repository --remove -y ppa:oisf/suricata-stable > /dev/null 2>&1

# 6. Eliminar directorios residuales
echo "Eliminando directorios de configuración, logs y datos para una limpieza completa..."
rm -rf /etc/suricata
rm -rf /var/log/suricata
rm -rf /var/lib/suricata

echo ""
echo "🗑️ ¡Erradicación completada!"
echo "Suricata ha sido eliminado por completo del sistema."
