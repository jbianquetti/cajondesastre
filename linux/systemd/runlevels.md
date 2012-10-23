How do I change the runlevel?
=============================
There's two ways to do this:

Ya olde runlevel number:  systemctl isolate runlevel3.target 


New, shiny way: systemctl isolate multi-user.target


How do I change the default runlevel? 
=====================================

Systemd uses symlinks to point to the default runlevel, but don't provide any method to do this.
You have to delete the existing symlink first before creating a new one

 rm /etc/systemd/system/default.target 

Switch to runlevel 3 by default

 ln -sf /lib/systemd/system/multi-user.target /etc/systemd/system/default.target 

