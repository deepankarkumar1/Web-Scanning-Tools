# Web Scanning Tools

A collection of web vulnerability scanning tools integrated into one package. This project combines various open-source security tools to help identify vulnerabilities in web applications and servers. The tools used in this project are:

- **Nmap** - Network exploration and security auditing tool.
- **Wapiti** - A web application vulnerability scanner.
- **Nikto** - A web server scanner for detecting vulnerabilities.
- **Nuclei** - A fast and customizable vulnerability scanner.
- **Dirsearch** - A simple command-line tool designed for brute-forcing directories and files in web servers.
- **Dirb** - A tool for scanning directories on a web server.
- **TestSSL** - A tool for checking SSL/TLS configuration of web servers.
- **Sqlmap** - A tool for checking Sql Injection in Web Application.

## Features

- Scan web servers for a wide range of vulnerabilities.
- Run multiple security scans with ease using integrated tools.
- Generate reports to analyze vulnerabilities in your web applications and infrastructure.
- Support for custom scanning configurations and options for each tool.

---

## 🛠️ Installation

### 1. Clone the repository

```bash
git clone https://github.com/deepankarkumar1/web-scanning-tools.git
cd web-scanning-tools
````

### 2. Make scripts executable

```bash
chmod +x check-and-install-tools.sh
chmod +x scan-tools.sh
```

---

## ⚙️ Usage

### 🔄 Recommended: Install all required tools first

```bash
./check-and-install-tools.sh
```

This script checks and installs all necessary dependencies and tools before scanning.

### 🚀 Run the scanning tools

If all dependencies are already installed:

```bash
./scan-tools.sh <target-url>
```

Example:

```bash
./scan-tools.sh https://example.com
```

---

## 📂 Project Structure

```
web-scanning-tools/
├── check-and-install-tools.sh   # Installs and verifies all dependencies
├── scan-tools.sh                # Main scanning script
├── README.md                    # Project documentation
```

---

## 📌 Notes

* Ensure you have root privileges for tools like Nmap or Sqlmap when needed.
* Use responsibly: Only scan applications and servers you **own** or have **explicit permission** to test.
* Some tools may require Python 3 or additional system packages (e.g., `pip`, `nmap`, `go`, etc.).
* Customize `scan-tools.sh` as needed to control which tools run and how.

---

## 🛡️ Disclaimer

> ⚠️ This project is intended for educational and authorized security testing purposes only. Unauthorized scanning is illegal and unethical.

---

## 📜 License

This project uses open-source tools, each under their respective licenses. Your usage must comply with the terms provided by those tools.

---

## 🙌 Credits

* Maintained by [Deepankar Kumar](https://github.com/deepankarkumar1)
* Built with ♥ using open-source security tools.

```
