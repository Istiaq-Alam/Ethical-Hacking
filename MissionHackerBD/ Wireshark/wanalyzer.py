#!/usr/bin/env python3

from scapy.all import rdpcap, TCP, Raw, IP

def analyze_http_pcapng(filename):
    packets = rdpcap(filename)

    for pkt in packets:
        if pkt.haslayer(TCP) and pkt.haslayer(Raw):
            tcp_payload = pkt[Raw].load
            if b"HTTP" in tcp_payload or b"GET" in tcp_payload or b"POST" in tcp_payload:
                print("-" * 50)
                print("Source IP:", pkt[IP].src)
                print("Destination IP:", pkt[IP].dst)
                print("Payload (partial):")
                # Try decoding as ASCII for readability
                try:
                    print(tcp_payload.decode('utf-8', errors='ignore'))
                except:
                    print(tcp_payload)
                print("-" * 50)

if __name__ == "__main__":
    pcapng_file = "capture.pcapng"   # আপনার ফাইলের নাম দিন
    analyze_http_pcapng(pcapng_file)
    packets = rdpcap('capture.pcapng')
    pkt = packets[0]
    pkt.show()
