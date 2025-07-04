-- Step 1: Create the master (partitioned) table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Add other necessary columns
    -- ...
    CONSTRAINT bookings_user_fk FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT bookings_property_fk FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (start_date);

-- Step 2: Create monthly partitions (example: Jan–Mar 2025)
CREATE TABLE bookings_2025_01 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE bookings_2025_02 PARTITION OF bookings
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE bookings_2025_03 PARTITION OF bookings
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- Add more partitions as needed for other months or years.
