FROM amos6224/tomcat7

MAINTAINER Jeff Destine <jdestine@kenzan.com>

ADD ./target/*.war /opt/tomcat/webapps/

EXPOSE 8080
