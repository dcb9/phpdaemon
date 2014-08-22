PHP守护进程
=========
### 功能
PHP的脚本执行时间长了就会失去响应，即使我们设置为永不超时，所以我们要写一个脚本，来监控这个PHP的执行状态，如果执行的进程已经不在了，那么重新再把这个程序启动，这样了就实现了一个守护进程的功能。（个人建议PHP内部的执行时间控制在30分钟以内然后自然地停止，则我们的守护进程再来把它启动）
 
### Gentoo安装配置
#### 安装
`# emerge phpdaemon`
#### 示例
* 创建一个软链接，这个名称最好取的和你最终要运行的php名称一致
`# ln -s /etc/init.d/phpdaemon_link /etc/init.d/phpdaemonExample`
* 正式的时候这个是你需要运行的php程序
`# echo "<?php sleep(600); " > /var/www/phpdaemonExample.php`
* 把刚才的的php程序全路径指定到配置文件里面去。 /etc/conf.d/配置文件名字 必须和创建软链接的名字一致，不然配置了无效
`# echo 'PHP_SCRIPT="/var/www/phpdaemonExample.php"' >> /etc/conf.d/phpdaemonExample`
* 服务的启动与停止
`# /etc/init.d/phpdaemonExample start|stop|status|restart`
