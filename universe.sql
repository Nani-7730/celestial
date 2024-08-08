| star_id |             name             | age_in_millions_of_years |                                    description                                     | has_life | galaxy_id |         type         |
+---------+------------------------------+--------------------------+------------------------------------------------------------------------------------+----------+-----------+----------------------+
|       1 | Alpha Centauri A             |                     6000 | Alpha Centauri A is the primary star of the Alpha Centauri star system.            | t        |         1 | G-type main-sequence |
|       2 | Alpha Centauri B             |                     6000 | Alpha Centauri B is a companion star to Alpha Centauri A.                          | t        |         1 | K-type main-sequence |
|       3 | Milky Way Central Black Hole |                    13000 | Sagittarius A* is a supermassive black hole at the center of the Milky Way Galaxy. | f        |         4 | Black hole           |
|       4 | Triangulum Cluster           |                     5000 | A star cluster within the Triangulum Galaxy.                                       | f        |         5 | Open cluster         |
|       5 | Centaurus A Radio Src        |                    12000 | A powerful radio source associated with the galaxy Centaurus A.                    | f        |         6 | Radio galaxy         |
|       6 | Sombrero Galaxy Bulge        |                    13000 | A star in the bulge region of the Sombrero Galaxy.                                 | f        |         7 | Population II star   |
|       7 | Whirlpool Supernova          |                    15000 | A remnant of a supernova explosion in the Whirlpool Galaxy.                        | f        |         8 | Supernova remnant    |
+---------+------------------------------+--------------------------+------------------------------------------------------------------------------------+----------+-----------+----------------------+
(7 rows)

