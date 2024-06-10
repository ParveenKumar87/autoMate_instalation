source common.sh
HEADING Installing nginx Server
dnf install nginx -y
echo exit status - $?

HEADING Removing old content
rm -rf /usr/share/nginx/html/*

HEADING Downloading source code from internet
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

HEADING Copying configuration file
cp expense.conf /etc/nginx/default.d/expense.conf

systemctl enable nginx

systemctl restart nginx
echo exit status - $?