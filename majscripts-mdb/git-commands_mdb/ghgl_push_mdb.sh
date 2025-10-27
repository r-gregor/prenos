#! /usr/bin/env bash
# ghgl_push_mdb
# last change: 20240821

rmts=( $(git remote) )

for rmt in "${rmts[@]}"; do
	echo "[INFO] git testpush in: $(git remote get-url ${rmt}) ..."
	git push ${rmt} main
	echo "---"
done
echo ""

