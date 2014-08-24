Gentoo Usage
============================================================================
# ln -s /etc/init.d/phpdaemon_link /etc/init.d/phpdaemonExample 
# echo "<?php sleep(600); " > /var/www/phpdaemonExample.php 
# echo 'PHP_SCRIPT="/var/www/phpdaemonExample.php"' >> /etc/conf.d/phpdaemonExample 
# /etc/init.d/phpdaemonExample start|stop|status|restart
#

Centos Usage
============================================================================
First step install start-stop-daemon
# mkdir -p /usr/src/local ; cd /usr/src/local
# wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
# tar zxf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
# cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/
# gcc start-stop-daemon.c -o /usr/local/bin/start-stop-daemon

Second step install phpdaemon
# yum -y install git ( if not installled )
# mkdir -p /usr/src/local ; cd /usr/src/local
# git clone https://github.com/bobchengbin/phpdaemon.git
# cp phpdaemon/phpdaemon /usr/bin/phpdaemon
# chmod 755 /usr/bin/phpdaemon (change /usr/bin/phpdaemon if php command isn't /usr/bin/php )
# cp phpdaemon/phpdaemon_centos /etc/init.d/phpdaemon_link
# mkdir /etc/conf.d/
usage
# ln -s /etc/init.d/phpdaemon_link /etc/init.d/phpdaemonExample 
# echo "<?php sleep(600); " > /var/www/phpdaemonExample.php 
# echo 'PHP_SCRIPT="/var/www/phpdaemonExample.php"' >> /etc/conf.d/phpdaemonExample 
# /etc/init.d/phpdaemonExample start|stop|status|restart
