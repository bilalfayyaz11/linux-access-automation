#!/bin/bash

set -u

PLAYBOOK="${1:-}"

if [ -z "$PLAYBOOK" ]; then
    echo "Usage: $0 <playbook.yml>"
    exit 1
fi

LOGFILE="outputs/troubleshoot-$(basename "$PLAYBOOK" .yml)-$(date +%Y%m%d-%H%M%S).log"

echo "=== ANSIBLE TROUBLESHOOTING METHODOLOGY ===" | tee "$LOGFILE"
echo "Playbook: $PLAYBOOK" | tee -a "$LOGFILE"
echo "Timestamp: $(date)" | tee -a "$LOGFILE"
echo "============================================" | tee -a "$LOGFILE"

echo
echo "Step 1: Syntax Check..." | tee -a "$LOGFILE"
ansible-playbook -i inventory.ini "$PLAYBOOK" --syntax-check 2>&1 | tee -a "$LOGFILE"

echo
echo "Step 2: Task Listing..." | tee -a "$LOGFILE"
ansible-playbook -i inventory.ini "$PLAYBOOK" --list-tasks 2>&1 | tee -a "$LOGFILE"

echo
echo "Step 3: Dry Run..." | tee -a "$LOGFILE"
ansible-playbook -i inventory.ini "$PLAYBOOK" --check 2>&1 | tee -a "$LOGFILE"

echo
echo "Step 4: Verbose Dry Run..." | tee -a "$LOGFILE"
ansible-playbook -i inventory.ini "$PLAYBOOK" --check -vv 2>&1 | tee -a "$LOGFILE"

echo
echo "Troubleshooting log saved to: $LOGFILE"
