Usage:
# ln -s /etc/init.d/phpdaemon_link /etc/init.d/phpdaemonExample 
# echo "<?php sleep(600); " > /var/www/phpdaemonExample.php 
# echo 'PHP_SCRIPT="/var/www/phpdaemonExample.php"' >> /etc/conf.d/phpdaemonExample 
# /etc/init.d/phpdaemonExample start|stop|status|restart
