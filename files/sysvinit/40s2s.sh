#!/bin/sh

set -e

test -f /etc/default/jabberd2 && . /etc/default/jabberd2

NAME=s2s
COMMAND=/usr/local/bin/jabberd2-${NAME}
PIDFILE=/run/jabberd2/${NAME}.pid
CONFFILE=/etc/jabberd2/${NAME}.xml

# exit now if we are not ment to run
test "${S2S_RUN}" != 0 || exit 0

# check for executable
test -f ${COMMAND} || exit 0

case "$1" in
   start)
	printf " ${NAME}"
        if [ ! `pidof ${COMMAND}` ]; then
      	    start-stop-daemon -b -c ${USER}:${GROUP} \
            --start --pidfile ${PIDFILE} --quiet \
            --exec ${COMMAND} -- -c ${CONFFILE} || printf "<Failed>"
        fi
	;;
   stop)
	printf " ${NAME}"
        start-stop-daemon -o -u ${USER} --stop --quiet \
    	    --signal 15 --retry 3 --pidfile ${PIDFILE} \
            --exec ${COMMAND} || printf "<Failed>"
	;;
   status)
        printf "${NAME}"
        if [ `pidof ${COMMAND}` ]; then
    	    printf " running\n"
        else
            printf " not running\n"
        fi
	;;
   restart)
        $0 stop
        sleep 1
        $0 start
	;;
   *)
      printf "`basename $0` called with unknown option {$1}\n"
      exit 1
   ;;
esac

exit 0
