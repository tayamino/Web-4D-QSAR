$down = New-Object System.Net.WebClient

$down.DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.20.1.windows.1/Git-2.20.1-64-bit.exe','git-scm-setup.exe');
$down.DownloadFile('https://download.virtualbox.org/virtualbox/6.0.0/VirtualBox-6.0.0-127566-Win.exe','virtualbox-setup.exe');
$down.DownloadFile('https://releases.hashicorp.com/vagrant/2.2.2/vagrant_2.2.2_x86_64.msi','vagrant-setup.exe');

$down.DownloadFile('https://github.com/tayamino/Web-4D-QSAR/raw/master/deploy.bat','deploy.bat');

$exec = New-Object -com shell.application

$exec.shellexecute('git-scm-installer.exe');
$exec.shellexecute('virtualbox-installer.exe');
$exec.shellexecute('vagrant-installer.exe');

$exec.shellexecute('git', 'clone https://github.com/tayamino/web-4d-qsar.git C:\web4d-qsar');

$exec.shellexecute('vagrant', 'up', 'C:\web4d-qsar');
