from kafka import KafkaConsumer

f = open('/root/consumer.log', 'w')

print("Consumer: Proceed to receive message from Kafka")
consumer = KafkaConsumer('foobar', bootstrap_servers='kafka:9092')
for msg in consumer:
    f.write("Message received: {}\n".format(msg))

f.close()
