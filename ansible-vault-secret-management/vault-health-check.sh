#!/bin/bash

echo "Ansible Vault Health Check"
echo "=========================="

VAULT_DIR="$HOME/.ansible/vault"
MAIN_PASS="$VAULT_DIR/main_pass"
DEV_PASS="$VAULT_DIR/dev_pass"
PROD_PASS="$VAULT_DIR/prod_pass"

for pass_file in "$MAIN_PASS" "$DEV_PASS" "$PROD_PASS"; do
    if [ -f "$pass_file" ]; then
        echo "PASS: Vault password file exists: $pass_file"
    else
        echo "FAIL: Missing vault password file: $pass_file"
    fi
done

echo

if ansible-vault view secrets.yml --vault-password-file "$MAIN_PASS" > /dev/null 2>&1; then
    echo "PASS: secrets.yml is encrypted and accessible"
else
    echo "FAIL: secrets.yml cannot be decrypted"
fi

if ansible-vault view prod-secrets.yml --vault-password-file "$MAIN_PASS" > /dev/null 2>&1; then
    echo "PASS: prod-secrets.yml is encrypted and accessible"
else
    echo "FAIL: prod-secrets.yml cannot be decrypted"
fi

if ansible-vault view user-secrets.yml --vault-password-file "$MAIN_PASS" > /dev/null 2>&1; then
    echo "PASS: user-secrets.yml is encrypted and accessible"
else
    echo "FAIL: user-secrets.yml cannot be decrypted"
fi

if ansible-vault view dev-secrets.yml --vault-id dev@"$DEV_PASS" > /dev/null 2>&1; then
    echo "PASS: dev-secrets.yml is encrypted and accessible"
else
    echo "FAIL: dev-secrets.yml cannot be decrypted"
fi

if ansible-vault view prod-secrets-multi.yml --vault-id prod@"$PROD_PASS" > /dev/null 2>&1; then
    echo "PASS: prod-secrets-multi.yml is encrypted and accessible"
else
    echo "FAIL: prod-secrets-multi.yml cannot be decrypted"
fi

echo
echo "Health check completed"
