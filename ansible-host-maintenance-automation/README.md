# Ansible Host Configuration and Maintenance Automation

## Overview

This project automates Linux host configuration, service management, package lifecycle management, log rotation, health monitoring, and maintenance operations using Ansible.

The implementation demonstrates enterprise infrastructure automation practices commonly used by Linux Administrators, RHCE Engineers, DevOps Engineers, Platform Engineers, and Infrastructure Operations teams.

## Objectives

- Automate package installation and removal
- Automate service configuration and validation
- Configure Apache web services
- Manage firewall policies
- Configure log rotation
- Implement automated update workflows
- Perform health monitoring and reporting
- Validate reboot readiness
- Maintain idempotent infrastructure automation

## Technologies Used

- Ansible
- Linux
- CentOS Stream 9
- Apache HTTP Server
- Firewalld
- Logrotate
- YAML
- SSH

## Project Structure

├── ansible.cfg
├── inventory
│   └── hosts.yml
├── outputs
│   ├── advanced-service-management-output.txt
│   ├── automated-updates-output.txt
│   ├── log-rotation-setup-output.txt
│   ├── package-service-management-output.txt
│   └── system-health-check-output.txt
└── playbooks
    ├── advanced-service-management.yml
    ├── automated-updates.yml
    ├── log-rotation-setup.yml
    ├── package-service-management.yml
    └── system-health-check.yml

## Skills Demonstrated

- Configuration Management
- Infrastructure Automation
- Linux Administration
- Service Lifecycle Management
- Package Management
- Firewall Administration
- System Monitoring
- Operational Maintenance
- Idempotent Automation
- RHCE-Level Ansible Workflows

## Outcome

A reusable Ansible automation framework for Linux host maintenance and operational management.
EOF
