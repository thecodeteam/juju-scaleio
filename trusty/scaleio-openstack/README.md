# Overview

This charm provides connection of ScaleIO cluster to OpenStack.

Its units should be placed in the same machines (not containers) as scaleio-sdc and nova-compute or cinder.

It should be connected to the ScaleIO Gateway

It prepares (configures and patches if required) nova-compute and cinder to use ScaleIO as a block storage.

It supports both block storage volumes operations and nova ephemeral storage for instances including live migration.

# Usage

Until the charm is in the Charm Store it can be used in the following manner:

1. cd to directory where trusty/scaleio-mdm resides
2. use command ```juju deploy local:trusty/scaleio-mdm```

Example:

  Deploy the connector
  ```
	juju deploy scaleio-openstack
  ```
  
  Configure protection domains and storage pools
  ```
  	juju set scaleio-openstack protection-domains="pd1" storage-pools="sp1"
  ```  
  
  Connect it to the Gateway
  ```
    juju add-relation scaleio-gw scaleio-openstack
  ```

# Configuration

* protection-domains - Comma-separated list of protection domains
* storage-pools	- Comma-separated list of storage pools

# Relations

Should be related to scaleio-gw. Reconfiguration of OpenStack is done when relation is set.
