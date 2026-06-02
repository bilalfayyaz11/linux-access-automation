# Ansible Package Automation

## Overview

This project automates software package management on Linux systems using Ansible. It demonstrates package installation, repository configuration, dependency management, role-based automation, and package verification using Infrastructure as Code principles.

The implementation follows RHCE-aligned package management practices and provides reusable automation for maintaining consistent software configurations across Linux environments.

---

## Objectives

- Automate package installation and removal
- Manage software repositories
- Handle package dependencies
- Build reusable Ansible roles
- Verify package deployment automatically
- Apply enterprise package management practices

---

## Architecture

```text
Ansible Control Node
        |
        v
+-------------------+
| Package Automation|
+-------------------+
        |
        +--------------------+
        |                    |
        v                    v
Package Installation   Repository Management
        |
        v
Dependency Resolution
        |
        v
Role-Based Automation
        |
        v
Verification & Validation
