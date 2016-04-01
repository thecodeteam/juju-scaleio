# Overview

This charm provides deployment of ScaleIO SDC.

It cannot be placed into containers because it installs kernel driver and does other low-level operations.

# Usage

Until the charm is in the Charm Store it can be used in the following manner:

1. cd to directory where trusty/scaleio-sdc resides
2. use command ```juju deploy local:trusty/scaleio-sdc```

Example:

  Deploy an SDC
  ```
	juju deploy scaleio-sdc
  ```
  
  Connect SDC to MDM
  ```
    juju add-relation scaleio-sdc scaleio-mdm
  ```
  
  Add two more SDCs
  ```
	juju add-unit scaleio-sdc -n 2
  ```
  
# Configuration

none

# Relations

Should be related to scaleio-mdm.

# Usage with OpenStack

Should be placed in the same machines where nova-compute or cinder charms reside.
 