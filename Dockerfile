FROM ubuntu:latest

# Taking the ubuntu base image

RUN apt-get -y update && apt-get -y upgrade

# apt-get upgrade actually installs newer versions of the package.

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

WORKDIR /usr/local/tomcat

# Specifying the container to use this as current working directory

ADD /mkdocs /usr/local/tomcat

# ADD command copies new files, directories or remote file URLs from <src> and adds them to the filesystem of the image at the path <dest>.
# Here /mkdocs directory consists of the application(war) file. So, the application will be deployed to the container.

EXPOSE 8000

# The tomcat application will be accessible on port 8080

HEALTHCHECK --interval=5s \
            --timeout=5s \
	    CMD curl -f http://127.0.0.1:8080 || exit 1

# This will perform health check of the container

VOLUME ["/mkdocs"]

# A volume with the name "mkdocs" gets created

CMD ["tomcat.sh","run"]

# Upon the container creation, CMD starts the tomcat web application. 

