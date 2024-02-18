# DOCKER Ubuntu 20.04

## some more examples

- pull a linux platform image:
  ```bash
  docker pull --platform linux/amd64 ubuntu:20.04
  ```
- run and attach to the container:
  ```bash
  docker run --platform linux/amd64 -it ubuntu:20.04 /bin/bash

  ```