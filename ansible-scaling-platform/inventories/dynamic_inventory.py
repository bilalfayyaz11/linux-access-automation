#!/usr/bin/env python3

import json
import sys

def get_inventory():
    inventory = {
        "_meta": {
            "hostvars": {}
        },
        "webservers": {
            "hosts": ["localhost"],
            "vars": {
                "ansible_connection": "local",
                "ansible_user": "centos",
                "http_port": 80,
                "max_clients": 200
            }
        },
        "us_east": {
            "hosts": ["localhost"],
            "vars": {
                "region": "us-east-1",
                "datacenter": "virginia"
            }
        },
        "us_west": {
            "hosts": [],
            "vars": {
                "region": "us-west-2",
                "datacenter": "oregon"
            }
        },
        "europe": {
            "hosts": [],
            "vars": {
                "region": "eu-west-1",
                "datacenter": "ireland"
            }
        }
    }

    inventory["_meta"]["hostvars"]["localhost"] = {
        "ansible_host": "127.0.0.1",
        "ansible_connection": "local",
        "region_name": "us_east",
        "server_id": "web-us-east-01"
    }

    return inventory

if __name__ == "__main__":
    if len(sys.argv) == 2 and sys.argv[1] == "--list":
        print(json.dumps(get_inventory(), indent=2))
    elif len(sys.argv) == 3 and sys.argv[1] == "--host":
        print(json.dumps({}))
    else:
        print(f"Usage: {sys.argv[0]} --list or {sys.argv[0]} --host <hostname>")
        sys.exit(1)
