--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2020-12-28 22:28:04

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
-- TOC entry 204 (class 1259 OID 16435)
-- Name: career; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career (
    id integer NOT NULL,
    id_career integer NOT NULL,
    group_id integer,
    company text,
    country_id integer,
    city_id integer,
    fromc integer,
    until integer,
    "position" text
);


ALTER TABLE public.career OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16483)
-- Name: chairs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chairs (
    id_chair integer NOT NULL,
    chair text
);


ALTER TABLE public.chairs OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16443)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id_city integer NOT NULL,
    title text
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16467)
-- Name: connections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connections (
    id_connection integer NOT NULL,
    social_network text
);


ALTER TABLE public.connections OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16430)
-- Name: counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counters (
    id integer NOT NULL,
    albums integer,
    videos integer,
    audios integer,
    photos integer,
    notes integer,
    friends integer,
    groups integer,
    online_friends integer,
    mutual_friends integer,
    user_videos integer,
    followers integer,
    pages integer
);


ALTER TABLE public.counters OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16451)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id_country integer NOT NULL,
    title text
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16499)
-- Name: faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculties (
    id_faculty integer NOT NULL,
    faculty_name text
);


ALTER TABLE public.faculties OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16512)
-- Name: military; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.military (
    id integer NOT NULL,
    id_num_military integer NOT NULL,
    unit_id integer,
    country_id integer,
    fromc integer,
    until integer
);


ALTER TABLE public.military OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16625)
-- Name: object_comment_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_comment_attachments (
    id_object integer NOT NULL,
    id_comment integer NOT NULL,
    id integer NOT NULL,
    id_attachment_num integer NOT NULL,
    attachment_url text,
    type text,
    object_type text NOT NULL
);


ALTER TABLE public.object_comment_attachments OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24822)
-- Name: object_comment_liked; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_comment_liked (
    id integer NOT NULL,
    id_object integer NOT NULL,
    id_comment integer NOT NULL,
    id_liked_user integer NOT NULL,
    object_type text NOT NULL
);


ALTER TABLE public.object_comment_liked OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16615)
-- Name: object_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_comments (
    id_comment integer NOT NULL,
    id_object integer NOT NULL,
    id_from integer,
    date date,
    text text,
    reply_to_user integer,
    reply_to_comment integer,
    parent_stack integer,
    date_of_collection timestamp without time zone,
    id integer NOT NULL,
    object_type text NOT NULL
);


ALTER TABLE public.object_comments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24837)
-- Name: object_liked; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object_liked (
    id integer NOT NULL,
    id_object integer NOT NULL,
    id_liked_user integer NOT NULL,
    object_type text NOT NULL
);


ALTER TABLE public.object_liked OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16575)
-- Name: school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school (
    id_school integer NOT NULL,
    title text
);


ALTER TABLE public.school OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16520)
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit (
    unit_id integer NOT NULL,
    title text
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16491)
-- Name: universities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universities (
    id_university integer NOT NULL,
    university_name text
);


ALTER TABLE public.universities OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16417)
-- Name: userDataTable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userDataTable" (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    deactivated integer,
    is_closed boolean,
    can_access_closed boolean,
    about character varying,
    activities character varying,
    bdate date,
    books character varying,
    can_post boolean,
    can_see_all_posts boolean,
    can_see_audio boolean,
    can_send_friend_request boolean,
    can_write_private_message boolean,
    city_id integer,
    mobile_phone character varying,
    home_phone character varying,
    country_id integer,
    domain character varying,
    friend_status integer,
    games character varying,
    has_mobile boolean,
    has_photo boolean,
    home_town character varying,
    interests character varying,
    is_favorite boolean,
    is_friend boolean,
    is_hidden_from_feed boolean,
    last_seen_time timestamp without time zone,
    last_seen_platform integer,
    maiden_name character varying,
    movies character varying,
    music character varying,
    nickname character varying,
    online boolean,
    photo_50 character varying,
    photo_100 character varying,
    photo_200_orig character varying,
    photo_200 character varying,
    photo_400_orig character varying,
    photo_id integer,
    photo_max character varying,
    photo_max_orig character varying,
    quotes character varying,
    screen_name character varying,
    sex integer,
    site character varying,
    status character varying,
    timezone integer,
    trending boolean,
    verified boolean,
    wall_default boolean,
    political integer,
    religion character varying,
    inspired_by character varying,
    people_main integer,
    life_main integer,
    smoking integer,
    alcohol integer,
    relation_type integer,
    "relation_partner_ID" integer,
    "Date_of_Collection" timestamp without time zone
);


ALTER TABLE public."userDataTable" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16415)
-- Name: userDataTable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."userDataTable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userDataTable_id_seq" OWNER TO postgres;

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 201
-- Name: userDataTable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."userDataTable_id_seq" OWNED BY public."userDataTable".id;


--
-- TOC entry 207 (class 1259 OID 16459)
-- Name: user_connections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_connections (
    id integer NOT NULL,
    id_connection integer NOT NULL,
    login text,
    exports boolean
);


ALTER TABLE public.user_connections OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: user_data_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_data_table (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    deactivated integer,
    is_closed boolean,
    can_access_closed boolean,
    about text,
    activities text,
    bdate date,
    blacklisted boolean,
    blacklisted_by_me boolean,
    books text,
    can_post boolean,
    can_see_all_posts boolean,
    can_see_audio boolean,
    can_send_friend_request boolean,
    can_write_private_message boolean,
    city_id integer,
    mobile_phone text,
    home_phone text,
    counter_pages integer,
    country_id integer,
    domain text,
    friend_status integer,
    games text,
    has_mobile boolean,
    has_photo boolean,
    home_town text,
    interests text,
    is_favorite boolean,
    is_friend boolean,
    is_hidden_from_feed boolean,
    last_seen_platform integer,
    maiden_name text,
    movies text,
    music text,
    nickname text,
    online boolean,
    photo_50 text,
    photo_100 text,
    photo_200_orig text,
    photo_200 text,
    photo_400_orig text,
    photo_id integer,
    photo_max text,
    photo_max_orig text,
    quotes text,
    screen_name text,
    sex integer,
    site text,
    status text,
    timezone integer,
    trending boolean,
    verified boolean,
    wall_default boolean,
    political integer,
    religion text,
    inspired_by text,
    people_main integer,
    life_main integer,
    smoking integer,
    alcohol integer,
    relation_type integer,
    "relation_partner_ID" integer,
    "Date_of_Collection" timestamp without time zone,
    last_seen_time timestamp without time zone
);


ALTER TABLE public.user_data_table OWNER TO postgres;

--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE user_data_table; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.user_data_table IS 'Хранит информацию о пользователе
';


--
-- TOC entry 213 (class 1259 OID 16507)
-- Name: user_friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_friends (
    id integer NOT NULL,
    id_friend integer NOT NULL
);


ALTER TABLE public.user_friends OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16633)
-- Name: user_occupation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_occupation (
    id integer NOT NULL,
    type text,
    id_occupation integer,
    name text
);


ALTER TABLE public.user_occupation OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 33009)
-- Name: user_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_photos (
    id integer NOT NULL,
    id_photo integer NOT NULL,
    album_id integer,
    text text,
    date date,
    url text,
    owner_id integer,
    post_id integer
);


ALTER TABLE public.user_photos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16558)
-- Name: user_relatives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_relatives (
    id integer NOT NULL,
    id_num_relative integer NOT NULL,
    id_user integer,
    name text,
    type text
);


ALTER TABLE public.user_relatives OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16567)
-- Name: user_school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_school (
    id integer NOT NULL,
    id_num_school integer NOT NULL,
    id_school integer,
    id_country integer,
    id_city integer,
    name text,
    year_from integer,
    year_to integer,
    year_graduated integer,
    classc text,
    speciality text,
    type integer
);


