#!/bin/bash
KAFKA_VERSION=kafka_2.11-1.0.1
/opt/$KAFKA_VERSION/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic kafka2-topic
