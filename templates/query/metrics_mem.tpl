avg(last_5m):avg:system.mem.used{*} by {host} / ( avg:system.mem.total{*} by {host} / 100 ) > ${critical}