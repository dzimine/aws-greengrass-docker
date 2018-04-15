#!/bin/bash

/greengrass/ggc/core/greengrassd start

# Note: ingonre initial "No such file" as it takes some time...
tail -F /greengrass/ggc/var/log/system/runtime.log