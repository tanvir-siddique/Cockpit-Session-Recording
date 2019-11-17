#!/bin/bash
yum install tlog cockpit-session-recording 
systemctl enable —now cockpit.socket

cat <<EOF >/etc/sssd/sssd.conf
[domain/local]
id_provider = files

[sssd]
domains = local
services = nss, pam, ssh, sudo
EOF

chmod 600 /etc/sssd/sssd.conf
systemctl restart sssd
