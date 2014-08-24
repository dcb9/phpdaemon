PHP守护进程
=========
### 功能
PHP的脚本执行时间长了就会失去响应，即使我们设置为永不超时，所以我们要写一个脚本，来监控这个PHP的执行状态，如果执行的进程已经不在了，那么重新再把这个程序启动，这样了就实现了一个守护进程的功能。（个人建议PHP内部的执行时间控制在30分钟以内然后自然地停止，则我们的守护进程再来把它启动）
 
#### Gentoo安装
```
# USE=git emerge layman
# layman -f
# layman -a gentoo-zh
# echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf
# emerge phpdaemon
```

#### CentOS安装
由于本程序使用了start-stop-daemon 这个后台运行管理程序，所以使用前请先安装start-stop-daemon，如果安装start-stop-daemon报错请自行Google解决。
```
# mkdir -p /usr/src/local ; cd /usr/src/local
# wget http://developer.axis.com/download/distribution/apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
# tar zxf apps-sys-utils-start-stop-daemon-IR1_9_18-2.tar.gz
# cd apps/sys-utils/start-stop-daemon-IR1_9_18-2/ 
# gcc start-stop-daemon.c -o /usr/local/bin/start-stop-daemon  (最终的执行命令一定要放到这里，后面的程序会依赖它的）
```
安装phpdaemon
```
# yum -y install git (如果有git 的话可以不用再安装了)
# mkdir -p /usr/src/local ; cd /usr/src/local
# git clone https://github.com/bobchengbin/phpdaemon.git
# cp phpdaemon/phpdaemon /usr/bin/phpdaemon
# chmod 755 /usr/bin/phpdaemon   (注意，CentOS这个系统非常乱大家安装php的位置都可能不一样，如果php不是在/usr/bin/php那么请修改 /usr/bin/phpdaemon的配置文件）
# cp phpdaemon/phpdaemon_centos /etc/init.d/phpdaemon_link
# chmod 755 /etc/init.d/phpdaemon_link
# mkdir /etc/conf.d/  （这个目录是为了存放配置文件用的）
```

#### 使用示例
* 创建一个软链接，这个名称最好取的和你最终要运行的php名称一致

```# ln -s /etc/init.d/phpdaemon_link /etc/init.d/phpdaemonExample```
* 正式的时候这个是你需要运行的php程序

```# echo "<?php sleep(600); " > /var/www/phpdaemonExample.php```
* 把刚才的的php程序全路径指定到配置文件里面去。 /etc/conf.d/配置文件名字 必须和创建软链接的名字一致，不然配置了无效

```# echo 'PHP_SCRIPT="/var/www/phpdaemonExample.php"' >> /etc/conf.d/phpdaemonExample```
* 服务的启动与停止

```# /etc/init.d/phpdaemonExample start|stop|status|restart```

#### 加入系统自启动
* Gentoo `rc-update add phpdaemonExample default`
* CentOs `chkconfig --levels 2345 phpdaemonExample on`
