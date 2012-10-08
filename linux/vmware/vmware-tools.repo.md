Installing vmware-tools on Red Hat, Centos 

Import DSA and RSA repo Keys
============================

 rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub
 rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub

Add YUM repo
============
Contents of /etc/yum.repos.d/vmwaretools.repo

[vmware-tools]
name=VMware Tools
baseurl=http://packages.vmware.com/tools/esx/4.1latest/rhel6/$basearch <--If arch isn't recognized: s/basearch/arch/g
enabled=1
gpgcheck=1

Install packages 
===============

headless server:

 yum -y install vmware-open-vm-tools-nox

¿need mouse and graphic adapter support?

 yum -y install vmware-open-vm-tools

Epithap 
=======

Seen on [1].  In comments you may find solutions for some quircks 



[1]  http://aaronwalrath.wordpress.com/2011/03/24/install-open-source-vmware-tools-on-red-hat-and-scientific-linux-6/

