#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain=$1
echo "[+] Starting advanced DNS recon for: $domain"
echo "--------------------------------------------"

# 1. Basic DNS Records
echo "[*] Basic DNS Records:"
dig $domain ANY +noall +answer
dig $domain MX +short
dig $domain NS +short
dig $domain TXT +short
echo

# 2. IP Address (A & AAAA)
echo "[*] A & AAAA Records:"
dig $domain A +short
dig $domain AAAA +short
echo

# 3. Zone Transfer
echo "[*] Zone Transfer Attempt:"
for ns in $(dig NS $domain +short); do
    echo "[>] Trying AXFR on $ns"
    dig @$ns $domain AXFR
done
echo

# 4. DNSSEC Check
echo "[*] DNSSEC Status:"
dig +dnssec $domain | grep "flags:"
echo

# 5. Subdomain Bruteforce
echo "[*] Brute-force Subdomains:"
for sub in www mail ftp dev admin test staging beta blog api portal webmail cpanel vpn ; do
    host $sub.$domain | grep "has address"
done
echo

# 6. DNSRecon
echo "[*] dnsrecon Scan:"
dnsrecon -d $domain -a
echo

# 7. Amass Passive Enum
echo "[*] Amass Passive Subdomain Enum:"
amass enum -passive -d $domain
echo

# 8. CNAME Discovery
echo "[*] CNAME Records:"
for sub in www ftp mail dev admin ; do
    dig CNAME $sub.$domain +short
done
echo

# 9. SPF / DKIM / DMARC
echo "[*] Email Security Records:"
echo "- SPF:"
dig $domain TXT +short | grep "v=spf"
echo "- DKIM (default selector):"
dig default._domainkey.$domain TXT +short
echo "- DMARC:"
dig _dmarc.$domain TXT +short
echo

# 10. Reverse DNS on sample range
echo "[*] Reverse DNS Check:"
base_ip=$(dig +short $domain | head -n 1 | cut -d'.' -f1-3)
for i in $(seq 1 5); do
    host $base_ip.$i | grep -v "not found"
done
echo

# 11. Check for Wildcard DNS
echo "[*] Checking Wildcard DNS:"
random=$(tr -dc a-z </dev/urandom | head -c5)
dig $random.$domain | grep "IN A"
echo

# 12. DNS Cache Snooping (on open resolvers)
echo "[*] DNS Cache Snooping Test (on 8.8.8.8):"
dig +nocmd $domain +noall +answer @8.8.8.8
echo

echo "[+] Recon Complete!"
