from kafka import KafkaConsumer
import logging

logpath = "/root/consumer.log"
logger = logging.getLogger('log')
logger.setLevel(logging.INFO)
ch = logging.FileHandler(logpath)
ch.setFormatter(logging.Formatter('%(message)s'))
logger.addHandler(ch)

print("Consumer: Proceed to receive message from Kafka")
consumer = KafkaConsumer('kafka2-topic', bootstrap_servers='kafka1:9092')
for msg in consumer:
    logger.info("Message received: {}\n".format(msg))
