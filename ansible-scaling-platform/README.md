# Ansible Scaling Platform

## What This Does

This implementation demonstrates large-scale infrastructure automation using Ansible dynamic inventories, parallel execution strategies, fact caching, deployment optimization, monitoring, and troubleshooting workflows.

The platform automates web server deployment across multiple logical regions while improving execution speed through optimized inventory management, cached facts, connection reuse, and parallel task execution.

It also provides operational visibility through deployment metrics, health checks, performance monitoring, and automated troubleshooting reports.

## Architecture

    Dynamic Inventory
            |
            v
    Ansible Control Node
            |
            v
    Deployment Orchestration
            |
            v
    Managed Apache Web Server

## Prerequisites

- CentOS Stream 9 or RHEL 9
- Python 3
- Ansible Core
- Git
- Apache HTTP Server
- Firewalld
- SSH access

## Setup And Installation

Run the following commands on a CentOS or RHEL-based machine:

    sudo dnf install -y ansible-core git httpd firewalld

Clone the repository and enter this implementation directory:

    git clone https://github.com/bilalfayyaz11/linux-access-automation.git
    cd linux-access-automation/ansible-scaling-platform

## How To Reproduce

Make the dynamic inventory executable:

    chmod +x inventories/dynamic_inventory.py

Validate the parsed inventory:

    ansible-inventory --list

Run the main scaling deployment:

    ansible-playbook playbooks/scale-webservers.yml

Run region-based deployment validation:

    ansible-playbook playbooks/scale-by-region.yml

Run optimized deployment:

    ansible-playbook playbooks/optimized-deployment.yml

Cache infrastructure facts:

    ansible-playbook playbooks/cache-facts.yml

Deploy using cached facts:

    ansible-playbook playbooks/deploy-with-cache.yml

Run performance monitoring:

    ansible-playbook playbooks/monitor-performance.yml

Generate troubleshooting report:

    ansible-playbook playbooks/troubleshoot-deployment.yml

## Tools Used

- Ansible Core
- Python
- Dynamic Inventory
- Apache HTTPD
- Firewalld
- YAML
- Jinja2 Templates
- Linux System Administration
- Fact Caching
- Performance Monitoring

## Key Skills Demonstrated

- Infrastructure automation at scale
- Dynamic inventory management
- Parallel deployment strategy design
- Ansible performance tuning
- Fact caching optimization
- Apache web server automation
- Health check automation
- Infrastructure monitoring
- Automated troubleshooting
- Production-style configuration management

## Real-World Use Case

This type of automation is used by platform engineering, DevOps, cloud operations, and infrastructure teams that manage fleets of Linux servers. Instead of manually maintaining static server lists and deploying changes one machine at a time, teams use dynamic inventories, fact caching, parallel execution, and health checks to safely deploy services across many servers with better speed and consistency.

## Lessons Learned

- Dynamic inventories reduce manual inventory maintenance and make infrastructure automation easier to scale.
- Fact caching reduces repeated fact gathering overhead during repeated automation runs.
- Parallel execution strategies improve deployment speed but require careful health checks and failure handling.
- Role-based design keeps deployment logic reusable and easier to maintain.
- Monitoring and troubleshooting automation improves visibility during large deployments.

## Troubleshooting Log

### Missing ansible.posix.firewalld Collection

Problem:
The original firewall task used ansible.posix.firewalld, but the required collection was not installed in the environment.

Resolution:
The firewall task was replaced with native firewall-cmd commands available on CentOS Stream 9.

### Undefined web_packages Variable

Problem:
The optimized deployment playbook referenced web_packages before the webserver role loaded its default variables.

Resolution:
The required package list was defined directly inside the optimized deployment playbook.

### Dynamic Inventory Using Non-Existent Hosts

Problem:
The original inventory referenced simulated cloud instances that were not reachable from the environment.

Resolution:
The dynamic inventory was adapted to use localhost with local connection mode while preserving region-based grouping logic.

### Deprecated Gather Timeout Configuration

Problem:
Ansible generated deprecation warnings for gather timeout configuration.

Resolution:
Deprecated configuration was removed and supported performance settings were retained.

## Project Structure

    ansible-scaling-platform
    ├── ansible.cfg
    ├── group_vars
    ├── host_vars
    ├── inventories
    │   └── dynamic_inventory.py
    ├── outputs
    ├── playbooks
    │   ├── cache-facts.yml
    │   ├── deploy-with-cache.yml
    │   ├── monitor-performance.yml
    │   ├── optimized-deployment.yml
    │   ├── scale-by-region.yml
    │   ├── scale-webservers.yml
    │   └── troubleshoot-deployment.yml
    ├── reports
    └── roles
        └── webserver

