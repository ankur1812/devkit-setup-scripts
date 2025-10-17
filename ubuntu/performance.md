# System Performance Tweaks

## 1. Add zRAM (Compressed RAM)

This uses part of your RAM as a compressed swap region — faster than disk-based swap.

```
sudo apt install zram-tools
sudo systemctl enable --now zramswap.service

# Configurations:

# Show the raw size allocated for zRAM (before compression). The result is in bytes
cat /sys/block/zram0/disksize 

# Installing zram-tools creates /etc/ztab config
# The default config looks roughly like this:
zram0  lz4  ram  50%

# Customize the zRAM by editing /etc/ztab. Below, 2G is a fixed size instead of a percentage.
zram0  lz4  ram  2G

# CHeck zRAM usage by below commands
lsblk | grep zram
swapon --show





```

## 2. Swapfiles : Increase Virtual Memory

```
# Check the current Memory availability
free -h

# Check the active swapfiles status
swapon --show

# Alternate check
cat /proc/swaps

# Increase the swapsize: 
sudo swapoff /swapfile
swapon --show # Check if it's inactive now.
sudo fallocate -l 6G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon --show

# Don't run below code directly, check Notes below first.
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

Note: Instead of appending `/swapfile non swap sw 0 0' to `/etc/fstab` always,
you can first check if it already includes the line or not, and then proceed to append
```
# Check if /swapfile line is at the end
cat /etc/fstab 

# If not append the below line: 
/swapfile none swap sw 0 0
```

Note: Instead of specific /swapfile, you can activate / deactivate all the swapfiles using `-a` tag.
``` 
sudo swapoff -a
sudo swapon -a            # reactivate all swaps listed in /etc/fstab
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```
