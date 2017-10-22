#!/bin/sh
#
# Script to start/stop jabberd2 on a Debian
#
# by Ady Romantika, 23 August 2005
#
 
DAEMON=/usr/local/bin/jabberd2-jabberd
NAME=jabberd2
DESC=jabberd2
JABBERUSER=jabber

# Uncomment if needs debugging
#DEBUG="-D"

# PID files base locations
PIDBASE=/run/jabberd2

case "$1" in
   start)
   	echo -n "Starting $DESC: "
   	su $JABBERUSER -c "$DAEMON $DEBUG &"
	echo "$NAME."
      ;;
   stop)
      echo -n "Stopping $DESC: "
      if [ -e $PIDBASE/router.pid ];
      then
        su $JABBERUSER -c "kill -9 `cat $PIDBASE/sm.pid`"
	echo "$NAME."
      else
        echo "jabberd2 is not started."
      fi
      # Delete the PID files as jabberd does not do this automatically
      rm -rf $PIDBASE/router.pid \
               $PIDBASE/resolver.pid \
               $PIDBASE/sm.pid \
               $PIDBASE/s2s.pid \
               $PIDBASE/c2s.pid
      ;;
   restart)
      $0 stop
      sleep 3
      $0 start
      ;;
   *)
      N=/etc/init.d/$NAME
      echo "Usage: $N {start|stop|restart|reload|force-reload}" >&2
      exit 1
      ;;
esac
 
exit 0
