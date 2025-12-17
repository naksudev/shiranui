#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "usage: $0 <vm-name>"
  exit 1
fi

VM="$1"
BASE_DIR="/home/naksu/Crafting_Table/mini_projects/shiranui_poc"
IMG="${BASE_DIR}/images/${VM}.qcow2"
TAP="tap-${VM}"

# MAC déterministe à partir du nom (hash → 3 octets)
HASH=$(echo -n "$VM" | sha256sum | cut -c1-6)
MAC="52:54:00:${HASH:0:2}:${HASH:2:2}:${HASH:4:2}"

# Vérifs
[ -f "$IMG" ] || { echo "Image not found: $IMG"; exit 1; }

echo "[INFO] VM=$VM"
echo "[INFO] TAP=$TAP"
echo "[INFO] MAC=$MAC"

exec qemu-system-x86_64 \
  -name "$VM" \
  -enable-kvm \
  -machine type=q35,accel=kvm \
  -cpu host \
  -smp 2 \
  -m 2048 \
  -drive file="$IMG",if=virtio,format=qcow2 \
  -netdev tap,id=net0,ifname="$TAP" \
  -device virtio-net-pci,netdev=net0,mac="$MAC" \
  -nographic \

