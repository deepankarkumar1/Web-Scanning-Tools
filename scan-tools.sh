#!/bin/bash

# Define target
TARGET=$1

# Resolve the domain to an IP address for Nmap
IP=$(dig +short $TARGET)

if [ -z "$TARGET" ]; then
  echo "Usage: ./scan_tools.sh <target-url>"
  exit 1
fi

# Check if a domain is provided
if [ -z "$TARGET" ]; then
  echo "Usage: ./scan_tools.sh <target-url>"
  exit 1

echo "Running Nikto Vulnerability Scan..."
nikto -h $TARGET -C all

echo "Running Wapiti Vulnerability Scan..."
wapiti -u $TARGET

echo "Running Nuclei Vulnerability Scan..."
nuclei -u $TARGET

echo "Running Nuclei Vulnerability Scan..."
nuclei -u $IP

echo "Running Dirb Vulnerability Scan..."
dirb $TARGET

echo "Running Dirsearch Scan..."
dirsearch -u $TARGET

echo "Running Nmap for Open Ports..."
nmap -sV  $IP
 
echo "Running Nmap for Vulnerability scanner.."
nmap -sV --script vuln $IP

echo "Running Testssl for SSL Vulnerability.."
testssl $TARGET

echo "Running Nmap script to check Weak Ciphers.."
nmap -sV --script ssl-enum-ciphers $IP

echo "Running Sqlmap to find Sql injection.."
sqlmap -u $TARGET --level=3 --crawl=3 --risk=3 --random-agent --batch --dbs


