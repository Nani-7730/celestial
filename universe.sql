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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_million_years numeric NOT NULL,
    no_of_stars integer NOT NULL,
    galaxy_type character varying(255)
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_planet numeric NOT NULL,
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
    name character varying(255) NOT NULL,
    age numeric NOT NULL,
    no_of_moons integer NOT NULL,
    has_life boolean NOT NULL,
    description text,
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
    name character varying(255) NOT NULL,
    has_life boolean NOT NULL,
    age numeric NOT NULL,
    description text,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_galaxy_star_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System.', 13600.00, 100000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way.', 10100.00, 1000000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group of galaxies.', 13600.00, 40000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A classic spiral galaxy with a companion galaxy.', 30000.00, 100000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with a bright central bulge.', 9000.00, 80000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring galaxy with a bright central bulge.', 500.00, 50000, 'Lenticular');
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'A peculiar galaxy with a supermassive black hole.', 13000.00, 50000, 'Elliptical');
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'A giant elliptical galaxy.', 14500.00, 100000, 'Elliptical');


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (1, 'Milky Way - Sun', 1, 1);
INSERT INTO public.galaxy_star VALUES (2, 'Milky Way - Proxima Centauri', 1, 2);
INSERT INTO public.galaxy_star VALUES (3, 'Andromeda - Betelgeuse', 2, 3);
INSERT INTO public.galaxy_star VALUES (4, 'Milky Way - Sirius', 1, 4);
INSERT INTO public.galaxy_star VALUES (5, 'Andromeda - Rigel', 2, 5);
INSERT INTO public.galaxy_star VALUES (6, 'Triangulum - Vega', 3, 6);
INSERT INTO public.galaxy_star VALUES (7, 'Whirlpool - Antares', 4, 7);
INSERT INTO public.galaxy_star VALUES (8, 'Triangulum - Aldebaran', 3, 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.384, 'Earth''s only natural satellite.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.000009, 'One of the two moons of Mars.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.000023, 'One of the two moons of Mars.', 2);
INSERT INTO public.moon VALUES (4, 'Io', 0.422, 'One of Jupiter''s largest moons, known for its volcanic activity.', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 0.671, 'One of Jupiter''s largest moons, with a subsurface ocean.', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1.070, 'The largest moon in the Solar System.', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1.883, 'One of Jupiter''s largest moons, heavily cratered.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1.222, 'Saturn''s largest moon, with a thick atmosphere.', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.527, 'The second-largest moon of Saturn.', 6);
INSERT INTO public.moon VALUES (10, 'Oberon', 0.583, 'One of Uranus'' largest moons.', 7);
INSERT INTO public.moon VALUES (11, 'Triton', 0.355, 'Neptune''s largest moon, with geysers of liquid nitrogen.', 8);
INSERT INTO public.moon VALUES (12, 'Betelgeuse I Moon', 0.500, 'A moon orbiting Betelgeuse I.', 10);
INSERT INTO public.moon VALUES (13, 'Betelgeuse II Moon', 0.800, 'A moon orbiting Betelgeuse II.', 11);
INSERT INTO public.moon VALUES (14, 'Rigel b Moon', 0.400, 'A moon orbiting Rigel b.', 13);
INSERT INTO public.moon VALUES (15, 'Vega b Moon', 0.300, 'A moon orbiting Vega b.', 14);
INSERT INTO public.moon VALUES (16, 'Mimas', 0.185, 'A small moon of Saturn, known for the large Herschel Crater.', 6);
INSERT INTO public.moon VALUES (17, 'Enceladus', 0.238, 'Saturn''s moon with a subsurface ocean and geysers.', 6);
INSERT INTO public.moon VALUES (18, 'Miranda', 0.130, 'One of Uranus'' moons, known for its extreme and varied terrain.', 7);
INSERT INTO public.moon VALUES (19, 'Nereid', 5.513, 'A distant and eccentric moon of Neptune.', 8);
INSERT INTO public.moon VALUES (20, 'Charon', 19.570, 'The largest moon of the dwarf planet Pluto.', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4.5, 1, true, 'The only planet known to support life.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4.6, 2, false, 'The Red Planet with the tallest volcano in the solar system.', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4.5, 0, false, 'A planet with a thick, toxic atmosphere.', 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 4.5, 0, false, 'The smallest planet in our Solar System.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4.6, 79, false, 'The largest planet in our Solar System.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4.5, 82, false, 'A gas giant known for its prominent ring system.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4.5, 27, false, 'An ice giant with a distinct blue-green color.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4.5, 14, false, 'An ice giant and the farthest known planet from the Sun.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 0.01, 0, false, 'An exoplanet orbiting within the habitable zone of Proxima Centauri.', 2);
INSERT INTO public.planet VALUES (10, 'Betelgeuse I', 10.0, 0, false, 'A planet orbiting Betelgeuse.', 3);
INSERT INTO public.planet VALUES (11, 'Betelgeuse II', 10.0, 0, false, 'A planet orbiting Betelgeuse.', 3);
INSERT INTO public.planet VALUES (12, 'Sirius b', 0.24, 0, false, 'A planet orbiting Sirius.', 4);
INSERT INTO public.planet VALUES (13, 'Rigel b', 8.0, 1, false, 'A planet orbiting Rigel.', 5);
INSERT INTO public.planet VALUES (14, 'Vega b', 0.45, 0, false, 'A planet orbiting Vega.', 6);
INSERT INTO public.planet VALUES (15, 'Antares b', 12.0, 0, false, 'A planet orbiting Antares.', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 4.6, 'The star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', false, 4.85, 'The closest known star to the Sun.', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', false, 10.01, 'A red supergiant star in the constellation of Orion.', 2);
INSERT INTO public.star VALUES (4, 'Sirius', false, 0.24, 'The brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (5, 'Rigel', false, 8.01, 'A blue supergiant star in the Orion constellation.', 2);
INSERT INTO public.star VALUES (6, 'Vega', false, 0.45, 'A bright star in the constellation Lyra.', 3);
INSERT INTO public.star VALUES (7, 'Antares', false, 12.1, 'A red supergiant star in the constellation Scorpius.', 4);
INSERT INTO public.star VALUES (8, 'Aldebaran', false, 6.5, 'An orange giant star in the constellation Taurus.', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_galaxy_star_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_name_key UNIQUE (name);


--
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_star_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE SET NULL;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--
