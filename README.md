# docker-context
`docker  context create cloud --description "Docker engine on Alibaba cloud" --docker "host=ssh://root@alibaba"`
# update all latest images
`docker images | grep -v REPOSITORY | awk '$2 ~ "latest" {print $1}' | xargs -L1 docker pull`