ALTER TABLE public.user_school OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16475)
-- Name: user_university; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_university (
    id integer NOT NULL,
    id_num_university integer NOT NULL,
    id_university integer,
    id_faculty integer,
    graduation integer,
    id_chair integer,
    education_form text,
    education_status text
);


ALTER TABLE public.user_university OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16599)
-- Name: user_wall_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_wall_posts (
    id_wallpost integer NOT NULL,
    id integer NOT NULL,
    id_from integer,
    date date,
    text text,
    reply_owner_id integer,
    reply_post_id integer,
    friends_only boolean,
    comments_count integer,
    copyright text,
    likes_count integer,
    like_user_likes boolean,
    reposts_count integer,
    views integer,
    post_type text,
    geo_type text,
    geo_coordinates text,
    id_place integer,
    is_pinned boolean,
    date_of_collection timestamp without time zone,
    post_source_type text,
    post_source_platform text,
    post_source_data text,
    post_source_url text
);


ALTER TABLE public.user_wall_posts OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16607)
-- Name: wall_post_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wall_post_attachments (
    id_wall_post integer NOT NULL,
    id integer NOT NULL,
    id_attachment_num integer NOT NULL,
    attachment_url text,
    type text
);


ALTER TABLE public.wall_post_attachments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24856)
-- Name: wall_post_comment_reposted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wall_post_comment_reposted (
    id integer NOT NULL,
    id_wallpost integer NOT NULL,
    id_comment integer NOT NULL,
    id_reposted_user integer NOT NULL
);


ALTER TABLE public.wall_post_comment_reposted OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24851)
-- Name: wall_post_reposted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wall_post_reposted (
    id integer NOT NULL,
    id_wallpost integer NOT NULL,
    id_reposted_user integer NOT NULL
);


ALTER TABLE public.wall_post_reposted OWNER TO postgres;

--
-- TOC entry 2982 (class 2604 OID 16420)
-- Name: userDataTable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userDataTable" ALTER COLUMN id SET DEFAULT nextval('public."userDataTable_id_seq"'::regclass);


--
-- TOC entry 3174 (class 0 OID 16435)
-- Dependencies: 204
-- Data for Name: career; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.career (id, id_career, group_id, company, country_id, city_id, fromc, until, "position") FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 16483)
-- Dependencies: 210
-- Data for Name: chairs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chairs (id_chair, chair) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 16443)
-- Dependencies: 205
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id_city, title) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 16467)
-- Dependencies: 208
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connections (id_connection, social_network) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 16430)
-- Dependencies: 203
-- Data for Name: counters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counters (id, albums, videos, audios, photos, notes, friends, groups, online_friends, mutual_friends, user_videos, followers, pages) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 16451)
-- Dependencies: 206
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id_country, title) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 16499)
-- Dependencies: 212
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculties (id_faculty, faculty_name) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 16512)
-- Dependencies: 214
-- Data for Name: military; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.military (id, id_num_military, unit_id, country_id, fromc, until) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 16625)
-- Dependencies: 222
-- Data for Name: object_comment_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.object_comment_attachments (id_object, id_comment, id, id_attachment_num, attachment_url, type, object_type) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 24822)
-- Dependencies: 224
-- Data for Name: object_comment_liked; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.object_comment_liked (id, id_object, id_comment, id_liked_user, object_type) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 16615)
-- Dependencies: 221
-- Data for Name: object_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.object_comments (id_comment, id_object, id_from, date, text, reply_to_user, reply_to_comment, parent_stack, date_of_collection, id, object_type) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 24837)
-- Dependencies: 225
-- Data for Name: object_liked; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.object_liked (id, id_object, id_liked_user, object_type) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 16575)
-- Dependencies: 218
-- Data for Name: school; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.school (id_school, title) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 16520)
-- Dependencies: 215
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unit (unit_id, title) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 16491)
-- Dependencies: 211
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universities (id_university, university_name) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 16417)
-- Dependencies: 202
-- Data for Name: userDataTable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userDataTable" (id, first_name, last_name, deactivated, is_closed, can_access_closed, about, activities, bdate, books, can_post, can_see_all_posts, can_see_audio, can_send_friend_request, can_write_private_message, city_id, mobile_phone, home_phone, country_id, domain, friend_status, games, has_mobile, has_photo, home_town, interests, is_favorite, is_friend, is_hidden_from_feed, last_seen_time, last_seen_platform, maiden_name, movies, music, nickname, online, photo_50, photo_100, photo_200_orig, photo_200, photo_400_orig, photo_id, photo_max, photo_max_orig, quotes, screen_name, sex, site, status, timezone, trending, verified, wall_default, political, religion, inspired_by, people_main, life_main, smoking, alcohol, relation_type, "relation_partner_ID", "Date_of_Collection") FROM stdin;
597793194	Катерина	Голубева	\N	f	t	Люблю всех:)	Учеба	1994-10-02	Война миров	f	t	t	t	t	110	89822573504	89127896001	1	id597793194	0	Покер	t	t	Удомля	Чтение	f	f	f	2020-11-23 09:29:45	7	Ванькова	Кинг Конг	Раммштайн		f	https://sun3-11.userapi.com/impg/IK4ieIQ9nChZ4PGg9sUHceuOVyEQMGXoOSOH5Q/dgZvPA3Qe7o.jpg?size=50x0&quality=96&crop=199,0,798,798&sign=a245934082f0a1f4c7e0313b44852c32&c_uniq_tag=OS6DMx1fFJ69rWMMeTEVdaVThT6iex6tUicRvygNhK0&ava=1	https://sun3-11.userapi.com/impg/IK4ieIQ9nChZ4PGg9sUHceuOVyEQMGXoOSOH5Q/dgZvPA3Qe7o.jpg?size=100x0&quality=96&crop=199,0,798,798&sign=8546b1a2447040e186fe0f485d5b418e&c_uniq_tag=4ATlLN9g7U9wuESIU5fsqVUgTmD7PtmFANlhDmzJfxg&ava=1	https://sun3-11.userapi.com/impg/IK4ieIQ9nChZ4PGg9sUHceuOVyEQMGXoOSOH5Q/dgZvPA3Qe7o.jpg?size=200x0&quality=96&crop=199,0,798,798&sign=d88c4a51219291048250d9c22cae3050&c_uniq_tag=BHvZuiDGm5buR4bq0KECNCV7fpvMmKcFRsBZ-SLutw0&ava=1	https://sun3-11.userapi.com/impg/IK4ieIQ9nChZ4PGg9sUHceuOVyEQMGXoOSOH5Q/dgZvPA3Qe7o.jpg?size=200x0&quality=96&crop=199,0,798,798&sign=d88c4a51219291048250d9c22cae3050&c_uniq_tag=BHvZuiDGm5buR4bq0KECNCV7fpvMmKcFRsBZ-SLutw0&ava=1	https://sun3-11.userapi.com/impg/IK4ieIQ9nChZ4PGg9sUHceuOVyEQMGXoOSOH5Q/dgZvPA3Qe7o.jpg?size=400x0&quality=96&crop=199,0,798,798&sign=19ec2e717cc8e5447aba916a2e2f1def&c_uniq_tag=vXh-b69_X5OeUIswmkgg1g4uxKGuR5e2wugMk3-2fM8&ava=1	457239054	https://sun3-11.userapi.com/impg/IK4ieIQ9nChZ4PGg9sUHceuOVyEQMGXoOSOH5Q/dgZvPA3Qe7o.jpg?size=200x0&quality=96&crop=199,0,798,798&sign=d88c4a51219291048250d9c22cae3050&c_uniq_tag=BHvZuiDGm5buR4bq0KECNCV7fpvMmKcFRsBZ-SLutw0&ava=1	https://sun3-11.userapi.com/impg/IK4ieIQ9nChZ4PGg9sUHceuOVyEQMGXoOSOH5Q/dgZvPA3Qe7o.jpg?size=400x0&quality=96&crop=199,0,798,798&sign=19ec2e717cc8e5447aba916a2e2f1def&c_uniq_tag=vXh-b69_X5OeUIswmkgg1g4uxKGuR5e2wugMk3-2fM8&ava=1	"Я мыслю, следовательно, существую"	id597793194	1	www.net	Я делаю это раз пять или шесть, чтоб уж наверняка...	\N	\N	f	f	8	Православие	1	1	1	1	1	\N	\N	2020-12-02 13:27:22.349291
\.


