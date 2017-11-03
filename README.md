# Docker image for registry on RASPBERRY PI

This will deploy a fully functional [registry](https://docs.docker.com/registry/) server as a docker image on raspberry pi.

Available on [Docker Hub](https://hub.docker.com/r/cretinon/raspidock-registry/)

With the help of [resin.io](https://resin.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/) to build on dockerhub 

## Download

    docker pull cretinon/raspidock-registry
	
## Run

Simplest version:

    docker run -d -p 5000:5000 -v local_registry_config_file:/tmp/registry-config.yml -v local_directory/:/var/lib/registry/ --name registry cretinon/raspidock-registry

As a service with swarm:

    docker service create --name registry --publish 5000:5000 --constraint 'node.role == manager' --mount type=bind,src=local_registry_config_file,dst=/tmp/registry-config.yml --mount type=bind,src=local_directory/,dst=/var/lib/registry/ registry
