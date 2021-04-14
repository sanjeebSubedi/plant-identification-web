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
-- Name: characteristics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characteristics (
    id integer NOT NULL,
    common_name character varying,
    feature character varying
);


ALTER TABLE public.characteristics OWNER TO postgres;

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
    use character varying,
    cultivation character varying,
    problems character varying
);


ALTER TABLE public.plants OWNER TO postgres;

--
-- Data for Name: characteristics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characteristics (id, common_name, feature) FROM stdin;
1	guava	Guava has a slender trunk with smooth green to red-brown bark.
2	guava	The fruit is oval in shape and green to yellow in color. The flesh inside can be white, yellow, pink or red in color and contains numerous yellowish seeds.
3	guava	The plant possesses oval or elliptical leaves which are smooth on the upper surface and hairy on the lower surface.
4	catweed	The small compound flowers occur in late spring and summer, and are found in clusters at the end of branches.
5	catweed	The plant can spread vegetatively, that is the stems can sprout roots and grow upon contact with earth.
6	catweed	It is toxic to horses, who develop respiratory disease after eating it.
7	potato	Potato is a cool-season vegetable that ranks with wheat and rice as one of the most important staples in the human diet.
8	potato	There are more than 100 varieties of potatoes currently under cultivation, ranging from finger-sized tubers to tubers of such magnitude that one can feed a family.
9	potato	Colors of flesh include white, gray, golden, pink, deep yellow, and even a rich purple-blue.
10	jackfruit	This attractive large tree has glossy, dark green leaves and produces a very large, oval shaped, rather unusual looking segmented (spiked) fruit.
11	jackfruit	The skin of the fruit must be peeled to reveal the succulent, yellow to orange colored pulp.
12	jackfruit	Fruit may be used fresh, fried green, pickled or roasted (seeds).
13	lychee	Lychee is an excellent fresh fruit with a pleasant, sweet flavor.
14	lychee	Fruit are a relatively small (about the size of a typical strawberry), round to oval, and borne in loose clusters.
15	lychee	Lychee trees are attractive having a dense, rounded, symmetrical canopy of dark green foliage.
16	rose	Rosa is a genus of about 150 species of deciduous (occasionally evergreen) shrubs and climbers noted for their beautiful, often fragrant, single, semidouble or double flowers
17	rose	They are harvested and cut when in bud, and held in refrigerated conditions until ready for display at their point of sale.
\.


--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants (common_name, scientific_name, type, family, native_range, height, use, cultivation, problems) FROM stdin;
barberry	Berberis aristata	Decidious shrub	Berberidaceae	Himalayas	upto 3m	Fruits	\N	\N
mulberry	Morus	Decidious tree	Moraceae	South Asia	upto 24m	Fruits	\N	\N
chestnut	Castanea mollissima	Decidious tree	Fagaceae	Temperate regions of Northern Hemisphere	upto 15m	Fruits	\N	\N
indian_rhododendron	Melastoma malabathricum	Evergreen shrub	Melastomataceae	Southeast Asia	upto 2m	Garden	\N	\N
spearmint	Mentha spicata	Perennial herb	Lamiaceae	Europe and Southeast Asia	30–100 cm	spice, oil	\N	\N
orange	Citrus X sinensis	Decidious tree	Rutaceae	Tropical regions of asia	6 metres	Fruits	\N	\N
catweed	Ageratina adenophora	Perennial Shrub	Asteraceae	Central America	Upto 6.6 feet	Not Available	It has threatened the native biodiversity of many regions.	No serious insect or disease problem.
guava	Psidium guajava	Evergreen Tree	Myrtaceae	South and North America	Upto 30 feet	Fruits	Guava is mainly grown in the tropics and will tolerate temperatures between 15 and 45°C.	Guavas are subject to several fungal and bacterial diseases as well as rust, pests and guava weevil.
jackfruit	Artocarpus heterophyllus	Evergreen Tree	Moraceae	India	30.00 to 70.00 feet	Fruits	Jackfruit must be planted in flood free, well-drained soils.	No serious insect or disease problems.
lychee	Litchi chinensis	Evergreen Tree	Sapindaceae	Southeastern Asia	20.00 to 30.00 feet	Fruits	Plant in sunny, well drained sites, preferably where there is some protection from wind.	Lychee trees do not acclimate to cold temperatures after exposure to cool, nonfreezing temperatures.
potato	Solanum tuberosum	Annual Herb	Solanaceae	South America	1.00 to 1.50 feet	Vegetable	Potatoes can be grown in the garden, in tubs, half whiskey barrels, horticultural fabric bags and other large containers - use your imagination!	Beetles, wireworms, and leafhoppers can reduce yields substantially. Potatoes are subject to several fungal, bacterial and viral diseases. If diseases occur, remove and destroy all affected plants.
rose	Rosa	Perennial Shrub	Rosaceae	Mostly Asia	6.00 to 8.00 feet	Hedge	Best grown in organically rich, medium moisture, well-drained loams in full sun.	Roses are generally susceptible to a large number of disease problems, the most common of which are black spot, powdery mildew and rust.
\.


--
-- Name: characteristics characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characteristics
    ADD CONSTRAINT characteristics_pkey PRIMARY KEY (id);


--
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (common_name);


--
-- PostgreSQL database dump complete
--