--
-- TOC entry 3177 (class 0 OID 16459)
-- Dependencies: 207
-- Data for Name: user_connections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_connections (id, id_connection, login, exports) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 16395)
-- Dependencies: 200
-- Data for Name: user_data_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_data_table (id, first_name, last_name, deactivated, is_closed, can_access_closed, about, activities, bdate, blacklisted, blacklisted_by_me, books, can_post, can_see_all_posts, can_see_audio, can_send_friend_request, can_write_private_message, city_id, mobile_phone, home_phone, counter_pages, country_id, domain, friend_status, games, has_mobile, has_photo, home_town, interests, is_favorite, is_friend, is_hidden_from_feed, last_seen_platform, maiden_name, movies, music, nickname, online, photo_50, photo_100, photo_200_orig, photo_200, photo_400_orig, photo_id, photo_max, photo_max_orig, quotes, screen_name, sex, site, status, timezone, trending, verified, wall_default, political, religion, inspired_by, people_main, life_main, smoking, alcohol, relation_type, "relation_partner_ID", "Date_of_Collection", last_seen_time) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 16507)
-- Dependencies: 213
-- Data for Name: user_friends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_friends (id, id_friend) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 16633)
-- Dependencies: 223
-- Data for Name: user_occupation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_occupation (id, type, id_occupation, name) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 33009)
-- Dependencies: 228
-- Data for Name: user_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_photos (id, id_photo, album_id, text, date, url, owner_id, post_id) FROM stdin;
139489901	457272504	-6		2020-09-25	https://sun9-33.userapi.com/impg/RRpcmlRh5rZCtpRA8cIQ3M57ZZkE6ga9QPK6Pg/YojJk4S52NY.jpg?size=810x1080&quality=96&sign=dbacd87881d791a5e1d39ba4cbcb6d30&c_uniq_tag=YumKPdDhUZgWTm-EC9D7YRNiETuYKyX2p-poWB_ahUA&type=album	139489901	9292
139489901	457266345	219465383		2019-11-22	https://sun9-54.userapi.com/impg/c854416/v854416765/17cc18/r4xOnS1IXpQ.jpg?size=1080x834&quality=96&proxy=1&sign=997431b2c7038d10b87ce6185e2f7866&c_uniq_tag=ZFvBDbq1qjy4XlJNScZ-LrjX0vMIrWZIabLWJ-di4SE&type=album	139489901	\N
139489901	457266261	-6		2019-11-21	https://sun9-69.userapi.com/impg/c858036/v858036845/eb023/8eBmktIcOtY.jpg?size=810x1080&quality=96&sign=e375bafc76f9b0b005bf62ef7311d8f8&c_uniq_tag=0W7JUBHxfGvdKdO3adO_MuPj8_Yg15_sLTHCzZHibZM&type=album	139489901	9251
139489901	457265255	219465383		2019-10-13	https://sun9-14.userapi.com/impf/c851136/v851136453/1e4d30/IbSroQg_Onw.jpg?size=1280x960&quality=96&proxy=1&sign=76ac4997a859f6023626cc156f5741f0&c_uniq_tag=H9HomJDNYfFVGJFqnIbQsgHo9vRRXIQX5p5PvqffRNY&type=album	139489901	\N
139489901	457264791	-6		2019-09-24	https://sun9-59.userapi.com/impf/c858324/v858324545/801d3/NZN5_ZSKB7Y.jpg?size=683x1024&quality=96&proxy=1&sign=7784ccb3b2201fa69eeff30f92a6746f&c_uniq_tag=INgAfB6zWukYlgnV7U1LbeO6aN61KdCWWRFMtfmFmMs&type=album	139489901	9230
139489901	457263988	219465383		2019-09-15	https://sun9-29.userapi.com/impf/c851224/v851224636/1ce46c/4yg8j8MTCpk.jpg?size=1280x851&quality=96&proxy=1&sign=139620ad1f8c791b468f40c2c4a4bba5&c_uniq_tag=kz1tTWeGEXFRmW_mXkm3UgXDM9PJ7YPAqmg6RzZRM4o&type=album	139489901	\N
139489901	457262785	-6		2019-07-27	https://sun9-73.userapi.com/impf/c855024/v855024065/a2851/7BfheXU3BjA.jpg?size=1280x858&quality=96&sign=9b185eaff5491690c059be94c191f3c3&c_uniq_tag=ZJVnm6r-V-ygiPECmSloZ84HEy7_5VovOWzbQnuAYuA&type=album	139489901	9224
139489901	457262165	219465383		2019-07-11	https://sun9-27.userapi.com/impf/c851228/v851228173/168753/-xOwKimBbxM.jpg?size=635x626&quality=96&proxy=1&sign=b8c931c310938d9afcfcc89099dbba1a&c_uniq_tag=PWPmpRWRRBkAckOZIUYdG4MD2FsqWJoWSXEUn5FSVAA&type=album	139489901	\N
139489901	456260597	219465383		2019-05-13	https://sun9-37.userapi.com/impf/c845420/v845420023/1fdb3c/X7_5Ld61hI0.jpg?size=717x1080&quality=96&sign=cedbcf775f31cc981fa8cad23be738bb&c_uniq_tag=_Fc6gKTCR0T6WiqCWHpoLIoVddj7roQ4HrkDjQBqHBY&type=album	139489901	\N
139489901	456260220	-6		2019-04-26	https://sun9-29.userapi.com/impf/c850328/v850328851/12e429/8-EvKUIHv78.jpg?size=718x1080&quality=96&sign=bec79c7f37bdb4c9dbc06144082775bf&c_uniq_tag=amf2QBKIMSPyqJmw81ssE_X3wYetLnDifyUxXSkjA-I&type=album	139489901	9213
15308848	457245293	-6		2020-11-30	https://sun9-21.userapi.com/impg/WJs3sZQQJ_3z8B5RlRZN6LRi9TBAvt13wxz5Nw/HIqP-u5yHFA.jpg?size=874x1080&quality=96&sign=06ccab22bba1425ddaae6093c2631172&c_uniq_tag=67Z2fcrHE7Y5KDw_M-Gmq_BtB77Bbm5QomL8Ufqejwk&type=album	15308848	872
15308848	457245174	-6		2020-11-21	https://sun9-58.userapi.com/impg/dAuuFR6mNFECXWTpdadlsDZFDiqHraXhd-ktDA/vfudjC8OL_s.jpg?size=810x1080&quality=96&sign=7329fed320ceeedaa32d09a40a5836f3&c_uniq_tag=eDzsFpMTX4_iwnHw_K-gyQWByA0OJTF3006TOT06rfM&type=album	15308848	871
15308848	457245045	-6		2020-10-21	https://sun9-16.userapi.com/impg/IT1EVWlp2_lc511y71vU_JdodWnB20begJeM2g/CdhDDAHmdU0.jpg?size=1280x854&quality=96&sign=16765f42f0d36ed59f30d81d1fc3fab2&c_uniq_tag=5ayaMu9k3Yg1Hvn7Us3atbMOyyYKY796huNHnYuPib0&type=album	15308848	868
308211120	424114804	-6		2016-07-13	https://sun9-37.userapi.com/impf/c636026/v636026196/160af/u2D3XlfwyGk.jpg?size=555x347&quality=96&proxy=1&sign=7b96c56453bc0a6945d09e41d49e5271&c_uniq_tag=dZhL9pyceGHtANj1Du0i8FZL3gub9VzudojVTNs1BjA&type=album	308211120	846
308211120	424048641	-7		2016-07-12	https://sun9-75.userapi.com/impf/c631225/v631225120/39f40/yf_70PLKEic.jpg?size=580x604&quality=96&proxy=1&sign=8716d5eb31a6484d0316a5ec883bdeb8&c_uniq_tag=RYF2NDTDWrEkjbabhhMke1468dW4Tk04kMufOwgA11E&type=album	308211120	845
308211120	424047826	-7		2016-07-12	https://sun9-67.userapi.com/impf/c631225/v631225120/39f2f/aIqMn9ZChe4.jpg?size=580x604&quality=96&proxy=1&sign=082765dbc6e4387ad48fa3590f433b4d&c_uniq_tag=imzVHb-wMKV1gjrFQ_of4T9hpRWW3tIArrKu8oPiChc&type=album	308211120	844
308211121	368767947	-6		2015-06-10	https://sun9-19.userapi.com/impf/c623918/v623918121/3268b/BYObT55iMvc.jpg?size=810x1080&quality=96&sign=0ac0998d1e232fd419b0107d992da5fe&c_uniq_tag=CYpQuDJYpz95ZDULUoudsD5KIXFP44E70eWyev8Ql7s&type=album	308211121	2
308211121	368762471	217100466		2015-06-10	https://sun9-19.userapi.com/impf/c623918/v623918121/3268b/BYObT55iMvc.jpg?size=810x1080&quality=96&sign=0ac0998d1e232fd419b0107d992da5fe&c_uniq_tag=CYpQuDJYpz95ZDULUoudsD5KIXFP44E70eWyev8Ql7s&type=album	308211121	\N
308211121	368762470	217100466		2015-06-10	https://sun9-50.userapi.com/impf/c623918/v623918121/32681/7V-Ab51RDOU.jpg?size=640x480&quality=96&proxy=1&sign=17da80864542375ddb89618c3a8fd1c7&c_uniq_tag=igfODDuXsa9q-jPUMUKOpDZbk8Xq_CTzP_MkSX7EnNA&type=album	308211121	\N
308211122	370352077	-6		2015-06-06	https://sun9-59.userapi.com/impf/c6030/v6030122/158a4/kgZ9rlo8__4.jpg?size=1048x1048&quality=96&proxy=1&sign=9dec3cd60794e21ba30226ac33c50db9&c_uniq_tag=fjEIMyYtmNksNjLbZj1leSwZZQS93yNeiBnPWKFhJBc&type=album	308211122	\N
308211125	372158015	-7		2015-06-06	https://sun9-5.userapi.com/impf/c629119/v629119125/1ee0/OwTKMrgML70.jpg?size=960x960&quality=96&proxy=1&sign=177ee7d7b84aee6db1a9e033bfcfef65&c_uniq_tag=vGuQFyM5CnDZ7BoFYeV3w5VFlBg9GOtNHjKe2HSXiDI&type=album	308211125	\N
308211125	372157993	-7		2015-06-06	https://sun9-66.userapi.com/impf/c629119/v629119125/1ed7/GEhCmPJLEa0.jpg?size=960x957&quality=96&proxy=1&sign=d01690f43bedd3cf6719f432acefbf79&c_uniq_tag=vmglg0kuQpvuhpeNZAwG8sJu1CIGf9NzB_XGgqB_jk4&type=album	308211125	\N
308211125	372157482	-7	marmaris	2015-06-06	https://sun9-34.userapi.com/impf/c629119/v629119125/1ece/vBPbDao6La4.jpg?size=960x720&quality=96&proxy=1&sign=d5f628fda5c635f10b1f50f9924ab320&c_uniq_tag=tkDcnbCjZNoJi8pGV9gvSmStDt9CfiN-jXvlkwJeaHM&type=album	308211125	\N
308211130	372170782	-6		2015-06-09	https://sun9-55.userapi.com/impf/c622130/v622130130/3691e/JJdaBxkcnh8.jpg?size=480x480&quality=96&proxy=1&sign=0fa9b5e74106b5e65635867ae48de8e4&c_uniq_tag=N1506YXOODrsNlzGNWbtIN4QtHDOHUF3BUnXpTON9Wo&type=album	308211130	4
308211130	371835685	-6		2015-06-06	https://sun9-5.userapi.com/impf/c622130/v622130130/3610b/5cGt1ZbaYcw.jpg?size=360x480&quality=96&proxy=1&sign=7c457916668ef03fd2e28ffdbfa1304b&c_uniq_tag=9nDS1HhelUZ55DW3QJkFMm4LM8lhXYUMh6fRN4Kwips&type=album	308211130	1
308211132	370441365	-6		2015-06-06	https://sun9-10.userapi.com/impf/c622330/v622330132/35864/xzV1qBw8Dp0.jpg?size=640x480&quality=96&proxy=1&sign=9b16d1dd2fb5c6f12bac078c901ac68e&c_uniq_tag=qkO3Cc8kUSaYzdXzV02JGXrrUPdpLE1PCNk_2_MMKnI&type=album	308211132	1
308211134	403554576	-6		2016-02-20	https://sun9-37.userapi.com/impf/c633416/v633416134/15c66/I-DyKMfhYZk.jpg?size=1280x960&quality=96&proxy=1&sign=c1dc57d1ad1f00c848a95b25624be3d7&c_uniq_tag=pEEPXB-ALdfLR2dtJpFMey2LJJvohqvig_wTEzlgjWM&type=album	308211134	35
308211134	403546762	-7		2016-02-20	https://sun9-36.userapi.com/impf/c633416/v633416134/15c56/Ee5hT1d4VwY.jpg?size=810x1080&quality=96&sign=a6926eef4858581e53ca08bbec99261a&c_uniq_tag=tD-O_SLdL4R1uBso48IjQu7eV83WscF71ow4e3fWbiA&type=album	308211134	\N
308211134	403546756	-7		2016-02-20	https://sun9-17.userapi.com/impf/c633416/v633416134/15c4c/GTZXqva0NlE.jpg?size=1280x960&quality=96&proxy=1&sign=0e6c7f4a2b0040f8939a34126465faff&c_uniq_tag=u2GJ0JiVUCsivEfd3JUJzxbYPTKwVvAyz0gDeaw7N7Q&type=album	308211134	\N
308211140	370049123	-6		2015-06-06	https://sun9-64.userapi.com/impf/c622828/v622828140/3ed1b/z2SiaxFSL_8.jpg?size=604x403&quality=96&proxy=1&sign=f91e9074807a955161a90ddea794f2be&c_uniq_tag=SP5XG_91GsCUV8yrtocVkGxcI0rI9N3jHhU6cEMFgwc&type=album	308211140	2
308211142	369913569	-6		2015-06-06	https://sun9-20.userapi.com/impf/c6048/v6048142/1691c/T_oRUAg38HQ.jpg?size=242x364&quality=96&proxy=1&sign=dff110383b65ebc88f9e4574efba0308&c_uniq_tag=MzdNlq09LdqelAj73iOnnzum52h2djkkxsFZZwR53cU&type=album	308211142	\N
308211147	385341598	-7		2015-11-03	https://sun9-72.userapi.com/impf/c629205/v629205147/1a4b4/S74HNwNEgxs.jpg?size=810x1080&quality=96&sign=524c8b0ecfaf717341cc3b8938357e68&c_uniq_tag=RjHKqZprTpd2qPOfuglvHdFgn80hDetCWRA74CKhgko&type=album	308211147	\N
308211147	367523889	-6		2015-06-09	https://sun9-72.userapi.com/impf/c622027/v622027147/38057/kJkZTaUqOuI.jpg?size=640x646&quality=96&proxy=1&sign=b65827baa01e7d58214e5ef49dbdc9cf&c_uniq_tag=MWdUfHOh23JLRO_672UOJCIGc6yKK9qrM_xymfStXqo&type=album	308211147	1
308211148	379280658	-7		2015-08-17	https://sun9-46.userapi.com/impf/c622523/v622523148/3f549/2MiFqlScEJI.jpg?size=723x1024&quality=96&proxy=1&sign=0753314ee2149beb7ac277a38b94b327&c_uniq_tag=pUUNEEjipsanRFS05dgN72RdH2upqgCPJkiQ1WHnmLQ&type=album	308211148	\N
308211148	375578498	-6		2015-07-16	https://sun9-52.userapi.com/impf/c621823/v621823148/2f9af/vQd-CYK0wnw.jpg?size=600x600&quality=96&proxy=1&sign=921f92e5bd159562ffd8c92fb5a6f1cf&c_uniq_tag=W2xBcsu-QG7DasUaFbKtaVTFRSOlGOMnjdi2C9RrzVE&type=album	308211148	6
308211148	375363551	-6		2015-07-14	https://sun9-67.userapi.com/impf/c621823/v621823148/2f538/N1I16w4aXz8.jpg?size=604x604&quality=96&proxy=1&sign=c812598b44eeef8a87ce2bf48249a8d1&c_uniq_tag=16YD3QZUOJv5wkvKq_eH7Isi3-PU0kJryIizT7o96jw&type=album	308211148	4
308211149	398095852	-6		2016-01-15	https://sun9-25.userapi.com/impf/c628120/v628120149/4a164/LHVCYmjmvBg.jpg?size=400x300&quality=96&proxy=1&sign=084805b302d207d23b80082ee385bbdc&c_uniq_tag=d3-DlGTKQ8DGxHqeM0lzIb0g9k694KhQlf_D0drv26c&type=album	308211149	5
308211151	457240860	-7		2019-09-18	https://sun9-49.userapi.com/impf/c850428/v850428819/1bf6d8/GqPvzbDMK7k.jpg?size=608x1080&quality=96&sign=d766d7c90b9250637fdae270db796f00&c_uniq_tag=fIoCZH_WDmaUCMSU89W6GMN0Fg0YbzwBd_VtmsUZPTo&type=album	308211151	2168
308211153	456239017	-7		2016-11-13	https://sun9-35.userapi.com/impf/c637229/v637229153/1a99d/Huk_lvKQGHQ.jpg?size=600x400&quality=96&proxy=1&sign=435f74c018768d8a75b52677c621f306&c_uniq_tag=jTyFgcrenOZo3fiIdzRJjK-_RzZNBAKl6zbNzoqR5i8&type=album	308211153	15
308211153	369886809	-6		2015-06-06	https://sun9-30.userapi.com/impf/c627626/v627626153/5cc1/Vlvr7U7DbCY.jpg?size=720x1080&quality=96&sign=80d87c3ae4e86409f4402ff5484ff55a&c_uniq_tag=eQ1JhuCB-D6vmJWsZkNDwPQQwqQBy22iO1zS7GXX5IY&type=album	308211153	1
308211154	369344748	-6		2015-06-12	https://sun9-16.userapi.com/impf/c621628/v621628154/2a2ad/KyZ1-ry0TJw.jpg?size=453x604&quality=96&proxy=1&sign=98fbe7a938ed11016cccf7814f43a961&c_uniq_tag=H3ZA-QNDZm5_80v5uXv8ZfRvb2yLqBwn5CncUABPfpA&type=album	308211154	5
308211154	369344738	-6		2015-06-12	https://sun9-26.userapi.com/impf/c621628/v621628154/2a2a1/ST5fOqUPSUs.jpg?size=453x604&quality=96&proxy=1&sign=2da1ff088a5e68048db008523c5215c2&c_uniq_tag=JK3UO8IEM67AfsLxiRglGOYj4dRiMmEy8I0XSK44Bws&type=album	308211154	4
308211154	369344736	-6		2015-06-12	https://sun9-33.userapi.com/impf/c621628/v621628154/2a295/f9DH5f0iQnk.jpg?size=453x604&quality=96&proxy=1&sign=cdf9a530f7b9f1b5b5c9aaf267096027&c_uniq_tag=-IZRGkuKPMLIGVXqBP03QiwE2gRRb5GvofRsbyy-pmw&type=album	308211154	3
308211157	367793202	-6		2015-06-06	https://sun9-60.userapi.com/impf/c627923/v627923157/7528/syMIsVp9DSE.jpg?size=1280x1280&quality=96&sign=238a947eff9532146bca15fd367310e7&c_uniq_tag=Sc_CUMVGULrhe7Ike3GOBo3CMAojs3gEBnNTOOMgb8s&type=album	308211157	1
308211159	456239017	233062316		2017-02-08	https://sun9-55.userapi.com/impf/c626529/v626529159/65ef7/pxa2weh9QzI.jpg?size=627x1080&quality=96&sign=c165b6f026c177208bc6f909e6d63561&c_uniq_tag=Qccf4BL73VlMVeAHMX0ye_2wxjchFlFHx3v1c82EMCo&type=album	308211159	\N
308211159	419120616	-6		2016-06-13	https://sun9-14.userapi.com/impf/c626530/v626530159/12d92/LPfoM6dXwjo.jpg?size=384x367&quality=96&proxy=1&sign=dad87c6a4750d50b628477b529bcb829&c_uniq_tag=kiocJm39WAjRqHDvubh2WnPxHtfbvK59gCRugncBaVY&type=album	308211159	3
308211159	419054357	233062316		2016-06-12	https://sun9-46.userapi.com/impf/c626530/v626530159/12bb5/u1XwL3u9_SE.jpg?size=608x1080&quality=96&sign=eac9879f223bfe0f87ad9baa1a99bebc&c_uniq_tag=DaYDuoe24vhdV_zhH-O18WRa2RRULyELBa7PbHJs7Zg&type=album	308211159	\N
308211164	369420645	-6		2015-06-27	https://sun9-65.userapi.com/impf/c624621/v624621164/182ac/2l08MUsj_KM.jpg?size=959x959&quality=96&proxy=1&sign=c7027dda201b28ce51cb705ed4164e7f&c_uniq_tag=1Anpli6Dl3Cy1VsDTCdcNmuAG_7br4q-rHphxtlDM78&type=album	308211164	2
308211164	367084042	-6		2015-06-06	https://sun9-73.userapi.com/impf/c624621/v624621164/132de/MOhmMr8u0FE.jpg?size=768x1024&quality=96&proxy=1&sign=dfa53818a643a9a106111466d712112b&c_uniq_tag=7AUrEo-Jf_E522rmuo5SwD-n7ybqFf9bs7zvWsM41fI&type=album	308211164	1
308211166	456239021	-7		2016-11-19	https://sun9-7.userapi.com/impf/c626616/v626616166/3a5aa/hAsJ3lXEcc0.jpg?size=450x300&quality=96&proxy=1&sign=5088e71b2a91ef059ce1eb98d4a52793&c_uniq_tag=ArM6R3enAMamj3DZTIBRFBxytIzf1rHETmg2P3P_16w&type=album	308211166	27
308211166	456239020	-7		2016-11-19	https://sun9-71.userapi.com/impf/c626616/v626616166/3a5a3/6a3v52EVmGw.jpg?size=450x300&quality=96&proxy=1&sign=50cde782b28357d2f7f735e26d94f213&c_uniq_tag=0VILHiIxqnHXdoKoScac5RbCIErlaBHrSUyepCT8ptg&type=album	308211166	26
308211166	456239019	-7		2016-11-19	https://sun9-10.userapi.com/impf/c626616/v626616166/3a59c/tMyv1ayBf-4.jpg?size=450x300&quality=96&proxy=1&sign=22272ad57aa3e665a190dbce15f89c09&c_uniq_tag=CXmA3XaUHpFEkczUJTyhaOXRFH25jKlQhaXbWcDcWTM&type=album	308211166	25
308211167	456239103	-6		2017-05-26	https://sun9-42.userapi.com/impf/c637229/v637229167/4b288/p9D3EYY3UYs.jpg?size=398x600&quality=96&proxy=1&sign=8d0caea38895a62a088e1ec233dbd8c1&c_uniq_tag=l29M5B5b5GQQKK8-GJA9rnwhiiZ8hWhS_5pAy1BQegc&type=album	308211167	232
308211167	456239102	-6		2017-05-26	https://sun9-18.userapi.com/impf/c637229/v637229167/4b27d/Dm3OhjrNwHo.jpg?size=398x600&quality=96&proxy=1&sign=812dcc7dba814fa7c6f7060120434cf6&c_uniq_tag=TE3owq4zNGWtXKCoZvbMEy8meCc-FvhC2FJjfgPnQwI&type=album	308211167	231
308211167	428848309	-7		2016-08-28	https://sun9-56.userapi.com/impf/MFzHP_zU5ijq0c8SUNYmw1UJNuNfbRtItn6WXw/KYCm7YXp_gU.jpg?size=450x602&quality=96&proxy=1&sign=1f1e054dfd1cc1296d2bac2080630fde&c_uniq_tag=sh8Myn1BzngdP10XpxG9g1osYVbdMsvFjJ25D5FpKsI&type=album	308211167	205
308211169	369585515	-6		2015-07-01	https://sun9-10.userapi.com/impf/c628028/v628028169/ae20/Ignnwp34TE8.jpg?size=376x604&quality=96&proxy=1&sign=0961f7cb56ea2ee85004920b71a073fa&c_uniq_tag=ohiNz7i_GiC9t0GjTjcbKWxLMNA6MO6lQ_a0vtXzLfU&type=album	308211169	4
308211169	369581941	-6		2015-07-01	https://sun9-74.userapi.com/impf/c628028/v628028169/ae04/hi2t_IjUwB4.jpg?size=660x495&quality=96&proxy=1&sign=b2fab2c47d5b4071f6a0cf02846f31ee&c_uniq_tag=dKXoF9QZrmEP_PBuIMqeNY06_u01TzZoKzQfgqwZHDo&type=album	308211169	3
308211169	366832996	-6		2015-06-06	https://sun9-72.userapi.com/impf/c628028/v628028169/662f/dbwd1FV-t44.jpg?size=597x959&quality=96&proxy=1&sign=bfea8f5b0cb35d8f3cba6d9bdf5b0817&c_uniq_tag=SUaweUdrl7ECF4Lxe5ReAqFznCaNCwTmDbS4uEZ4v10&type=album	308211169	1
308211170	456239477	-6		2019-06-02	https://sun9-64.userapi.com/impf/c855328/v855328611/596a6/1p4dti6s0eI.jpg?size=606x1080&quality=96&sign=8f0653380a16683373f46777c722ab37&c_uniq_tag=gB7s7ZiC6UNuE6hUVzU7RqkxgmqqUdd1auQMC6xYqIg&type=album	308211170	145
308211171	370784377	-6		2015-06-06	https://sun9-58.userapi.com/impf/c624831/v624831643/33fbe/bOpbZFCXDCA.jpg?size=480x640&quality=96&proxy=1&sign=834d934c502c573defd1795b27fdbdf3&c_uniq_tag=VfQwIE3Qs_4r7Dfc6_xE37TaV-dw2YGwgOMAPuODzJg&type=album	308211171	1
308211176	370072745	-6		2015-06-06	https://sun9-25.userapi.com/impf/c628725/v628725176/69e8/LiFbpK07doA.jpg?size=810x1080&quality=96&sign=ca05846ce9a987d56c81e6303d4ac59f&c_uniq_tag=-dWtNe9C0Z88AyTui5eGABRLbc7wdWcqXkzirnEdjmQ&type=album	308211176	1
308211178	456239818	-6		2017-07-14	https://sun9-49.userapi.com/impf/c639123/v639123233/3487b/IWQZz0jrpqE.jpg?size=640x358&quality=96&proxy=1&sign=f8bc252e70187a50921f4b9b31ba0b0f&c_uniq_tag=1XZleMNdpvXmnmEKBDZpTbJpSnfpFzsxsXHD8xhEFuo&type=album	308211178	212
308211182	381195960	-6		2015-09-15	https://sun9-67.userapi.com/impf/c622925/v622925182/58d9a/Q8Lj2qsQ_jk.jpg?size=200x200&quality=96&proxy=1&sign=acf3c04fb313dfa0300c5e85fac0d8aa&c_uniq_tag=GZVn27hCo0T_KBYatcOPUetrbY8lTXrbTllYhgIEyvA&type=album	308211182	6
308211182	381194863	-7		2015-09-15	https://sun9-50.userapi.com/impf/c622925/v622925182/58d93/HflXJptwEWo.jpg?size=280x280&quality=96&proxy=1&sign=8f666e542cffad2c1d7f9910d5748e7f&c_uniq_tag=Ya01gYXOZuHC3jQSkkcdUkAP_fsJLnG6kQOPmcL9kHc&type=album	308211182	5
308211201	456240396	-6		2019-05-26	https://sun9-30.userapi.com/impf/c855024/v855024494/5319e/EllKka1M2ZM.jpg?size=864x1080&quality=96&proxy=1&sign=3f922784be77b8e5122feb34e24a88a0&c_uniq_tag=J0aJzYDANCi5F0yxx0C4bw2LXZnHqYRVBTViD2Ld7QY&type=album	308211201	473
308211202	369479588	-6		2015-06-06	https://sun9-66.userapi.com/impf/c6040/v6040202/153b4/U46TP1xxiBM.jpg?size=477x477&quality=96&proxy=1&sign=ad5537f8d9f12adc7867ca414262c198&c_uniq_tag=MunTDvBiSQgzjReVAkz2opXM2FzpA5l-83dyHz6xEqU&type=album	308211202	\N
308211204	370503637	-6		2015-06-06	https://sun9-60.userapi.com/impf/c625425/v625425204/395ef/8xUVJxINRCI.jpg?size=646x1080&quality=96&sign=98b7b6159916b9c2ff04f1d5afe2dcaa&c_uniq_tag=LX4ThpcLMoCBarU_UGxwS5IO7HJ-N6ixxvzvQP1E-00&type=album	308211204	1
109354630	457254792	-6		2020-01-15	https://sun9-37.userapi.com/impf/c855632/v855632359/1d5df3/DLaqx5ky36g.jpg?size=1280x1222&quality=96&sign=864c3c8bf5d3d726cac9e7858423cd63&c_uniq_tag=2FXlYis4B7Dh3IQydN6_tYKyUQtJETbgh9W2zhv6Eg0&type=album	109354630	7462
282879447	457242014	-6		2020-03-07	https://sun9-70.userapi.com/impg/c854532/v854532925/1fefde/CrPdT2i6z38.jpg?size=533x800&quality=96&proxy=1&sign=773f00ad575abcea5911d1bf35857fc6&c_uniq_tag=9DDKmGBuIQdsfoUkknX_4IfFGgR9EzUjyG0skpK-4_o&type=album	282879447	281
187524626	457247592	-6		2020-10-05	https://sun9-62.userapi.com/impg/N6OhD8sl_lJZEzPn4hn5urjd_s5QSy_7ZJyO5w/CUvxsdvvGUA.jpg?size=499x1080&quality=96&sign=2a0f66e7239b26c4aa0c73141ddb4f50&c_uniq_tag=P61cxa4TuQz9XiJX1TeSq51lQZ9JARlEuJaOqq1pXHk&type=album	187524626	789
457243827	457239423	-7		2020-09-13	https://sun9-41.userapi.com/impg/UjjuOS4zYuEYUein7k0e_DcJ_Rb8DOzpZE4A-A/AowFRwSqFUE.jpg?size=620x465&quality=96&proxy=1&sign=0ab05cdd3087deced730649043d58b2d&c_uniq_tag=szJXgY-dK0NQbJMqqJvOCK95e3YdBi-IP82zkW0Clis&type=album	457243827	420
457249017	456239033	-7		2017-12-31	https://sun9-16.userapi.com/impf/c840627/v840627765/3b904/BvkFgolDqiA.jpg?size=810x1080&quality=96&sign=1eae556f99f45caa3dde66df1739e094&c_uniq_tag=7z4-5OMaPadWKSAmBdWSDfvjgy-v_EK6m--Ty8eSFYI&type=album	457249017	\N
14	457248580	-6		2020-04-18	https://sun9-18.userapi.com/impg/IUlleGuqngxuI-SshtjsmYprCFSxPNzuoGOq9w/_K8N1mmhMXg.jpg?size=720x1080&quality=96&sign=2f238202cfd0f67b90c6f4acff564517&c_uniq_tag=4HE4U75nlAeBT0F4eatZH2oUPKpKYATRw_Q4C4Du0S0&type=album	14	81867
14	456244589	-6		2018-06-28	https://sun9-66.userapi.com/impf/c844720/v844720474/8c163/ATAdLPNPMho.jpg?size=801x1080&quality=96&sign=ac790805e4e3e7d50926a0f0a0f18ffe&c_uniq_tag=MEJ7bFpXdy4IEl0R2hNHP5dllkoKvmbw44jc9vNhrT8&type=album	14	\N
14	423317972	-6		2016-07-09	https://sun9-54.userapi.com/impf/c631431/v631431014/4231d/dm16nvl53hc.jpg?size=717x1080&quality=96&sign=51805f8b2bbc17e92e8b41960839aa40&c_uniq_tag=HSDkF1QPm0LWBS3y7rl9dEpG7tyBd6yxPOUiHMuC_8I&type=album	14	69365
17	457244302	-7		2020-12-25	https://sun9-46.userapi.com/impf/WMXSR5GytZ-33ysbORjyMSRhI2YtddziM9rZtQ/QHOS5r4-NqA.jpg?size=840x490&quality=96&proxy=1&sign=c3ec7c88504da817cb41e32264f45205&c_uniq_tag=d19uRW5gRdZyGsOMxWz85Cwzy5rr8CUbf2yAoL4eJpI&type=album	17	116112
23	456239201	-7		2017-05-16	https://sun9-25.userapi.com/impf/c837723/v837723023/43b70/3kQ7GY6JrK8.jpg?size=834x610&quality=96&proxy=1&sign=246392f7ce2c12022b362fc4c1194438&c_uniq_tag=SdORjpz6CllBYN1Fo3jbJu7mo7Kpwj8_2lo0Hr7BBEM&type=album	23	3258
1	456316241	-7		2018-05-01	https://sun3-13.userapi.com/impf/c623900/v623900095/1160b2/39ZyjmEB_1Y.jpg?size=1279x959&quality=96&proxy=1&sign=fd54b29846172edd00944b5802e9b659&c_uniq_tag=ndZlUaeZRBGeqIOOXfKQsYtTHSxZ9OkGnDChynLJlJo&type=album	1	\N
5	457239091	-7		2020-12-20	https://sun9-11.userapi.com/impf/J6W-O-d700OovK4a3xMSbvmekrpxX56VY03Pag/BZTK1qvWUCA.jpg?size=1200x800&quality=96&proxy=1&sign=a50eeeefa29ab88610edbace41e93d72&c_uniq_tag=aHSwTFiIsrQp_X3637b_u1SRPmUAsh2PATxXC0BPSoo&type=album	5	3310
5	456239083	-7		2019-07-08	https://sun9-65.userapi.com/impf/c850636/v850636485/167278/_yQiW2S_EEM.jpg?size=960x640&quality=96&proxy=1&sign=b8ca628090a3c0cb6ca0ffc521128bdf&c_uniq_tag=7G4DbEXyvG6JdFyN3D6OrN6QO7S1XR5B6L7PCNf87H0&type=album	5	3309
5	456239082	-7		2019-03-27	https://sun9-5.userapi.com/impf/c846521/v846521479/1ca5f6/73NSa9yvCRY.jpg?size=720x959&quality=96&proxy=1&sign=77b1ae4c083d995f2a93b3b11512e232&c_uniq_tag=vS8CuBwz0550sOiZPYJLzUVm8nDpBZnqcl_AuCh-o4Y&type=album	5	\N
6	456239020	-7		2017-03-07	https://sun9-46.userapi.com/impf/c638425/v638425006/29685/Ac-S7VAg6aI.jpg?size=348x480&quality=96&proxy=1&sign=e4aef97c774b684727aecdec8b1f918c&c_uniq_tag=YBYS25wNKyydL20ZqRuQ5xyA1z3Pn9QEt39qcXpuDYw&type=album	6	\N
7	457239095	-7		2020-07-06	https://sun9-10.userapi.com/impg/zp9ub4jdz4TTmQnr-VxEhiRNuOn8fg4aWbleWA/wouT4EBa5Rg.jpg?size=810x1080&quality=96&sign=e312e241b1810cdc42e5d14edde828f8&c_uniq_tag=eRrTBUMe6ZrSCX28D4LLNeAnLZHnAp2Rdrmwj8tw4cU&type=album	7	\N
8	340690046	-7		2014-10-02	https://sun9-8.userapi.com/impf/E7n_MKvuDT7QhIa02c0Xs6HYRwoHO4vaVXrn-Q/WOxIfkDBBe0.jpg?size=200x200&quality=96&proxy=1&sign=05975f5022ecf7786b3c2b06f503c637&c_uniq_tag=ik7LoK9byl0vLtovvjTF9RnOa2wuZRiXW53vT1Za6-s&type=album	8	475
8	340690021	-7		2014-10-02	https://sun9-67.userapi.com/impf/Ii0YlEKqKQB0KS2uY5GAYOhUjVIdgiXN_NUgXA/hvSSykDWDvk.jpg?size=334x250&quality=96&proxy=1&sign=6174ac88cb5a8fbb44329c57195bcfdf&c_uniq_tag=9QfvDQ9xQ2UXG7oVIXICQas66-P7WNpwXpETzruQzpI&type=album	8	474
8	340689529	-6		2014-10-02	https://sun9-9.userapi.com/impf/hkUgxDsm80M0bUcZBhihG1DbnpAEvFzPWV8Gww/AdEXxsJa7rs.jpg?size=340x604&quality=96&proxy=1&sign=d1ad23e5d2abdbc75d232529da79349d&c_uniq_tag=f7l6AO1xGLu1qmsCj3ZqBHFmBavZKbHZQYVOcHWA0Z0&type=album	8	473
10	457333138	-6		2020-09-11	https://sun9-37.userapi.com/impf/Yy4SU0dzWDmzQ19rFYSwEKEqxQGU8GX7vy0Y7g/0C101iCjOfY.jpg?size=810x1080&quality=96&sign=7a8666c25d99dac4d91a04fc1bf48964&c_uniq_tag=l27OjOLVLx4FmbDHG5eubRs-sKhe05H2ow-QJTMsvVg&type=album	10	40561
11	456239020	-7		2017-12-27	https://sun9-40.userapi.com/impf/c841531/v841531520/527bb/FLUyydzrRIQ.jpg?size=1280x960&quality=96&proxy=1&sign=8ae805d3cdf2baf02928553351ea4815&c_uniq_tag=NWjUs-wOr1_2BosaM9P6QUtgx1og0hfkuwoN-1avnuo&type=album	11	\N
11	393817231	-7		2015-12-31	https://sun9-67.userapi.com/impf/c627517/v627517011/44c20/WL4QiqM5txY.jpg?size=667x484&quality=96&proxy=1&sign=e4548b93dc5b448d2650e4c132d71db3&c_uniq_tag=Q5pU45uyyb8ReT_v7JCPw27BYZtgBPX1l2aXmldJ3AI&type=album	11	\N
11	357653996	-7		2015-03-25	https://sun9-63.userapi.com/impf/c625624/v625624011/259ee/D5LhKnWXxlM.jpg?size=810x1080&quality=96&sign=f1bf04ca1ddba72bc6dfbc82f2672052&c_uniq_tag=UIlOcEC0RhBQANnw9KTvCflBtPaVUzx9rWVldem1Bfc&type=album	11	\N
\.


