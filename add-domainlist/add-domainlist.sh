
#!/bin/bash
# Create zone in powerDNS with soa record, Nameservers en DNS Sec Activated
NAMESERVER1=ns01.example.com
NAMESERVER2=ns02.example.com
NAMESERVER3=ns03.example.com
MAIL=noc@example.com

for i in $(cat domains.txt)
    do
      pdnsutil create-zone ${i}
      pdnsutil replace-rrset ${i} @ SOA ""$NAMESERVER1" "$MAIL" 0 10800 3600 604800 3600"
      pdnsutil add-record ${i} @ NS $NAMESERVER1
      pdnsutil add-record ${i} @ NS $NAMESERVER2
      pdnsutil add-record ${i} @ NS $NAMESERVER3
      pdnsutil add-zone-key ${i} ksk active
      pdnsutil increase-serial ${i}
    done

