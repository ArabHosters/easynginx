user  nobody;
worker_processes  REP_CORES;


error_log  logs/error.log  info; # notice

#pid        logs/nginx.pid;

events {
   	worker_connections  5000;
}

http {
   
 server_names_hash_max_size 2048;
 server_names_hash_bucket_size 2048;
 set_real_ip_from     REP_IP;
 include    mime.types;
 default_type  application/octet-stream;

 sendfile on;
 tcp_nopush on;
 tcp_nodelay on;

 keepalive_timeout  10;

        gzip on;
        gzip_disable "msie6";
        gzip_vary on;
        gzip_proxied any;
        gzip_comp_level 5;
        gzip_buffers 64 8k;
        gzip_min_length 1024; gzip_http_version 1.1;
        gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

	ignore_invalid_headers on;

	client_body_buffer_size 10m;
	client_max_body_size 20m;
	client_header_timeout  3m;
	client_body_timeout 3m;
	send_timeout     3m;
	connection_pool_size  256;
	client_header_buffer_size 4k;
	large_client_header_buffers 4 32k;
	request_pool_size  4k;
	output_buffers   4 32k;
	postpone_output  1460;
	fastcgi_buffers 2048 4k;

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

   proxy_redirect  http://www.REP_DOMAIN:REP_Apache_Port   http://www.REP_DOMAIN;
   proxy_redirect  http://REP_DOMAIN:REP_Apache_Port   http://REP_DOMAIN;

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
}
