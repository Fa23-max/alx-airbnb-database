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
