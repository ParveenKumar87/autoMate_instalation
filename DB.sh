source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ];then
  echo "Enter the password for MySQL"
  exit 1
fi

HEADING Installing MySQL Server
dnf install mysql-server -y
STAT $?

HEADING enabling and starting MySQL Service
systemctl enable mysqld
systemctl start mysqld
STAT $?

HEADING Installing MySQL Server
mysql_secure_installation --set-root-pass $1
STAT $?