#!/bin/bash

# Function to detect the OS
detect_os() {
  os_name=$(grep '^NAME=' /etc/os-release | cut -d'"' -f2)
  echo "$os_name"
}

# Function to configure NAT for Linux
configure_nat_linux() {
  # Check if yum is available for CentOS, RHEL, Fedora, and Amazon Linux
  if command -v yum >/dev/null 2>&1; then
    sudo yum install -y iptables-services || { 
      echo "Error: Failed to install iptables-services."
      exit 1
    }
  # Check if apt-get is available for Ubuntu and Debian
  elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update || { 
      echo "Error: Failed to update apt repositories."
      exit 1
    }
  else
    echo "Error: Neither yum nor apt-get found. Cannot install iptables-services."
    exit 1
  fi

  # Get the default interface name
  interface_name=$(ip -o -4 route show to default | awk '{print $5}')
  
  # Enable IP forwarding
  echo 1 > /proc/sys/net/ipv4/ip_forward || { 
    echo "Error: Failed to enable IP forwarding."
    exit 1
  }
  
  # Configure NAT using iptables
  iptables -t nat -A POSTROUTING -o "$interface_name" -j MASQUERADE || { 
    echo "Error: Failed to configure NAT."
    exit 1
  }
  
  # Apply sysctl settings
  sysctl -p || { 
    echo "Error: Failed to apply sysctl settings."
    exit 1
  }
}

# Main function
main() {
  os=$(detect_os)
  case "$os" in
    "Ubuntu" | "Debian" | "CentOS" | "Red Hat Enterprise Linux" | "Fedora" | "Amazon Linux")
      configure_nat_linux
      ;;
    *)
      echo "Unsupported OS: $os"
      exit 1
      ;;
  esac
}

# Execute the main function
main
