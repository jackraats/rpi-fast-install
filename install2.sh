#!/bin/sh
#
pkg install -y nano
cd /usr/local/bin
ln -s nano pico
pkg install -y sshguard rsync
pkg install -y dovecot postfix 
pkg install -y procmail
pkg install -y postfix-policyd-spf-perl
cd /
ln -s /usr/local/etc /letc
ln -s /usr/local/etc/dovecot
ln -s /usr/local/etc/postfix
cd /dovecot
wget -N --no-check-certificate https://nednl.com/install/dovecot.conf
cd /postfix
wget -N --no-check-certificate https://nednl.com/install/main.cf
wget -N --no-check-certificate https://nednl.com/install/master.cf
wget -N --no-check-certificate https://nednl.com/install/update
chmod 755 update
mkdir tables
cd tables
wget -N --no-check-certificate https://nednl.com/install/body_checks
wget -N --no-check-certificate https://nednl.com/install/bogus_mx
wget -N --no-check-certificate https://nednl.com/install/generic
wget -N --no-check-certificate https://nednl.com/install/header_checks
wget -N --no-check-certificate https://nednl.com/install/helo_checks
wget -N --no-check-certificate https://nednl.com/install/sender_checks
wget -N --no-check-certificate https://nednl.com/install/spamtrap
wget -N --no-check-certificate https://nednl.com/install/tld_acl
wget -N --no-check-certificate https://nednl.com/install/transport
wget -N --no-check-certificate https://nednl.com/install/virtual_alias_domains
wget -N --no-check-certificate https://nednl.com/install/virtual_alias_maps
cd /letc
wget -N --no-check-certificate https://nednl.com/install/procmailrc
wget -N --no-check-certificate https://nednl.com/install/sshguard.conf
wget -N --no-check-certificate https://nednl.com/install/sshguard.whitelist
wget -N --no-check-certificate https://nednl.com/install/upgrade.sh
chmod 755 upgrade.sh
cd /usr
mkdir spool
cd spool
mkdir procmail
mkdir temp
cd /usr
chmod -R 777 spool
cd /usr/local
mkdir mailbackup
chmod 777 mailbackup
pkg install -y spamassassin
pkg install -y p5-Digest-SHA1 razor-agents
pkg install -y p5-DBI p5-LWP-UserAgent-POE
pkg install -y p5-Net-Patricia p5-BSD-Resource
pkg install -y p5-IP-Country
sa-update -D
install -m 0644 /usr/local/share/postfix/mailer.conf.postfix /usr/local/etc/mail/mailer.conf
cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
# Clean up the mess
pkg autoremove
pkg clean -a
pkg check -Bdsr
