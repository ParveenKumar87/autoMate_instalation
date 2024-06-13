source common.sh
rm -f /tmp/expense.log

if [ -z "$1" ];then
  echo "Enter the password for MySQL"
  exit
fi

HEADING Installing MySQL Server
dnf install mysql-server -y
echo exit status - $?

HEADING enabling and starting MySQL Service
systemctl enable mysqld
systemctl start mysqld
echo exit status - $?

HEADING Installing MySQL Server
mysql_secure_installation --set-root-pass $1
echo exit status - $?