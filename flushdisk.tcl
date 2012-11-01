#!/usr/bin/env tclsh
# expect must be installed
# I used tcl here because "yes | glance delete $ID not work"
package require Expect

set ids [exec glance index | tail -n +3 | sed -n {s/ .*//gp}]

foreach id $ids {
	spawn glance delete $id
	expect {
		-regexp {y/N} {
			exp_send y\r
			exp_continue
		}
	}
}

