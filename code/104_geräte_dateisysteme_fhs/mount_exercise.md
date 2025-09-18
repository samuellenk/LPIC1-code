# Erweiterunug vom Filesystem

## Voraussetzungen

- Debian 12
- User mit `sudo`-Rechten
- es wurde bereits im Hypervisor (VM) eine zweite Platte eingebunden und darauf eine GPT-Partitionstabelle sowie eine Partition definiert, die gemountet ist unter `/mnt/disk2`

## Umsetzung

- die Kommentare im Code sind die Schritte der Übung :smile:

```bash
# 0. Voraussetzungen schaffen
sudo umount /mnt/disk2
sudo apt install parted -y
# 1. zweite Partition mit gdisk/parted erstellen
sudo parted /dev/vdb
print
mkpart primary ext4 11G 15G
print
quit
sudo mkfs.ext4 /dev/vdb2
# 2. zweite Partition mounten
sudo mkdir /mnt/disk3
sudo mount -t ext4 -o defaults /dev/vdb2 /mnt/disk3
sudo umount /mnt/disk3
# 3. eine Mount-Unit zur zweiten Partition erstellen
systemctl list-units --type mount
sudo systemctl daemon-reload
sudo ls -al /run/systemd/generator/
sudo cp /run/systemd/generator/mnt-disk2.mount /etc/systemd/system
cd !$
sudo mv mnt-disk2.mount mnt-disk3.mount
sudo nano mnt-disk3.mount
# Anpassung der Mount-Unit nach Bedarf + Generierung des blockdev über KI
# Beispiel-Unit: [mnt-disk3.mount.old](./mnt-disk3.mount.old)
sudo systemctl daemon-reload
systemctl status mnt-disk
sudo systemctl enable --now mnt-disk3.mount
systemctl status mnt-disk
# 4. dazu noch eine Automount-Unit erstellen
sudo nano /etc/systemd/system/mnt-disk3.automount
# Anpassung der Auto-Mount-Unit nach Bedarf
# Beispiel-Unit: [mnt-disk3.mount](./mnt-disk3.mount)
# Beispiel-Unit: [mnt-disk3.automount](./mnt-disk3.automount)
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable mnt-disk3.automount
# Test des Automount:
ls /mnt/disk3 # wird gemountet, falls aktuell nicht eingehängt ist
```
