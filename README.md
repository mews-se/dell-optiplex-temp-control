# dell-optiplex-temp-control
Many of Dell Optiplex has no way of controlling fan speed in certain distros of Linux. This is a good enough work around.
Fancontrol and/or i8kmon isn't a sure way of making sure that the fans aren't dead or at full blast. This is a crude solve.

How-to:

```
apt install i8kutils lm-sensors
```

edit /etc/modules to contain:
```
coretemp
i8k
dell=smm-hwmon
```

edit /etc/modprobe.d/i8k.conf to contain:
```
options i8k force=1
```

reboot

Move tempcontrol.sh to /usr/local/bin/ and make sure it's executable (chmod +x)
Move tempcontrol.service to /etc/systemd/system/

```
systemctl enable tempcontrol.service
systemctl start tempcontrol.service
```

Check status with systemctl status tempcontrol.service
Check sensors to make sure that fan speed and temperature is showing correctly

OPTIONAL: To also disable Dell's bios fan control use [this](https://github.com/TomFreudenberg/dell-bios-fan-control)

Credits: [Tom Freudenberg](https://github.com/TomFreudenberg), [Ronny Svedman](https://github.com/RonnySvedman)
