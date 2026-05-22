# Ansible Linux User Access Management

## What This Does
This system automates Linux user and group management using Ansible. It creates role-based groups, provisions users with defined shells and home directories, updates group memberships, applies account controls, and verifies the final identity state of the machine. In production, this pattern helps infrastructure teams manage Linux access consistently instead of relying on manual account creation.

## Architecture

```text
+--------------------------------------------------+
|              Ansible Control Node                |
|--------------------------------------------------|
| inventory.ini                                    |
| create-groups.yml                                |
| create-users.yml                                 |
| modify-shells.yml                                |
| modify-groups.yml                                |
| modify-home-dirs.yml                             |
| advanced-user-management.yml                     |
| verify-user-management.yml                       |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|              Local Linux Target Host             |
|--------------------------------------------------|
| Users: alice, bob, carol, david, eve, frank, grace|
| Groups: developers, testers, managers,           |
|         contractors, project-alpha, sysadmins    |
| Home directories: /home/* and /opt/users/eve     |
| Shells: bash, sh, zsh                            |
+--------------------------------------------------+
