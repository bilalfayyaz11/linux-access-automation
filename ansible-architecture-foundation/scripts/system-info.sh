#!/bin/bash
echo "System Information:"
echo "Hostname: $(hostname)"
echo "OS: $(grep PRETTY_NAME /etc/os-release)"
echo "Memory: $(free -h | grep Mem)"
echo "Disk: $(df -h / | tail -1)"
