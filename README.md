# moex-algopack

MOEX AlgoPack fo/ data loader — общий источник данных AlgoPack для всех TQA-проектов.

## Назначение

Загружает датасеты MOEX AlgoPack fo/ в ClickHouse (10.0.0.63:8123, БД `moex`).
Данные доступны всем проектам: TQA-MOEX-futures, TQA-MOEX-options, option-rf и др.

## Датaсеты

| Датасет | Таблица CH | Что содержит |
|---------|-----------|--------------|
| `tradestats` | `tradestats_fo` | OHLC, OI (open/high/low/close), disb, vol_b/s, VWAP |
| `obstats` | `obstats_fo` | Стакан (спреды, объёмы на L1-L20, micro/mid price) |
| `orderstats` | `orderstats_fo` | Заявки (put/cancel ratio, orders_b/s_put, orders_b/s_cancel, VWAP) |

Период: 2020-01-03 — настоящее время (торговые дни).

## Использование

```bash
# Инкрементальная загрузка (пропущенные даты за последние 7 дней)
python3 scripts/load_algopack_fo.py

# Полная загрузка всех датасетов за всё время
python3 scripts/load_algopack_fo.py --full

# Конкретный диапазон
python3 scripts/load_algopack_fo.py --start 2025-01-01 --end 2025-06-01

# Только obstats + orderstats
python3 scripts/load_algopack_fo.py --datasets obstats orderstats

# Скрипт для cron
./run_daily.sh
```

## Требования

- Python 3.10+
- pip: `clickhouse-connect`, `requests`
- `.env` с `ALGOPACK_APIKEY=<токен>`

## Токен

Копируется из TQA-MOEX-futures при первом запуске `run_daily.sh`.
Или вручную: `cp /path/to/TQA-MOEX-futures/.env .env`

## Структура

- `scripts/load_algopack_fo.py` — основной загрузчик
- `run_daily.sh` — cron-обёртка
- `checkpoint/` — чекпойнты
