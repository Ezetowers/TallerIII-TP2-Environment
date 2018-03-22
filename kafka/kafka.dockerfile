FROM alpine:3.5

WORKDIR /tmp

RUN apk --update add openjdk8-jre supervisor bash

# Download, install and configure zookeeper
ADD config/kafka /tmp/kafka/
RUN wget http://apache.cs.utah.edu/kafka/1.0.1/kafka_2.11-1.0.1.tgz && \
    mkdir /opt && tar xzvf kafka_2.11-1.0.1.tgz -C /opt/ && \
    cp -r kafka/server.properties.erb /opt/kafka_2.11-1.0.1/config/server.properties && \
    rm -rf kafka_2.11-1.0.1.tgz

# Configure supervisor to start zookeeper
ADD config/supervisor /tmp/supervisor
RUN mkdir -p /etc/supervisor/conf.d && \
    cp supervisor/supervisord.conf /etc/supervisor/supervisord.conf && \
    cp supervisor/kafka.conf /etc/supervisor/conf.d/

ADD config/init.sh /root/

CMD /root/init.sh
