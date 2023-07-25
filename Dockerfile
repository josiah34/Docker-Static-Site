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



