EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';

-> Append (cost=...) 
    -> Index Scan using ... on bookings_2025_01
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
