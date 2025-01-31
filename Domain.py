import socket

domain_name = "example.com"
ip_address = socket.gethostbyname(domain_name)

print(f"Domain {domain_name} resolves to IP {ip_address}")
