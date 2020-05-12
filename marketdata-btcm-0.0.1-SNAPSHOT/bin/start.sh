#!/bin/bash

WORK_DIR="$(dirname $(dirname "$0"))"

if [ "x$DATA_ENGINE_WORK_DIR" != "x" ]
then
    WORK_DIR="${DATA_ENGINE_WORK_DIR}"
fi

echo "work directory: $WORK_DIR"

LOG_DIR=$WORK_DIR/log
LIB_DIR=$WORK_DIR/lib
CONFIG_DIR=$WORK_DIR/config

if [ ! -d $LOG_DIR ]
then
    echo "$LOG_DIR does not exist, so create it"
    mkdir $LOG_DIR
fi

CLASSPATH="$CONFIG_DIR:$(echo $LIB_DIR/*.jar | tr ' ' ':')"

java -version
# echo "CLASSPATH: $CLASSPATH"


java -cp $CLASSPATH -jar -Dspring.profiles.active=prod marketdata-btcm-0.0.1-SNAPSHOT.jar > $LOG_DIR/marketdata-btcm.out 2>&1

echo $! > $WORK_DIR/bin/marketdata-btcm.pid

echo "marketdata-btcm started"