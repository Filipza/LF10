-- enable psql radius extension
CREATE EXTENSION cube;
CREATE EXTENSION earthdistance;

-- create locations table
CREATE TABLE IF NOT EXISTS locations (
    id SERIAL PRIMARY KEY,
    depotNr VARCHAR(15) NOT NULL,
    city TEXT NOT NULL,
    postalcode INT NOT NULL,
    street TEXT NOT NULL,
    coordinates POINT NOT NULL,
    paperCount INT NOT NULL DEFAULT 0,
    whiteGlassCount INT NOT NULL DEFAULT 0,
    greenGlassCount INT NOT NULL DEFAULT 0,
    brownGlassCount INT NOT NULL DEFAULT 0,
    electroCount INT NOT NULL DEFAULT 0,
    clothCount INT NOT NULL DEFAULT 0,
    rating INT,
    info TEXT
);
