#!/bin/bash

# List of required tools and their install commands
REQUIRED_TOOLS=(
  "nmap"
  "wapiti"
  "nikto"
  "nuclei"
  "dirsearch"
  "dirb"
  "testssl"
  "sqlmap"
  "dig"
  "unzip"
  "python3"
  "pip3"
)

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install a tool
install_tool() {
  TOOL=$1
  case $TOOL in
    nmap|nikto|dirb|dnsutils|unzip|python3|pip3)
      echo "Installing $TOOL with apt..."
      sudo apt-get update && sudo apt-get install -y $TOOL
      ;;
    wapiti)
      echo "Installing wapiti with apt or pip..."
      sudo apt-get update && sudo apt-get install -y wapiti || pip3 install wapiti3
      ;;
    sqlmap)
      echo "Installing sqlmap with apt or git..."
      sudo apt-get update && sudo apt-get install -y sqlmap || {
        git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git &&
        sudo ln -s $(pwd)/sqlmap/sqlmap.py /usr/local/bin/sqlmap &&
        chmod +x /usr/local/bin/sqlmap
      }
      ;;
    nuclei)
      echo "Installing nuclei..."
      curl -s https://api.github.com/repos/projectdiscovery/nuclei/releases/latest | \
        grep "browser_download_url.*linux_amd64.zip" | \
        cut -d : -f 2,3 | tr -d '\"' | wget -i -
      unzip nuclei_*_linux_amd64.zip
      sudo mv nuclei /usr/local/bin/
      rm nuclei_*_linux_amd64.zip
      ;;
    dirsearch)
      echo "Installing dirsearch..."
      git clone https://github.com/maurosoria/dirsearch.git || true
      sudo ln -sf $(pwd)/dirsearch/dirsearch.py /usr/local/bin/dirsearch
      chmod +x /usr/local/bin/dirsearch
      pip3 install -r dirsearch/requirements.txt
      ;;
    testssl)
      echo "Installing testssl..."
      git clone --depth 1 https://github.com/drwetter/testssl.sh.git || true
      sudo ln -sf $(pwd)/testssl.sh/testssl.sh /usr/local/bin/testssl
      chmod +x /usr/local/bin/testssl
      ;;
    dig)
      echo "Installing dig (dnsutils) with apt..."
      sudo apt-get update && sudo apt-get install -y dnsutils
      ;;
    *)
      echo "No install instructions for $TOOL. Please install it manually."
      ;;
  esac
}

# Check and install missing tools
for TOOL in "${REQUIRED_TOOLS[@]}"; do
  if ! command_exists $TOOL; then
    echo "$TOOL not found. Installing..."
    install_tool $TOOL
  else
    echo "$TOOL is already installed."
  fi
done

echo "All required tools are installed."