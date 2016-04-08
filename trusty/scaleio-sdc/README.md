# Overview

This charm provides deployment of ScaleIO SDC.

It cannot be placed into containers because it installs kernel driver and does other low-level operations.

Before deployment you might want to make sure that kernel you have on the nodes for ScaleIO SDC installation (compute and cinder nodes in case of OpenStack deployment) is suitable for the drivers present here: ```ftp://QNzgdxXix:Aw3wFAwAq3@ftp.emc.com/ ```. Look for something like ``` Ubuntu/2.0.5014.0/4.2.0-30-generic ```. Local kernel version can be found with ``` uname -a ``` command.

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

* scaleio-apt-repo - Apt-repository where ScaleIO 2.0 packages can be fetched from
* scaleio-driver-ftp - FTP to fetch ScaleIO SDC drivers from

# Relations

Should be related to scaleio-mdm.

# Usage with OpenStack

Should be placed in the same machines where nova-compute or cinder charms reside.
 
