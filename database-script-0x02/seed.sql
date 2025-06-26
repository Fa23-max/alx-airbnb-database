
-- Sample data for `airbnb` database

-- Insert into `user`
INSERT INTO `user` (`first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'hashed_password_1', '1234567890', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'hashed_password_2', '0987654321', 'host'),
('Carol', 'White', 'carol@example.com', 'hashed_password_3', '1122334455', 'guest'),
('David', 'Brown', 'david@example.com', 'hashed_password_4', '2233445566', 'admin');

-- Insert into `property`
INSERT INTO `property` (`host_id`, `name`, `description`, `location`, `pricepernight`, `updated_at`)
VALUES
(2, 'Ocean View Apartment', 'Spacious apartment with a sea view', 'Mombasa, Kenya', 80, NOW()),
(2, 'Cozy Cabin Retreat', 'Rustic cabin near the forest', 'Nanyuki, Kenya', 60, NOW()),
(2, 'Modern Studio', 'Minimalist studio in the city center', 'Nairobi, Kenya', 70, NOW());

-- Insert into `booking`
INSERT INTO `booking` (`Property_id`, `user_id`, `Start_date`, `end_date`, `Total_price`, `Status`)
VALUES
(1, 1, '2025-06-01', '2025-06-05', 320, 'confirmed'),
(2, 3, '2025-06-10', '2025-06-12', 120, 'pending'),
(3, 1, '2025-06-15', '2025-06-18', 210, 'canceled');

-- Insert into `payment`
INSERT INTO `payment` (`booking_id`, `Amount`, `Payment_date`, `Payment_method`, `Total_price`, `Status`)
VALUES
(1, 320, '2025-05-25', 'Credit Card', 320, 'confirmed'),
(2, 120, '2025-06-01', 'PayPal', 120, 'pending'),
(3, 210, '2025-06-10', 'Mobile Money', 210, 'canceled');

-- Insert into `review`
INSERT INTO `review` (`Property_id`, `user_id`, `rating`, `comment`)
VALUES
(1, 1, 5, 'Amazing stay, beautiful view and clean apartment.'),
(2, 3, 4, 'Cozy place, great for a weekend getaway.'),
(3, 1, 3, 'Decent location, but could be cleaner.');

-- Insert into `message`
INSERT INTO `message` (`Sender_id`, `Recipient_id`, `Message_body`, `Created_at`)
VALUES
(1, 2, 'Hi Bob, is the Ocean View Apartment available in July?', NOW()),
(2, 1, 'Yes, it is! Feel free to book.', NOW()),
(3, 2, 'Hello, is there parking at the Cabin Retreat?', NOW());
