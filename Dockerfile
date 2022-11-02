#
# Jenkins Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV JENKINS_UC http://updates.jenkins.io/
ENV JENKINS_VERSION 2.361.3

# Update & install packages for jenkins
RUN apt-get update && \
    apt-get install -y gnupg unzip openjdk-11-jdk wget curl git && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y jenkins

#Configure plugins
#ADD plugins.sh /usr/local/bin/
#ADD plugins.txt /usr/share/jenkins/plugins.txt
#RUN bash /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

EXPOSE 8080

#CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--argumentsRealm.passwd.hihouhou=hihouhou", "--argumentsRealm.roles.hihouhou=admin"]
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
