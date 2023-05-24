/etc/cron.d/salt:
  file.managed:
    - source: salt://salt/salt.cron
    - user: root
    - group: root
    - mode: 644
    - template: jinja

