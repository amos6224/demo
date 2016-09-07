FROM ubuntu:14.04
MAINTAINER Jeff Destine <jdestine@kenzan.com>

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

RUN apt-get install -y openjdk-7-jdk

RUN adduser --quiet jenkins
RUN echo "jenkins:jenkins" | chpasswd

RUN mkdir /home/jenkins/.m2

ADD pom.xml /home/jenkins/.m2/

RUN chown -R jenkins:jenkins /home/jenkins/.m2/ 

RUN apt-get install -y maven
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

