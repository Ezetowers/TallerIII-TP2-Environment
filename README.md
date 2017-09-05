## Executing environment
In order to stsart the environment, you must be placed in the path where the docker compose YAML is located:
```
user@hostname /path/to/project $ docker-compose -f docker-compose-dev.yml up --build -d
```

## Stop Environment
In order to stsart the environment, you must be placed in the path where the docker compose YAML is located:
```
user@hostname /path/to/project $ docker-compose -f docker-compose-dev.yml down
```

## Another useful commands:
* **docker images**: List all the images already pulled or built
* **docker ps**: List all the active containers 
* **docker ps -a**: List all the containers that exist. Useful to destroy containers that have finished yet has not been destroyed. 
* **docker rmi -f image**: Remove an already pulled or built image from the Docker FS. The parameter **image** can be the name of the image or the IMAGE ID. Both of them can be obtained executing the command **docker images**
* **docker rm -f container**: Remove a container fomr the Docker FS. The parameter **container** can be the name of the container or the CONTAINER ID. Both of them can be obtained executing the command **docker ps -a**
* **docker run --rm -it imageName command**: Create a container based on imageName and execute the a command on it (Example: docker run --rm -it ubuntu:16.04 bash). The flag **--run** destroy the container it has finished to execute the **command** given as a parameter
* **docker exec -it container**: Enter to an already active container. The parameter **container** can be the name of the container or the CONTAINER ID. Both of them can be obtained executing the command **docker ps**
* **docker logs -f container**: Shows the output of the command executed in a container. The parameter **container** can be the name of the container or the CONTAINER ID. Both of them can be obtained executing the command **docker ps**
* **docker inspect container**: Gives information about the container. Useful to obtain the IP acquired by certain container without accessing it with **docker exec** (**docker inspect container | grep IPAddress**). The parameter **container** can be the name of the container or the CONTAINER ID. Both of them can be obtained executing the command **docker ps**
