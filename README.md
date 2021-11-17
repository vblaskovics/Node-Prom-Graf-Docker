## Katakoda inicializálása

1. Lépj be a Katakoda Sandbox környezetébe:

(Katakoda Ubuntu Playground)[https://www.katacoda.com/courses/ubuntu/playground]

2. A terminal-ba belépve add ki a következő parancsot:

```
git clone https://github.com/vblaskovics/Node-Prom-Graf-Docker
```

3. Miután lejött a git repo, lépj is bele:

```
cd Node-Prom-Graf-Docker
```

## Web app-ok létrehozása

Ahhoz, hogy tudjunk monitorozni, szükségünk lesz alkalmazásokra. Ezeket az alábbi parancccsal tudod elindítani:

```
docker-compose -f docker-compose.web.yml up
```

Miután elindultak, nyisd meg az alkalmazásokat!

## Prometheus elkészítése

1. Ha már futnak az alkalmazások, akkor az elérési útjukat be kell másolni a prometheus config fájljába. Ehhez lépj át az IDE-be és nyisd meg a `./prometheus/prometheus.yml` fájlt!

A fájl megfelelő helyeire írd be az alkalmazások elérési útjait:
```
global:
  scrape_interval: 5s
scrape_configs:
  - job_name: "nodeapp"
    static_configs:
      - targets: ["IDE KELL BEÍRNI A NODE APP ELÉRÉSI ÚTJÁT"]
  - job_name: "expressapp"
    static_configs:
      - targets: ["IDE KELL BEÍRNI AZ EXPRESS APP ELÉRÉSI ÚTJÁT"]
```

2. Ezután el kell indítani a prometheus-t:
```
docker-compose -f docker-compose.prom.yml up
```

3. Ha elindult a prometheus alkalmazás, akkor nyisd meg külön ablakba!

### Prometheus 





## Grafana instance elkészítése

1. Létrehozunk egy új instance-t, és azon belül egy Dockerfile-t, valamint a Grafana config fájlt:

```
touch Dockerfile
```

```
touch datasources.yml
```

2. Bemásoljuk a grafana.Dockerfile tartalmát a Dockerfile-ba, a datasources.yml fájl tartalmát pedig a datasources.yml fájlba! A datasources.yml fájlban írjuk át az URL-t a Prometheus instance címére!

3. Elkészítjük a Docker image-t!

```
docker build . -t promapp -f 
```

4. Elindítjuk a konténert!

```
docker run --rm -p 3000:3000 \
  -e GF_AUTH_DISABLE_LOGIN_FORM=true \
  -e GF_AUTH_ANONYMOUS_ENABLED=true \
  -e GF_AUTH_ANONYMOUS_ORG_ROLE=Admin \
  grafanaapp
```

