user  nobody;
worker_processes  REP_CORES;

error_log  logs/error.log info;
worker_rlimit_nofile  80192;

events {
	worker_connections  5000; # you might need to increase this setting for busy servers
	use epoll; #  Linux kernels 2.4.x  change to rtsig
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
        client_header_buffer_size 4k;

	send_timeout     3m;
	connection_pool_size  256;
	large_client_header_buffers 4 32k;
	request_pool_size  4k;
	output_buffers   4 32k;
	postpone_output  1460;
	fastcgi_buffers 2048 4k;

	include   /usr/local/nginx/vhosts/*.conf;

}
