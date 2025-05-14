#!/bin/bash

hwctl > $SNAP_DATA/hwctl-output.json 2> $SNAP_DATA/hwctl-error.log
exit 0
