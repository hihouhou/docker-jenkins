#
# Jenkins Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV JENKINS_UC http://updates.jenkins.io/
ENV JENKINS_VERSION jenkins-2.190

# Update & install packages for jenkins
RUN apt-get update && \
    apt-get install -y gnupg unzip wget curl git && \
    wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y jenkins

#Configure plugins
#ADD plugins.sh /usr/local/bin/
#ADD plugins.txt /usr/share/jenkins/plugins.txt
#RUN bash /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

EXPOSE 8080

#CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--argumentsRealm.passwd.hihouhou=hihouhou", "--argumentsRealm.roles.hihouhou=admin"]
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
