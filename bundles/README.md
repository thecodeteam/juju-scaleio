# Overview

Bundles for ScaleIO and OpenStack provisioning.

Amazon and manual environments are included.

Bundles for 3 and 5-nodes cluster.

Each OpenStack-related bundle contains series reference like cloud:trusty-liberty, cloud:trusty-kilo.
They can be changed before running the bundle. Juno, Kilo and Liberty are supported.

# Usage

Until the bundles are in the Charm Store they can be used in the following manner:

1. cd to directory where trusty/bundles resides
2. use command ```juju-deployer -c bundles/bundle_name.yaml``` to deploy
3. use command ```juju-deployer -D bundles/bundle_name.yaml``` to destroy the deployment

# Configuration

Replace cloud:trusty-liberty/kilo/juno in the bundles with the desired OpenStack version before deployment.

Keep in mind that changing machines might lead to non-working deployment, because OpenStack charms are mostly
designed to work separately form each other.
