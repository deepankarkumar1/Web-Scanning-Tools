#!/bin/bash

# Define target
TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Usage: ./scan_tools.sh <target-url>"
  exit 1
fi

echo "Running Nikto Scan..."
nikto -h $TARGET -C all

echo "Running Wapiti Scan..."
wapiti -u $TARGET

echo "Running Nuclei Scan..."
nuclei -u $TARGET

echo "Running Dirb Scan..."
dirb $TARGET

echo "Running Dirsearch Scan..."
python3 dirsearch/dirsearch.py -u $TARGET

echo "Running Nmap for Ports..."
nmap -sV $TARGET

echo "Running Nmap for Vulnerability scanner..."
nmap -sV --script vuln $TARGET