--
-- TOC entry 3186 (class 0 OID 16558)
-- Dependencies: 216
-- Data for Name: user_relatives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_relatives (id, id_num_relative, id_user, name, type) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 16567)
-- Dependencies: 217
-- Data for Name: user_school; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_school (id, id_num_school, id_school, id_country, id_city, name, year_from, year_to, year_graduated, classc, speciality, type) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 16475)
-- Dependencies: 209
-- Data for Name: user_university; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_university (id, id_num_university, id_university, id_faculty, graduation, id_chair, education_form, education_status) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 16599)
-- Dependencies: 219
-- Data for Name: user_wall_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_wall_posts (id_wallpost, id, id_from, date, text, reply_owner_id, reply_post_id, friends_only, comments_count, copyright, likes_count, like_user_likes, reposts_count, views, post_type, geo_type, geo_coordinates, id_place, is_pinned, date_of_collection, post_source_type, post_source_platform, post_source_data, post_source_url) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 16607)
-- Dependencies: 220
-- Data for Name: wall_post_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wall_post_attachments (id_wall_post, id, id_attachment_num, attachment_url, type) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 24856)
-- Dependencies: 227
-- Data for Name: wall_post_comment_reposted; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wall_post_comment_reposted (id, id_wallpost, id_comment, id_reposted_user) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 24851)
-- Dependencies: 226
-- Data for Name: wall_post_reposted; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wall_post_reposted (id, id_wallpost, id_reposted_user) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 201
-- Name: userDataTable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."userDataTable_id_seq"', 1, false);


