CREATE TYPE LOCATION_TYPE AS ENUM ('Altglas', 'Altkleider', 'Altpapier', 'Elektrokleingeräte', 'Recyclinghof');

CREATE TABLE IF NOT EXISTS locations (
    id SERIAL PRIMARY KEY,
    address JSON NOT NULL,
    coordinates POINT NOT NULL,
    type LOCATION_TYPE NOT NULL,
    rating INT,
    info TEXT
);

INSERT INTO locations (address, coordinates, type) VALUES (
    '{"street": "Baumeisterstraße 17","postalcode": 20099,"city": "Hamburg"}',
    POINT(53.55512071027223, 10.010559453442404),
    'Altglas'
);