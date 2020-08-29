FROM debian:bullseye

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install sudo openssl openssh-server busybox-syslogd -y \
  && apt-get clean \
  && /bin/rm -v /etc/ssh/ssh_host_* \
  && mkdir /var/run/sshd
COPY sshd.sh /sshd.sh
COPY sshd_config /etc/ssh/sshd_config.d/overrides.conf
CMD /sshd.sh
