См. [README.md](README.md)

Содержит загрузчик MOEX AlgoPack fo/. После загрузки данные в ClickHouse `moex.*_fo` — доступны всем проектам.

Не содержит стратегий и аналитики — только data pipeline.

Основные точки входа:
- `scripts/load_algopack_fo.py` — загрузчик (tradestats, obstats, orderstats)
- `run_daily.sh` — cron entrypoint
