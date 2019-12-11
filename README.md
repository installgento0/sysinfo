# sysinfo
Simple BASH script to fetch system information
(Tested under a GNOME-based environment)

Use `sudo chmod +x ./fetch.sh` to make the file executable

**Observations:**

No info will be shown under "DE" if the user has only a basic window manager such as i3/awesome/herbstluftwm and no desktop environment installed.

Some desktop environments that aren't GNOME-based might not show up.

**To-do:**

Find a way to fetch monitor information without the usage of `cat /var/log/Xorg.0.log | grep "(DFP-1)"` as the monitor device will most likely not be associated with DFP-1 for every given situation. I guess a common example would be a system with integrated Intel graphics.

Show window manager info. Maybe, without the use of `wmctrl -m`

Show all installed compilers and python version.

List connected usb devices.
