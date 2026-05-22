# Ansible Firewall Policy Automation

## What This Does
This system automates Linux firewall configuration using Ansible and firewalld. It manages services, ports, rich rules, custom zones, security policies, and validation checks through repeatable playbooks. The workflow demonstrates how infrastructure and security teams can enforce consistent firewall policy across Linux systems without relying on manual rule changes.

## Architecture

```text
+--------------------------------------------------+
|              Ansible Control Layer               |
|--------------------------------------------------|
| inventory                                         |
| basic-firewall.yml                               |
| advanced-firewall.yml                            |
| rich-rules.yml                                   |
| zones-management.yml                             |
| services-management.yml                          |
| security-policy.yml                              |
| firewall-testing.yml                             |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|             CentOS Firewall Host                 |
|--------------------------------------------------|
| firewalld                                        |
| firewall-cmd                                     |
| ansible.posix.firewalld                          |
| public zone                                      |
| internal zone                                    |
| dmz-custom zone                                  |
| custom-app service                               |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|          Security Validation and Backup          |
|--------------------------------------------------|
| SSH allowed                                      |
| HTTP/HTTPS allowed                               |
| Telnet blocked                                   |
| Rich rules configured                            |
| Zone policies applied                            |
| /tmp/firewall-backups/firewall-config.txt        |
+--------------------------------------------------+
