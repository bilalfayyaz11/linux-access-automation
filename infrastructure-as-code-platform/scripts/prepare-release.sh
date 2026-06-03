#!/bin/bash
set -e

echo "=== Infrastructure Release Preparation ==="

source VERSION
echo "Current version: $VERSION"

echo "Validating Ansible playbooks..."
for playbook in playbooks/*.yml; do
    echo "Checking $playbook"
    ansible-playbook -i inventory/hosts.yml "$playbook" --syntax-check
done

cat > RELEASE_NOTES.md << EOL
# Release Notes - Version $VERSION

## Summary
This release contains infrastructure automation for web, database, and load-balancer layers using Ansible inventory, variables, templates, and repeatable execution patterns.

## Components
- Web Layer: httpd
- Database Layer: MariaDB
- Load Balancer Layer: Nginx

## Validation
All playbooks were syntax checked before release.

## Deployment
Run:
\`\`\`bash
ansible-playbook -i inventory/hosts.yml playbooks/provision-cloud-resources.yml
ansible-playbook -i inventory/hosts.yml playbooks/deploy-with-templates.yml
\`\`\`

Generated: $(date)
EOL

echo "Release notes generated: RELEASE_NOTES.md"
