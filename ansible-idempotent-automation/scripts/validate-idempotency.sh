#!/bin/bash

echo "=== Ansible Idempotency Validation ==="
echo "Testing playbook: $1"

if [ -z "$1" ]; then
    echo "Usage: $0 <playbook-name.yml>"
    exit 1
fi

PLAYBOOK=$1
INVENTORY=${2:-inventory.ini}
TEMP_DIR="/tmp/idempotency-test-$(date +%s)"
mkdir -p "$TEMP_DIR"

echo
echo "Running playbook first time..."
ansible-playbook -i "$INVENTORY" "$PLAYBOOK" --ask-become-pass > "$TEMP_DIR/run1.log" 2>&1
FIRST_EXIT_CODE=$?

echo
echo "Running playbook second time..."
ansible-playbook -i "$INVENTORY" "$PLAYBOOK" --ask-become-pass > "$TEMP_DIR/run2.log" 2>&1
SECOND_EXIT_CODE=$?

echo
echo "Analyzing results..."

CHANGED_RUN1=$(grep -o "changed=[0-9]*" "$TEMP_DIR/run1.log" | tail -1 | cut -d= -f2)
CHANGED_RUN2=$(grep -o "changed=[0-9]*" "$TEMP_DIR/run2.log" | tail -1 | cut -d= -f2)
FAILED_RUN1=$(grep -o "failed=[0-9]*" "$TEMP_DIR/run1.log" | tail -1 | cut -d= -f2)
FAILED_RUN2=$(grep -o "failed=[0-9]*" "$TEMP_DIR/run2.log" | tail -1 | cut -d= -f2)

CHANGED_RUN1=${CHANGED_RUN1:-0}
CHANGED_RUN2=${CHANGED_RUN2:-0}
FAILED_RUN1=${FAILED_RUN1:-0}
FAILED_RUN2=${FAILED_RUN2:-0}

echo
echo "=== RESULTS ==="
echo "First run  - Exit code: $FIRST_EXIT_CODE, Changed tasks: $CHANGED_RUN1, Failed tasks: $FAILED_RUN1"
echo "Second run - Exit code: $SECOND_EXIT_CODE, Changed tasks: $CHANGED_RUN2, Failed tasks: $FAILED_RUN2"

if [ "$SECOND_EXIT_CODE" -eq 0 ] && [ "$CHANGED_RUN2" -eq 0 ] && [ "$FAILED_RUN2" -eq 0 ]; then
    echo "IDEMPOTENCY TEST PASSED"
    echo "The playbook is idempotent: no changes on the second run."
else
    echo "IDEMPOTENCY TEST FAILED"
    echo "The playbook made changes or failed on the second run."
    echo "Check logs in: $TEMP_DIR"
fi

echo
echo "Detailed logs available in: $TEMP_DIR"
