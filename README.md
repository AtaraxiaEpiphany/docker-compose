# Docker

## Difference between `CMD` and `ENTRYPOINT`

- Command line arguments to `docker run <image>` will be `appended after` all elements in an exec form ENTRYPOINT,
  and will
  override all elements specified using CMD.
- `CMD` can used to provide default arguments for the ENTRYPOINT instruction.
- CMD: Sets default parameters that `can` be overridden from the Docker command line interface (CLI) while running a
  docker container.
- ENTRYPOINT: Sets default parameters that `cannot` be overridden while executing Docker containers with CLI
  parameters.

### CMD

```dockerfile
FROM alpine
CMD ["echo", "Hello word!"]
```

```shell
docker build . -t cmd-instructions
docker run --rm -it cmd-instructions
# output: Hello word!
docker run --rm -it cmd-instructions echo message changed
# output: message changed
```

### ENTRYPOINT
```dockerfile
FROM alpine
ENTRYPOINT ["echo", "Hello word!"]
```
```shell
docker build . -t entrypoint-instructions
docker run --rm -it  entrypoint-instructions
docker run --rm -it entrypoint-instructions
# output: Hello word!
docker run --rm -it entrypoint-instructions echo message changed
# output: Hello word! message changed
docker run --rm -it --entrypoint env entrypoint-instructions
# output: some env variables
```
### Combine CMD and ENTRYPOINT
```dockerfile
FROM alpine
ENTRYPOINT ["echo", "Hello entrypoint!"]
CMD ["Hello cmd!"]
```
```shell
docker build . -t entrypoint-cmd
docker run --rm -it entrypoint-cmd
# output: Hello entrypoint! Hello cmd!
docker run --rm -it entrypoint-cmd hello Hannibal!
# output: Hello entrypoint! hello Hannibal!
```


## Some commands

- Docker-context

> docker context create cloud --description "Docker engine on Alibaba cloud" --docker "host=ssh://root@alibaba"

- Update all latest images

> docker images | grep -v REPOSITORY | awk '$2 ~ "latest" {print $1}' | xargs -L1 docker pull
