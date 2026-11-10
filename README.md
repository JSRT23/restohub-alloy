# 📈 RestoHub Alloy

Configuración de **Grafana Alloy** que recoge las métricas de los 7 microservicios de RestoHub desplegados en Render y las envía a **Grafana Cloud** (Prometheus gestionado).

![Grafana](https://img.shields.io/badge/Grafana-Alloy-F46800?logo=grafana&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-ready-2496ED?logo=docker&logoColor=white)

## Qué hace

`config.alloy` define un `prometheus.scrape` sobre cada servicio (`menu`, `staff`, `order`, `inventory`, `loyalty`, `auth`, `gateway`) y reenvía las métricas a Grafana Cloud.

## Cómo correrlo

### Con Docker

```bash
git clone https://github.com/JSRT23/restohub-alloy.git
cd restohub-alloy
docker build -t restohub-alloy .
docker run -p 12345:12345 -e GRAFANA_CLOUD_TOKEN=<tu-token> restohub-alloy      # UI de Alloy en http://localhost:12345
```

La imagen parte de `grafana/alloy` y arranca con `config.alloy`.

### Sin Docker

Instala [Grafana Alloy](https://grafana.com/docs/alloy/latest/set-up/install/) y ejecuta:

```bash
GRAFANA_CLOUD_TOKEN=<tu-token> alloy run --server.http.listen-addr=0.0.0.0:12345 config.alloy
```

## Credenciales

El token de Grafana Cloud se lee de la variable de entorno `GRAFANA_CLOUD_TOKEN` (no se versiona).
