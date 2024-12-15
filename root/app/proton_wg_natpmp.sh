#!/bin/bash
GATEWAY=10.2.0.1

TM_REMOTE=/usr/bin/transmission-remote
NATPMPC=/usr/bin/natpmpc
ECHO=echo

PORT=`${NATPMPC} -g ${GATEWAY} -a 1 0 tcp 60 | sed -n 's/.*Mapped public port \([0-9]\{1,5\}\) protocol.*/\1/p'`

${TM_REMOTE} -M >/dev/null 2>&1
${ECHO} "Setting port ${PORT}"
${TM_REMOTE} -p ${PORT} >/dev/null 2>&1
${TM_REMOTE} -pt

