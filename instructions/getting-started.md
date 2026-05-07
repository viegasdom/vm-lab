## VM Lab

This lab runs an Ubuntu 22.04 VM alongside an Alpine container on the same network.

**Tabs:**
- **Container** — terminal into the Alpine container
- **VM** — terminal directly into the Ubuntu VM
- **Web Server** — web server running on port 8080 inside the VM

From the container terminal, verify connectivity:

```bash
ping -c 3 ubuntu.vm.sandbox.internal
```

```bash
curl http://ubuntu.vm.sandbox.internal:8080
```
