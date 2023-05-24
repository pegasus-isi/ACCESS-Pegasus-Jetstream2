
htcondor-release:
  pkg.installed:
    - sources:
      - htcondor-release: https://research.cs.wisc.edu/htcondor/repo/10.x/el8/x86_64/release/htcondor-release-10.x-1.el8.noarch.rpm

htcondor-packages:
  pkg.installed:
    - pkgs:
      - condor

/etc/condor/master_shutdown.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://htcondor/master_shutdown.sh

/etc/condor/config.d/10-main.conf:
  file:
    - managed
    - source: salt://htcondor/10-main.conf

condor:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/condor/config.d/10-main.conf


