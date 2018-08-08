# vim:set ft=dockerfile:
FROM debian:buster-slim

ARG PRIVRSA
ARG PUBRSA
ENV PRIVRSA=${PRIVRSA} \
    PUBRSA=${PUBRSA}

COPY ./files/py_requirements.txt /py_requirements.txt
RUN apt-get update \
    ; apt-get install -yy --no-install-recommends \
      python3 python3-dev gcc python3-pip git-core netcat \
      openssh-client nano \
    ; apt-get clean \ 
    ; pip3 install setuptools \
    ; pip3 install -r /py_requirements.txt \
    ; rm -rf /var/lib/apt/lists/* \
    ; rm -rf /root/.cache \
    ; rm -rf /py_requirements.txt

RUN mkdir /root/.ssh \
    && echo ${PRIVRSA} > /root/.ssh/id_rsa \
    && echo ${PUBRSA} > /root/.ssh/id_rsa.pub \ 
    && chmod -R 0700 /root/.ssh 
COPY ./files/ssh.cfg /root/.ssh/config

CMD ["bash"]
