# Shiranui PoC
It's just a little PoC for a personal infrastructure. Mainly using Ansible, the whole infrastructure works around k3s with traefik.

Since I can't emulate aarch64 with QEMU for the VMs, I'll use x64. There will be a custom-made image of an Alpine Linux, ready to install k3s and the proper network configuration (at least for the PoC). 

For this PoC we're going to host a Gitea platform, which we'll make it available publicly.

Update: Well that was "easy" (not really), got it done in a day. If we can host a Gitea, we can surely host anything else. 
