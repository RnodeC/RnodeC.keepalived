rnodec.keepalived
=========

This ansible role sets up keepalived, which shares a vip across a cluster of servers.

Requirements
------------

Three linux servers.

Role Variables
--------------

If `keepalived_enabled` is set to `true` (default is `false`), these variables must be provided:
* `keepalived_vip`: the reserved ip on this network that the cluster will use

These variables are optional:
* `keepalived_iface`: the interface for keepalived to bind to.  default is the primary interface that ansible sees. 
* `keepalived_hostname` & `keepalived_domain`: if provided, update /etc/hosts to map fqdn to the vip 

Dependencies
------------

None


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers

      vars: 
        keepalived_enabled: true 
        keepalived_vip: 192.168.0.100
        keepalived_fqdn: servervip.local

      roles:
      - RnodeC.keepalived

Author Information
------------------

RnodeC - rnodec.io
