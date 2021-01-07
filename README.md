# jenkins Local

## Criando o Volume

```
podman volume create jenkins_home
```

## Iniciando o Container

```
podman run --name jenkins --rm -p 8080:8080 -p 50000:50000 \
         -v jenkins_home:/var/jenkins_home \
         jenkins:jcasc
```
