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
# Cluster reconfiguration

This charm supports ScaleIO MDM clustering.
ScaleIO cluster can consist of 1, 3 or 5 nodes. This is set by cluster-mode configuration parameter.
Existing units will be automatically configured to become a cluster in accordance with the cluster-mode except for 1 case (see below)

## Grow the cluster

In any order:
* use add-unit to add more MDMs
* set required cluster-mode

Cluster will switch to requested mode when the number of MDMs is sufficient

## Replace nodes

In any order:
* use remove-unit to remove one MDM from the cluster
* use add-unit to add the replacement

Cluster will automatically replace the nodes

IMPORTANT: Don't remove more than one node at a time for replacement for 3-node cluster and more than two in 5-node.

IMPORTANT: Use juju-status before replacement to check status of the nodes and units - some of them might be lost already.

## Reduce the cluster

IMPORTANT: It's very easy to destroy the cluster if not reduced properly.

You need to:
1. Make sure that all of the participating nodes and units are alive and active by using ```juju status scaleio-mdm```
2. Set the desired mode (1 or 3) like ```juju set scaleio-mdm cluster-mode=3```
3. Issue ```juju status scaleio-mdm``` command
4. See status messages of blocked cluster members - they'll reveal roles (Manager or Tiebreaker) and show units of which roles should be removed
5. Remove the prescribed amount of units of prescribed roles one by one like ```juju remove-unit scaleio-mdm/11``` (you can remove one and recheck juju status)

Cluster will automatically switch to requested mode when it's possible.

The following units will have to be removed before the cluster can switch:
* 5 to 3 - 1 Manager and 1 Tiebreaker
* 5 to 1 - 2 Managers (2 spare units will remain after the change)
* 3 to 1 - 1 Manager (1 spare unit will remain after the change)

IMPORTANT: Do not try to remove units with any other roles combinations. In case it happened, first restore the cluster to current mode with all members active.

IMPORTANT: Any changes in cluster and in JuJu can take time in each step, usually not more than 1 minute.

# Configuration

* cluster-mode - mode of the cluster: 1, 3 or 5.
* password - password for the cluster
* internal-iface - Interface used for MDM control communications with SDSs and SDCs, by default JuJu-provided IPs are used
* management-iface - Interface used to provide access to ScaleIO management applications, by default internal-iface is used
* scaleio-apt-repo - Apt-repository where ScaleIO 2.0 packages can be fetched from
* performance-profile - Performance profile for SDC/SDS. Can be default or high_performance.
* restricted-sdc-mode - 'enabled'|'disabled' Restricted SDC mode.
* license-file-path - Path to license file.
* remote-readonly-limit-state - 'enabled'|'disabled' Remote readonly limit state.

# Relations

To build complete ScaleIO cluster it should be related to scaleio-sds, scaleio-sdc and scaleio-gw charms.

