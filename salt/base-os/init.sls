
# remove some stuff from the base image
base-os.remove-packages:
  pkg.removed:
    - pkgs:
      - avahi
      - ceph-common
      - ceph-fuse
      - cups
      - dnf-automatic
      - firewalld
      - pulseaudio
      - smartmontools

# packages we require
base-os.install-packages:
  pkg.installed:
    - pkgs:
      - apptainer
      - apptainer-suid

/etc/selinux/config:
  file.managed:
    - source: salt://base-os/selinux-config
    - user: root
    - group: root
    - mode: 644


