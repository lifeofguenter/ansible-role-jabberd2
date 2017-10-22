#!/bin/sh
### BEGIN INIT INFO
# Provides:          jabberd2
# Required-Start:    $network $named $remote_fs
# Required-Stop:     $network $named $remote_fs
# Should-Start:	     mysql
# Should-Stop:	     mysql
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: jabberd2 init script to start jabberd2 daemon
# Description:	     Enable services provided by jabberd2.
### END INIT INFO

set -e

test -f /etc/default/jabberd2 && . /etc/default/jabberd2

COMPONENTDPATH=/etc/init.d/jabberd2.d/
PIDPATH=/run/jabberd2

test -d ${COMPONENTDPATH} || exit 0

if [ ! -d ${PIDPATH} ]; then
    mkdir -p ${PIDPATH}
    chown ${USER}:${GROUP} ${PIDPATH}
fi

case "$1" in
   start)
      printf "Starting Jabber services:"
      if [ -z "$2" ]; then
         run-parts --arg=start ${COMPONENTDPATH}
      else
         ${COMPONENTDPATH}/??$2 start
      fi
      printf ".\n"
	;;
   stop)
      printf "Stopping Jabber services:"
      if [ -z "$2" ]; then
         run-parts --reverse --arg=stop ${COMPONENTDPATH}
      else
         ${COMPONENTDPATH}/??$2 stop
      fi
      printf ".\n"
	;;
   status)
      printf "Status Jabber services:\n"
      if [ -z "$2" ]; then
         run-parts --reverse --arg=status ${COMPONENTDPATH}
      else
         ${COMPONENTDPATH}/??$2 status
      fi
	;;
   restart|force-reload)
      printf "Restarting Jabber services:\n"
      $0 stop $2
      sleep 1
      $0 start $2
   ;;
   *)
      printf "Usage: $0 {action} [component]\n" >&2
      printf "   action = start|stop|status|restart|force-reload\n" >&2
      printf "   component = router|sm|s2s|c2s\n" >&2
      exit 1
   ;;
esac

exit 0
