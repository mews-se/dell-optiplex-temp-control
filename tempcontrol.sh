#!/bin/bash

# Bash script to control fan speed based on CPU temperature
# Replace '/sys/class/hwmon/hwmon3/temp1_input' with your actual temperature sensor path

while true; do
  # Read CPU temperature from the sensor file
  if [ -r "/sys/class/hwmon/hwmon3/temp1_input" ]; then
    read -r temp < "/sys/class/hwmon/hwmon3/temp1_input"
  else
    echo "Error: Unable to read temperature sensor file." >&2
    exit 1
  fi

  # Determine fan speed based on temperature thresholds
  if [ "$temp" -lt 40000 ]; then
    /usr/bin/i8kfan - 0 > /dev/null  # Set fan speed to 0 (min) if temperature is less than 40°C
  elif [ "$temp" -lt 45000 ]; then
    /usr/bin/i8kfan - 1 > /dev/null  # Set fan speed to 1 (medium) if temperature is less than 45°C
  else
    /usr/bin/i8kfan - 2 > /dev/null  # Set fan speed to 2 (max) if temperature is 45°C or higher
  fi

  sleep 2  # Adjust this interval according to your needs
done