universe=> \d planet
                                                    Table "public.planet"
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
|             Column              |         Type          | Collation | Nullable |                  Default                  |
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id                       | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                            | character varying(30) |           |          |                                           |
| age_in_millions_of_years        | integer               |           |          |                                           |
| distance_from_earth_in_millions | numeric(5,2)          |           |          |                                           |
| description                     | text                  |           |          |                                           |
| has_life                        | boolean               |           |          |                                           |
| star_id                         | integer               |           |          |                                           |
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> INSERT INTO planet (name, age_in_millions_of_years, distance_from_earth_in_millions, description, has_life, star_id)VALUES     ('Proxima Centauri b', 4500, 4.24, 'Proxima Centauri b is an exoplanet orbiting in the habitable zone of Alpha Centauri A.', true, 1),    ('Alpha Centauri Bb', 4500, 4.37, 'Alpha Centauri Bb is a possible exoplanet orbiting the star Alpha Centauri B.', false, 2),    ('Hypothetical Planet A*', 10000, 26000.00, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3),    ('Triangulum Planet 1', 3000, 3000.00, 'A planet within the Triangulum Galaxy.', false, 4),    ('Centaurus A Planet', 7000, 12000.00, 'A planet associated with the galaxy Centaurus A.', false, 5),    ('Sombrero Planet', 9000, 29000.00, 'A planet in the Sombrero Galaxy.', false, 6),    ('Whirlpool Planet', 5000, 23000.00, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7);
ERROR:  numeric field overflow
DETAIL:  A field with precision 5, scale 2 must round to an absolute value less than 10^3.
universe=> INSERT INTO planet (name, age_in_millions_of_years, distance_from_earth_in_millions, description, has_life, star_id)VALUES     ('Proxima Centauri b', 4500, 4.24, 'Proxima Centauri b is an exoplanet orbiting in the habitable zone of Alpha Centauri A.', true, 1),    ('Alpha Centauri Bb', 4500, 4.37, 'Alpha Centauri Bb is a possible exoplanet orbiting the star Alpha Centauri B.', false, 2),    ('Hypothetical Planet A*', 10000, 999.99, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3),    ('Triangulum Planet 1', 3000, 999.99, 'A planet within the Triangulum Galaxy.', false, 4),    ('Centaurus A Planet', 7000, 999.99, 'A planet associated with the galaxy Centaurus A.', false, 5),    ('Sombrero Planet', 9000, 999.99, 'A planet in the Sombrero Galaxy.', false, 6),    ('Whirlpool Planet', 5000, 999.99, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7);
INSERT 0 7
universe=> alter table moon add column planet_id references planet(planet_id);
ERROR:  syntax error at or near "references"
LINE 1: alter table moon add column planet_id references planet(plan...
                                              ^
universe=> alter table moon add column planet_id int references planet(planet_id);
ALTER TABLE
universe=> select * from planet;
+-----------+------------------------+--------------------------+---------------------------------+----------------------------------------------------------------------------------------+----------+---------+
| planet_id |          name          | age_in_millions_of_years | distance_from_earth_in_millions |                                      description                                       | has_life | star_id |
+-----------+------------------------+--------------------------+---------------------------------+----------------------------------------------------------------------------------------+----------+---------+
|         8 | Proxima Centauri b     |                     4500 |                            4.24 | Proxima Centauri b is an exoplanet orbiting in the habitable zone of Alpha Centauri A. | t        |       1 |
|         9 | Alpha Centauri Bb      |                     4500 |                            4.37 | Alpha Centauri Bb is a possible exoplanet orbiting the star Alpha Centauri B.          | f        |       2 |
|        10 | Hypothetical Planet A* |                    10000 |                          999.99 | A hypothetical planet orbiting the supermassive black hole Sagittarius A*.             | f        |       3 |
|        11 | Triangulum Planet 1    |                     3000 |                          999.99 | A planet within the Triangulum Galaxy.                                                 | f        |       4 |
|        12 | Centaurus A Planet     |                     7000 |                          999.99 | A planet associated with the galaxy Centaurus A.                                       | f        |       5 |
|        13 | Sombrero Planet        |                     9000 |                          999.99 | A planet in the Sombrero Galaxy.                                                       | f        |       6 |
|        14 | Whirlpool Planet       |                     5000 |                          999.99 | A planet formed from a supernova remnant in the Whirlpool Galaxy.                      | f        |       7 |
+-----------+------------------------+--------------------------+---------------------------------+----------------------------------------------------------------------------------------+----------+---------+
(7 rows)

universe=> \d moon;
                                                    Table "public.moon"
+----------------------------------+-----------------------+-----------+----------+---------------------------------------+
|              Column              |         Type          | Collation | Nullable |                Default                |
+----------------------------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id                          | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name                             | character varying(30) |           |          |                                       |
| age_in_millions_of_years         | integer               |           |          |                                       |
| distance_from_planet_in_millions | numeric(5,2)          |           |          |                                       |
| description                      | text                  |           |          |                                       |
| planet_id                        | integer               |           |          |                                       |
+----------------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> INSERT INTO moon (name, age_in_millions_of_years, distance_from_planet_in_millions, description, planet_id)VALUES     ('Proxima b Moon 1', 4500, 0.01, 'A moon orbiting Proxima Centauri b.', 8),    ('Proxima b Moon 2', 4500, 0.02, 'A second moon orbiting Proxima Centauri b.', 8),    ('Alpha Centauri Bb Moon', 4500, 0.03, 'A moon orbiting Alpha Centauri Bb.', 9),    ('Hypothetical A* Moon 1', 10000, 0.05, 'A moon orbiting the hypothetical planet around Sagittarius A*.', 10),    ('Hypothetical A* Moon 2', 10000, 0.06, 'A second moon orbiting the hypothetical planet around Sagittarius A*.', 10),    ('Triangulum Moon 1', 3000, 0.07, 'A moon within the Triangulum Galaxy.', 11),    ('Centaurus A Moon', 7000, 0.08, 'A moon associated with the planet in Centaurus A.', 12),    ('Sombrero Moon', 9000, 0.09, 'A moon in the Sombrero Galaxy.', 13),    ('Whirlpool Moon 1', 5000, 0.10, 'A moon formed from a supernova remnant in the Whirlpool Galaxy.', 14),    ('Whirlpool Moon 2', 5000, 0.11, 'A second moon formed from a supernova remnant in the Whirlpool Galaxy.', 14);
INSERT 0 10
universe=> \d galaxy;
                                                 Table "public.galaxy"
+--------------------------+-----------------------+-----------+----------+-------------------------------------------+
|          Column          |         Type          | Collation | Nullable |                  Default                  |
+--------------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id                | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                     | character varying(30) |           |          |                                           |
| age_in_millions_of_years | integer               |           |          |                                           |
| description              | text                  |           |          |                                           |
+--------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> \d planet
                                                    Table "public.planet"
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
|             Column              |         Type          | Collation | Nullable |                  Default                  |
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id                       | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                            | character varying(30) |           |          |                                           |
| age_in_millions_of_years        | integer               |           |          |                                           |
| distance_from_earth_in_millions | numeric(5,2)          |           |          |                                           |
| description                     | text                  |           |          |                                           |
| has_life                        | boolean               |           |          |                                           |
| star_id                         | integer               |           |          |                                           |
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d star
                                                Table "public.star"
+--------------------------+------------------------+-----------+----------+---------------------------------------+
|          Column          |          Type          | Collation | Nullable |                Default                |
+--------------------------+------------------------+-----------+----------+---------------------------------------+
| star_id                  | integer                |           | not null | nextval('star_star_id_seq'::regclass) |
| name                     | character varying(30)  |           |          |                                       |
| age_in_millions_of_years | integer                |           |          |                                       |
| description              | character varying(255) |           |          |                                       |
| has_life                 | boolean                |           |          |                                       |
| galaxy_id                | integer                |           |          |                                       |
| type                     | character varying(30)  |           |          |                                       |
+--------------------------+------------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> \d moon
                                                    Table "public.moon"
+----------------------------------+-----------------------+-----------+----------+---------------------------------------+
|              Column              |         Type          | Collation | Nullable |                Default                |
+----------------------------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id                          | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name                             | character varying(30) |           |          |                                       |
| age_in_millions_of_years         | integer               |           |          |                                       |
| distance_from_planet_in_millions | numeric(5,2)          |           |          |                                       |
| description                      | text                  |           |          |                                       |
| planet_id                        | integer               |           |          |                                       |
+----------------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> alter table galaxy alter name set not null;
ALTER TABLE
universe=> alter table star alter name set not null;
ALTER TABLE
universe=> alter table planet alter name set not null;
ALTER TABLE
universe=> alter table moon alter name set not null;
ALTER TABLE
universe=> alter table galaxy add column galaxy_types;
ERROR:  syntax error at or near ";"
LINE 1: alter table galaxy add column galaxy_types;
                                                  ^
universe=> alter table galaxy add column galaxy_types text;
ALTER TABLE
universe=> INSERT INTO moon (name, age_in_millions_of_years, distance_from_planet_in_millions, description, planet_id)VALUES     ('Proxima b Moon 3', 4500, 0.04, 'A third moon orbiting Proxima Centauri b.', 8),    ('Proxima b Moon 4', 4500, 0.05, 'A fourth moon orbiting Proxima Centauri b.', 8),    ('Alpha Centauri Bb Moon 2', 4500, 0.06, 'A second moon orbiting Alpha Centauri Bb.', 9),    ('Hypothetical A* Moon 3', 10000, 0.12, 'A third moon orbiting the hypothetical planet around Sagittarius A*.', 10),    ('Triangulum Moon 2', 3000, 0.08, 'A second moon within the Triangulum Galaxy.', 11),    ('Triangulum Moon 3', 3000, 0.09, 'A third moon within the Triangulum Galaxy.', 11),    ('Centaurus A Moon 2', 7000, 0.10, 'A second moon associated with the planet in Centaurus A.', 12),    ('Sombrero Moon 2', 9000, 0.11, 'A second moon in the Sombrero Galaxy.', 13),    ('Whirlpool Moon 3', 5000, 0.12, 'A third moon formed from a supernova remnant in the Whirlpool Galaxy.', 14),    ('Whirlpool Moon 4', 5000, 0.13, 'A fourth moon formed from a supernova remnant in the Whirlpool Galaxy.', 14);
INSERT 0 10
universe=> \d planet
                                                    Table "public.planet"
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
|             Column              |         Type          | Collation | Nullable |                  Default                  |
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id                       | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                            | character varying(30) |           | not null |                                           |
| age_in_millions_of_years        | integer               |           |          |                                           |
| distance_from_earth_in_millions | numeric(5,2)          |           |          |                                           |
| description                     | text                  |           |          |                                           |
| has_life                        | boolean               |           |          |                                           |
| star_id                         | integer               |           |          |                                           |
+---------------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> INSERT INTO planet (name, age_in_millions_of_years, distance_from_earth_in_millions, description, has_life, star_id)VALUES     ('Proxima Centauri c', 4500, 4.50, 'Proxima Centauri c is another exoplanet orbiting Alpha Centauri.', false, 1),    ('Alpha Centauri Cc', 4500, 4.60, 'Alpha Centauri Cc is a possible exoplanet orbiting Alpha Centauri C.', false, 2),    ('Sagittarius B Planet', 10000, 10000.00, 'A hypothetical planet orbiting the supermassive black hole Sagittarius B.', false, 3),    ('Triangulum Planet 2', 3000, 4000.00, 'A second planet within the Triangulum Galaxy.', false, 4),    ('Centaurus B Planet', 7000, 15000.00, 'A planet associated with the galaxy Centaurus B.', false, 5),    ('Sombrero Planet 2', 9000, 30000.00, 'A second planet in the Sombrero Galaxy.', false, 6),    ('Whirlpool Planet 2', 5000, 25000.00, 'A second planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7),    ('Proxima Centauri d', 4500, 4.75, 'Proxima Centauri d is another exoplanet orbiting Alpha Centauri.', false, 1),    ('Alpha Centauri Dd', 4500, 4.80, 'Alpha Centauri Dd is a possible exoplanet orbiting Alpha Centauri D.', false, 2),    ('Sagittarius C Planet', 10000, 12000.00, 'A hypothetical planet orbiting the supermassive black hole Sagittarius C.', false, 3);
ERROR:  numeric field overflow
DETAIL:  A field with precision 5, scale 2 must round to an absolute value less than 10^3.
universe=> select * from star;
+---------+------------------------------+--------------------------+------------------------------------------------------------------------------------+----------+-----------+----------------------+
| star_id |             name             | age_in_millions_of_years |                                    description                                     | has_life | galaxy_id |         type         |
+---------+------------------------------+--------------------------+------------------------------------------------------------------------------------+----------+-----------+----------------------+
|       1 | Alpha Centauri A             |                     6000 | Alpha Centauri A is the primary star of the Alpha Centauri star system.            | t        |         1 | G-type main-sequence |
|       2 | Alpha Centauri B             |                     6000 | Alpha Centauri B is a companion star to Alpha Centauri A.                          | t        |         1 | K-type main-sequence |
|       3 | Milky Way Central Black Hole |                    13000 | Sagittarius A* is a supermassive black hole at the center of the Milky Way Galaxy. | f        |         4 | Black hole           |
|       4 | Triangulum Cluster           |                     5000 | A star cluster within the Triangulum Galaxy.                                       | f        |         5 | Open cluster         |
|       5 | Centaurus A Radio Src        |                    12000 | A powerful radio source associated with the galaxy Centaurus A.                    | f        |         6 | Radio galaxy         |
|       6 | Sombrero Galaxy Bulge        |                    13000 | A star in the bulge region of the Sombrero Galaxy.                                 | f        |         7 | Population II star   |
|       7 | Whirlpool Supernova          |                    15000 | A remnant of a supernova explosion in the Whirlpool Galaxy.                        | f        |         8 | Supernova remnant    |
+---------+------------------------------+--------------------------+------------------------------------------------------------------------------------+----------+-----------+----------------------+
(7 rows)

universe=> INSERT INTO planet (name, age_in_millions_of_years, distance_from_earth_in_millions, description, has_life, star_id)VALUES     ('Alpha Centauri A b', 6000, 4.24, 'An exoplanet orbiting Alpha Centauri A.', true, 1),    ('Alpha Centauri A c', 6000, 4.50, 'Another exoplanet orbiting Alpha Centauri A.', false, 1),    ('Alpha Centauri B b', 6000, 4.37, 'An exoplanet orbiting Alpha Centauri B.', true, 2),    ('Alpha Centauri B c', 6000, 4.60, 'Another exoplanet orbiting Alpha Centauri B.', false, 2),    ('Hypothetical Planet A*', 13000, 26000.00, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3),    ('Triangulum Planet X', 5000, 10000.00, 'A planet within the Triangulum Cluster.', false, 4),    ('Centaurus A Planet X', 12000, 15000.00, 'A planet associated with the galaxy Centaurus A.', false, 5),    ('Sombrero Galaxy Planet', 13000, 20000.00, 'A planet in the bulge region of the Sombrero Galaxy.', false, 6),    ('Whirlpool Galaxy Planet', 15000, 25000.00, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7),    ('Alpha Centauri A d', 6000, 4.75, 'A fourth exoplanet orbiting Alpha Centauri A.', false, 1);
ERROR:  numeric field overflow
DETAIL:  A field with precision 5, scale 2 must round to an absolute value less than 10^3.
universe=> INSERT INTO planet (name, age_in_millions_of_years, distance_from_earth_in_millions, description, has_life, star_id)VALUES     ('Alpha Centauri A b', 6000, 4.24, 'An exoplanet orbiting Alpha Centauri A.', true, 1),    ('Alpha Centauri A c', 6000, 4.50, 'Another exoplanet orbiting Alpha Centauri A.', false, 1),    ('Alpha Centauri B b', 6000, 4.37, 'An exoplanet orbiting Alpha Centauri B.', true, 2),    ('Alpha Centauri B c', 6000, 4.60, 'Another exoplanet orbiting Alpha Centauri B.', false, 2),    ('Hypothetical Planet A*', 13000, 999.99, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3),    ('Triangulum Planet X', 5000, 999.99, 'A planet within the Triangulum Cluster.', false, 4),    ('Centaurus A Planet X', 12000, 999.99, 'A planet associated with the galaxy Centaurus A.', false, 5),    ('Sombrero Galaxy Planet', 13000, 999.99, 'A planet in the bulge region of the Sombrero Galaxy.', false, 6),    ('Whirlpool Galaxy Planet', 15000, 999.99, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7),    ('Alpha Centauri A d', 6000, 4.75, 'A fourth exoplanet orbiting Alpha Centauri A.', false, 1);
ERROR:  duplicate key value violates unique constraint "planet_name_key"
DETAIL:  Key (name)=(Hypothetical Planet A*) already exists.
universe=> select * from planet;
+-----------+------------------------+--------------------------+---------------------------------+----------------------------------------------------------------------------------------+----------+---------+
| planet_id |          name          | age_in_millions_of_years | distance_from_earth_in_millions |                                      description                                       | has_life | star_id |
+-----------+------------------------+--------------------------+---------------------------------+----------------------------------------------------------------------------------------+----------+---------+
|         8 | Proxima Centauri b     |                     4500 |                            4.24 | Proxima Centauri b is an exoplanet orbiting in the habitable zone of Alpha Centauri A. | t        |       1 |
|         9 | Alpha Centauri Bb      |                     4500 |                            4.37 | Alpha Centauri Bb is a possible exoplanet orbiting the star Alpha Centauri B.          | f        |       2 |
|        10 | Hypothetical Planet A* |                    10000 |                          999.99 | A hypothetical planet orbiting the supermassive black hole Sagittarius A*.             | f        |       3 |
|        11 | Triangulum Planet 1    |                     3000 |                          999.99 | A planet within the Triangulum Galaxy.                                                 | f        |       4 |
|        12 | Centaurus A Planet     |                     7000 |                          999.99 | A planet associated with the galaxy Centaurus A.                                       | f        |       5 |
|        13 | Sombrero Planet        |                     9000 |                          999.99 | A planet in the Sombrero Galaxy.                                                       | f        |       6 |
|        14 | Whirlpool Planet       |                     5000 |                          999.99 | A planet formed from a supernova remnant in the Whirlpool Galaxy.                      | f        |       7 |
+-----------+------------------------+--------------------------+---------------------------------+----------------------------------------------------------------------------------------+----------+---------+
(7 rows)

universe=> INSERT INTO planet (name, age_in_millions_of_years, distance_from_earth_in_millions, description, has_life, star_id)VALUES     ('Alpha Centauri A e', 6000, 4.85, 'An exoplanet orbiting Alpha Centauri A.', false, 1),    ('Alpha Centauri A f', 6000, 5.00, 'Another exoplanet orbiting Alpha Centauri A.', true, 1),    ('Alpha Centauri B d', 6000, 4.70, 'An exoplanet orbiting Alpha Centauri B.', true, 2),    ('Alpha Centauri B e', 6000, 4.80, 'Another exoplanet orbiting Alpha Centauri B.', false, 2),    ('Black Hole Planet X', 13000, 15000.00, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3),    ('Triangulum Planet Y', 5000, 15000.00, 'A planet within the Triangulum Galaxy.', false, 4),    ('Centaurus A Planet Y', 12000, 20000.00, 'A planet associated with the galaxy Centaurus A.', false, 5),    ('Sombrero Planet X', 13000, 15000.00, 'A planet in the bulge region of the Sombrero Galaxy.', false, 6),    ('Whirlpool Planet X', 15000, 20000.00, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7),    ('Alpha Centauri A g', 6000, 5.10, 'A seventh exoplanet orbiting Alpha Centauri A.', false, 1);
ERROR:  numeric field overflow
DETAIL:  A field with precision 5, scale 2 must round to an absolute value less than 10^3.
universe=> INSERT INTO planet (name, age_in_millions_of_years, distance_from_earth_in_millions, description, has_life, star_id)VALUES     ('Alpha Centauri A e', 6000, 4.85, 'An exoplanet orbiting Alpha Centauri A.', false, 1),    ('Alpha Centauri A f', 6000, 5.00, 'Another exoplanet orbiting Alpha Centauri A.', true, 1),    ('Alpha Centauri B d', 6000, 4.70, 'An exoplanet orbiting Alpha Centauri B.', true, 2),    ('Alpha Centauri B e', 6000, 4.80, 'Another exoplanet orbiting Alpha Centauri B.', false, 2),    ('Black Hole Planet X', 13000, 999.99, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3),    ('Triangulum Planet Y', 5000, 999.99, 'A planet within the Triangulum Galaxy.', false, 4),    ('Centaurus A Planet Y', 12000, 999.99, 'A planet associated with the galaxy Centaurus A.', false, 5),    ('Sombrero Planet X', 13000, 999.99, 'A planet in the bulge region of the Sombrero Galaxy.', false, 6),    ('Whirlpool Planet X', 15000, 999.99, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7),    ('Alpha Centauri A g', 6000, 5.10, 'A seventh exoplanet orbiting Alpha Centauri A.', false, 1);\
INSERT 0 10
invalid command \
Try \? for help.
universe=> create table galaxy_star(galaxy_id int references galaxy(galaxy_id), star_id int references star(star_id));
CREATE TABLE
universe=> \d galaxy_star
               Table "public.galaxy_star"
+-----------+---------+-----------+----------+---------+
|  Column   |  Type   | Collation | Nullable | Default |
+-----------+---------+-----------+----------+---------+
| galaxy_id | integer |           |          |         |
| star_id   | integer |           |          |         |
+-----------+---------+-----------+----------+---------+
Foreign-key constraints:
    "galaxy_star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
    "galaxy_star_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> alter table galaxy_star add primary key(galaxy_id,star_id);
ALTER TABLE
universe=> alter table galaxy_star alter column galaxy_id set not null;
ALTER TABLE
universe=> alter table galaxy_star alter column star_id set not null;
ALTER TABLE
universe=> drop table galaxy_star;
DROP TABLE
universe=> CREATE TABLE asteroid (    asteroid_id SERIAL PRIMARY KEY,    name VARCHAR(50) UNIQUE NOT NULL,    age_in_millions_of_years INTEGER,    diameter NUMERIC(7,2), -- Example of NUMERIC data type    description TEXT,    has_moons BOOLEAN);\
universe(> 
universe(> 
universe(> 
universe=> 
universe=> 
universe=> CREATE TABLE asteroid (    asteroid_id SERIAL PRIMARY KEY,                -- Auto-incrementing primary key    name VARCHAR(50) UNIQUE NOT NULL,             -- Unique and non-null name    age_in_millions_of_years INTEGER,              -- Integer column for age    diameter NUMERIC(7,2),                        -- Numeric column for diameter    description TEXT,                             -- Text column for description    has_moons BOOLEAN                             -- Boolean column for moons);
universe(> 
universe=> 
universe=> 
universe=> CREATE TABLE asteroid (    asteroid_id SERIAL PRIMARY KEY,    name VARCHAR(50) UNIQUE NOT NULL,     age_in_millions_of_years INTEGER,    diameter NUMERIC(7,2),    description TEXT,    has_moons BOOLEAN);
CREATE TABLE
universe=> INSERT INTO asteroid (name, age_in_millions_of_years, diameter, description, has_moons) VALUES    ('Ceres', 4600, 940.00, 'The largest asteroid in the asteroid belt.', true),    ('Vesta', 4600, 525.00, 'A large asteroid in the asteroid belt.', false),    ('Pallas', 5100, 512.00, 'An asteroid located in the asteroid belt.', true),    ('Hygiea', 4500, 430.00, 'A large asteroid with a spherical shape.', false),    ('Eros', 4330, 34.00, 'A near-Earth asteroid.', true);
INSERT 0 5
universe=> 
[2]+  Stopped                 psql --username=freecodecamp --dbname=postgres
camper: /project$ pg_dump -cC --inserts -U freecodecamp universe > universe.sql
camper: /project$ \l
bash: l: command not found
camper: /project$ ls
universe.sql
camper: /project$ cat universe.sql 
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    diameter numeric(7,2),
    description text,
    has_moons boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_types text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_planet_in_millions numeric(5,2),
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_millions numeric(5,2),
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description character varying(255),
    has_life boolean,
    galaxy_id integer,
    type character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 4600, 940.00, 'The largest asteroid in the asteroid belt.', true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 4600, 525.00, 'A large asteroid in the asteroid belt.', false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 5100, 512.00, 'An asteroid located in the asteroid belt.', true);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 4500, 430.00, 'A large asteroid with a spherical shape.', false);
INSERT INTO public.asteroid VALUES (5, 'Eros', 4330, 34.00, 'A near-Earth asteroid.', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 125, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now.', NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 123, 'Two colliding galaxies', NULL);
INSERT INTO public.galaxy VALUES (4, 'Milky Way Galaxy', 13000, 'The Milky Way Galaxy is the galaxy that contains our Solar System.', NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 5000, 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth.', NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A Galaxy', 12000, 'Centaurus A is a prominent galaxy in the constellation of Centaurus.', NULL);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 13000, 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo.', NULL);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool Galaxy', 15000, 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy in the constellation Canes Venatici.', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Proxima b Moon 1', 4500, 0.01, 'A moon orbiting Proxima Centauri b.', 8);
INSERT INTO public.moon VALUES (2, 'Proxima b Moon 2', 4500, 0.02, 'A second moon orbiting Proxima Centauri b.', 8);
INSERT INTO public.moon VALUES (3, 'Alpha Centauri Bb Moon', 4500, 0.03, 'A moon orbiting Alpha Centauri Bb.', 9);
INSERT INTO public.moon VALUES (4, 'Hypothetical A* Moon 1', 10000, 0.05, 'A moon orbiting the hypothetical planet around Sagittarius A*.', 10);
INSERT INTO public.moon VALUES (5, 'Hypothetical A* Moon 2', 10000, 0.06, 'A second moon orbiting the hypothetical planet around Sagittarius A*.', 10);
INSERT INTO public.moon VALUES (6, 'Triangulum Moon 1', 3000, 0.07, 'A moon within the Triangulum Galaxy.', 11);
INSERT INTO public.moon VALUES (7, 'Centaurus A Moon', 7000, 0.08, 'A moon associated with the planet in Centaurus A.', 12);
INSERT INTO public.moon VALUES (8, 'Sombrero Moon', 9000, 0.09, 'A moon in the Sombrero Galaxy.', 13);
INSERT INTO public.moon VALUES (9, 'Whirlpool Moon 1', 5000, 0.10, 'A moon formed from a supernova remnant in the Whirlpool Galaxy.', 14);
INSERT INTO public.moon VALUES (10, 'Whirlpool Moon 2', 5000, 0.11, 'A second moon formed from a supernova remnant in the Whirlpool Galaxy.', 14);
INSERT INTO public.moon VALUES (11, 'Proxima b Moon 3', 4500, 0.04, 'A third moon orbiting Proxima Centauri b.', 8);
INSERT INTO public.moon VALUES (12, 'Proxima b Moon 4', 4500, 0.05, 'A fourth moon orbiting Proxima Centauri b.', 8);
INSERT INTO public.moon VALUES (13, 'Alpha Centauri Bb Moon 2', 4500, 0.06, 'A second moon orbiting Alpha Centauri Bb.', 9);
INSERT INTO public.moon VALUES (14, 'Hypothetical A* Moon 3', 10000, 0.12, 'A third moon orbiting the hypothetical planet around Sagittarius A*.', 10);
INSERT INTO public.moon VALUES (15, 'Triangulum Moon 2', 3000, 0.08, 'A second moon within the Triangulum Galaxy.', 11);
INSERT INTO public.moon VALUES (16, 'Triangulum Moon 3', 3000, 0.09, 'A third moon within the Triangulum Galaxy.', 11);
INSERT INTO public.moon VALUES (17, 'Centaurus A Moon 2', 7000, 0.10, 'A second moon associated with the planet in Centaurus A.', 12);
INSERT INTO public.moon VALUES (18, 'Sombrero Moon 2', 9000, 0.11, 'A second moon in the Sombrero Galaxy.', 13);
INSERT INTO public.moon VALUES (19, 'Whirlpool Moon 3', 5000, 0.12, 'A third moon formed from a supernova remnant in the Whirlpool Galaxy.', 14);
INSERT INTO public.moon VALUES (20, 'Whirlpool Moon 4', 5000, 0.13, 'A fourth moon formed from a supernova remnant in the Whirlpool Galaxy.', 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 4500, 4.24, 'Proxima Centauri b is an exoplanet orbiting in the habitable zone of Alpha Centauri A.', true, 1);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 4500, 4.37, 'Alpha Centauri Bb is a possible exoplanet orbiting the star Alpha Centauri B.', false, 2);
INSERT INTO public.planet VALUES (10, 'Hypothetical Planet A*', 10000, 999.99, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3);
INSERT INTO public.planet VALUES (11, 'Triangulum Planet 1', 3000, 999.99, 'A planet within the Triangulum Galaxy.', false, 4);
INSERT INTO public.planet VALUES (12, 'Centaurus A Planet', 7000, 999.99, 'A planet associated with the galaxy Centaurus A.', false, 5);
INSERT INTO public.planet VALUES (13, 'Sombrero Planet', 9000, 999.99, 'A planet in the Sombrero Galaxy.', false, 6);
INSERT INTO public.planet VALUES (14, 'Whirlpool Planet', 5000, 999.99, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7);
INSERT INTO public.planet VALUES (20, 'Alpha Centauri A e', 6000, 4.85, 'An exoplanet orbiting Alpha Centauri A.', false, 1);
INSERT INTO public.planet VALUES (21, 'Alpha Centauri A f', 6000, 5.00, 'Another exoplanet orbiting Alpha Centauri A.', true, 1);
INSERT INTO public.planet VALUES (22, 'Alpha Centauri B d', 6000, 4.70, 'An exoplanet orbiting Alpha Centauri B.', true, 2);
INSERT INTO public.planet VALUES (23, 'Alpha Centauri B e', 6000, 4.80, 'Another exoplanet orbiting Alpha Centauri B.', false, 2);
INSERT INTO public.planet VALUES (24, 'Black Hole Planet X', 13000, 999.99, 'A hypothetical planet orbiting the supermassive black hole Sagittarius A*.', false, 3);
INSERT INTO public.planet VALUES (25, 'Triangulum Planet Y', 5000, 999.99, 'A planet within the Triangulum Galaxy.', false, 4);
INSERT INTO public.planet VALUES (26, 'Centaurus A Planet Y', 12000, 999.99, 'A planet associated with the galaxy Centaurus A.', false, 5);
INSERT INTO public.planet VALUES (27, 'Sombrero Planet X', 13000, 999.99, 'A planet in the bulge region of the Sombrero Galaxy.', false, 6);
INSERT INTO public.planet VALUES (28, 'Whirlpool Planet X', 15000, 999.99, 'A planet formed from a supernova remnant in the Whirlpool Galaxy.', false, 7);
INSERT INTO public.planet VALUES (29, 'Alpha Centauri A g', 6000, 5.10, 'A seventh exoplanet orbiting Alpha Centauri A.', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 6000, 'Alpha Centauri A is the primary star of the Alpha Centauri star system.', true, 1, 'G-type main-sequence');
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 6000, 'Alpha Centauri B is a companion star to Alpha Centauri A.', true, 1, 'K-type main-sequence');
INSERT INTO public.star VALUES (3, 'Milky Way Central Black Hole', 13000, 'Sagittarius A* is a supermassive black hole at the center of the Milky Way Galaxy.', false, 4, 'Black hole');
INSERT INTO public.star VALUES (4, 'Triangulum Cluster', 5000, 'A star cluster within the Triangulum Galaxy.', false, 5, 'Open cluster');
INSERT INTO public.star VALUES (5, 'Centaurus A Radio Src', 12000, 'A powerful radio source associated with the galaxy Centaurus A.', false, 6, 'Radio galaxy');
INSERT INTO public.star VALUES (6, 'Sombrero Galaxy Bulge', 13000, 'A star in the bulge region of the Sombrero Galaxy.', false, 7, 'Population II star');
INSERT INTO public.star VALUES (7, 'Whirlpool Supernova', 15000, 'A remnant of a supernova explosion in the Whirlpool Galaxy.', false, 8, 'Supernova remnant');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
