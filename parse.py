import csv
import sqlite3

CSV_FILE = "data.csv"
DB_FILE = "data.db"

conn = sqlite3.connect(DB_FILE)
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS DrawResults (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    draw1 INTEGER,
    draw2 INTEGER,
    draw3 INTEGER,
    draw4 INTEGER,
    drawdate TEXT
)
""")

inserted = 0
skipped = 0

with open(CSV_FILE, mode="r", newline="", encoding="utf-8") as csvfile:
    reader = csv.reader(csvfile)

    for row in reader:

        draw1, draw2, draw3, draw4, drawdate, last = [x.strip() for x in row]

        # skip if any value is empty
        if not all([draw1, draw2, draw3, draw4, drawdate]) or draw1=="-":
            skipped += 1
            continue

        cursor.execute("""
        INSERT INTO DrawResults (draw1, draw2, draw3, draw4, drawdate)
        VALUES (?, ?, ?, ?, ?)
        """, (draw1, draw2, draw3, draw4, drawdate))

        inserted += 1

conn.commit()
conn.close()

print(f"Done. Inserted={inserted}, Skipped={skipped}")
