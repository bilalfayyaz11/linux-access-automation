# Ansible Network and Firewall Automation

## What This Does
This automation configures Linux network identity and firewall rules using Ansible. It sets a stable hostname, captures active NetworkManager connection details, enables firewalld, opens required services, allows a custom application port, and applies SSH rate limiting through a rich firewall rule.

This solves the problem of inconsistent manual network and firewall configuration across Linux systems. It provides a repeatable workflow for applying baseline network security controls and generating diagnostic evidence after deployment.

## Architecture
```text
+------------------------------------------------+
| CentOS Stream 9 Host                           |
| Hostname: network-node.local                   |
+------------------------+-----------------------+
                         |
                         v
+------------------------------------------------+
| NetworkManager                                  |
| Active Interface: ens5                          |
| DHCP Address: 172.31.10.137                     |
| Default Gateway: 172.31.10.1                   |
| DNS: 172.31.0.2                                 |
+------------------------+-----------------------+
                         |
                         v
+------------------------------------------------+
| firewalld Public Zone                           |
| Services: ssh, http, https, cockpit             |
| Ports: 8080/tcp, 8443/tcp                       |
| Rich Rule: SSH rate limit 3 connections/minute  |
+------------------------------------------------+
