#takes centos as base image, we can also write it as FROM centos:latest
FROM centos

ARG series=8 
ARG version=5.16

#install open JDK
RUN ["yum", "-y", "install", "java-1.8.0-openjdk.x86_64"]
RUN ["yum", "-y", "install", "wget"]
RUN ["mkdir", "/opt/tomcat"]

WORKDIR "/opt/tomcat"

RUN ["wget", "http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz"]
RUN ["tar", "-zxvf", "apache-tomcat-8.5.16.tar.gz",  "-C", "/opt/tomcat", "--strip-components=1"]

ADD ["opt/tomcat/", "/opt/tomcat/"]

EXPOSE 8080

LABEL CentOS="7.3.1611 (Core)"
LABEL Tomcat="8.5.16"
LABEL version="1.0"
LABEL description="Tomcat installed on at /opt/tomcat on port 8080 \
both manager & host-manager application opened."

ENTRYPOINT ["bin/catalina.sh", "run"]
