# Docker private registry

## After set up below

```
$ docker-compose up
```

## configuration

### config/auth_config.yml

As you like.

### docker-compose.yml

It is set for Azure Blob. Modify environment valiables as you like.


## enable insecure-registry in client

If you run private registry except on localhost, set `--insecure-registry` option to profile and restart docker daemon.

These example, please replace `my-registry` to your private registry address.

### MacOSX

```
$ docker-machine ssh default "echo $'EXTRA_ARGS=\"--insecure-registry my-registry:5000\"' | sudo tee -a /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"
```

### Ubuntu (Unverified)

```
$ echo "export other_args=\"--insecure-registry my-registry:5000\" | sudo tee -a /etc/default/docker && sudo service docker restart
```

### CentOS (Unverified)

```
$ echo "export other_args=\"--insecure-registry my-registry:5000\" | sudo tee -a /etc/sysconfig/docker && sudo service docker restart
```
