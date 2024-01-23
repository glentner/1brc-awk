#!/bin/bash
# Naive solution to 1BRC
# Usage:
#   $ dd if=measurements.txt bs=10M | ./awk-basic.sh

awk -F ';' '
{
	v_count[$1] += 1
	v_sum[$1] += $2
	if (v_min[$1] > $2) v_min[$1] = $2
	if (v_max[$1] < $2) v_max[$1] = $2

} END {
	for (a in v_sum) {
		print a, "/", v_min[a], "/", v_sum[a] / v_count[a], "/", v_max[a]
	}
}
'
