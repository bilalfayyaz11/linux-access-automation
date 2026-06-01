# Ansible Operations Troubleshooting Framework

## What This Does

This implementation demonstrates a systematic approach to diagnosing, validating, and troubleshooting Ansible automation workflows. It covers interactive infrastructure management, playbook debugging, check mode validation, task isolation, logging, and operational diagnostics.

The objective is to improve automation reliability by identifying configuration issues before they reach production systems. The workflow emphasizes safe change validation, root-cause analysis, and repeatable troubleshooting procedures.

## Architecture

```text
+----------------------+
|   Control Node       |
|  Ansible Core        |
+----------+-----------+
           |
           |
           v
+----------------------+
|   Inventory Layer    |
|  Host Definitions    |
+----------+-----------+
           |
           |
           v
+----------------------+
| Automation Layer     |
| Playbooks            |
| Modules              |
| Variables            |
| Handlers             |
+----------+-----------+
           |
           |
           v
+----------------------+
| Validation Layer     |
| Check Mode           |
| Syntax Checks        |
| Tags                 |
| Task Isolation       |
+----------+-----------+
           |
           |
           v
+----------------------+
| Troubleshooting      |
| Verbose Logging      |
| Diagnostics          |
| Root Cause Analysis  |
+----------------------+
```

## Prerequisites

* CentOS Stream 9 / RHEL 9
* Ansible Core
* Git
* Python 3
* SSH Access
* ansible.posix collection

## Setup & Installation

```bash
sudo dnf install -y ansible-core git tree

ansible-galaxy collection install ansible.posix
```

## How to Reproduce

```bash
git clone <repository>

cd ansible-troubleshooting

ansible-playbook -i inventory broken-playbook.yml -v

ansible-playbook -i inventory broken-playbook.yml --step

ansible-playbook -i inventory tagged-playbook.yml --tags="install,service"

ansible-playbook -i inventory check-mode-demo.yml --check

ansible-playbook -i inventory check-mode-demo.yml --check --diff
```

## Tools Used

* Ansible Core
* ansible-console
* ansible-playbook
* ansible-galaxy
* YAML
* Linux
* Systemd
* Firewalld

## Key Skills Demonstrated

* Infrastructure automation troubleshooting
* Playbook validation and testing
* Check mode execution
* Variable debugging
* Service management automation
* Root cause analysis
* Configuration validation
* Automation safety controls
* Infrastructure diagnostics

## Real-World Use Case

Platform engineering, cloud operations, and DevOps teams routinely troubleshoot automation failures affecting production infrastructure. The techniques demonstrated here help engineers safely validate changes, isolate failures, reduce deployment risk, and maintain reliable infrastructure automation pipelines.

## Lessons Learned

* Check mode significantly reduces deployment risk.
* Verbose execution is essential for root-cause analysis.
* Missing collections can cause module resolution failures.
* Task isolation accelerates troubleshooting.
* Interactive execution simplifies infrastructure validation.

## Troubleshooting Log

### Issue: Missing Ansible Installation

Resolution:

```bash
sudo dnf install -y ansible-core
```

### Issue: Missing Inventory

Resolution:

Created local inventory targeting localhost.

### Issue: firewalld Module Not Found

Cause:

Ansible Core did not include required collection.

Resolution:

```bash
ansible-galaxy collection install ansible.posix
```

Updated module:

```yaml
ansible.posix.firewalld
```

### Issue: Undefined Variable

Cause:

```yaml
wrong_service_name
```

Resolution:

Replaced with:

```yaml
web_service
```

### Issue: Missing Configuration Source File

Cause:

```text
/nonexistent/httpd.conf
```

Resolution:

Task isolated and removed for validation.

### Issue: htop Package Unavailable

Cause:

Package not present in enabled repositories.

Resolution:

Skipped package installation during console testing.

```
```
