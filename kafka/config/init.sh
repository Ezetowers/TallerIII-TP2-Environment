#!/bin/bash

# Cannot live without this alias, sorry!!
echo 'alias ll="ls -l"' > /root/.bashrc
KAFKA_VERSION=kafka_2.11-1.0.1

sed -i "s/@KAFKA_BROKER_ID@/$KAFKA_BROKER_ID/" /opt/$KAFKA_VERSION/config/server.properties
sed -i "s/@KAFKA_ADVERTISED_HOST@/$KAFKA_ADVERTISED_HOST/" /opt/$KAFKA_VERSION/config/server.properties
sed -i "s/@KAFKA_ADVERTISED_PORT@/$KAFKA_ADVERTISED_PORT/" /opt/$KAFKA_VERSION/config/server.properties
sed -i "s/@KAFKA_ZOOKEEPER_CONNECT@/$KAFKA_ZOOKEEPER_CONNECT/" /opt/$KAFKA_VERSION/config/server.properties
sed -i "s/@KAFKA_DELETE_TOPIC_ENABLE@/$KAFKA_DELETE_TOPIC_ENABLE/" /opt/$KAFKA_VERSION/config/server.properties
sed -i "s/@KAFKA_LOG_RETENTION_HOURS@/$KAFKA_LOG_RETENTION_HOURS/" /opt/$KAFKA_VERSION/config/server.properties
sed -i "s/@KAFKA_NUM_PARTITIONS@/$KAFKA_NUM_PARTITIONS/" /opt/$KAFKA_VERSION/config/server.properties
sed -i "s/@KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS@/$KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS/" /opt/$KAFKA_VERSION/config/server.properties

# Start supervisor (it will start zookeeper)
mkdir -p /var/log/supervisor
supervisord -c /etc/supervisor/supervisord.conf

mkdir -p /opt/$KAFKA_VERSION/logs
touch /opt/$KAFKA_VERSION/logs/server.log


if [ -f /tmp/create_topics.sh ]; then
    sleep 10
    unset JMX_PORT
   /tmp/create_topics.sh
fi

tail -f /opt/$KAFKA_VERSION/logs/server.log
