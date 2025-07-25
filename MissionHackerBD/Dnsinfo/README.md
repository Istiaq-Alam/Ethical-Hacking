🔍 Advanced DNS Recon Script (for Educational Use Only)
========================================================

This Bash script automates advanced DNS reconnaissance tasks as part of ethical hacking or penetration testing methodology. It helps in identifying DNS records, misconfigurations, subdomains, zone transfers, DNSSEC usage, email verification records, and more.

📁 Features:
-----------
- ✔️ DNS record enumeration (ANY, A, MX, NS, TXT, AAAA)
- ✔️ Zone Transfer checks (AXFR)
- ✔️ Subdomain brute-forcing
- ✔️ Email verification record checks (SPF, DKIM, DMARC)
- ✔️ DNSSEC status inspection
- ✔️ Reverse DNS lookup on adjacent IPs
- ✔️ Wildcard DNS detection
- ✔️ Passive enumeration via Amass
- ✔️ DNSRecon full scan
- ✔️ DNS Cache snooping test

🛠 Requirements:
---------------
- Kali Linux / Parrot OS
- `dig`, `host`, `dnsrecon`, `amass`
-Install missing tools via:
   - sudo apt install dnsutils dnsrecon amass

🚀 Usage:
--------
cd dnsinfo
chmod +x dnsinfo.sh
./dnsinfo.sh <domain>

Example:
./dnsinfo.sh vulnweb.com

⚠️ DISCLAIMER:
-------------
This script is intended for **educational and ethical hacking** purposes only.
Do NOT run against unauthorized or production systems. Use it in controlled lab environments.

Author: https://github.com/ShajalalCSE
GitHub: https://github.com/ShajalalCSE/dnsinfo
