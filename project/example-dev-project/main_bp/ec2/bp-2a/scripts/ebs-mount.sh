#!/bin/bash

# 정상 동작 확인 OK 
# - /dev/sd*, /dev/nvme* 모두 동작 확인
# - amazonelinux3, RHEL 8.6에서 검증

echo "Waiting for EBS devices to attach..."
sleep 30  # Adjust the sleep time as needed


# Declare an array with device and mount point pairs
# 5세대 전에는 /dev/sd[b-z]을 사용
# 5세대 부터는 /dev/nvme[1-26]n1을 사용

# 5세대 이전 사용
devices_and_mounts=(
    "/dev/sdb /bak"
    "/dev/sdc /data"
)

# # 5세대 이후 사용
# devices_and_mounts=(
#     "/dev/nvme1n1 /bak"
#     "/dev/nvme2n1 /data"
# )

sudo cp /etc/fstab /etc/fstab.orig

# Check if devices exist and find correct device names
for device_and_mount in "${devices_and_mounts[@]}"; do
    # Split device name and mount point
    echo "#######################"
    echo "Start the mount script"
    echo "#######################"

    device=$(echo $device_and_mount | awk '{print $1}')
    mount_point=$(echo $device_and_mount | awk '{print $2}')

    # Check if the device exists
    if [ ! -b "$device" ]; then
        # Try to find NVMe device if the traditional name doesn't work
        echo "$device not found, checking for NVMe device..."
        nvme_device=$(lsblk -o NAME,MODEL | awk '{print"/dev/"$1}' | grep $device )
        if [ ! -z "$nvme_device" ]; then
            echo "Found NVMe device: $nvme_device"
            device=$nvme_device
        else
            echo "No valid device found for $device. Skipping."
            continue
        fi
    fi
    
    echo "Mounting $device to $mount_point"
    echo "DEVICE=$device"
    echo "MOUNT_POINT=$mount_point"

    echo "Create mount point folder"
    sudo mkdir -p $mount_point

    # Determine if the device is partitioned (e.g., /dev/nvme0n1p1 or /dev/sdb1)
    partition_device=$(lsblk -npo NAME $device | grep -E 'p?[0-9]+$')
    
    # If partitioned device exists, use it, otherwise use the whole device
    if [ ! -z "$partition_device" ]; then
        echo "Using partition: $partition_device"
        device=$partition_device
    else
        echo "No partitions found, using the whole device: $device"
    fi


    # Check the current filesystem type
    type=$(df -hT / | tail -n 1 | awk '{print $2}')

    # Format the device (either partitioned or whole)
    echo "##### Start format job #####"
    echo "Formatting $device as $type"
    
    sudo mkfs -t $type -q $device

    # Check for format success
    if [ $? -ne 0 ]; then
        echo "Failed to format $device"
        exit 1
    fi

    # Wait for the device to be ready
    sleep 5
 
    
    echo "##############################"
    echo "##### Check device UUID #####"
    echo "##############################"
    echo $device

    # Use blkid instead of lsblk to get UUID
    uuid=$(sudo blkid -s UUID -o value $device)

    if [ -z "$uuid" ]; then
        echo "Failed to get UUID for $device"
        exit 1
    fi

    echo $uuid
    echo "Adding new fstab entry"
    
    sudo bash -c "echo UUID=$uuid   $mount_point    $type   defaults,nofail   0   2 >> /etc/fstab"    
    sudo mount -a

    echo "##### Finish mount $device #####"
done
