#!/bin/bash

devices=$(bluetoothctl devices | awk '{print $2}')

for device in $devices; do
    bluetoothctl connect "$device"
done

