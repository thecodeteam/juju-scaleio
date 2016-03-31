# Overview

This charm provides deployment of ScaleIO MDMs cluster.

# Usage

Until the charm is in the Charm Store it can be used in the following manner:

1. cd to directory where trusty/scaleio-mdm resides
2. use command ```juju deploy local:trusty/scaleio-mdm```

Example:

  Deploy single node cluster
  ```
	juju deploy scaleio-mdm
  ```
  
  Add two more MDMs
  ```
    juju add-unit scaleio-mdm -n 2
  ```
  
  Set up 3 node cluster
  ```
	juju set scaleio-mdm cluster-mode=3
  ```
  
  Add another couple of MDMs
  ```
    juju add-unit scaleio-mdm -n 2
  ```
  
  Set up 5 node cluster
  ```
	juju set scaleio-mdm cluster-mode=5
  ```
  
  Remove two MDMs (change to particular units)
  ```
	juju remove-unit scaleio-mdm/1
	juju remove-unit scaleio-mdm/2
  ```

  Set up 3 node cluster
  ```
	juju set scaleio-mdm cluster-mode=3
  ```

  Change password
  ```
    juju set scaleio-mdm password="Non_default_password"  
  ```

# Configuration

* cluster-mode - mode of the cluster: 1, 3 or 5.
* password - password for the cluster

# Relations

To build complete ScaleIO cluster it should be related to scaleio-sds, scaleio-sdc and scaleio-gw charms.

# Limitations

* No change from 3 or 5 node cluster to 1 node cluster is supported

