echo -e "\e[35mInstalling nginx Server\e[0m"
dnf install nginx -y
echo exit status - $?

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
cp expense.conf /etc/nginx/default.d/expense.conf
systemctl enable nginx
systemctl restart nginx