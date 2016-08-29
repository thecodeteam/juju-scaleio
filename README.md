# Overview

The repository provides a set of charms for ScaleIO 2.0 cluster deployment.

It brings the following ScaleIO components:
* ScaleIO MDM - Meta Data Manager
* ScaleIO SDS - Storage Data Server
* ScaleIO SDC - Storage Data Client
* ScaleIO Gateway - REST API client gateway
* ScaleIO Cluster - Existing ScaleIO cluster gateway
* ScaleIO GUI - The UI tool

And a connector of ScaleIO to OpenStack:
* ScaleIO OpenStack

All of these charms are present in the [JuJu Charm Store](https://jujucharms.com/q/cloudscaling).

# Structure

Folders:
* bundles - JuJu charm bundles allowing bundled orchestrated deployment of the ScaleIO
* trusty - Ubuntu 14.04 set of JuJu charms for flexible, individual deployment of charms

The following charms are present:

- [scaleio-mdm - ScaleIO MDM] (https://github.com/emccode/juju-scaleio/tree/master/trusty/scaleio-mdm)
- [scaleio-sds - ScaleIO SDS] (https://github.com/emccode/juju-scaleio/tree/master/trusty/scaleio-sds)
- [scaleio-sdc - ScaleIO SDC] (https://github.com/emccode/juju-scaleio/tree/master/trusty/scaleio-sdc)
- [scaleio-gw  - ScaleIO Gateway] (https://github.com/emccode/juju-scaleio/tree/master/trusty/scaleio-gw)
- [scaleio-cluster  - ScaleIO Cluster] (https://github.com/emccode/juju-scaleio/tree/master/trusty/scaleio-cluster)
- [scaleio-gui - ScaleIO GUI] (https://github.com/emccode/juju-scaleio/tree/master/trusty/scaleio-gui)
- [scaleio-openstack - Connector to OpenStack] (https://github.com/emccode/juju-scaleio/tree/master/trusty/scaleio-openstack)

A patched nova-compute is required for ephemeral storage backend to work:

- [nova-compute - Patched nova-compute which supports ephemeral-storage backend] (https://github.com/cloudscaling/juju-scaleio/tree/master/trusty/nova-compute)

IMPORTANT: ScaleIO MDM cluster is very sensitive to its reconfiguration. Please read carefully the scaleio-mdm README.

# Usage

Charms are normally installed from JuJu Charm store.
Also can be installed locally by downloading from github and following installation instructions in particular charm READMEs.

In order for the ScaleIO cluster to be deployed you would need to deploy and configure at least:
* 1 MDM server
* 3 SDS servers
* X SDC clients on the same machines you want to allocate and access volumes from

In order to make ScaleIO working with OpenStack you additionally need:
* SDC clients and scaleio-openstack charms to be installed on nova-compute and cinder machines
* 1 Gateway

Please read particular charms' READMEs (you can find links in the Structure section above) for details about installation, usage, relations and configuration.

# ScaleIO charms Contact Information

- [Project Bug Tracker](https://github.com/emccode/juju-scaleio/issues)