--
-- TOC entry 2991 (class 2606 OID 16442)
-- Name: career career_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career
    ADD CONSTRAINT career_pkey PRIMARY KEY (id, id_career);


--
-- TOC entry 3003 (class 2606 OID 16490)
-- Name: chairs chairs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chairs
    ADD CONSTRAINT chairs_pkey PRIMARY KEY (id_chair);


--
-- TOC entry 2993 (class 2606 OID 16450)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id_city);


--
-- TOC entry 2999 (class 2606 OID 16474)
-- Name: connections connections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id_connection);


--
-- TOC entry 2989 (class 2606 OID 16434)
-- Name: counters counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.counters
    ADD CONSTRAINT counters_pkey PRIMARY KEY (id);


--
-- TOC entry 2995 (class 2606 OID 16458)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id_country);


--
-- TOC entry 3007 (class 2606 OID 16506)
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id_faculty);


--
-- TOC entry 3011 (class 2606 OID 16519)
-- Name: military military_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.military
    ADD CONSTRAINT military_pkey PRIMARY KEY (id, id_num_military);


--
-- TOC entry 3027 (class 2606 OID 33037)
-- Name: object_comment_attachments object_comment_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_comment_attachments
    ADD CONSTRAINT object_comment_attachments_pkey PRIMARY KEY (id_object, id_comment, id, id_attachment_num, object_type);


