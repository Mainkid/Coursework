--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2021-02-23 19:42:28

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

--
-- TOC entry 2996 (class 0 OID 41430)
-- Dependencies: 201
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stats (id, successfully, failed) FROM stdin;
1	0	0
\.


--
-- TOC entry 2995 (class 0 OID 41423)
-- Dependencies: 200
-- Data for Name: telegram_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telegram_users ("user") FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 41471)
-- Dependencies: 203
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (token) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 202
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stats_id_seq', 45, true);


-- Completed on 2021-02-23 19:42:30

--
-- PostgreSQL database dump complete
--

