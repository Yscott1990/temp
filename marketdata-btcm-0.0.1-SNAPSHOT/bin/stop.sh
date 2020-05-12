#!/bin/bash

WORK_DIR="$(dirname $(dirname "$0"))"

if [ "x$DATA_ENGINE_WORK_DIR" != "x" ]
then
    WORK_DIR="${DATA_ENGINE_WORK_DIR}"
fi

echo "work directory: $WORK_DIR"

kill `cat $WORK_DIR/bin/marketdata-btcm.pid`

echo "dataloader stopped"
