#!/sbin/runscript

APP_ROOT=/var/www/nodejs-apps

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/var/lib/gems/1.8/bin
DAEMON=/opt/ruby-enterprise-1.8.7-2010.01/bin/god
DAEMON_ARGS="-c $APP_ROOT/god/node.god -l /var/log/god.log"
# NAME=node-monitor
# DESC=node-monitor
# PIDFILE=/var/run/node-monitor.pid
NAME=God
DESC=God
PIDFILE=/var/run/node-monitor.pid

opts="${opts}"

start() {
	ebegin "Starting $DESC"
	start-stop-daemon --start --pidfile /var/run/god.pid \
		--exec $DAEMON -- $DAEMON_ARGS
	eend $? "Failed to start $DESC"
}

stop() {
	ebegin "Stopping $DESC"
	start-stop-daemon --stop --pidfile /var/run/god.pid
	# kill `ps -e -o pid,command | grep node -m 1 | awk '{ print $1; }'`
	echo "God stopped"
	eend $? "Failed to stop $DESC"
	rm -f /var/run/nginx.pid
}

restart() {
	stop
  start
}
