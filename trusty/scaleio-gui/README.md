# Overview

This charm provides deployment of ScaleIO GUI.

It's not connected anywhere by means of relations.

# Usage

The charm can be fetched from the JuJu charm-store.

Or it can be installed locally in the following manner:

1. cd to directory where trusty/scaleio-gui resides
2. use command ```juju deploy local:trusty/scaleio-gui```

Example:

  Deploy a Gateway
  ```
	juju deploy scaleio-gui
  ```
  
  Run the GUI
  ```
	/opt/emc/scaleio/gui/run.sh
  ```

# Configuration

* scaleio-apt-repo - Apt-repository where ScaleIO 2.0 packages can be fetched from

# Relations

none
