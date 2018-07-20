FROM jenkins/jenkins:lts

ENV JENKINS_HOME /dcos_jenkins_home
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Xms1024m -Xmx1024m

USER root
RUN mkdir $JENKINS_HOME
ADD jenkins_entrypoint.sh /usr/local/bin/jenkins_entrypoint.sh
RUN chmod +x /usr/local/bin/jenkins_entrypoint.sh

USER jenkins
RUN /usr/local/bin/install-plugins.sh \
  github-oauth


USER root
RUN mkdir -p /dcos_jenkins_home/userContent/
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins_entrypoint.sh"]
