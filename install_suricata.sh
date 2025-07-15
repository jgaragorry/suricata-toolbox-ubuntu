#!/bin/bash

# --- Script para Instalar y Configurar Suricata en Ubuntu Server LTS ---

# 1. Validar que se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script debe ejecutarse como root. Usa: sudo ./install_suricata.sh" >&2
  exit 1
fi

# 2. Detectar la interfaz de red principal
INTERFACE=$(ip -o -4 route show to default | awk '{print $5}')
if [ -z "$INTERFACE" ]; then
  echo "No se pudo detectar la interfaz de red principal. Saliendo." >&2
  exit 1
fi
echo "Interfaz de red detectada: $INTERFACE"

# 3. Agregar el repositorio oficial de Suricata
echo "Agregando el repositorio PPA de Suricata..."
add-apt-repository -y ppa:oisf/suricata-stable

# 4. Actualizar e instalar Suricata
echo "Actualizando paquetes e instalando Suricata..."
apt-get update
apt-get install -y suricata jq

# 5. Configurar la interfaz de red en suricata.yaml
echo "Configurando la interfaz de red en suricata.yaml..."
sed -i "s/interface: eth0/interface: $INTERFACE/" /etc/suricata/suricata.yaml

# 6. Actualizar las reglas de Suricata
echo "Actualizando las reglas de Suricata..."
suricata-update

# 7. Reiniciar y habilitar el servicio
echo "Reiniciando y habilitando el servicio de Suricata..."
systemctl restart suricata
systemctl enable suricata

echo ""
echo "✅ ¡Instalación completada!"
echo "Suricata está monitoreando la interfaz: $INTERFACE"
systemctl status suricata
