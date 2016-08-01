#!/bin/bash

if [[ ! -d /opt/snapshot ]]
then
	yum install git -y
	cd /opt/
	git clone https://github.com/sjafferali/snapshot.git
fi

if [[ -e /etc/cron.d/snapshot ]]
then
	ln -s /opt/snapshot/dropins/cron /etc/cron.d/snapshot
fi

if [[ -e /etc/logrotate.d/snapshot ]]
then
	ln -s /opt/snapshot/dropins/logrotate /etc/logrotate.d/snapshot
fi

if [[ -e /var/awslogs/etc/config/snapshot ]]
then
	ln -s /opt/snapshot/dropins/awslogs /var/awslogs/etc/config/snapshot
	touch /opt/snapshot/logs/ps.log
	/etc/init.d/awslogs stop
	systemctl daemon-reload
	/etc/init.d/awslogs start
fi
