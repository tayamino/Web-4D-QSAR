Prerequisites :
===============

* Install [Windows Update - KB 3004394](https://support.microsoft.com/kb/3024777).
* Install [Windows Management Framework 3.0](https://www.microsoft.com/en-us/download/details.aspx?id=34595).

* Install [Git-SCM](https://git-scm.com/download/win).

* Install [Oracle VirtualBox Platform](https://www.virtualbox.org/wiki/Downloads) package (for Windows hosts).
* Install [Oracle VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) from the samepage as well.

* Install [HashiCorp Vagrant](https://www.vagrantup.com/downloads.html).

Installation :
==============

* Download the PowerShell script : [installer.ps1](https://github.com/tayamino/Web-4D-QSAR/raw/master/installer.ps1)

* Execute it by using : `powershell.exe -executionpolicy bypass -file installer.ps1`

Usage :
=======

Now, go to your favorite browser, type : [http://127.0.0.1:8000](http://127.0.0.1:8000)

After reboot :
==============

* Run through the commandline the following :

```
cd C:\web4d-qsar

vagrant up
```

