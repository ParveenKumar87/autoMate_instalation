source common

cp backend.service /etc/systemd/system/backend.service
dnf module disable nodejs -y
dnf module enable nodejs:20 -y

HEADING "Installing NodeJS"
dnf install nodejs -y
STAT $?

HEADING "Installing user Expense"
id expense &>>/tmp/expense.log
  if [ $? -ne 0 ]; then
    useradd expense &>>/tmp/expense.log
  fi
STAT $?
mkdir /app

HEADING "Downloading app code from Server"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
STAT $?

cd /app
unzip /tmp/backend.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable backend
systemctl start backend

HEADING "Installing MySQL client"
dnf install mysql -y
mysql -h 23.22.204.199 -uroot -p$1 < /app/schema/backend.sql
STAT $?