FROM resin/armv7hf-debian

RUN [ "cross-build-start" ]

RUN apt-get update  && apt-get upgrade

RUN apt-get install -y curl git mercurial make  binutils bison gcc build-essential
RUN curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer > /tmp/inst.sh
RUN chmod +x /tmp/inst.sh
RUN /tmp/inst.sh
RUN "source /root/.gvm/scripts/gvm ; gvm install go1.4"
#RUN /bin/bash -c "source /root/.gvm/scripts/gvm ; GOROOT_BOOTSTRAP=/root/.gvm/gos/go1.4/ gvm install go1.8"
#RUN /bin/bash -c "source /root/.gvm/scripts/gvm ; gvm use go1.8 [--default]"
#RUN cd /tmp ; git clone https://github.com/docker/distribution.git
#RUN /bin/bash -c "source /root/.gvm/scripts/gvm ; gvm use go1.8 [--default] ; cd /tmp/distribution ; go get ./...; echo 0"
#RUN /bin/bash -c "source /root/.gvm/scripts/gvm ; gvm use go1.8 [--default] ; cd /tmp/distribution ; GOOS=linux GOARCH=arm make binaries"
#RUN mkdir -p /var/lib/registry

#EXPOSE 5500/tcp
#CMD ["/tmp/distribution/bin/registry", "serve", "/tmp/registry-config.yml"]

RUN [ "cross-build-end" ]  
