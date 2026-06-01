# Ansible Fact-Based Configuration Validation

## What This Does
This implementation validates Linux system configuration using Ansible facts. It gathers operating system, memory, network, package, service, web server, database, and security state information, then checks whether the system matches the expected operational baseline. It also generates validation reports that can be used for audits, troubleshooting, and configuration drift detection.

## Architecture

```text
+--------------------------------------------------+
|              Ansible Control Node                |
|--------------------------------------------------|
|  inventory                                       |
|  ansible.cfg                                     |
|  gather-facts.yml                                |
|  basic-validation.yml                            |
|  advanced-validation.yml                         |
|  webserver-validation.yml                        |
|  database-validation.yml                         |
|  comprehensive-validation.yml                    |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|              Local Managed System                |
|--------------------------------------------------|
|  OS facts                                        |
|  Package facts                                   |
|  Service facts                                   |
|  Network facts                                   |
|  Disk and memory facts                           |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|              Validation Output                   |
|--------------------------------------------------|
|  /tmp/*_facts.json                               |
|  /tmp/validation_reports/*_validation_report.txt |
|  Apache response validation                      |
|  MariaDB service validation                      |
+--------------------------------------------------+
