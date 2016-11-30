FROM alpine:latest

MAINTAINER Samuel von Baussnern <samuel.vonbaussnern@gmail.com>

RUN apk update && apk add python3 python3-dev openssh-client supervisor make git
# RUN apk install bash tree # for debugging
RUN pip3 install sphinx sphinx_rtd_theme

RUN touch /supervisord.log
RUN chmod 666 /supervisord.log

RUN mkdir /app

COPY conf/sphinx-supervisord.conf /app/sphinx-supervisord.conf
COPY conf/ssh-conf /root/.ssh/config
RUN chown root /root/.ssh/config && chmod 644 /root/.ssh/config

COPY scripts /app
ENV SPHINX_PORT 8000
EXPOSE 8000

CMD ["/app/run.sh"]

