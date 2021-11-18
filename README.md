## Katakoda inicializálása

### 1. Lépj be a Katakoda Sandbox környezetébe:

[Katakoda Ubuntu Playground](https://www.katacoda.com/courses/ubuntu/playground)

### 2. A terminal-ba belépve add ki a következő parancsot:

```
git clone https://github.com/vblaskovics/Node-Prom-Graf-Docker
```

### 3. Miután lejött a git repo, lépj is bele:

```
cd Node-Prom-Graf-Docker
```

## Web app-ok létrehozása

Ahhoz, hogy tudjunk monitorozni, szükségünk lesz alkalmazásokra. Ezeket az alábbi parancccsal tudod elindítani:

```
docker-compose -f docker-compose.web.yml up
```

Miután elindultak, nyisd meg az alkalmazásokat!

- Port számok:
  - node: 8080
  - express: 8081

## Prometheus elkészítése

### 1. Ha már futnak az alkalmazások, akkor az elérési útjukat be kell másolni a prometheus config fájljába. Ehhez lépj át az IDE-be és nyisd meg a `./prometheus/prometheus.yml` fájlt!

A fájl megfelelő helyeire írd be az alkalmazások elérési útjait:
```yml
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

### 2. Ezután el kell indítani a prometheus-t:
Nyiss egy új Terminal-t, majd indítsd el a docker-compose-t:
```
cd Node-Prom-Graf-Docker
docker-compose -f docker-compose.prom.yml up
```
Ha elindult a prometheus alkalmazás, akkor nyisd meg külön ablakba!

Port szám: 9090

## Prometheus használata 

### 1. Ellenőrizd a config beállításokat!
![image](https://user-images.githubusercontent.com/1146283/142297582-13098e64-f191-416a-a8af-20c8b1ac5531.png)

### 2. Ellenőrizd, hogy melyik app-okat monitorozzuk!
![image](https://user-images.githubusercontent.com/1146283/142297654-6c460a17-d46f-49f6-9da2-88fab196bb77.png)

### Kérdezd le az alábbi query-ket:

Process által használt memória:  
`process_resident_memory_bytes`

Összes http request válaszideje:  
`http_request_duration_seconds_sum`

Http request-ek, a /random végű URL-ekből, 200-as hibakóddal, bucket-ekbe szedve (histogram)  
`http_request_duration_seconds_bucket{route='/random', status='2XX'}`

Összes http request, aminek status-a 2-vel vagy 4-el kezdődik  
`http_requests_total{status=~"2.*|4.*"}`

### Kérdezd le az alábbi query-ket:

Process által használt memória:  
`process_resident_memory_bytes`

Összes http request válaszideje:  
`http_request_duration_seconds_sum`

Http request-ek, a /random végű URL-ekből, 200-as hibakóddal, bucket-ekbe szedve (histogram)  
`http_request_duration_seconds_bucket{route='/random', status='2XX'}`

Összes http request, aminek status-a 2-vel vagy 4-el kezdődik  
`http_requests_total{status=~"2.*|4.*"}`



## Grafana elkészítése

### 1. A prometheus elérési útját be kell másolni a grafana config fájljába. Ehhez lépj át az IDE-be és nyisd meg a `./grafana/datasources.yml` fájlt!

A fájl megfelelő helyeire írd be a Prometheus elérési útját:
```yml
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    orgId: 1
    url: IDE_KELL_BEÍRNI
    basicAuth: false
    isDefault: true
    editable: true
```

### 2. Elindítjuk a Grafana-t!

```
docker-compose -f docker-compose.grafana.yml up 
```

