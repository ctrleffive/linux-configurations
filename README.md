# 🐧 Linux Configurations

## 💾 Backup Configurations
- Make the `backup.sh` file executable with `chmod +x ./backup.sh` first.
- Backup configurations by executing `backup.sh` file.
- Files & folders that needs to be backed up should be mentioned inside `backup.conf` file.
- Once backup is complete, commit the changes.
- If you want to restore the backup, instead of just copy paste everything back, run the backup script. After that you can use file diff to compare the changes and pick manually.

## 💫 Install Packages
- Make the `install.sh` file executable with `chmod +x ./install.sh` first.
- Bulk install packages by executing `install.sh` file.
- Packages needs to be installed should be listed inside `install_third_party.conf` & `install_trusted.conf` files.
- Services needs to be enabled should be listed inside `services.conf` file.
- Its better to restart the PC after script finished running.
- 3rd party packages are installed through `pikaur` AUR helper.

## ⚡️ Notes
- Install **VMWare Player** from here: https://wiki.archlinux.org/title/VMware#Installation
- After installing `wine`
  - Create a link in home directory to `/run/media/chandu/Storage/Softwares/Wine` directory.
  - Enable `multilib` in `/etc/pacman.conf` file.
- Use below code to create direct shortcut for joining Zoom calls:
  ```ini
  [Desktop Entry]
  Comment=Zoom video conference
  Exec=xdg-open "zoommtg://zoom.us/join?action=join&confno=XXXXXXXXXXXXXXXX&pwd=XXXXXXXXXXXXXXXX"
  Icon=Zoom
  MimeType=application/x-zoom;
  Name=Join Meeting
  StartupNotify=true
  StartupWMClass=zoom
  Type=Application
  X-KDE-Protocols=zoommtg;zoomus;tel;callto;zoomphonecall;
  ```