--
-- TOC entry 3031 (class 2606 OID 33028)
-- Name: object_comment_liked object_comment_liked_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_comment_liked
    ADD CONSTRAINT object_comment_liked_pkey PRIMARY KEY (id, id_object, id_comment, id_liked_user, object_type);


--
-- TOC entry 3025 (class 2606 OID 33030)
-- Name: object_comments object_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_comments
    ADD CONSTRAINT object_comments_pkey PRIMARY KEY (id_comment, id_object, id, object_type);


--
-- TOC entry 3033 (class 2606 OID 33042)
-- Name: object_liked object_liked_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object_liked
    ADD CONSTRAINT object_liked_pkey PRIMARY KEY (id, id_object, id_liked_user, object_type);


--
-- TOC entry 3019 (class 2606 OID 16582)
-- Name: school school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id_school);


--
-- TOC entry 3013 (class 2606 OID 16527)
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (unit_id);


--
-- TOC entry 3005 (class 2606 OID 16498)
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id_university);


--
-- TOC entry 2984 (class 2606 OID 16402)
-- Name: user_data_table userDataTable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data_table
    ADD CONSTRAINT "userDataTable_pkey" PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 16425)
-- Name: userDataTable userDataTable_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userDataTable"
    ADD CONSTRAINT "userDataTable_pkey1" PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 16466)
