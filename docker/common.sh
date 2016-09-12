#!/bin/bash

# We don't want any of the incoming service variables, we'd rather use
# DNS. But this one interferes directly with Spark.
unset SPARK_MASTER_PORT

# spark.{executor,driver}.extraLibraryPath don't actually seem to
# work, this seems to be the only reliable way to get the native libs
# picked up.
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/hadoop/lib/native
