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
    name character varying(30) NOT NULL,
    dist_tocenter integer,
    diameter_ly integer,
    size_kpc numeric(4,1),
    shape character varying(30) NOT NULL
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
    name character varying(30),
    associated_to character varying(30),
    gravity_ms2 numeric(10,6),
    discovery_date date,
    synodic_rot character varying(30) NOT NULL,
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
-- Name: more_info_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info_planet (
    more_info_planet_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
    mean_anomaly numeric(4,1),
    satellites integer
);


ALTER TABLE public.more_info_planet OWNER TO freecodecamp;

--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_planet_more_info_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_planet_more_info_planet_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_planet_more_info_planet_id_seq OWNED BY public.more_info_planet.more_info_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    has_cats boolean,
    is_spherical boolean,
    type text NOT NULL,
    which_visible_from_here character varying(30),
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
    galaxy_name character varying(30),
    constellation character varying(30),
    age_myr integer,
    rotation_hour numeric(10,4),
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info_planet more_info_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet ALTER COLUMN more_info_planet_id SET DEFAULT nextval('public.more_info_planet_more_info_planet_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (7, 'Milky Way', 26000, 105700, 30.0, 'spiral');
INSERT INTO public.galaxy VALUES (8, 'Andromeda', 2500000, 260000, 46.6, 'spiral');
INSERT INTO public.galaxy VALUES (9, 'Black Eye', 17290000, 53800, 16.5, 'spiral');
INSERT INTO public.galaxy VALUES (10, 'Cartwheel', 500000000, 150000, 44.2, 'lenticular ring');
INSERT INTO public.galaxy VALUES (11, 'Cigar', 12000000, 37000, 12.5, 'elongated elliptical');
INSERT INTO public.galaxy VALUES (12, 'Pinwheel', 25000000, 170000, 51.9, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 1.622000, '1609-01-01', 'Synchronous', 1);
INSERT INTO public.moon VALUES (4, 'Europa', 'Jupiter', 1.314000, '1610-01-08', 'Synchronous', 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Jupiter', 1.428000, '1660-01-07', 'Synchronous', 4);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Jupiter', 1.235000, '1610-01-07', 'Synchronous', 4);
INSERT INTO public.moon VALUES (7, 'Themisto', 'Jupiter', NULL, '1975-11-30', 'Synchronous', 4);
INSERT INTO public.moon VALUES (8, 'Metis', 'Jupiter', 0.000080, '1979-03-04', 'Synchronous', 4);
INSERT INTO public.moon VALUES (9, 'Adrastea', 'Jupiter', NULL, '1979-07-08', 'Synchronous', 4);
INSERT INTO public.moon VALUES (10, 'Io', 'Jupiter', 1.797000, '1610-01-08', 'Synchronous', 4);
INSERT INTO public.moon VALUES (11, 'Thebe', 'Jupiter', 0.040000, '1979-03-05', 'Synchronous', 4);
INSERT INTO public.moon VALUES (12, 'Ersa', 'Jupiter', NULL, '2018-05-11', 'Synchronous', 4);
INSERT INTO public.moon VALUES (13, 'Himalia', 'Jupiter', 0.062000, '1904-12-03', 'Synchronous', 4);
INSERT INTO public.moon VALUES (14, 'Pandia', 'Jupiter', NULL, '2017-03-23', 'Synchronous', 4);
INSERT INTO public.moon VALUES (15, 'Lysithea', 'Jupiter', NULL, '1938-07-06', 'Synchronous', 4);
INSERT INTO public.moon VALUES (16, 'Elara', 'Jupiter', NULL, '1905-01-05', 'Synchronous', 4);
INSERT INTO public.moon VALUES (17, 'Amalthea', 'Jupiter', 0.020000, '1892-09-09', 'Synchronous', 4);
INSERT INTO public.moon VALUES (18, 'Eirene', 'Jupiter', NULL, '2003-01-01', 'Synchronous', 4);
INSERT INTO public.moon VALUES (19, 'Carpo', 'Jupiter', NULL, '2003-02-25', 'Synchronous', 4);
INSERT INTO public.moon VALUES (20, 'Valetudo', 'Jupiter', NULL, '2016-03-09', 'Synchronous', 4);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 0.005700, '1877-08-18', 'Synchronous', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 0.003000, '1877-08-12', 'Synchronous', 2);


--
-- Data for Name: more_info_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info_planet VALUES (1, 1, 'Earth', 358.6, 1);
INSERT INTO public.more_info_planet VALUES (2, 2, 'Mars', 19.4, 2);
INSERT INTO public.more_info_planet VALUES (3, 3, 'Venus', 50.2, 0);
INSERT INTO public.more_info_planet VALUES (4, 4, 'Jupiter', 20.0, 95);
INSERT INTO public.more_info_planet VALUES (5, 5, 'Neptune', 259.9, 16);
INSERT INTO public.more_info_planet VALUES (6, 6, 'Mercury', 174.2, 0);
INSERT INTO public.more_info_planet VALUES (7, 7, 'Uranus', 142.2, 28);
INSERT INTO public.more_info_planet VALUES (8, 8, 'Saturn', 317.0, 146);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 'Terrestrial', 'Sun', 20);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 'Terrestrial', 'Sun', 20);
INSERT INTO public.planet VALUES (3, 'Venus', false, true, 'Terrestrial', 'Sun', 20);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, true, 'Gas giant', 'Sun', 20);
INSERT INTO public.planet VALUES (5, 'Neptune', false, true, 'Ice giant', 'Sun', 20);
INSERT INTO public.planet VALUES (6, 'Mercury', false, true, 'Terrestrial', 'Sun', 20);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 'Ice giant', 'Sun', 20);
INSERT INTO public.planet VALUES (8, 'Saturn', false, true, 'Gas giant', 'Sun', 20);
INSERT INTO public.planet VALUES (9, 'Kepler 10b', false, true, 'Terrestrial', 'Vega', 19);
INSERT INTO public.planet VALUES (10, 'Kepler 20b', false, true, 'Terrestrial', 'Vega', 19);
INSERT INTO public.planet VALUES (11, 'Kepler 76b', false, true, 'Gas giant', 'Vega', 19);
INSERT INTO public.planet VALUES (12, 'Kepler 102', false, true, 'Terrestrial', 'Vega', 19);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (19, 'Vega', 'Milky Way', 'Lyra', 455, 16.5000, 7);
INSERT INTO public.star VALUES (20, 'Sun', 'Milky Way', NULL, 4600, 601.2000, 7);
INSERT INTO public.star VALUES (21, 'Alpheratz', 'Andromeda', 'Andromeda', 60, 57.1668, 8);
INSERT INTO public.star VALUES (22, 'Mirach', 'Andromeda', 'Andromeda', NULL, 189600.0000, 8);
INSERT INTO public.star VALUES (23, 'Alioth', 'Cigar', 'Ursa Major', 300, 122.4000, 11);
INSERT INTO public.star VALUES (24, 'Merak', 'Cigar', 'Ursa Major', 500, NULL, 11);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_planet_more_info_planet_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 24, true);


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
-- Name: more_info_planet more_info_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT more_info_planet_name_key UNIQUE (name);


--
-- Name: more_info_planet more_info_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT more_info_planet_pkey PRIMARY KEY (more_info_planet_id);


--
-- Name: planet name_plan_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_plan_unq UNIQUE (name);


--
-- Name: star name_star_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star_unq UNIQUE (name);


--
-- Name: galaxy name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unq UNIQUE (name);


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
-- Name: more_info_planet more_info_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT more_info_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

