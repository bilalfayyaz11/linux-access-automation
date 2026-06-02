# Ansible Role-Based System Automation

## What This Does

This implementation builds a reusable Ansible role-based automation framework for Linux system administration. It separates user management, service management, and file management into clean reusable roles that can be applied consistently across servers. The structure improves maintainability, reduces repeated playbook logic, and creates a scalable foundation for infrastructure automation.

## Architecture

```text
Control Node
    |
    |-- site.yml
    |-- variable_precedence_demo.yml
    |-- conditional_roles.yml
    |-- verify_roles.yml
    |-- performance_test.yml
    |
    +-- roles/
        |
        +-- user_management/
        |   |-- defaults/
        |   |-- tasks/
        |   |-- handlers/
        |
        +-- service_config/
        |   |-- defaults/
        |   |-- tasks/
        |   |-- handlers/
        |
        +-- file_management/
            |-- defaults/
            |-- tasks/
            |-- handlers/
Prerequisites
CentOS Stream, RHEL, Rocky Linux, or compatible Linux system
Python 3
Ansible Core
Git
sudo privileges
ansible.posix collection
Setup & Installation
sudo dnf install -y git ansible-core tree
ansible-galaxy collection install ansible.posix
How to Reproduce
cd ansible-role-based-system-automation

ansible-playbook site.yml --syntax-check
ansible-playbook site.yml -v

ansible-playbook variable_precedence_demo.yml -v
ansible-playbook conditional_roles.yml -v
ansible-playbook verify_roles.yml
ansible-playbook performance_test.yml
Tools Used
Ansible Core
Ansible Galaxy
ansible.posix
YAML
Linux user management
Linux service management
Linux file permissions
Git
Key Skills Demonstrated
Reusable infrastructure automation using Ansible roles
Role defaults, handlers, task separation, and clean structure
Idempotent Linux user, group, service, and file management
Variable precedence handling across role and playbook scope
Conditional role execution
Verification automation after configuration changes
Performance testing for reusable automation workflows
Real-World Use Case

This type of role-based automation is used by platform engineering and operations teams to standardize server configuration across multiple environments. Instead of writing separate playbooks for every server, teams define reusable roles for common responsibilities such as user provisioning, service configuration, and file deployment, then apply them consistently across development, staging, and production systems.

Lessons Learned
Role-based structure makes automation easier to reuse and maintain.
Handler naming should be specific to avoid collisions across roles.
Local execution is useful when validating automation before expanding to remote inventory.
Verification playbooks make infrastructure changes easier to audit.
Idempotent execution is critical because automation may run repeatedly in real environments.
Troubleshooting Log
Replaced generic role workspace naming with a professional automation-focused directory.
Installed missing Git and Ansible Core packages on CentOS Stream 9.
Installed the missing ansible.posix collection required for SSH key management.
Adjusted execution from remote node assumptions to localhost validation because the active environment was single-node.
Improved handler naming from generic service restart logic to clearer managed service restart behavior.
