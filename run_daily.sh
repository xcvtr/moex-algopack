#!/usr/bin/env bash
# Daily MOEX AlgoPack fo/ update — run via cron
# Loads all 3 datasets incrementally (missed dates only)
set -euo pipefail
cd "$(dirname "$0")"/..
if [ ! -f .env ]; then
    cp /home/user/projects/TQA-MOEX-futures/.env .env 2>/dev/null || true
fi
python3 scripts/load_algopack_fo.py --incremental 2>&1
