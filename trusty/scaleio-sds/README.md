# Overview

This charm provides deployment of ScaleIO SDS.

Various configurations can be set up for different groups of SDSs thus allowing several protection domains in one cluster.

Please read ScaleIO guides for requirements on hardware suitable for installation.

# Usage

Until the charm is in the Charm Store it can be used in the following manner:

1. cd to directory where trusty/scaleio-sds resides
2. use command ```juju deploy local:trusty/scaleio-sds```

Example:

  Deploy an SDS
  ```
	juju deploy scaleio-sds
  ```
  
  Set up protection domain, storage pool and device path
  ```
  	juju set scaleio-sds protection-domain="pd1" storage-pools="sp1" device-paths="/dev/sdb"
  ```  

  Connect SDS to MDM
  ```
    juju add-relation scaleio-sds scaleio-mdm
  ```
  
  Add two more SDSs to get working protection domain
  ```
	juju add-unit scaleio-sds -n 2
  ```

  Add another group of SDSs for a different protection domain
  ```
	juju deploy scaleio-sds scaleio-sds-pd2
	juju add-unit scaleio-sds-pd2 -n 2
  ```
  
  Configure them for a different protection domain, different fault set and several storage pools and devices
  ```
  	juju set scaleio-sds-pd2 protection-domain="pd2" fault-set="fs1" storage-pools="sp1,sp2" device-paths="/dev/sdc,/dev/sdd"
  ```  
  
  Connect them to MDM
  ```
    juju add-relation scaleio-sds-pd2 scaleio-mdm
  ```
  
  Add another group of SDSs for a different fault set in the second protection domain
  ```
	juju deploy scaleio-sds scaleio-sds-pd2-fs2
	juju add-unit scaleio-sds-pd2-fs2 -n 2
  ```
  
  Configure them for a different fault set of the same protection domain
  ```
  	juju set scaleio-sds-pd2-fs2 protection-domain="pd2" fault-set="fs2" storage-pools="sp1,sp2" device-paths="/dev/sdc,/dev/sdd"
  ```  
  
  Connect them to MDM
  ```
    juju add-relation scaleio-sds-pd2-fs2 scaleio-mdm
  ```

  Create another protection domain and switch the last group to it
  ```
    juju set scaleio-sds-pd2 protection-domain="pd3"
  ```

# Configuration

* protection-domain - Protection Domain for the group of SDSs
* fault-set - Fault Set for the group of SDSs
* storage-pools - Comma-separated list of Storage Pools for the group of SDSs
* device-paths - Comma-separated list of Device Paths for the group of SDSs

# Relations

Should be related to scaleio-mdm.

# Usage with OpenStack

Should be placed in the same machines where nova-compute or cinder charms reside.
 