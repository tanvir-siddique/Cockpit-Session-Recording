#!/bin/bash
yum install sssd tlog cockpit-session-recording 
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

echo "Now login to your system http://[your_ip]:9000"
