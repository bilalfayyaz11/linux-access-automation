# SELinux Policy Automation with Ansible

## Overview

This project automates SELinux administration and security policy management using Ansible on Red Hat Enterprise Linux and CentOS-based systems.

The implementation demonstrates infrastructure automation for SELinux enforcement, file context management, SELinux booleans, custom port assignments, application policy configuration, and security troubleshooting.

## Objectives

- Automate SELinux enforcement
- Manage SELinux file contexts
- Configure SELinux booleans
- Manage SELinux port policies
- Deploy SELinux-aware applications
- Generate automated SELinux reports
- Validate SELinux configuration consistency

## Technologies Used

- Ansible
- SELinux
- RHEL / CentOS Stream
- Apache HTTP Server
- PolicyCoreUtils
- Setroubleshoot
- Linux System Administration

## Project Structure

```text
selinux-policy-automation/
├── inventory/
├── playbooks/
├── outputs/
├── reports/
├── screenshots/
└── scripts/
