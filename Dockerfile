FROM debian:10

RUN apt-get update && apt-get install -y openssh-server

ARG MY_USER

ADD id_rsa.pub  /home/${MY_USER}/.ssh/authorized_keys

RUN mkdir /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && echo "" >> /etc/ssh/sshd_config \
    && echo "LogLevel INFO" >> /etc/ssh/sshd_config \
    && useradd -ms /bin/bash ${MY_USER} \
    && usermod -aG sudo ${MY_USER} \
    && chmod -R 0700 /home/${MY_USER} \
    && chown -R ${MY_USER} /home/${MY_USER}

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]