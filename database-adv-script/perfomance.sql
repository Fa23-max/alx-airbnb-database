SELECT 
    b.id AS booking_id,
    b.created_at AS booking_date,
    
    -- User details
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,

    -- Property details
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.price,

    -- Payment details
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date

FROM 
    bookings b

JOIN 
    users u ON b.user_id = u.id

JOIN 
    properties p ON b.property_id = p.id

LEFT JOIN 
    payments pay ON b.id = pay.booking_id;


EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.created_at AS booking_date,
    
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,

    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.price,

    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date

FROM 
    bookings b

JOIN 
    users u ON b.user_id = u.id

JOIN 
    properties p ON b.property_id = p.id

LEFT JOIN 
    payments pay ON b.id = pay.booking_id;

-- Example: Only get bookings from the last 3 months
SELECT 
    b.id AS booking_id,
    b.created_at AS booking_date,

    u.name AS user_name,
    u.email AS user_email,

    p.name AS property_name,
    p.location,

    pay.amount,
    pay.status

FROM 
    bookings b

JOIN 
    users u ON b.user_id = u.id

JOIN 
    properties p ON b.property_id = p.id

LEFT JOIN 
    payments pay ON b.id = pay.booking_id

WHERE 
    b.created_at >= CURRENT_DATE - INTERVAL '3 months'

ORDER BY 
    b.created_at DESC

LIMIT 100;
["AND"]

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

CREATE INDEX idx_payments_booking_id ON payments(booking_id);

Seq Scan on bookings → Nested Loop Join → Filter on date → Cost = high
Index Scan on bookings → Merge Join → Filter optimized by WHERE + indexes → Cost = much lower
