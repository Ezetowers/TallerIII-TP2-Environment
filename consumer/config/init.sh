#!/bin/bash

# Cannot live without this alias, sorry!!
echo 'alias ll="ls -l"' > /root/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk' >> /root/.bashrc

# Start supervisor (it will start zookeeper)
mkdir -p /var/log/supervisor
supervisord -c /etc/supervisor/supervisord.conf

touch /root/consumer.log

# Java program
. ~/.bashrc
cd /root/java 
mvn clean package
java -cp target/CustomKafkaConsumer-1.0.0.jar:/root/.m2/repository/org/apache/kafka/kafka-clients/0.10.0.0/kafka-clients-0.10.0.0.jar:/root/.m2/repository/org/slf4j/slf4j-api/1.7.21/slf4j-api-1.7.21.jar test.CustomKafkaConsumer kafka2-topic lala
tail -f /root/consumer.log