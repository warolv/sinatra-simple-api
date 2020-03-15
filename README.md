# Simple sinatra api + redis + docker compose

## start up

```
$ docker-compose build
$ docker-compose up
```
I didn't change the default Sinatra port, so after start you have to do
```
$ curl http://<docker_host>:4567/
```

Create new key:value
```
curl -i -X POST -H "Content-Type: application/json" -d '{"nnn":"mmm"}' http://<docker_host>:4567/keys
```

Get all keys
```
curl http://<docker_host>:4567/keys
```

Get specific key
```
curl http://<docker_host>:4567/keys/:key_id
```