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
        
	location / {
   	client_max_body_size    10m;
   	client_body_buffer_size 128k;

   	proxy_send_timeout   90;
    	proxy_read_timeout   90;

        proxy_buffer_size    4k;
   	# you can increase proxy_buffers here to suppress "an upstream response   	
	#  is buffered to a temporary file" warning
   	proxy_buffers     16 32k;
  	proxy_busy_buffers_size 64k;
  	proxy_temp_file_write_size 64k;
  	proxy_connect_timeout 30s;

   	#proxy_redirect  http://www.REP_DOMAIN:REP_Apache_Port   http://www.REP_DOMAIN;
   	#proxy_redirect  http://REP_DOMAIN:REP_Apache_Port   http://REP_DOMAIN;
   	proxy_pass   http://REP_IP:REP_Apache_Port/;

   	proxy_set_header   Host   $host;
  	proxy_set_header   X-Real-IP  $remote_addr;
   	proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
  	}

  	## All other errors get the generic error page
      	error_page 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 495 496 497 500 501 502 503 504 505 506 507 /maintenance/error_page.html;

      	location  /maintenance/error_page.html {
        internal;

         }

  }
