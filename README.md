
## Node Instance létrehozása

1. Létrehozzuk a Node instance-t, és azon belül a Dockerfile-t:

```
$ touch Dockerfile
```

2. Bemásoljuk a node.Dockerfile tartalmát a Dockerfile-ba!

3. Elkészítjük a Docker image-t!

```
$ docker build . -t nodeapp
```

4. Elindítjuk a konténert!

```
$ docker run -d -p 8080:8080 nodeapp
```

## Prometheus Instance elkészítése

1. Létrehozunk egy új instance-t, és azon belül egy Dockerfile-t, valamint egy prometheus config fájlt:

```
$ touch Dockerfile
```

```
$ touch prometheus.yml
```

2. Bemásoljuk a prometheus.Dockerfile tartalmát a Dockerfile-ba, a prometheus.yml fájl tartalmát pedig a prometheus.yml fájlba! A prometheus.yml fájlban írjuk át a target IP címet a Node instance címére!

3. Elkészítjük a Docker image-t!

```
$ docker build . -t promapp -f 
```

4. Elindítjuk a konténert!

```
$ docker run -d -p 9090:9090 promapp
```
