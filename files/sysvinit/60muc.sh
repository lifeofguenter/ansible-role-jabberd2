#!/bin/sh

set -e

test -f /etc/default/jabberd2 && . /etc/default/jabberd2

NAME=muc
COMMAND=/usr/local/bin/mu-conference
PIDPATH=/run/jabberd2
PIDFILE=${PIDPATH}/${NAME}.pid
CONFFILE=/etc/jabberd2/${NAME}.xml

if [ ! -d ${PIDPATH} ]; then
    mkdir -p ${PIDPATH}
    chown ${USER}:${GROUP} ${PIDPATH}
fi

# exit now if we are not ment to run
test "${MUC_RUN}" != 0 || exit 0

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
            printf " running"
        else
            printf " not running"
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
