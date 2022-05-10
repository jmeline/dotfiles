#!/bin/bash

if grep "0" /sys/class/hwmon/hwmon1/pwm1_enable
then
  sudo echo "1" | sudo tee /sys/class/hwmon/hwmon1/pwm1_enable
  sudo echo "180" | sudo tee /sys/class/hwmon/hwmon1/pwm1
  echo "GPU Fan enabled"
else
  sudo echo "0" | sudo tee /sys/class/hwmon/hwmon1/pwm1_enable
  sudo echo "175" | sudo tee /sys/class/hwmon/hwmon1/pwm1
  echo "GPU Fan disabled"
fi

