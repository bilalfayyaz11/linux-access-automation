# Automated Linux Reboot Orchestration and Validation

## What This Does

This implementation automates Linux system reboots using Ansible while validating service availability, system health, and post-maintenance operational readiness. The solution includes controlled reboot workflows, service verification, health checks, rolling reboot strategies, scheduled maintenance procedures, and structured error handling mechanisms.

The automation reduces operational risk associated with manual maintenance activities and provides repeatable validation workflows that help ensure systems return to a healthy state after reboot operations.

## Architecture

```text
+----------------------+
|  Ansible Control     |
|       Node           |
+----------+-----------+
           |
           v
+----------------------+
| Reboot Automation    |
| Playbooks            |
+----------+-----------+
           |
           v
+----------------------+
| Managed Linux Hosts  |
+----------+-----------+
           |
           +------------------+
           |                  |
           v                  v
+----------------+   +----------------+
| Service Checks |   | Health Checks  |
| sshd           |   | CPU            |
| NetworkManager |   | Memory         |
| chronyd        |   | Disk           |
+----------------+   | DNS            |
                     +----------------+

           |
           v

+----------------------+
| Logs & Reports       |
| Validation Output    |
| Recovery Records     |
+----------------------+
```

## Prerequisites

* CentOS Stream 9 / RHEL 9 compatible system
* Ansible Core
* Python 3
* SSH access
* Sudo privileges
* Systemd-managed services

## Setup & Installation

```bash
sudo dnf install -y ansible-core git

git clone https://github.com/bilalfayyaz11/linux-access-automation.git
cd linux-access-automation
```

## How to Reproduce

```bash
ansible-playbook playbooks/system-reboot.yml

ansible-playbook playbooks/reboot-with-validation.yml

ansible-playbook playbooks/service-validation.yml

ansible-playbook playbooks/reboot-with-error-handling.yml

ansible-playbook playbooks/rolling-reboot.yml

ansible-playbook playbooks/scheduled-reboot.yml
```

## Tools Used

* Ansible Core
* YAML
* Linux Systemd
* SSH
* CentOS Stream 9
* Jinja2 Templates

## Key Skills Demonstrated

* Automated system maintenance
* Safe reboot orchestration
* Service validation workflows
* Infrastructure health verification
* Failure recovery automation
* Operational logging and reporting
* Rolling maintenance strategies
* Production-style infrastructure management

## Real-World Use Case

Platform Engineering, DevOps, Infrastructure Operations, and SRE teams frequently need to reboot servers for kernel updates, security patching, configuration changes, and maintenance windows. This implementation demonstrates how reboot procedures can be automated safely while ensuring that services recover correctly and operational health is verified after maintenance activities.

## Lessons Learned

* Reboots should always include validation procedures.
* Service health must be verified after maintenance operations.
* Rolling maintenance reduces operational risk.
* Error handling significantly improves automation reliability.
* Structured reporting improves operational visibility.

## Troubleshooting Log

* Removed unsupported Ansible yaml callback configuration.
* Adapted inventory configuration for local execution.
* Replaced environment-specific assumptions with portable validation logic.
* Implemented post-reboot health verification procedures.
* Added recovery workflows for failed reboot scenarios.
