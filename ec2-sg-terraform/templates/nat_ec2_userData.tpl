#!/bin/bash

# Function to detect the OS
detect_os() {
  if [ -f /etc/os-release ]; then
    local os=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
    echo "$os"
  else
    echo "Unsupported OS: Unknown"
    exit 1
  fi
}

# Function to install necessary packages and configure NAT
configure_nat_linux() {
  # Check package manager and install iptables-services or update apt repositories
  if command -v yum >/dev/null 2>&1; then
    install_yum_package
  elif command -v apt-get >/dev/null 2>&1; then
    update_apt_repositories
  else
    echo "Error: Neither yum nor apt-get found. Cannot install iptables-services."
    exit 1
  fi

  # Enable IP forwarding
  enable_ip_forwarding
  
  # Configure NAT
  configure_nat
  
  # Apply sysctl settings
  apply_sysctl_settings
}

# Function to install iptables-services on CentOS/RHEL
install_yum_package() {
  sudo yum install -y iptables-services || { 
    echo "Error: Failed to install iptables-services."
    exit 1
  }
}

# Function to update apt repositories on Debian/Ubuntu
update_apt_repositories() {
  sudo apt-get update || { 
    echo "Error: Failed to update apt repositories."
    exit 1
  }
}

# Function to enable IP forwarding
enable_ip_forwarding() {
  echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward >/dev/null || { 
    echo "Error: Failed to enable IP forwarding."
    exit 1
  }
}

# Function to configure NAT
configure_nat() {
  local default_interface=$(ip -o -4 route show to default | awk '{print $5}')
  sudo iptables -t nat -A POSTROUTING -o "$default_interface" -j MASQUERADE || { 
    echo "Error: Failed to configure NAT."
    exit 1
  }
}

# Function to apply sysctl settings
apply_sysctl_settings() {
  sudo sysctl -p >/dev/null || { 
    echo "Error: Failed to apply sysctl settings."
    exit 1
  }
}

# Main function to orchestrate the script
main() {
  local os_name=$(detect_os)
  case "$os_name" in
    "Ubuntu" | "Debian" | "CentOS" | "Red Hat Enterprise Linux" | "Fedora" | "Amazon Linux")
      configure_nat_linux
      ;;
    *)
      echo "Unsupported OS: $os_name"
      exit 1
      ;;
  esac
}

# Call the main function to start the script
main
