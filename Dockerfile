FROM openjdk:8-jre-alpine
MAINTAINER Ricardo Ruiz ricardo.ruizsaiz.external@atos.net
RUN mkdir -p /opt/flume-config
#ENV JAVA_HOME /usr

RUN mkdir -p /opt/flume-config && apk add --update bash && rm -rf /var/cache/apk/* && wget -qO- http://archive.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz \
          | tar zxvf - -C /opt/flume --strip 1

ENV PATH /opt/flume/bin:/usr/java/bin:$PATH

ADD start-flume.sh /opt/flume/bin/start-flume.sh
RUN chmod +x /opt/flume/bin/start-flume.sh

CMD ["/opt/flume/bin/start-flume.sh"]
