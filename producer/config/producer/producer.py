from kafka import KafkaProducer
from time import sleep

producer = KafkaProducer(bootstrap_servers='kafka1:9092')

count = 0
while 1:
    for _ in range(5):
        count += 1
        producer.send('kafka2-topic', str.encode('Some Message Bytes: {}'.format(count)))
    sleep(10)
