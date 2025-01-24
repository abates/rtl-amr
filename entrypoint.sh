#!/bin/ash

export COLLECT_STRICTIDM=1
export RTLAMR_FORMAT=json
export RTLAMR_FILTERID=$FILTERID

/usr/bin/rtl_tcp -a 127.0.0.1 &
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start rtl_tcp: $status"
  exit $status
fi

# wait for rtl_tcp to become ready
sleep 2
echo "Starting rtlamr/rtlamr-collect"
/usr/bin/rtlamr -msgtype=$RTLAMR_MSGTYPE| /usr/bin/rtlamr-collect

