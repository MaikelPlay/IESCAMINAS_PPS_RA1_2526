# 2. Apartado 2: Scripting Bash (Info de Sistema)

Este apartado contiene un script avanzado en Bash diseñado para obtener y mostrar información detallada del sistema en una sola línea formateada, útil para registros o logs.

## 📋 Descripción Técnica

* **Archivo:** `info_sistema_pro.sh`
* **Lenguaje:** Bash (Shell Scripting).
* **Compatibilidad:** Híbrida. Detecta automáticamente si se ejecuta en **Git Bash (Windows/MinGW)** o en **Linux/WSL** y utiliza los comandos nativos apropiados (`ipconfig`/`wmic` vs `ip`/`cat`).

## 🚀 Datos Obtenidos

El script recopila y muestra los siguientes campos separados por tuberías (`|`) y coloreados:
1.  Fecha y Hora actual.
2.  Nombre del Equipo (Hostname) y Usuario actual.
3.  Usuario Gráfico (detecta el usuario real de Windows incluso desde WSL).
4.  Sistema Operativo, Kernel y Build.
5.  Modelo del Hardware.
6.  Entorno de ejecución (Mingw, WSL, Linux nativo).
7.  Dirección MAC y direcciones IP (Local y Pública).
8.  Puerta de enlace (Gateway).
9.  Recursos: Memoria RAM Total y Espacio libre en disco.
10. Ruta absoluta del script.

## 💻 Instrucciones de Ejecución

Desde la terminal (Git Bash o Linux), navegue a esta carpeta y ejecute:

```bash
chmod +x info_sistema_pro.sh
./info_sistema_pro.sh