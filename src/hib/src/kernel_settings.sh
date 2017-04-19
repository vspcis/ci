#!/bin/bash

echo "kernel.shmmni = 4096" >> /etc/sysctl.conf
echo "kernel.shmall = 2097152" >> /etc/sysctl.conf
echo "kernel.shmmax = 268435456" >> /etc/sysctl.conf
echo "kernel.sem = 500 256000 250 1024" >> /etc/sysctl.conf
echo "fs.file-max = 524288" >> /etc/sysctl.conf
echo "kernel.pid-max = 120000" >> /etc/sysctl.conf
echo "kernel.threads-max = 48000" >> /etc/sysctl.conf

echo "mqadmin hard nofile 10240" >> /etc/security/limits.conf
echo "mqadmin soft nofile 10240" >> /etc/security/limits.conf
echo "mqadmin hard nproc 4096" >> /etc/security/limits.conf
echo "mqadmin soft nproc 4096" >> /etc/security/limits.conf
echo "iibadmin hard nofile 10240" >> /etc/security/limits.conf
echo "iibadmin soft nofile 10240" >> /etc/security/limits.conf
echo "mqm hard nofile 10240" >> /etc/security/limits.conf
echo "mqm soft nofile 10240" >> /etc/security/limits.conf
echo "mqm hard nproc 4096" >> /etc/security/limits.conf
echo "mqm soft nproc 4096" >> /etc/security/limits.conf
