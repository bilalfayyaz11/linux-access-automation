# Idempotent Ansible Automation Framework

## What This Does
This implementation demonstrates reliable, repeatable infrastructure automation using Ansible idempotency patterns. It converts unsafe shell-based operations into predictable Ansible modules that can be executed multiple times without creating duplicate entries, failed user creation, unnecessary service restarts, or configuration drift. The workflow includes basic idempotent operations, handlers, conditional execution, validation scripts, service management, and repeat-run testing.

## Architecture

```text
Local Control Node
      |
      v
Ansible Inventory
      |
      v
Managed Host: localhost
      |
      +--> System Configuration
      |     +--> /etc/hosts
      |     +--> users
      |     +--> packages
      |
      +--> Web Service Automation
      |     +--> httpd
      |     +--> firewalld
      |     +--> custom port 8080
      |
      +--> Application Service
      |     +--> /opt/test-app
      |     +--> /opt/app-2.1.0
      |     +--> systemd service
      |
      +--> Validation Layer
            +--> repeat-run testing
            +--> changed-count analysis
            +--> idempotency reports
