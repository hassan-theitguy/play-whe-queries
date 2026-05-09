rm results.db
sqlite3 results.db < create_tbl_results.sql
sqlite3 results.db < random.sql
sqlite3 results.db < query_top10.sql
