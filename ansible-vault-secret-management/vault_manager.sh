#!/bin/bash

set -euo pipefail

VAULT_PASSWORD_FILE=".vault_password"

show_usage() {
    echo "Usage: $0 [create|edit|view|encrypt|decrypt|rekey] [filename]"
    echo
    echo "Examples:"
    echo "  $0 create new_secrets.yml"
    echo "  $0 edit db_secrets.yml"
    echo "  $0 view staging_secrets.yml"
    echo "  $0 encrypt plain_file.yml"
    echo "  $0 decrypt encrypted_file.yml"
    echo "  $0 rekey old_secrets.yml"
}

if [ $# -lt 2 ]; then
    show_usage
    exit 1
fi

ACTION="$1"
FILENAME="$2"

if [ ! -f "$VAULT_PASSWORD_FILE" ]; then
    echo "ERROR: Vault password file not found: $VAULT_PASSWORD_FILE"
    exit 1
fi

case "$ACTION" in
    create|edit|view|encrypt|decrypt|rekey)
        echo "Running vault action: $ACTION on $FILENAME"
        ansible-vault "$ACTION" "$FILENAME" --vault-password-file "$VAULT_PASSWORD_FILE"
        ;;
    *)
        echo "ERROR: Unknown action: $ACTION"
        show_usage
        exit 1
        ;;
esac
