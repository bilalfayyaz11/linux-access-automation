#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <vault-file>"
    exit 1
fi

VAULT_FILE="$1"

if [ ! -f "$VAULT_FILE" ]; then
    echo "Error: File not found: $VAULT_FILE"
    exit 1
fi

case "$VAULT_FILE" in
    dev-secrets.yml)
        ansible-vault view "$VAULT_FILE" --vault-id dev@"$HOME/.ansible/vault/dev_pass"
        ;;
    prod-secrets-multi.yml)
        ansible-vault view "$VAULT_FILE" --vault-id prod@"$HOME/.ansible/vault/prod_pass"
        ;;
    *)
        ansible-vault view "$VAULT_FILE" --vault-password-file "$HOME/.ansible/vault/main_pass"
        ;;
esac
