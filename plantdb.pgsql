--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: plants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants (
    common_name character varying(50) NOT NULL,
    scientific_name character varying(100),
    type character varying,
    family character varying,
    native_range character varying,
    height character varying,
    use character varying
);


ALTER TABLE public.plants OWNER TO postgres;

--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants (common_name, scientific_name, type, family, native_range, height, use) FROM stdin;
jackfruit	Artocarpus heterophyllus	Evergreen Tree	Moraceae	India	30.00 to 70.00 feet	Fruits
potato	Solanum tuberosum	Annual Herb	Solanaceae	South America	1.00 to 1.50 feet	Vegetable
rose	Rosa	Perennial Shrub	Rosaceae	Mostly Asia	6.00 to 8.00 feet	Hedge
guava	Psidium guajava	Evergreen Tree	Myrtaceae	South and North America	Upto 30 feet	Fruits
catweed	Ageratina adenophora	Perennial Shrub	Asteraceae	Central America	Upto 6.6 feet	Not Available
lychee	Litchi chinensis	Evergreen Tree	Sapindaceae	Southeastern Asia	20.00 to 30.00 feet	Fruits
barberry	Berberis aristata	Decidious shrub	Berberidaceae	Himalayas	upto 3m	Fruits
mulberry	Morus	Decidious tree	Moraceae	South Asia	upto 24m	Fruits
chestnut	Castanea mollissima	Decidious tree	Fagaceae	Temperate regions of Northern Hemisphere	upto 15m	Fruits
indian_rhododendron	Melastoma malabathricum	Evergreen shrub	Melastomataceae	Southeast Asia	upto 2m	Garden
spearmint	Mentha spicata	Perennial herb	Lamiaceae	Europe and Southeast Asia	30–100 cm	spice, oil
orange	Citrus X sinensis	Decidious tree	Rutaceae	Tropical regions of asia	6 metres	Fruits
\.


--
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (common_name);


--
-- PostgreSQL database dump complete
--

