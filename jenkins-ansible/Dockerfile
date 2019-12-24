FROM jenkins/jenkins:lts

USER root

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install ansible --upgrade

USER jenkins

COPY remote-key /tmp/remote-key
COPY initial-script.sh /tmp/initial-script.sh