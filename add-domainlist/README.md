# Add domainlist script

Add a list of domains to powerdns with pdnsutils. I made this just to make a simple migration more easy.
i have a situation that pdns is running on a different user. and i create ons script to use is on the user

edit the variables in the files to your needs

NAMESERVER1=ns01.example.com
NAMESERVER2=ns02.example.com
NAMESERVER3=ns03.example.com
MAIL=noc@example.com
user=pdns

if you like to add one line with a records just copy one add-record rule

sudo -u $user pdnsutil add-record ${i} fillrecord A 1.1.1.1
