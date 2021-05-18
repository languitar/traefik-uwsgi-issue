#!/bin/bash

thread() {
  while true
  do
    curl -v --silent --fail -X GET -d '{"some": ["garbage", "data"]}' http://localhost:8888/ -H "Host: backend.localhost" > /tmp/out-$1 2>&1
    status=$?
    if [ $status -ne 0 ]
    then
      cat /tmp/out-$1
      break
    fi
  done
}

export -f thread

parallel --halt now,done=1 thread ::: A B C D
