--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    has_life boolean DEFAULT false NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days numeric(8,2) NOT NULL,
    is_tidally_locked boolean DEFAULT true NOT NULL,
    has_water boolean DEFAULT false NOT NULL,
    notes text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_info (
    moon_info_id integer NOT NULL,
    name character varying(100) NOT NULL,
    moon_id integer NOT NULL,
    discovered_year integer NOT NULL,
    is_confirmed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.moon_info OWNER TO freecodecamp;

--
-- Name: moon_info_moon_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_info_moon_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_info_moon_info_id_seq OWNER TO freecodecamp;

--
-- Name: moon_info_moon_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_info_moon_info_id_seq OWNED BY public.moon_info.moon_info_id;


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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    orbital_period_days integer NOT NULL,
    distance_from_star_au numeric(10,3),
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    mass_solar numeric(10,3),
    is_main_sequence boolean DEFAULT true NOT NULL,
    description text
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_info moon_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info ALTER COLUMN moon_info_id SET DEFAULT nextval('public.moon_info_moon_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, false, 'Nearest major spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2730000.00, false, 'Third largest member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 13250, 29350000.00, false, 'Bright nucleus and large central bulge');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400, 23160000.00, false, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13240, 53500000.00, false, 'Supergiant elliptical galaxy with a supermassive black hole');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27.32, true, true, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.32, true, false, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.26, true, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 1.77, true, false, 'Most volcanically active body in Solar System');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, 3.55, true, true, 'Subsurface ocean beneath icy crust');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 7.15, true, true, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 16.69, true, true, 'Heavily cratered outer Galilean moon');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83, 0.50, true, false, 'Inner irregular moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 85, 250.56, false, false, 'Largest irregular moon of Jupiter');
INSERT INTO public.moon VALUES (10, 'Titan', 6, 2574, 15.95, true, true, 'Thick atmosphere and liquid methane lakes');
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 252, 1.37, true, true, 'Cryovolcanic plumes from subsurface ocean');
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 198, 0.94, true, true, 'Known for large Herschel crater');
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 763, 4.52, true, true, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 734, 79.32, true, false, 'Two-tone coloration');
INSERT INTO public.moon VALUES (15, 'Dione', 6, 561, 2.74, true, true, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (16, 'Tethys', 6, 531, 1.89, true, true, 'Large Odysseus impact crater');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 235, 1.41, true, true, 'Extreme cliff topography on Uranus');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 578, 2.52, true, true, 'Brightest moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 584, 4.14, true, false, 'Darkest major moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353, 5.88, true, true, 'Retrograde orbit, likely captured Kuiper Belt object');


--
-- Data for Name: moon_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_info VALUES (1, 'Luna Observation', 1, 1609, true);
INSERT INTO public.moon_info VALUES (2, 'Europa Ocean Study', 5, 1610, true);
INSERT INTO public.moon_info VALUES (3, 'Titan Atmosphere Study', 10, 1655, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88, 0.387, false, true, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225, 0.723, false, true, 'Hottest planet with a thick CO2 atmosphere');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365, 1.000, true, true, 'Only known astronomical object harboring life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687, 1.524, false, true, 'The Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4333, 5.204, false, true, 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 10759, 9.582, false, true, 'Famous for its extensive ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 30687, 19.201, false, true, 'Rotates nearly on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 60190, 30.047, false, true, 'Distant blue ice giant');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Exoplanet', 11, 0.049, false, true, 'Orbits within the habitable zone of Proxima Centauri');
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, 'Super-Earth', 1928, 1.489, false, true, 'Distant companion to Proxima Centauri');
INSERT INTO public.planet VALUES (11, 'Sirius b-1', 3, 'Exoplanet', 120, 0.540, false, true, 'Model exoplanet orbiting Sirius A');
INSERT INTO public.planet VALUES (12, 'Andromeda p-1', 5, 'Gas Giant', 850, 2.100, false, true, 'Model exoplanet in Andromeda');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, 1.000, true, 'G-type main-sequence star at the center of our Solar System');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4500, 3042, 0.122, true, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 242, 9940, 2.063, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (4, 'Vega', 1, 455, 9602, 2.135, true, 'Bright star in the constellation Lyra');
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 60, 13800, 3.800, true, 'Brightest star in Andromeda');
INSERT INTO public.star VALUES (6, 'Mirach', 2, 1000, 3842, 3.500, false, 'Red giant star in Andromeda');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_info_moon_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_info_moon_info_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon_info moon_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_name_key UNIQUE (name);


--
-- Name: moon_info moon_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_pkey PRIMARY KEY (moon_info_id);


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
-- Name: moon_info moon_info_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_info
    ADD CONSTRAINT moon_info_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

