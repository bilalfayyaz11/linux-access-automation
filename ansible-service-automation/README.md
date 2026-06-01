# Ansible Service Lifecycle Automation

## What This Does

This implementation automates the complete lifecycle management of Linux services using Ansible and systemd. The workflow deploys and manages Apache HTTP Server, validates service availability, implements intelligent handler-based restarts, performs configuration validation, generates health reports, and provides automated service recovery capabilities. The result is a repeatable and idempotent service management framework suitable for production infrastructure environments.

## Architecture

```text
+--------------------------------------------------+
|                 Ansible Control Node             |
|--------------------------------------------------|
| setup-services.yml                               |
| service-management.yml                           |
| advanced-service-management.yml                  |
| handler-demo.yml                                 |
| complex-handlers.yml                             |
| service-validation.yml                           |
| health-check.yml                                 |
| service-recovery.yml                             |
| final-verification.yml                           |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|                 Managed Linux Host               |
|--------------------------------------------------|
| Apache HTTP Server (httpd)                       |
| SSH Service                                      |
| Cron Service                                     |
| firewalld                                        |
| Monitoring Script                               |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|                 Validation Layer                 |
|--------------------------------------------------|
| Service Health Checks                            |
| Configuration Validation                         |
| Handler Execution                                |
| Automated Recovery                               |
| Health Reports                                   |
+--------------------------------------------------+
