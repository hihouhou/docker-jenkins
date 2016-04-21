#
# Jenkins Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Update & install packages for jenkins
RUN apt-get update && \
    apt-get install -y wget && \
    wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y jenkins

#Configure graylog
#ADD server.conf /etc/graylog/server/

EXPOSE 8080

CMD ["graylogctl", "run"]