-- Name: user_connections user_connections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_connections
    ADD CONSTRAINT user_connections_pkey PRIMARY KEY (id, id_connection);


--
-- TOC entry 3009 (class 2606 OID 16511)
-- Name: user_friends user_friends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_friends
    ADD CONSTRAINT user_friends_pkey PRIMARY KEY (id_friend, id);


--
-- TOC entry 3029 (class 2606 OID 41212)
-- Name: user_occupation user_occupation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_occupation
    ADD CONSTRAINT user_occupation_pkey PRIMARY KEY (id);


--
-- TOC entry 3039 (class 2606 OID 33016)
-- Name: user_photos user_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_photos
    ADD CONSTRAINT user_photos_pkey PRIMARY KEY (id_photo, id);


--
-- TOC entry 3015 (class 2606 OID 16565)
-- Name: user_relatives user_relatives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_relatives
    ADD CONSTRAINT user_relatives_pkey PRIMARY KEY (id, id_num_relative);


--
-- TOC entry 3017 (class 2606 OID 16574)
-- Name: user_school user_school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_school
    ADD CONSTRAINT user_school_pkey PRIMARY KEY (id_num_school, id);


--
-- TOC entry 3001 (class 2606 OID 16482)
-- Name: user_university user_university_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_university
    ADD CONSTRAINT user_university_pkey PRIMARY KEY (id, id_num_university);


