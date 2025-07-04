SELECT *
FROM bookings
WHERE user_id = 42
ORDER BY created_at DESC
LIMIT 50;

SELECT property_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY property_id
ORDER BY total_bookings DESC
LIMIT 10;

SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42
ORDER BY created_at DESC
LIMIT 50;

Seq Scan on bookings  (cost=0.00..18500.00 rows=100000 width=...)
Filter: user_id = 42
Sort Method: quicksort  Memory: 512kB
Execution Time: 420.812 ms

-- For Query 1
CREATE INDEX idx_bookings_user_created ON bookings(user_id, created_at DESC);

-- For Query 2
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- For Query 3 (only effective if table is partitioned)
-- Ensure start_date is used as partition key and include CHECK constraints
