# Overview

This charm provides deployment of ScaleIO Gateway.

It can be related to client side charms, such as scaleio-openstack.

At least 3gb RAM is required to be set in the machine for ScaleIO Gateway.

# Usage

Until the charm is in the Charm Store it can be used in the following manner:

1. cd to directory where trusty/scaleio-gw resides
2. use command ```juju deploy local:trusty/scaleio-gw```

Example:

  Deploy a Gateway
  ```
    juju deploy scaleio-gw
  ```

  Connect the Gateway to MDM
  ```
    juju add-relation scaleio-gw scaleio-mdm
  ```

  Check the scaleio-openstack README for details on its relation.

# Configuration

* port - port where Gateway will listen
* im-port - Port of Installation Manager web server.
* scaleio-apt-repo - Apt-repository where ScaleIO 2.0 packages can be fetched from
* vip - Virtual IP to use to front API service in HA configuration.
* haproxy-server-timeout - Server timeout configuration in ms for haproxy, used in HA configurations.
* haproxy-client-timeout - Client timeout configuration in ms for haproxy, used in HA configurations.
* haproxy-queue-timeout - Queue timeout configuration in ms for haproxy, used in HA configurations.
* haproxy-connect-timeout - Connect timeout configuration in ms for haproxy, used in HA configurations.

# Relations

Should be related to scaleio-mdm.
Can be related to scaleio-openstack or other client-side charms.

