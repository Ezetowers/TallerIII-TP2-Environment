from kafka import KafkaProducer
from time import sleep

producer = KafkaProducer(bootstrap_servers='kafka:9092')

while 1:
    for _ in range(100):
        producer.send('foobar', b'some_message_bytes')
    sleep(10)
