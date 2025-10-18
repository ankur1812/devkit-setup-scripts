# System Performance Tweaks

## CPU Monitoring : 
```
htop
free -h
swapon --show
```

## 1. Add zRAM (Compressed RAM)

This uses part of your RAM as a compressed swap region — faster than disk-based swap.

```
# Installation
sudo apt install zram-tools
sudo systemctl enable --now zramswap.service

# Check the raw size allocated for zRAM (before compression).
# Note: The result is in bytes
cat /sys/block/zram0/disksize 
echo "$(($(cat /sys/block/zram0/disksize) / 1024 / 1024)) MB"

# Check how much zRAM currently being used
cat /sys/block/zram0/mem_used_total
echo "$(($(cat /sys/block/zram0/mem_used_total) / 1024 / 1024)) MB"

# Check how much data is stored after compression
cat /sys/block/zram0/compr_data_size

# Installing zram-tools creates /etc/ztab config
# The default config looks roughly like this:
zram0  lz4  ram  50%

# Customize the zRAM by editing /etc/ztab. Below, 2G is a fixed size instead of a percentage.
zram0  lz4  ram  2G

# Check zRAM usage by below commands
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

## 3. Configure VM Swappiness
Swappiness controls when the CPU uses swaps
```
cat /proc/sys/vm/swappiness
```
Default: 60
Lower → less swap, more RAM first
Higher → more aggressive swapping

To change temporarily:
```
sudo sysctl vm.swappiness=30
```
To change permanently, updated `/etc/sysctl.conf`: 
```
vm.swappiness=30
```

### When to lower swappiness: 
- You have enough RAM (≥8 GB or 16 GB+)
- You need maximum performance You have enough RAM (≥8 GB or 16 GB+)
- You need maximum performance and responsiveness
- You’re running interactive workloads like:
  - Flutter / Android builds
  - IDEs (VS Code, IntelliJ)
  - Gaming
  - Audio/video productionand responsiveness
 
#### Why it helps: ####
- Keeps most data in RAM (fastest)
- Prevents slow disk I/O from swapping
- Keeps Flutter, Android Emulator, and your IDE running smoothly without lag

#### Risks ####

- If you run out of RAM + zRAM completely, the OOM killer may kill a process
- So you should have at least some zRAM or swapfile configured as a fallback


### When to Increase Swappiness (e.g., 50–80)

You should increase swappiness when:
- You have low RAM (≤4–8 GB)
- You prioritize stability over speed
- You run many background processes
- Browsers, IDEs, VMs, Docker containers, etc.
- You’re doing long builds or leaving the system unattended

#### Pros ####
- Linux starts moving inactive data (like unused app memory) to swap earlier
- Keeps free RAM available for active tasks
- Prevents sudden OOM (Out Of Memory) crashes

#### Tradeoff ###
- May cause more disk activity (swapfile I/O)
- Flutter builds could be slightly slower due to more swapping


### How to Experiment Safely

You can change swappiness live — it doesn’t require reboot:

```
sudo sysctl vm.swappiness=30
```

and check it:
```
cat /proc/sys/vm/swappiness
```
Watch system behavior with:

```
free -h
swapon --show
htop
```
If you see swap usage climbing rapidly and system slows, lower swappiness.
If you see no swap usage and system occasionally freezes, increase it a bit.

#### Requirement	/ Issue	----> Action Suggested Swappiness
💻 Flutter builds / coding	Lag from disk I/O ----> Lower it	20–30

🧩 System freezing / OOM errors	Out of memory	Increase it ----> 50–60

⚡ Gaming / real-time work	Frame drops, stutters ----> Lower it	10–20

🧠 Heavy multitasking	Many apps, tabs, VMs ----> Increase it	60–80

💾 Using zRAM (fast swap)	You want balanced use ----> Moderate 30-40

Your development/builds are causing the system to crash (likely due to running out of RAM)
-->  You should **increase swappiness — not lower it**.



