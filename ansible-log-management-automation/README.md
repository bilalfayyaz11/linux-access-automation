# Ansible Log Management Automation

## What This Does
This automation configures Linux system logging, custom log routing, log rotation, retention policy, and log health monitoring using Ansible. It creates dedicated application, security, and audit log files, routes custom syslog facilities into those files, validates rsyslog syntax, and applies automated log rotation through logrotate.

This solves the problem of inconsistent manual logging configuration across Linux systems. It provides a repeatable baseline for log collection, retention, and operational visibility.

## Architecture
```text
+------------------------------------------------+
| CentOS Stream 9 Host                           |
+------------------------+-----------------------+
                         |
                         v
+------------------------------------------------+
| rsyslog                                         |
| local0.* -> /var/log/application.log           |
| local1.* -> /var/log/security.log              |
| local2.* -> /var/log/custom-audit.log          |
+------------------------+-----------------------+
                         |
                         v
+------------------------------------------------+
| logrotate                                       |
| Daily rotation                                  |
| 14 retained rotations                           |
| Compression enabled                             |
| rsyslog reload after rotation                   |
+------------------------+-----------------------+
                         |
                         v
+------------------------------------------------+
| Log Health Monitoring                           |
| /usr/local/bin/log-health-check.sh             |
| Daily cron execution at 03:00                   |
+------------------------------------------------+
