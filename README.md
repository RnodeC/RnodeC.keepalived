rnodec.keepalived
=========

This ansible role sets up keepalived, which shares a vip across a cluster of servers.

Requirements
------------

Three linux servers.

Role Variables
--------------

If `keepalived_enabled` is set to `true` (default is `false`), these variables must be provided:
* `keepalived_floating_ip`: the reserved ip on this network that the cluster will use

These variables are optional:
* `keepalived_iface`: the interface for keepalived to bind to.  default is the primary interface that ansible sees.  

Dependencies
------------

None


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: rnodec.keepalived }

Author Information
------------------

RnodeC - rnodec.io
