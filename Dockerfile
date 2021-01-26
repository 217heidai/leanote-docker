FROM centos:7.9.2009
LABEL maintainer="217heidai"
LABEL name="leanote" 
ENV TZ=Asia/Shanghai

COPY leanote-linux-amd64.bin.tar.gz /
COPY docker-entrypoint.sh /bin/
RUN set -ex; \
	chmod a+x /bin/docker-entrypoint.sh; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime; \
	echo $TZ > /etc/timezone
VOLUME /leanote
EXPOSE 9000
WORKDIR /leanote
ENTRYPOINT docker-entrypoint.sh
