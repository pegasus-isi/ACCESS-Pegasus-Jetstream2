
## Using the Image

When creating the image in Exosphere, add a bootcmd to the advanced configuration,
bootscript yaml. You need your ACCESS username (same one as on access.pegasus.isi.edu)
and your token from access.pegasus.isi.edu:~/.condor/pilot.token. The 
`/opt/ACCESS-Pegasus-Jetstream2/bin/vm-conf` tool takes those two as argument.
Leave the rest of the bootscript in place, like:


```
....
bootcmd:
  - /opt/ACCESS-Pegasus-Jetstream2/bin/vm-conf [username] [token]
runcmd:
....
```


## Image Setup

Install this repo under `/opt/ACCESS-Pegasus-Jetstream2` and create a salt symlink:

```
ln -s /opt/ACCESS-Pegasus-Jetstream2/salt /srv/salt
```

Then:

```
rpm --import https://repo.saltproject.io/py3/redhat/8/x86_64/latest/SALTSTACK-GPG-KEY.pub

curl -fsSL https://repo.saltproject.io/py3/redhat/8/x86_64/latest.repo >/etc/yum.repos.d/salt.repo

dnf install -y salt-minion

cat >/etc/salt/minion.d/50-main.conf <<EOF
file_client: local
EOF

salt-call --local state.highstate
```


