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

## Healthy check

> The HEALTHCHECK instruction tells Docker how to test a container to check that it is still `working`.

### Options

- `interval`=DURATION (default: 30s)
- `timeout`=DURATION (default: 30s)
- `start-period`=DURATION (default: 0s)
- `retries`=N (default: 3)

> The health check will first run `interval` seconds after the container is started, and then again `interval` seconds
> after each previous check completes.
>
> If a single run of the check takes longer than `timeout` seconds then the check is considered to have failed.
>
> It takes `retries` **consecutive failures** of the health check for the container to be considered `unhealthy`.
>
> `start period` provides initialization time for containers that need time to bootstrap. Probe failure during that
> period will not be counted towards the maximum number of retries. However, if a health check succeeds during the start
> period, the container is considered started and all consecutive failures will be counted towards the maximum number
> of retries.

### Status:

> The command’s `exit status` indicates the health status of the container.

The possible values are:

- 0: `success` - the container is healthy and ready for use
- 1: `unhealthy` - the container is not working correctly
- 2: `reserved` - do not use this exit code

## Some commands

- Docker-context

> docker context create cloud --description "Docker engine on Alibaba cloud" --docker "host=ssh://root@alibaba"

- Update all latest images

> docker images | grep -v REPOSITORY | awk '$2 ~ "latest" {print $1}' | xargs -L1 docker pull
