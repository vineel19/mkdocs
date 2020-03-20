# mkdocs
MKDocs-Project-Repository


This repository is about MkDocs application website. 

Dockerfile:

I have written a docker file with a ubuntu base image with tomcat web application. Included the health checks of the container application and exposed the ports to access the application as part of Dockerfile.

Need to run the below command to build the image from the Dockerfile

docker build -t mkdocs .

It takes the Docker file from the current directory and Docker image with name mkdocs gets created. Once we have a image, we need to create a Docker container from the below command.

docker run -it -p 8000:8000 -v /mkdocsrootvol : /mkdocs/usr/local/tomcat /bin/bash

The above command creates a container and it is accessible on port 8080 from host machine and mounts the mkdocsrootvol in local host to  volume in the container

Jenkinsfile:

Written a Jenkinsfile with declarative pipeline as code, and included build and test stages and push to JFrog Artifactory.

