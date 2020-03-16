# Simple sinatra api + redis + docker compose

## start up

```
$ docker-compose build
$ docker-compose up
```

Create new key:value
```
curl -i -X POST -H "Content-Type: application/json" -d '{"nnn":"mmm"}' http://localhost:4567/keys
```

Get all keys
```
curl http://localhost:4567/keys
```

Get specific key
```
curl http://localhost:4567/keys/:key_id
```

Simplified things for demo purposes, in real app all endpoints will look like:
```
/api/v1/keys
/api/v1/keys/:key_id
```

Also access to endpoints must be authorized.