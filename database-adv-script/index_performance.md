-- Indexes for Users table
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_users_email ON users(email);

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Indexes for Properties table
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 5
ORDER BY created_at DESC;

Seq Scan on bookings  (cost=0.00..1200.00 rows=5000 width=...)
Index Scan using idx_bookings_user_id on bookings  (cost=0.25..300.00 rows=500 width=...)
