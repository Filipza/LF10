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

INSERT INTO
    locations (
        depotNr,
        city,
        postalcode,
        street,
        coordinates,
        paperCount,
        whiteGlassCount,
        greenGlassCount,
        brownGlassCount,
        electroCount,
        clothCount,
        rating,
        info
    )
VALUES
    (
        'DC2015',
        'Hamburg',
        22769,
        'Langenfelder Strasse 121',
        POINT(53.56901478232307, 9.9444711430707),
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        'Cox'
    );