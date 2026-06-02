# Ansible Task Scheduling Automation

## What This Does
This automation configures Linux task scheduling using Cron, At, and Systemd Timers through Ansible. It provisions recurring maintenance jobs, one-time deferred tasks, system backup timers, and monitoring timers with validation output.

## Architecture
```text
CentOS Stream 9 Host
├── Cron
│   ├── Daily temp cleanup
│   ├── Weekly logrotate validation
│   └── Disk usage monitoring
├── At
│   └── One-time deferred validation task
└── Systemd Timers
    ├── system-backup.timer
    └── system-monitor.timer
