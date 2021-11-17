
## Node Instance létrehozása

1. Létrehozzuk a Node instance-t, és azon belül a Dockerfile-t:

```
touch Dockerfile
```

2. Bemásoljuk a node.Dockerfile tartalmát a Dockerfile-ba!

3. Elkészítjük a Docker image-t!

```
docker build . -t nodeapp
```

4. Elindítjuk a konténert!

```
docker run -d -p 8080:8080 nodeapp
```

## Prometheus Instance elkészítése

1. Létrehozunk egy új instance-t, és azon belül egy Dockerfile-t, valamint egy prometheus config fájlt:

```
touch Dockerfile
```

```
touch prometheus.yml
```

2. Bemásoljuk a prometheus.Dockerfile tartalmát a Dockerfile-ba, a prometheus.yml fájl tartalmát pedig a prometheus.yml fájlba! A prometheus.yml fájlban írjuk át a target IP címet a Node instance címére!

3. Elkészítjük a Docker image-t!

```
docker build . -t promapp
```

4. Elindítjuk a konténert!

```
docker run -d -p 9090:9090 promapp
```

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

