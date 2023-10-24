#!/bin/sh

curl -X POST -H 'Content-Type: application/json' --data '{"jsonrpc":"2.0","method":"edgecore.GetEdgeNodeSummary","params":[],"id":1}' http://localhost:17888/rpc | jq -r '.'

