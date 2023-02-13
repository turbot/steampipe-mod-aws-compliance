#!/bin/bash

controls=( $(STEAMPIPE_INTROSPECTION=info steampipe query "select resource_name from steampipe_control order by resource_name" --output csv) )

for control in ${controls[*]}
do
if [ "$control" != "resource_name" ]; then
steampipe check control.$control --output csv --export=$control.csv
fi
done