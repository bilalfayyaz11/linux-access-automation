#!/bin/bash

set -euo pipefail

PLAYBOOK="${1:-}"

if [ -z "$PLAYBOOK" ]; then
    echo "Usage: $0 <playbook.yml>"
    exit 1
fi

LOGFILE="outputs/changes-$(date +%Y%m%d-%H%M%S).log"

echo "=== Ansible Diff Analysis ===" | tee "$LOGFILE"
echo "Playbook: $PLAYBOOK" | tee -a "$LOGFILE"
echo "Timestamp: $(date)" | tee -a "$LOGFILE"
echo "================================" | tee -a "$LOGFILE"

ansible-playbook -i inventory.ini "$PLAYBOOK" --diff --check 2>&1 | tee -a "$LOGFILE"

echo "================================" | tee -a "$LOGFILE"
echo "Analysis complete. Log saved to: $LOGFILE" | tee -a "$LOGFILE"

echo "Files that would be modified:" | tee -a "$LOGFILE"
grep -E "^\+\+\+|^---" "$LOGFILE" | sort | uniq | tee -a "$LOGFILE" || true
