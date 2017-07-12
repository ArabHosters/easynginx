# EasyNginx 

Simple BashScript installing Nginx as reverse proxy for cPanel Apache and Nginx + PHP-FPM Edit


# Usage 

Usage  ./easynginx -options


 |Options     |         Description|
 | ------------- |:-------------:|
 | -fpm | Installing Nginx + PHP-FPM and make Nginx stands alone | 
 | -r | Installing Nginx as a reverse proxy | 
 | -rr  | Installing Nginx as a reverse proxy For a remote server
  | -fpm -c  | Making VHosts when Nginx is standing alone (without Installing Nginx)  | 
 |  -r -c   | Making VHosts when Nginx is reverse proxy  (without Installing Nginx) | 
 |  -fpm -nc | Adding VHosts for new domains when Nginx is standing alone | 
 |  -r -nc |                Adding VHosts for new domains when Nginx is reverse proxy | 
  | -rc   |                 Removing VHosts for Terminated Accounts | 
  | -rpaf       |           Installing Rpaf module | 
 |  -drpaf   |              Disable Rpaf module | 
 |  -logr |                 If you have nginx and want to rotate logs | 

# Advanced Options

 |Options     |         Description|
 | ------------- |:-------------:|
 |  -r -s  |                Installing Nginx as a reverse proxy With Optimized Cache | 
  | -r -c -s   |            Making VHosts when Nginx is reverse proxy With Optimized Cache (without Installing Nginx) | 
 |  -r -nc -s        |      Adding VHosts for new domains when Nginx is reverse proxy With Optimized Cache | 

[WARNNING]: It's Not Recommended To Use Advanced Options If You Use vbulletin Or Any Other Forums Scripts.
