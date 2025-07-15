# Scripts de Gestión para Suricata en Ubuntu LTS

Este repositorio contiene un conjunto de scripts para automatizar la **instalación, gestión y desinstalación** de Suricata IDS/IPS en servidores **Ubuntu Server LTS** (22.04, 24.04, etc.).

## ✅ Filosofía y Logros

El objetivo de este proyecto es **simplificar y estandarizar** la administración de Suricata, eliminando la complejidad y los errores comunes de la instalación manual.

**¿Qué logramos con estos scripts?**

1.  **Instalación en Minutos, No en Horas:** Pasamos de un proceso manual, propenso a errores y que requiere consultar documentación, a una **instalación desatendida y perfecta en menos de 5 minutos**.
2.  **Cero Errores de Configuración:** El script de instalación detecta automáticamente la interfaz de red correcta y la configura, evitando el problema más común al empezar con Suricata.
3.  **Aplicación de Buenas Prácticas:** Se utiliza siempre el repositorio oficial (PPA) para garantizar que se instala la última versión estable y que el sistema puede recibir futuras actualizaciones de seguridad.
4.  **Gestión Accesible para Todos:** Con el visualizador de logs, cualquier administrador, sin importar su nivel de experiencia con el comando `jq`, puede monitorear las alertas de seguridad de forma eficiente.
5.  **Consistencia y Escalabilidad:** Permite desplegar configuraciones idénticas de Suricata en múltiples servidores de forma rápida y fiable.
6.  **Limpieza Garantizada:** El script de desinstalación asegura que el sistema vuelve a su estado original sin dejar paquetes, configuraciones o repositorios residuales que puedan causar problemas a futuro.

En resumen, este repositorio transforma la gestión de Suricata en un proceso **rápido, fiable y accesible para cualquier nivel de usuario**.

---

## 🚀 Scripts del Repositorio

### 1. `install_suricata.sh`

* **Propósito:** Realizar una instalación completa y funcional de Suricata desde cero.
* **Logro:** Automatiza más de 10 pasos manuales en un solo comando. Se encarga de agregar el PPA, instalar el paquete, detectar y configurar la interfaz de red, descargar las reglas de amenazas más recientes y activar el servicio. Al finalizar, tendrás una instancia de Suricata monitoreando tu red activamente.

**Ejecución:**
```bash
sudo ./install_suricata.sh
```

¡Excelente idea! Un buen nombre y una explicación clara del "porqué" son clave para que un repositorio sea útil para la comunidad.

Nombres Sugeridos para el Repositorio
Aquí tienes algunas opciones, de la más descriptiva a la más concisa. Cualquiera de ellas es una excelente elección:

suricata-scripts-ubuntu: Claro, profesional y directo. Indica exactamente lo que contiene.

suricata-facil-ubuntu: Destaca el principal beneficio del repositorio: la simplicidad.

suricata-toolbox-ubuntu: Sugiere que es una "caja de herramientas" para gestionar Suricata.

Recomendación: suricata-scripts-ubuntu es probablemente la mejor opción por ser estándar y fácil de encontrar.

README.md Actualizado y Detallado
Aquí está la versión mejorada del README.md. He añadido una nueva sección llamada "Filosofía y Logros" y he detallado más el propósito de cada script para que quede muy claro el valor que aporta el repositorio.

Copia y pega este contenido en tu archivo README.md.

Markdown

# Scripts de Gestión para Suricata en Ubuntu LTS

Este repositorio contiene un conjunto de scripts para automatizar la **instalación, gestión y desinstalación** de Suricata IDS/IPS en servidores **Ubuntu Server LTS** (22.04, 24.04, etc.).

## ✅ Filosofía y Logros

El objetivo de este proyecto es **simplificar y estandarizar** la administración de Suricata, eliminando la complejidad y los errores comunes de la instalación manual.

**¿Qué logramos con estos scripts?**

1.  **Instalación en Minutos, No en Horas:** Pasamos de un proceso manual, propenso a errores y que requiere consultar documentación, a una **instalación desatendida y perfecta en menos de 5 minutos**.
2.  **Cero Errores de Configuración:** El script de instalación detecta automáticamente la interfaz de red correcta y la configura, evitando el problema más común al empezar con Suricata.
3.  **Aplicación de Buenas Prácticas:** Se utiliza siempre el repositorio oficial (PPA) para garantizar que se instala la última versión estable y que el sistema puede recibir futuras actualizaciones de seguridad.
4.  **Gestión Accesible para Todos:** Con el visualizador de logs, cualquier administrador, sin importar su nivel de experiencia con el comando `jq`, puede monitorear las alertas de seguridad de forma eficiente.
5.  **Consistencia y Escalabilidad:** Permite desplegar configuraciones idénticas de Suricata en múltiples servidores de forma rápida y fiable.
6.  **Limpieza Garantizada:** El script de desinstalación asegura que el sistema vuelve a su estado original sin dejar paquetes, configuraciones o repositorios residuales que puedan causar problemas a futuro.

En resumen, este repositorio transforma la gestión de Suricata en un proceso **rápido, fiable y accesible para cualquier nivel de usuario**.

---

## 🚀 Scripts del Repositorio

### 1. `install_suricata.sh`

* **Propósito:** Realizar una instalación completa y funcional de Suricata desde cero.
* **Logro:** Automatiza más de 10 pasos manuales en un solo comando. Se encarga de agregar el PPA, instalar el paquete, detectar y configurar la interfaz de red, descargar las reglas de amenazas más recientes y activar el servicio. Al finalizar, tendrás una instancia de Suricata monitoreando tu red activamente.

**Ejecución:**
```bash
sudo ./install_suricata.sh
```
2. view_logs.sh
Propósito: Facilitar el monitoreo diario de la actividad detectada por Suricata.

* **Logro: Ofrece un menú interactivo que evita tener que recordar las rutas de los logs y los complejos comandos de filtrado. Con solo pulsar un número, puedes ver alertas de seguridad, el estado del servicio o un resumen rápido, haciendo el análisis de seguridad mucho más ágil.

Ejecución:

```Bash

./view_logs.sh
```
3. uninstall_suricata.sh
Propósito: Eliminar por completo Suricata y todos sus componentes del sistema.

* **Logro: Garantiza una desinstalación limpia y segura. No solo elimina el programa, sino que también purga los archivos de configuración, los logs acumulados y el PPA del sistema, evitando conflictos si se desea reinstalar en el futuro.

Ejecución:

```Bash

sudo ./uninstall_suricata.sh
```
🔧 Requisitos Previos
Un servidor con Ubuntu Server LTS (22.04 o superior).

Acceso a internet.

Permisos de superusuario (sudo).

🛠️ Guía Rápida de Uso
Clonar el Repositorio:

```Bash

git clone [https://github.com/tu-usuario/suricata-scripts-ubuntu.git](https://github.com/tu-usuario/suricata-scripts-ubuntu.git)
cd suricata-scripts-ubuntu
```
Dar Permisos de Ejecución:

```Bash

chmod +x *.sh
```
Ejecutar el script deseado (ver sección de scripts).
