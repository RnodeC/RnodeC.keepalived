rnodec.keepalived
=========

This ansible role sets up keepalived, which shares a vip across a cluster of servers.

Requirements
------------

Three linux servers.

Role Variables
--------------

*`keepalived_action`: install|upgrade|teardown

required:
* `keepalived_vip`: the reserved ip on this network that the cluster will use

optional:
* `keepalived_iface`: the interface for keepalived to bind to.  default is the primary interface that ansible sees. 
* `keepalived_fqdn`: if provided, update /etc/hosts to map fqdn to the vip 
* `keepalived_rke2_enabled`: set up a health check for rke2 

Dependencies
------------

None


Example Playbook
----------------

```bash
- hosts: servers

  vars: 
    keepalived_enabled: true 
    keepalived_vip: 192.168.0.100
    keepalived_fqdn: servervip.local

  roles:
  - RnodeC.keepalived
```

Author Information
------------------

RnodeC - rnodec.io
