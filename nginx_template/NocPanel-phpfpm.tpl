## Copyright (c) 2012, Fixed Solutions, System Development All rights reserved.
## Script : EasyNginx v3.3.1
## Author : [Ahmed Kandil] <a.kandil@arabhosters>
## Last Update : [ 08-09-2012 ]

server {
        root   /usr/local/nginx/html;
        listen       80;
        server_name  localhost;

        #charset koi8-r;

 	access_log logs/access_log;
        error_log  logs/error_log warn;
     
	location ~.*\.(3gp|gif|jpg|jpeg|png|ico|wmv|avi|asf|asx|mpg|mpeg|mp4|pls|mp3|mid|wav|swf|flv)$ {
	  expires 1y;   
         }
        location ~* \.php$ {
	   
	   try_files       $uri /index.php;
	   fastcgi_index   index.php;
	   fastcgi_pass    127.0.0.1:9000;
	#  fastcgi_pass   unix:/var/run/php-fpm/php-fpm.sock;
      	   include         fastcgi_params;
   	   fastcgi_param   SCRIPT_FILENAME    $document_root$fastcgi_script_name;
   	   fastcgi_param   SCRIPT_NAME        $fastcgi_script_name;
                           }
          
	location / {
            index  index.html index.htm;
                   }

        ## All other errors get the generic error page

        error_page 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 495 496 497 500 501 502 503 504 505 506 507 /maintenance/error_page.html;

        location  /maintenance/error_page.html {
        internal;

                                                }
	}
