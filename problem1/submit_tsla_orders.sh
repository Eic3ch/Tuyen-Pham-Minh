#!/bin/bash
# This script submits HTTP GET requests for TSLA orders from transaction-log.txt

# Process each JSON line; filter TSLA orders and request the API
while read -r line; do
    if echo "$line" | grep -q '"symbol": "TSLA"'; then
        order_id=$(echo "$line" | jq -r '.order_id')
        curl -s "https://example.com/api/${order_id}" >>./output.txt
    fi
done <./transaction-log.txt
