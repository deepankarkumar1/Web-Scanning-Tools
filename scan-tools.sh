#!/bin/bash

# Define target
TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Usage: ./scan_tools.sh <target-url>"
  exit 1
fi

echo "Running Nikto Vulnerability Scan..."
nikto -h $TARGET -C all

echo "Running Wapiti Vulnerability Scan..."
wapiti -u $TARGET

echo "Running Nuclei Vulnerability Scan..."
nuclei -u $TARGET

echo "Running Dirb Vulnerability Scan..."
dirb $TARGET

echo "Running Dirsearch Scan..."
dirsearch -u $TARGET

echo "Running Nmap for Open Ports..."
nmap -sV $TARGET

echo "Running Nmap for Vulnerability scanner..."
nmap -sV --script vuln $TARGET

echo "Running Testssl for SSL Vulnerability.."
testssl $TARGET

echo "Running Nmap script to check Weak Ciphers.."
nmap -sV --script ssl-enum-ciphers $TARGET

