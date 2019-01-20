# docker-phpipam-agent

phpIPAM is an open-source web IP address management application. Its goal is to provide light and simple IP address management application.

phpIPAM is developed and maintained by Miha Petkovsek, released under the GPL v3 license, project source is [here](https://github.com/phpipam/phpipam-agent)

Learn more on [phpIPAM homepage](http://phpipam.net)

This container can be used as a discovery scan agent.

## How to use this Docker image

### Setup PHPIPAM

* See steps in https://github.com/pierrecdn/phpipam
* Configure a remote agent (Administration > scan agents), get the key.
![config_agent](https://user-images.githubusercontent.com/4225738/45190599-0b799000-b23f-11e8-9e41-fb993606264d.png)

* For each subnet, enable scan & configure the remote agent by selecting a remote.
![config_subnet](https://user-images.githubusercontent.com/4225738/45190619-2ba94f00-b23f-11e8-9e45-b5e721c63d70.png)

### Run this container

Pass the MySQL password and the phpipam agent key.

```bash
$ docker run -ti -d -e PHPIPAM_AGENT_KEY=dummy-key -e MYSQL_ENV_MYSQL_PASSWORD=my-secret-pw --name ipam-agent --link phpipam-mysql:mysql pierrecdn/phpipam-agent
```

Now, the discovery scans will be performed every 1mn by default.

The logs are available on stdout/stderr (allowing to use `docker logs`).
