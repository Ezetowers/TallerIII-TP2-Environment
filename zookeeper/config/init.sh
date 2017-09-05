#!/bin/bash

# Cannot live without this alias, sorry!!
echo 'alias ll="ls -l"' > /root/.bashrc

# Set zookeeper log dir and log level
export ZOO_LOG_DIR="/var/log/zookeeper"
export ZOO_LOG4J_PROP="$ZOOKEEPER_LOGLEVEL, CONSOLE"
mkdir -p $ZOO_LOG_DIR
# sed -i "s@\(zookeeper\.root\.logger=\)\(.*\),\(.*$\)@\1$ZOOKEEPER_LOGLEVEL,\3@" /opt/zookeeper-3.4.10/conf/log4j.properties
# sed -i "s@\(zookeeper\.log\.dir=\)\(.*$\)@\1 $ZOOKEEPER_LOGDIR@" /opt/zookeeper-3.4.10/conf/log4j.properties

# Start supervisor (it will start zookeeper)
mkdir -p /var/log/supervisor
supervisord -c /etc/supervisor/supervisord.conf

touch /var/log/zookeeper/zookeeper.out
tail -f /var/log/zookeeper/zookeeper.out