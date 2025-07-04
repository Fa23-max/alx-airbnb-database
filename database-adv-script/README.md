SELECT 
    bookings.*,
    users.*
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

SELECT 
    properties.*,
    reviews.*
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

SELECT 
    users.*,
    bookings.*
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;

