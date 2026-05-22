# Ansible Network Configuration Automation

## What This Does
This system automates Linux network configuration using Ansible and NetworkManager. It safely manages network profiles, DNS settings, static routes, validation checks, and reporting without disrupting the active cloud interface. The workflow demonstrates how infrastructure teams can apply repeatable network configuration through code while avoiding manual drift and outage-prone changes.

## Architecture

```text
+--------------------------------------------------+
|              Ansible Control Layer               |
|--------------------------------------------------|
| inventory                                         |
| configure-network-baseline.yml                   |
| configure-secondary-network.yml                  |
| configure-routing.yml                            |
| configure-dns.yml                                |
| master-network-config.yml                        |
| validate-network.yml                             |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|          CentOS Stream 9 Network Host            |
|--------------------------------------------------|
| NetworkManager                                   |
| nmcli                                            |
| Active cloud interface                           |
| Secondary managed network profile                |
| DNS configuration                                |
| Static route configuration                       |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|              Validation and Reporting            |
|--------------------------------------------------|
| Interface status checks                          |
| Active connection checks                         |
| DNS resolution tests                             |
| Internet connectivity tests                      |
| reports/localhost_network_report.txt            |
+--------------------------------------------------+
