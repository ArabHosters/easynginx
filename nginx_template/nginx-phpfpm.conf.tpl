## Copyright (c) 2012, Fixed Solutions, System Development All rights reserved.
## Script : EasyNginx v3.3.1
## Author : [Ahmed Kandil] <a.kandil@arabhosters>
## Last Update : [ 08-09-2012 ]

server {
  REP_TXT
  access_log logs/REP_DOMAIN-access_log;
  error_log  logs/REP_DOMAIN-error_log warn;

  listen    80;
  server_name  REP_DOMAIN www.REP_DOMAIN;
  index index.html index.htm index.php;

  location ~.*\.(3gp|gif|jpg|jpeg|png|ico|wmv|avi|asf|asx|mpg|mpeg|mp4|pls|mp3|mid|wav|swf|flv)$ {

             expires 1y;
                                                                                                 }

  location ~.*\.(3gp|gif|jpg|jpeg|png|ico|wmv|avi|asf|asx|mpg|mpeg|mp4|pls|mp3|mid|wav|swf|flv)$ {
    	     proxy_cache_valid 200 301 302 120m;
             expires 2d;
             proxy_pass http://REP_IP;
             proxy_cache one;   
                                                                                                  }
  location ~* \.php$ {
	   try_files $uri $uri/ /index.php?$args;
	   # check existence
	   if (!-f $document_root$fastcgi_script_name) { return 404; }

	   fastcgi_index   index.php;
	   fastcgi_pass    127.0.0.1:REP_FPMPORT;
	#  fastcgi_pass   unix:/var/run/php-fpm/php-fpm.sock;
	   include         fastcgi_params;
	   fastcgi_param   SCRIPT_FILENAME    $document_root$fastcgi_script_name;
	   fastcgi_param   SCRIPT_NAME        $fastcgi_script_name;
                      }
  location ~ /\. {
	    access_log off;
	    log_not_found off;
	    deny all;
	               }

  location = /favicon.ico {
		log_not_found off;
		access_log off;
	                        }

  location = /robots.txt {
			allow all;
			log_not_found off;
			access_log off;
		               }

	# Enable permalink structures
		    if (!-e $request_filename) {
			rewrite . /index.php last;
		                               }
  location ~ /\.ht {
        	deny  all;
               	 }

     ## All other errors get the generic error page

      error_page 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 495 496 497

                 500 501 502 503 504 505 506 507 /maintenance/error_page.html;

   location  /maintenance/error_page.html {

          internal;
                                             }
}

