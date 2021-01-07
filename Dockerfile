FROM jenkins/jenkins:lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
USER root
ARG OC=https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
RUN wget ${OC} -O /tmp/oc.tgz
RUN tar -C /tmp/ -xf /tmp/oc.tgz openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc
RUN cp /tmp/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/bin/oc
RUN rm -rf /tmp/oc*
RUN chmod +x /usr/bin/oc

