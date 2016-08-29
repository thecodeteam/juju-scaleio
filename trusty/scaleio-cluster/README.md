# Overview

This charm allows using existing ScaleIO cluster.

It should be related to client-side charms, such as scaleio-openstack
and scaleio-sdc charm.

# Usage

The charm can be fetched from the JuJu charm-store.

Or it can be installed locally in the following manner:

1. cd to directory where trusty/scaleio-cluster resides
2. use command ```juju deploy local:trusty/scaleio-cluster```

Example:

  Deploy an existing Gateway wrapper
  ```
    juju deploy scaleio-cluster
  ```

  Connect the charm to SDC
  ```
    juju add-relation scaleio-cluster scaleio-sdc
  ```

  Connect the charm to scaleio-openstack
  ```
    juju add-relation scaleio-cluster scaleio-openstack
  ```

# Configuration

* gateway-ip - IP address where existing gateway is listening.
* gateway-port - Port where existing gateway is listening.
* client-user - Username for connecting to gateway
* client-password - Password for connecting to gateway

# Relations

Should be related to scaleio-sdc.
Should be related to scaleio-openstack.
