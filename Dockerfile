FROM ubuntu:latest

# Taking the ubuntu base image

RUN apt-get -y update && apt-get -y upgrade

# apt-get upgrade actually installs newer versions of the packages you have. After updating the lists, the package manager knows about available updates for the software you have installed. This is why you first want to update

RUN apt-get -y install software-properties-common

# Installing the prerequisites for the tomcat application


RUN add-apt-repository ppa:webupd8team/java

# A Personal Package Archive (PPA) is a software repository for uploading source packages to be built and published as an Advanced Packaging Tool (APT)//

RUN apt-get -y update

RUN mkdir /usr/local/tomcat

# Creating a directory inside the container

RUN apt-get -y install wget

# Installing wget

RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz -O /tmp/tomcat.tar.gz

# Downloading the tomcat package file

RUN cd /tmp && tar xvfz tomcat.tar.gz

# Untar a tar.gz file

RUN cp -R /tmp/apache-tomcat-8.5.16/* /usr/local/tomcat/

# Copying the tomcat package file to container

EXPOSE 8080

# The tomcat application will be accessible on port 8080

HEALTHCHECK --interval=5s \
            --timeout=5s \
	    CMD curl -f http://127.0.0.1:8080 || exit 1

# Set a health check for the container

WORKDIR /usr/local/tomcat

# Specifying the container to use this as current working directory

VOLUME ["/usr/local/tomcat"]


CMD ["/bin/bash"]

# bash shell prompt for the container. In this case, container gets created with /bin/bash

CMD ["tomcat","start"]

# Upon the container creation, CMD starts the tomcat service  

