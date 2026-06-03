#!/bin/bash

echo "=== ANSIBLE TROUBLESHOOTING CHECKLIST ==="
echo
echo "1. Syntax Check"
echo "ansible-playbook playbook.yml --syntax-check"
echo
echo "2. Dry Run"
echo "ansible-playbook -i inventory playbook.yml --check"
echo
echo "3. Dry Run with Diff"
echo "ansible-playbook -i inventory playbook.yml --check --diff"
echo
echo "4. Interactive Step Mode"
echo "ansible-playbook -i inventory playbook.yml --step"
echo
echo "5. Verbose Output"
echo "ansible-playbook -i inventory playbook.yml -vvv"
echo
echo "6. Connectivity Test"
echo "ansible -i inventory all -m ping"
echo
echo "7. Gather Facts"
echo "ansible -i inventory all -m setup"
echo
echo "8. Limit to Host"
echo "ansible-playbook -i inventory playbook.yml --limit hostname"
echo
echo "9. List Tasks"
echo "ansible-playbook -i inventory playbook.yml --list-tasks"
echo
echo "10. List Hosts"
echo "ansible-playbook -i inventory playbook.yml --list-hosts"
