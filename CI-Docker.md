#### Build Book (HIAL 2.0 VM Build)
[HIAL 2.0 VM Build]()

##### 1. Base virtual machine
* RHEL, TripWire, ITCAM, NFS Client, etc.

##### 2. Layer node specific
1. WSRR-G / WSRR-R (governance / runtime)
2. Queueing
3. HIB
4. FMBL
5. LOG
6. MGMT

##### 3. Deploy HIAL 2.0 solution
Package and deploy to each Master VM

[HIAL 2.0 Create Solution Package]()

##### 4. Create and deploy OVA

[Build and Deployment guide]()


### Docker images

####1. Base OS
* centos:6.6
  * _yum update brings it up to 6.8_
  * _ubuntu?_

* _LVM_
  * _25Gb total (33Gb for Queueing)_

* groups
```
groupadd -g 1160 fmbl
groupadd -g 1161 log
groupadd -g 1164 config
groupadd -g 1165 cache
groupadd -g 1166 jms
```

* users
```
useradd -g log -u 1155 hial
useradd -g fmbl -G log -u 1200 fmbl
```

* directory structure
```
mkdir /hial
mkdir /hial/apps
mkdir /hial/nfs
mkdir /hial/setup
mkdir /hial/DTE
mkdir /hial/ITE2
mkdir /hial/PPE
mkdir /hial/PROD
mkdir /hial/DR
```

* additional software packages _(yum)_

COTS

* _TripWire_

* _ITCAM_

_(! additional yum packages and folder structure installed/created here)_

* _Oracle Client_
_(! is this for rsyslog plugin or there are other components using it)

* _NFS_

* rsyslog
```
yum -y remove rsyslog-5.8.10-10.el6_6.x86_64
yum -y install rsyslog7.x86_64
service rsyslog start
service rsyslog stop
```
  * _rslylog plugin_

  _(! this should be moved to application deployment)_

* HIAL AD


####2. MQ

group add -g 1156 mqm
useradd -u 498 -g mqm mqm


####2. HIB

groupadd –g 1155 iib
groupadd –g 1157 mqbrkrs
groupmod –a mqbrkrs,iib mqm
useradd –G iib,mqm,mqbrkrs,root iibadmin
useradd –G config,cache,log iibadmin


### Docker containers

####1. tfsclient

build:
```
docker build -t tfsclient .
```

run:
```
docker run -it -w /work/workspace docker_tfsclient_1 /bin/bash
tfs_get
exit
```
