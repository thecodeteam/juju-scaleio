# Overview

This charm provides availability of using existing ScaleIO cluster.

It should be related to client side charms, such as scaleio-openstack
and to scaleio-sdc charm.

# Usage

Until the charm is in the Charm Store it can be used in the following manner:

1. cd to directory where trusty/scaleio-cluster resides
2. use command ```juju deploy local:trusty/scaleio-cluster```

Example:

  Deploy a Gateway
  ```
    juju deploy scaleio-cluster
  ```

  Connect the charm to SDC
  ```
    juju add-relation scaleio-cluster scaleio-sdc
  ```

  Connect the charm to SDC
  ```
    juju add-relation scaleio-cluster scaleio-openstack
  ```

# Configuration

* gateway-ip - IP address where existing gateway is listening.
* gateway-port - Port where existing gateway is listening.
* client-user - Username for connecting to gateway
* client-password - Password for connecting to gateway

# Relations

Should be related to scaleio-mdm.
Should be related to scaleio-openstack or other client-side charms.
