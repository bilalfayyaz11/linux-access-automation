# Ansible Run Diagnostics and Troubleshooting Automation

## What This Does
This implementation demonstrates a structured troubleshooting workflow for Ansible automation runs. It validates playbooks before execution, captures debug output, tests interactive step-based execution, and documents common operational diagnostics used when automation fails. The workflow is designed for infrastructure engineers who need safer, more predictable automation in production-like Linux environments.

## Architecture
+-----------------------------+
| CentOS Stream 9 Control VM  |
+-------------+---------------+
              |
              v
+-----------------------------+
| Ansible Core Execution      |
| inventory + playbooks       |
+-------------+---------------+
              |
              v
+-----------------------------+
| Local Managed Target        |
| localhost connection        |
+-------------+---------------+
              |
              v
+-----------------------------+
| Diagnostics Outputs         |
| check, diff, debug, step    |
+-----------------------------+

## Prerequisites
- CentOS Stream 9 or compatible RHEL-based system
- Python 3
- Git
- Ansible Core
- SSH client
- sudo access
- ansible.posix collection

## Setup & Installation
sudo dnf install -y git ansible-core
ansible-galaxy collection install ansible.posix

## How to Reproduce
git clone https://YOUR_TOKEN@github.com/bilalfayyaz11/linux-access-automation.git
cd linux-access-automation/ansible-run-diagnostics

ansible-playbook -i inventory webserver-setup.yml --syntax-check
ansible-playbook -i inventory webserver-setup.yml --check
ansible-playbook -i inventory webserver-setup.yml --check --diff

ansible-playbook -i inventory debug-examples.yml
ansible-playbook -i inventory advanced-debug.yml
ansible-playbook -i inventory debug-failures.yml

ansible-playbook -i inventory step-by-step.yml --step
ansible-playbook -i inventory comprehensive-troubleshooting.yml --check --diff
ansible-playbook -i inventory comprehensive-troubleshooting.yml -v

./troubleshooting-checklist.sh

## Tools Used
- Ansible Core
- Ansible Playbooks
- Ansible Debug Module
- Check Mode
- Diff Mode
- Step Mode
- DNF
- systemd
- Git
- Bash
- CentOS Stream 9

## Key Skills Demonstrated
- Validating automation safely before execution
- Debugging variables, facts, registered output, and failed tasks
- Using interactive execution controls for risky automation
- Handling missing packages, missing collections, and broken playbook assumptions
- Creating reusable troubleshooting references for Linux automation workflows

## Real-World Use Case
This workflow is used by infrastructure, DevOps, and platform teams before applying automation to production systems. It reduces deployment risk by validating expected changes, exposing broken assumptions, and giving engineers a repeatable process for diagnosing failed automation runs.

## Lessons Learned
- Check mode helps catch broken automation before real changes are applied.
- Minimal Ansible Core installations may not include required collections.
- Local execution is useful when external managed nodes are unavailable.
- Package availability differs across RHEL-compatible distributions.
- Registered variables and debug output are essential for understanding failed tasks.

## Troubleshooting Log
- Replaced fake managed node IPs with localhost execution because external nodes were not available.
- Installed missing Ansible Core and Git on CentOS Stream 9.
- Installed missing ansible.posix collection for firewalld support.
- Recreated missing problematic playbook after initial execution stopped.
- Replaced unavailable htop package with nano for CentOS Stream 9 compatibility.
- Fixed template directory structure so Ansible could locate index.html.j2.
