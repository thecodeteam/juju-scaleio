# Overview

This charm provides deployment of ScaleIO SDS.

Various configurations can be set up for different groups of SDSs thus allowing several protection domains in one cluster.

Please read ScaleIO guides for requirements on hardware suitable for installation.

# Usage

The charm can be fetched from the JuJu charm-store.

Or it can be installed locally in the following manner:

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
* device-paths - Comma-separated list of Device Paths for the group of SDSs in the same order as list of storage-pools above
* rfcache-device-paths - Comma-separated list of device paths for RF Cache
* zero-padding-policy - Ensures that every read from an area previously not written to returns zeros
* checksum-mode: This feature addresses errors that change the payload during the transit through the ScaleIO system
* rfcache-usage: Switch rfcache on or off by 'use' or 'dont_use'
* rmcache-usage: Server RAM that is reserved for caching storage devices in a Storage Pool.
* rmcache-write-handling-mode: The caching write-mode used by the system: passthrough mode (writes to storage only), or cached mode (by default, writes both to cache and to storage).
* scanner-mode: The Background Device Scanner ("scanner") enhances the resilience of your ScaleIO system by constantly searching for, and fixing, device errors before they can affect your system. Can be 'enable' that means 'device_only' mode or 'disable'.
* spare-percentage: The number represents the percentage of total capacity set aside to ensure data integrity during server failures. The percentage is derived by 1/(number of SDS), which yields the recommended percentage for less than 10 balanced servers. For more information, see “Modifying spare policy” in the EMC ScaleIO User Guide.
* internal-iface - Comma-separated list of network interfaces for internal cluster communications, by default internal JuJu-provided IP is used
* storage-iface - Comma-separated list of network interfaces for storage communication of SDS with SDC, by default internal-iface is used
* scaleio-packages-url - URL of ScaleIO 2.x packages where charm can find them in appropriate structure.
* scaleio-driver-ftp - FTP to fetch ScaleIO SDC drivers from

# Relations

Should be related to scaleio-mdm.
