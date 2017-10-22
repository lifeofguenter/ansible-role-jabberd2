[![Build Status](https://travis-ci.org/lifeofguenter/ansible-role-jabberd2.svg?branch=master)](https://travis-ci.org/lifeofguenter/ansible-role-jabberd2)

# Ansible Role: jabberd2

An Ansible role that installs jabberd2 on Debian like systems.

## Requirements

none

## Role Variables

```yaml

jabberd2_router_user_secret:

jabberd2_component_secret:

jabberd2_domain:

jabberd2_mysql_host:

jabberd2_mysql_user:

jabberd2_mysql_password:

jabberd2_mysql_db:

jabberd2_cert_pemfile:

jabberd2_cert_cachain:

```

## Dependencies

none

## Example Playbook

    - hosts: xmpp
      roles:
        - { role: lifeofguenter.jabberd2 }

## License

MIT
