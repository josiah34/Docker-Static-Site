# Docker-Static-Site

This is a simple project using docker to setup an image that runs an apache webserver with a static website. 


```

FROM ubuntu:latest 
LABEL "Author"="Josiah"
LABEL "Project"="Docker"
LABEL "Purpose"="Dockerfile to deploy a static template site"
RUN apt update && apt install git -y
RUN apt install apache2 -y
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80 
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD gotto.tar.gz  /var/www/html/
# COPY gotto.tar.gz /var/www/html/







```

- FROM: sets the base image 
- LABEL: adds metadata to the image 
- RUN runs commands on the image
- CMD runs commands on the running container 
- VOLUME sets a volume in the image that we can mount to when running a container in order to persist data
- ADD in this dockerfile untars tge tarball and extracts its content to the default apache directory to server the static site
- EXPOSE exposes a port for inter-container communication


HOW TO RUN:

Pull Image:

``docker pull josiah34/gotto-site``

Create Container From Image:

``docker run -d --name gottowebsite -p 9090:80 gotto-site``

Go to localhost:9090 to see the template site being run. 


![Screenshot from 2023-07-25 14-03-12](https://github.com/josiah34/Docker-Static-Site/assets/25124463/2b394214-4cb1-4ad0-b026-a05aa2c8b7d0)


