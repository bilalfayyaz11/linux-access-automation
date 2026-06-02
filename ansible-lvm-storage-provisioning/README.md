# Ansible LVM Storage Provisioning

## What This Does
This automation provisions block storage on a Linux server using Ansible. It prepares a raw disk, creates an LVM volume group, builds multiple logical volumes, formats them with production-ready filesystems, mounts them, and persists the configuration through `/etc/fstab`.

This solves the problem of repetitive, error-prone manual storage setup. In real infrastructure environments, storage must be consistent, repeatable, and recoverable across many servers.

## Architecture
```text
+-----------------------------+
| CentOS Stream 9 Host        |
|                             |
| Raw Disk: /dev/nvme1n1      |
+-------------+---------------+
              |
              v
+-----------------------------+
| LVM Partition               |
| /dev/nvme1n1p1              |
+-------------+---------------+
              |
              v
+-----------------------------+
| Volume Group: vg_data       |
+------+------+---------------+
       |      |      
       v      v
+-----------+ +-------------+ +-------------+
| lv_web    | | lv_logs     | | lv_backup   |
| ext4      | | xfs         | | ext4        |
| /var/www  | | /var/log/apps | | /backup   |
+-----------+ +-------------+ +-------------+
