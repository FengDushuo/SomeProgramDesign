


# 技术栈
- [React——The best front-end framework ever](https://reactjs.org/)
- [Antd UI](https://ant.design/)
- 定制化 CSS
- Nginx


# 使用方式
## Dev Env
1. git clone.  
2. Run  ``` npm install ```.  
3. Run ```npm start``` . 在 3000 端口上开启本地服务器  
  

## Product Env  
1. Run ``` npm run build ```.  
2. console.    
***The build folder is ready to be deployed.  
You may serve it with a static server:***    
```  
npm install -g serve 
serve -s build 
```  
生成web app.  
3. 可以将其部署在Nginx或Apache的服务器上.  

4. 以Nginx为例，创建一个配置文件。可以配置更多功能，如负载平衡。 
```  
user root;

events {
	worker_connections 1024; # Default setting
}

http {
	gzip on;
	
	# No gzip IE6
	gzip_disable "msie6";
	
	# Set up if Nginx is used for reverse proxy
	# gzip_proxied any;
	
	# from 1-9. Bigger, Better. But use CPU
	gzip_comp_level 5;
	
	# Minimum file size which will be compressed.
	gzip_min_length 1k;
	
	# Set up the system to get a few units of cache for storing GZip's compressed result data stream. 16 8k represents 16 times the application memory in 8k units with the original data size installed in 8k units.
	gzip_buffers 16 8k;
	
	# Identify http version 
	gzip_http_version 1.1;
	
	# Set which kinds will be compressed.
	gzip_types text/plain text/css application/json application/x-javascript text/javascript text/xml application/xml application/xml+rss image/jpeg image/gif image/png;


	include /etc/nginx/mime.types; # Important

	server {
		listen 80;
		server_name localhost;
		root /root/React-build;
		index index.html;
		
		location ~.*\.css {
			add_header Content-Type text/css;
		}
		
		location ~* ^.+\.(ico|gif|jpg|jpeg|png)$ { 
			access_log off; 
			expires 7d;
		}

		location ~* ^.+\.(css|js|txt|xml)$ {
			access_log off;
			expires 24h;
		}
		
		# Open no-cache mode if you encounter some problem, which will reduce loading speed.
		# location ~.*\.(js|css|html|png|jpg)$ {
		# 	add_header Cache-Control no-cache;
		# }

		location @fallback {
			 rewrite .* /index.html break;
		}
	}
}
```  
5. 运行这个 .conf 可以访问.  
```  nginx -c /etc/nginx/vhost/example.conf  # We always make a vhost directory in nginx to store our .conf. ```  
停止服务先查询PID.  
``` ps aux|grep nginx  ```  
然后停掉进程.  
``` kill -QUIT [PPID]  ```  

## PC
![img](https://github.com/yanym/Cornell-Club/blob/master/public/images/Demo/PC.gif)  

## phone
![img](https://github.com/yanym/Cornell-Club/blob/master/public/images/Demo/IphoneX.gif)

## Pad
![img](https://github.com/yanym/Cornell-Club/blob/master/public/images/Demo/Ipad.gif)



### Some Notes
 - 这个项目基于开源项目 https://github.com/yanym/Cornell-Club .  
 - 学习使用，非商用.  

