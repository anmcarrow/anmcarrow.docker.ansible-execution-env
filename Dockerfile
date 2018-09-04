# vim:set ft=dockerfile:
FROM debian:buster-slim

ENV    RSA_KEYS_PATH=/root/.ssh

COPY ./files/py_requirements.txt /py_requirements.txt
COPY ./files/bash.bashrc /etc/bash.bashrc
RUN apt-get update \
    ; apt-get install -yy --no-install-recommends \
      python3 python3-dev gcc python3-pip git-core netcat \
      openssh-client nano iputils-ping\
    ; apt-get clean \ 
    ; pip3 install setuptools \
    ; pip3 install -r /py_requirements.txt \
    ; rm -rf /var/lib/apt/lists/* \
    ; rm -rf /root/.cache \
    ; rm -rf /py_requirements.txt

RUN mkdir /root/.ssh \
    && ssh-keygen -f /root/.ssh/id_rsa -q -N "" \
    && chmod -R 0700 /root/.ssh 
COPY ./files/ssh.cfg /root/.ssh/config

CMD ["bash"]
