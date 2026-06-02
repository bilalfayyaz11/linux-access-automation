#!/bin/bash

echo "=== Ansible Version ==="
ansible --version

echo
echo "=== Inventory Validation ==="
ansible-inventory --list -i inventory

echo
echo "=== Connectivity Test ==="
ansible all -m ping -i inventory

echo
echo "=== Hostname Facts ==="
ansible all -m setup -a "filter=ansible_hostname" -i inventory

echo
echo "=== Verification Complete ==="
