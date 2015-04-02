# docker-rails-blog
Run rails inside docker container

Usage
---------------------

### Build Image

```bash
docker build -t kr1sp1n/docker-rails-blog:<NEW VERSION> .
```

### Tag Latest

```bash
docker tag -f <IMAGE ID> kr1sp1n/docker-rails-blog:latest
```

### Run Container

```bash
docker run --name docker-rails-blog -p 8080:3000 --link postgres:db -d kr1sp1n/docker-rails-blog:latest
```
This will also link the container to a `postgres` container and give alias `db`