--
-- TOC entry 3021 (class 2606 OID 16606)
-- Name: user_wall_posts user_wall_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wall_posts
    ADD CONSTRAINT user_wall_posts_pkey PRIMARY KEY (id_wallpost, id);


--
-- TOC entry 3023 (class 2606 OID 33039)
-- Name: wall_post_attachments wall_post_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wall_post_attachments
    ADD CONSTRAINT wall_post_attachments_pkey PRIMARY KEY (id_wall_post, id, id_attachment_num);


--
-- TOC entry 3037 (class 2606 OID 24860)
-- Name: wall_post_comment_reposted wall_post_comment_reposted_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wall_post_comment_reposted
    ADD CONSTRAINT wall_post_comment_reposted_pkey PRIMARY KEY (id_reposted_user, id_comment, id_wallpost, id);


--
-- TOC entry 3035 (class 2606 OID 24855)
-- Name: wall_post_reposted wall_post_reposted_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wall_post_reposted
    ADD CONSTRAINT wall_post_reposted_pkey PRIMARY KEY (id, id_wallpost, id_reposted_user);


--
-- TOC entry 2985 (class 1259 OID 33074)
-- Name: fki_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_city ON public."userDataTable" USING btree (city_id);


-- Completed on 2020-12-28 22:28:06

--
-- PostgreSQL database dump complete
--

