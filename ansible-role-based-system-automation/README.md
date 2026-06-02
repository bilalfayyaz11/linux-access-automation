# Ansible Role-Based System Automation

## What This Does

This implementation builds a reusable Ansible role-based automation framework for Linux system administration. User management, service configuration, and file management are separated into dedicated roles that can be reused across multiple systems and environments.

The automation framework follows Ansible best practices by using role defaults, handlers, variable precedence, conditional execution, verification playbooks, and performance testing. This approach improves maintainability, scalability, and operational consistency across infrastructure deployments.

## Architecture

```text
Control Node
│
├── site.yml
├── variable_precedence_demo.yml
├── conditional_roles.yml
├── verify_roles.yml
├── performance_test.yml
│
└── roles
    │
    ├── user_management
    │   ├── defaults
    │   ├── tasks
    │   └── handlers
    │
    ├── service_config
    │   ├── defaults
    │   ├── tasks
    │   └── handlers
    │
    └── file_management
        ├── defaults
        ├── tasks
        └── handlers
```

## Prerequisites

* CentOS Stream 9, RHEL 9, Rocky Linux, or compatible Linux distribution
* Python 3
* Git
* Ansible Core
* Sudo privileges
* ansible.posix collection

## Setup & Installation

```bash
sudo dnf install -y git ansible-core tree

ansible-galaxy collection install ansible.posix
```

## How to Reproduce

```bash
cd ansible-role-based-system-automation

ansible-playbook site.yml --syntax-check

ansible-playbook site.yml -v

ansible-playbook variable_precedence_demo.yml -v

ansible-playbook conditional_roles.yml -v

ansible-playbook verify_roles.yml

ansible-playbook performance_test.yml
```

## Tools Used

* Ansible Core
* Ansible Galaxy
* ansible.posix
* YAML
* Linux User Management
* Linux Service Management
* Linux File Management
* Git

## Key Skills Demonstrated

* Reusable infrastructure automation using Ansible Roles
* Idempotent Linux administration workflows
* User and group lifecycle management
* Service deployment and lifecycle management
* File and directory automation
* Variable precedence implementation
* Conditional role execution
* Handler-driven configuration updates
* Verification and validation automation
* Infrastructure testing and performance measurement

## Real-World Use Case

Large organizations often manage hundreds or thousands of Linux systems. Maintaining separate playbooks for every environment quickly becomes difficult and error-prone. By creating reusable Ansible roles, operations and platform engineering teams can standardize user provisioning, service management, and file deployment across development, testing, and production environments while reducing maintenance overhead and improving consistency.

## Lessons Learned

* Role-based design significantly improves automation reusability.
* Separating responsibilities into dedicated roles simplifies maintenance.
* Verification playbooks provide confidence after infrastructure changes.
* Variable precedence must be carefully managed to avoid unexpected behavior.
* Idempotent automation is essential because infrastructure code executes repeatedly throughout a system lifecycle.

## Troubleshooting Log

* Installed missing Git and Ansible Core packages on CentOS Stream 9.
* Installed the ansible.posix collection required for SSH key management.
* Adapted execution to localhost because the environment provided a single-node deployment instead of multiple managed hosts.
* Improved handler naming to avoid ambiguity across roles.
* Validated syntax before execution to prevent runtime failures.
* Verified role execution using dedicated verification playbooks.
* Confirmed successful idempotent execution through repeated playbook runs.
