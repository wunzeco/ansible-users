users
=====

This role manages unix users.

`users_add_users` variable takes a list of dictionaries one per user. Valid
attributes of a user dict.
  * `username`:    **Mandatory**
  * `shell`:       Defaults to `/bin/bash`
  * `comment`:     Description of user e.g full name. Defaults to empty string
  * `createhome`:  Defaults to `true`
  * `group`:       User's primary group. Defaults to `{{ item.username }}`
  * `groups`:      User's supplementary groups. Defaults to `[]`
  * `home`:        Defaults to `/home/{{ item.username }}`
  * `ssh\_keys`:   List of ssh authorized keys. Defaults to `[]`

This role assumes users will only ssh private keys for login so does not support
password.

## Example

```
- hosts: myhost

  vars:
    users_add_groups: [ devops ]
    users_add_users:
      - username: ogonna
        groups: [ devops ]
        comment: "Ogonna I"
        ssh_keys:
          - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1dZw1rcvBElYXHhEfqphmtJ48Do+q05EO3p4RWvTI0YZcOw4ly4lUr/eR1pY9vDTDXcRUlt7FUrwgraqOtuiEZgFVbv+QQPlKXtkqzTkqy/HCAgDaB8vRdMaTk6QGQTBybXe6k6BZKpcaFwxPUmO127SegWbqnp4x/gGqfjY9W5FqBdPF3LNAZi/TJ9pWmO2vNrwhRvhmIX4zLI+pDGjNeRO01uk0No9z52lJgXcBAqb9Pn8TbEhPJZIdkvjVbFKQlZTjW4X47zNQ7CuCrbG2HuCcM3wqMETqBaZDO36j06Ehf3nWeqUC7lI9RHT0lxl0LkxedZbTshgf2ZbQtQp3"
          - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVT4Hth7soHd5teNxW4Y+vNUr4Tvfz19jt70DLstDjf965aqciIzi8EC+3qiiX2FClbfq/RA0RL5wbK1l27OxOr6tHExslapDe/TU58kQacyvU7m0E3JI+0oor0E+imt5LSh2WikP+yPbInnttSfX0f6zwN7ROh3V9bVoLyzz4WWENszRHceoJ9YfyF6+nZqEz1adG64Tc94Ys00g+hWm52A04IdOvs5QOYw7rnou91W73odzTmcoowHzP5HrBrQwK2hFKrrXCcg0TA/7eD5F8V7jQlhKKbCEawUrBlnTVEKcIjZjmNDky5yuFLHJ+npl2Itn/H2kpunzJ9K0xizJv"
      - username: pinkie
        groups: [ devops ]

    users_remove_users:
      - username: chika

  roles:
    - wunzeco.users
```


## Testing

To run this role's integration tests

```
kitchen test
```


## Dependencies

none
