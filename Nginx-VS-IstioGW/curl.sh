#!/bin/bash

RESULT_FILE=result.list

for i in {1..1000}; 
do
echo -n "Request $i; ";
curl -w @- -o /dev/null -s "$@" <<'EOF'
response_time: %{time_total}s\n
EOF
sleep 0.06
done > $RESULT_FILE
cat $RESULT_FILE

echo -n "Average: "
awk '{ total += $4; count++ } END { print total/count }' $RESULT_FILE