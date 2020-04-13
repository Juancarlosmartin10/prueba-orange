FROM jenkins 
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
EXPOSE 8080
EXPOSE 50000
