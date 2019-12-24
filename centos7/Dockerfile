FROM centos:7

RUN yum -y install openssh-server initscripts

RUN useradd remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub  /home/remote_user/.ssh/authorized_keys
COPY remote-key  /tmp/

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 400 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen -A

RUN yum -y install mysql

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

CMD /usr/sbin/sshd -D
