#!/bin/bash

if [ -z "$MQSI_VERSION" ]; then
  echo "Sourcing profile"
  source /opt/ibm/mqsi/9.0.0.2/bin/mqsiprofile
fi
