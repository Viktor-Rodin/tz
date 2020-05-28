log_format upstreamlog	'$remote_addr -- [$time_local] -- '
			'$server_name to: $upstream_addr ["$request" - status $status - $body_bytes_sent] -- '
			'upstream_response_time $upstream_response_time -- '
			'"$http_user_agent" \n';

upstream backend {
   server localhost:8001;
   server localhost:8002;
   server localhost:8003;
}

server {
   listen 80;
   #listen [::]:80;

   #root /var/www;
   #index index.html index.htm;
   #access_log /var/log/nginx/schoolsys-access.log main;
   access_log /var/log/nginx/school-access-new.log upstreamlog;
   error_log /var/log/nginx/schoolsys-error.log;
   server_name schoolsys.ru www.schoolsys.ru;

   location / {
       proxy_pass http://backend;
       #proxy_pass http://localhost:8001;
       proxy_set_header Host $host;

       proxy_set_header X-Forwarded-Host $server_name;
       proxy_set_header X-Real-IP $remote_addr;
       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header X-Forwarded-Proto $scheme;
       proxy_set_header Upgrade $http_upgrade;
       proxy_set_header Connection "upgrade";
   }
}
