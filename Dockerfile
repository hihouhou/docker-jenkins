#
# Jenkins Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou < hihouhou@hihouhou.com >"

ENV JENKINS_UC=http://updates.jenkins.io/
ENV JENKINS_VERSION=jenkins-2.499

# Update & install packages for jenkins
RUN apt-get update && \
    apt-get install -y gnupg unzip openjdk-17-jdk wget curl git && \
    wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io-2023.key && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null && \
    apt-get update && \
    apt-get install -y jenkins

#Configure plugins
#ADD plugins.sh /usr/local/bin/
#ADD plugins.txt /usr/share/jenkins/plugins.txt
#RUN bash /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

EXPOSE 8080

#CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--argumentsRealm.passwd.hihouhou=hihouhou", "--argumentsRealm.roles.hihouhou=admin"]
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
