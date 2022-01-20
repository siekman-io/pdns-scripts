
#!/bin/bash
# Create zone in powerDNS with soa record, Nameservers en DNS Sec Activated
NAMESERVER1=ns01.example.com
NAMESERVER2=ns02.example.com
NAMESERVER3=ns03.example.com
MAIL=noc@example.com
user=pdns

for i in $(cat domains.txt)
    do
     sudo -u $user pdnsutil create-zone ${i}
     sudo -u $user pdnsutil replace-rrset ${i} @ SOA ""$NAMESERVER1" "$MAIL" 0 10800 3600 604800 3600"
     sudo -u $user pdnsutil add-record ${i} @ NS $NAMESERVER1
     sudo -u $user pdnsutil add-record ${i} @ NS $NAMESERVER2
     sudo -u $user pdnsutil add-record ${i} @ NS $NAMESERVER3
     sudo -u $user pdnsutil add-zone-key ${i} ksk active
     sudo -u $user pdnsutil increase-serial ${i}
    done

