FROM jenkins/jenkins:lts

USER root

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install ansible --upgrade

COPY remote-key /tmp/remote-key
COPY initial-script.sh /tmp/initial-script.sh

RUN chown jenkins:jenkins -R /tmp/initial-script.sh && \
    chown jenkins:jenkins -R /tmp/remote-key && \
    chmod +x /tmp/initial-script.sh && \
    chmod 400 /tmp/remote-key

USER jenkins