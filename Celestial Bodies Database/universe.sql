--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    galaxy_types character varying(40),
    average_size_in_light_year numeric,
    supernova_seen boolean
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
-- Name: list_of_supernovae; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.list_of_supernovae (
    list_of_supernovae_id integer NOT NULL,
    name character varying(40) NOT NULL,
    supernovae_types character varying(40),
    comments text,
    in_milky_way boolean,
    galaxy_id integer
);


ALTER TABLE public.list_of_supernovae OWNER TO freecodecamp;

--
-- Name: list_of_supernovae_list_of_supernovae_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.list_of_supernovae_list_of_supernovae_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_of_supernovae_list_of_supernovae_id_seq OWNER TO freecodecamp;

--
-- Name: list_of_supernovae_list_of_supernovae_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.list_of_supernovae_list_of_supernovae_id_seq OWNED BY public.list_of_supernovae.list_of_supernovae_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    average_diameter_in_km integer,
    orbital_period_in_days numeric,
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
    name character varying(40) NOT NULL,
    density_in_g_per_cm3 numeric,
    number_of_moons integer,
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
    name character varying(40) NOT NULL,
    age_in_millions_of_years numeric,
    solar_mass numeric,
    surface_temperature_in_k numeric,
    distance_from_earth_in_light_year numeric,
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
-- Name: list_of_supernovae list_of_supernovae_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.list_of_supernovae ALTER COLUMN list_of_supernovae_id SET DEFAULT nextval('public.list_of_supernovae_list_of_supernovae_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Sombrero', 'elliptical', 49000, false);
INSERT INTO public.galaxy VALUES (2, 'Sculptor', 'intermediate spiral', 90000, false);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'barred spiral', 87400, true);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'barred spiral', 152000, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'grand design spiral', 96000, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'spiral', 53800, false);


--
-- Data for Name: list_of_supernovae; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.list_of_supernovae VALUES (1, 'SN 185', 'Ia', '', true, 3);
INSERT INTO public.list_of_supernovae VALUES (2, 'SN 386', 'II', '', true, 3);
INSERT INTO public.list_of_supernovae VALUES (3, 'SN 393', 'II/Ib', '', true, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mimas', 396, 0.9, 3);
INSERT INTO public.moon VALUES (2, 'Enceladus', 504, 1.4, 3);
INSERT INTO public.moon VALUES (3, 'Tethys', 1062, 1.9, 3);
INSERT INTO public.moon VALUES (4, 'Dione', 1123, 2.7, 3);
INSERT INTO public.moon VALUES (5, 'Rhea', 1527, 4.5, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 5149, 16, 3);
INSERT INTO public.moon VALUES (7, 'Iapetus', 1470, 79, 3);
INSERT INTO public.moon VALUES (8, 'Cordelia', 40, 0.335, 4);
INSERT INTO public.moon VALUES (9, 'Ophelia', 43, 0.376, 4);
INSERT INTO public.moon VALUES (10, 'Bianca', 51, 0.434, 4);
INSERT INTO public.moon VALUES (11, 'Cressida', 80, 0.463, 4);
INSERT INTO public.moon VALUES (12, 'Desdemona', 64, 0.473, 4);
INSERT INTO public.moon VALUES (13, 'Juliet', 94, 0.493, 4);
INSERT INTO public.moon VALUES (14, 'Portia', 135, 0.513, 4);
INSERT INTO public.moon VALUES (15, 'Naiad', 60, 0.2944, 5);
INSERT INTO public.moon VALUES (16, 'Thalassa', 81, 0.3115, 5);
INSERT INTO public.moon VALUES (17, 'Despina', 156, 0.3346, 5);
INSERT INTO public.moon VALUES (18, 'Galatea', 175, 0.4287, 5);
INSERT INTO public.moon VALUES (19, 'Larissa', 194, 0.5555, 5);
INSERT INTO public.moon VALUES (20, 'Hippocamp', 35, 0.9500, 5);
INSERT INTO public.moon VALUES (21, 'Proteus', 420, 1.1223, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5.43, 0, 1);
INSERT INTO public.planet VALUES (2, 'Earth', 5.52, 1, 1);
INSERT INTO public.planet VALUES (3, 'Saturn', 0.7, 83, 1);
INSERT INTO public.planet VALUES (4, 'Uranus', 1.3, 27, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 1.76, 14, 1);
INSERT INTO public.planet VALUES (6, 'Andro-P-21', NULL, NULL, 4);
INSERT INTO public.planet VALUES (7, 'Andro-P-52', NULL, NULL, 4);
INSERT INTO public.planet VALUES (8, 'Andro-P-1', NULL, NULL, 4);
INSERT INTO public.planet VALUES (9, 'Andro-P-2', NULL, NULL, 4);
INSERT INTO public.planet VALUES (10, 'Andro-R-201', NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'Andro-R-77', NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Andro-R-85', NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 1, 5572, 0.0000158137, 3);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4850, 0.1221, 3042, 4.2465, 3);
INSERT INTO public.star VALUES (3, 'Epsilon Eridani', 600, 0.82, 5084, 10.475, 3);
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 60, 3.8, 13800, 97, 4);
INSERT INTO public.star VALUES (5, 'HD 8673', 1500, 1.36, 6340, 124.5, 4);
INSERT INTO public.star VALUES (6, '7 Andromedae', 1120, 1.6, 7380, 79.6, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: list_of_supernovae_list_of_supernovae_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.list_of_supernovae_list_of_supernovae_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


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
-- Name: list_of_supernovae list_of_supernovae_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.list_of_supernovae
    ADD CONSTRAINT list_of_supernovae_name_key UNIQUE (name);


--
-- Name: list_of_supernovae list_of_supernovae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.list_of_supernovae
    ADD CONSTRAINT list_of_supernovae_pkey PRIMARY KEY (list_of_supernovae_id);


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
-- Name: list_of_supernovae list_of_supernovae_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.list_of_supernovae
    ADD CONSTRAINT list_of_supernovae_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

