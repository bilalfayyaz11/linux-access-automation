# Ansible Vault Secret Management

## What This Does
This implementation secures sensitive automation data using Ansible Vault. It encrypts database credentials, API tokens, environment-specific secrets, and team-specific secrets while allowing playbooks to consume them safely during execution. The workflow demonstrates how infrastructure automation can manage secrets without storing plain-text credentials in configuration files. This is directly applicable to production automation where credential exposure can create serious security risk.

## Architecture

```text
+--------------------------------------------------+
|              Ansible Control Node                |
|--------------------------------------------------|
|  secure_deployment.yml                           |
|  mixed_vars_playbook.yml                         |
|  environment_deployment.yml                      |
|  vault_id_playbook.yml                           |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|              Encrypted Vault Files               |
|--------------------------------------------------|
|  db_secrets.yml          -> production secrets    |
|  dev_secrets.yml         -> development secrets   |
|  staging_secrets.yml     -> staging secrets       |
|  team_dev_secrets.yml    -> dev team secrets      |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|              Generated Runtime Configs           |
|--------------------------------------------------|
|  /tmp/app_config.ini                             |
|  /tmp/dev_config.ini                             |
|  /tmp/staging_config.ini                         |
|  /tmp/production_config.ini                      |
+--------------------------------------------------+
