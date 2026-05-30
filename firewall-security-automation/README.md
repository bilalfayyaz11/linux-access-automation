# Firewall Security Automation with Ansible

## Overview

This project automates Linux firewall configuration using Ansible and firewalld. It demonstrates service-based rules, custom port management, rich rules, handlers, and audit reporting on CentOS Stream 9.

## Objectives

- Install and enable firewalld
- Configure firewall services using Ansible
- Open custom TCP ports
- Apply rich firewall rules
- Use handlers for firewall reloads
- Generate firewall audit reports

## Technology Stack

- Ansible Core
- Ansible POSIX Collection
- Firewalld
- CentOS Stream 9
- YAML
- Linux Security Administration

## Project Structure

```text
firewall-security-automation/
├── group_vars/
├── host_vars/
├── inventory/
├── outputs/
├── playbooks/
├── reports/
├── screenshots/
└── README.md
