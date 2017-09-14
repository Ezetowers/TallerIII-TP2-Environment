#!/bin/bash

# Cannot live without this alias, sorry!!
echo 'alias ll="ls -l"' > /root/.bashrc

sed -i "s/@KAFKA_BROKER_ID@/$KAFKA_BROKER_ID/" /opt/kafka_2.11-0.10.0.0/config/server.properties
sed -i "s/@KAFKA_ADVERTISED_HOST@/$KAFKA_ADVERTISED_HOST/" /opt/kafka_2.11-0.10.0.0/config/server.properties
sed -i "s/@KAFKA_ADVERTISED_PORT@/$KAFKA_ADVERTISED_PORT/" /opt/kafka_2.11-0.10.0.0/config/server.properties
sed -i "s/@KAFKA_ZOOKEEPER_CONNECT@/$KAFKA_ZOOKEEPER_CONNECT/" /opt/kafka_2.11-0.10.0.0/config/server.properties
sed -i "s/@KAFKA_DELETE_TOPIC_ENABLE@/$KAFKA_DELETE_TOPIC_ENABLE/" /opt/kafka_2.11-0.10.0.0/config/server.properties
sed -i "s/@KAFKA_LOG_RETENTION_HOURS@/$KAFKA_LOG_RETENTION_HOURS/" /opt/kafka_2.11-0.10.0.0/config/server.properties
sed -i "s/@KAFKA_NUM_PARTITIONS@/$KAFKA_NUM_PARTITIONS/" /opt/kafka_2.11-0.10.0.0/config/server.properties
sed -i "s/@KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS@/$KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS/" /opt/kafka_2.11-0.10.0.0/config/server.properties

# Start supervisor (it will start zookeeper)
mkdir -p /var/log/supervisor
supervisord -c /etc/supervisor/supervisord.conf

mkdir -p /opt/kafka_2.11-0.10.0.0/logs
touch /opt/kafka_2.11-0.10.0.0/logs/server.log


if [ -f /tmp/create_topics.sh ]; then
    sleep 10
    unset JMX_PORT
   /tmp/create_topics.sh
fi

tail -f /opt/kafka_2.11-0.10.0.0/logs/server.log