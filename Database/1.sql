--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2020-12-29 19:33:53

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
-- Name: career; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 210 (class 1259 OID 16483)
-- Name: chairs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chairs (
    id_chair integer NOT NULL,
    chair text
);


--
-- TOC entry 205 (class 1259 OID 16443)
-- Name: city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city (
    id_city integer NOT NULL,
    title text
);


--
-- TOC entry 208 (class 1259 OID 16467)
-- Name: connections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.connections (
    id_connection integer NOT NULL,
    social_network text
);


--
-- TOC entry 203 (class 1259 OID 16430)
-- Name: counters; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 206 (class 1259 OID 16451)
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country (
    id_country integer NOT NULL,
    title text
);


--
-- TOC entry 212 (class 1259 OID 16499)
-- Name: faculties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.faculties (
    id_faculty integer NOT NULL,
    faculty_name text
);


--
-- TOC entry 214 (class 1259 OID 16512)
-- Name: military; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.military (
    id integer NOT NULL,
    id_num_military integer NOT NULL,
    unit_id integer,
    country_id integer,
    fromc integer,
    until integer
);


--
-- TOC entry 222 (class 1259 OID 16625)
-- Name: object_comment_attachments; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 224 (class 1259 OID 24822)
-- Name: object_comment_liked; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.object_comment_liked (
    id integer NOT NULL,
    id_object integer NOT NULL,
    id_comment integer NOT NULL,
    id_liked_user integer NOT NULL,
    object_type text NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16615)
-- Name: object_comments; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 225 (class 1259 OID 24837)
-- Name: object_liked; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.object_liked (
    id integer NOT NULL,
    id_object integer NOT NULL,
    id_liked_user integer NOT NULL,
    object_type text NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16575)
-- Name: school; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.school (
    id_school integer NOT NULL,
    title text
);


--
-- TOC entry 215 (class 1259 OID 16520)
-- Name: unit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit (
    unit_id integer NOT NULL,
    title text
);


--
-- TOC entry 211 (class 1259 OID 16491)
-- Name: universities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.universities (
    id_university integer NOT NULL,
    university_name text
);


--
-- TOC entry 202 (class 1259 OID 16417)
-- Name: userDataTable; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 201 (class 1259 OID 16415)
-- Name: userDataTable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userDataTable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 201
-- Name: userDataTable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userDataTable_id_seq" OWNED BY public."userDataTable".id;


--
-- TOC entry 207 (class 1259 OID 16459)
-- Name: user_connections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_connections (
    id integer NOT NULL,
    id_connection integer NOT NULL,
    login text,
    exports boolean
);


--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: user_data_table; Type: TABLE; Schema: public; Owner: -
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
    bdate text,
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


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE user_data_table; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.user_data_table IS 'Хранит информацию о пользователе
';


--
-- TOC entry 213 (class 1259 OID 16507)
-- Name: user_friends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_friends (
    id integer NOT NULL,
    id_friend integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16633)
-- Name: user_occupation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_occupation (
    id integer NOT NULL,
    type text,
    id_occupation integer,
    name text
);


--
-- TOC entry 228 (class 1259 OID 33009)
-- Name: user_photos; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 216 (class 1259 OID 16558)
-- Name: user_relatives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_relatives (
    id integer NOT NULL,
    id_num_relative integer NOT NULL,
    id_user integer,
    name text,
    type text
);


--
-- TOC entry 217 (class 1259 OID 16567)
-- Name: user_school; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 209 (class 1259 OID 16475)
-- Name: user_university; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 219 (class 1259 OID 16599)
-- Name: user_wall_posts; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 220 (class 1259 OID 16607)
-- Name: wall_post_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wall_post_attachments (
    id_wall_post integer NOT NULL,
    id integer NOT NULL,
    id_attachment_num integer NOT NULL,
    attachment_url text,
    type text
);


--
-- TOC entry 227 (class 1259 OID 24856)
-- Name: wall_post_comment_reposted; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wall_post_comment_reposted (
    id integer NOT NULL,
    id_wallpost integer NOT NULL,
    id_comment integer NOT NULL,
    id_reposted_user integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 24851)
-- Name: wall_post_reposted; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wall_post_reposted (
    id integer NOT NULL,
    id_wallpost integer NOT NULL,
    id_reposted_user integer NOT NULL
);


--
-- TOC entry 2982 (class 2604 OID 16420)
-- Name: userDataTable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userDataTable" ALTER COLUMN id SET DEFAULT nextval('public."userDataTable_id_seq"'::regclass);


--
-- TOC entry 2991 (class 2606 OID 16442)
-- Name: career career_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.career
    ADD CONSTRAINT career_pkey PRIMARY KEY (id, id_career);


--
-- TOC entry 3003 (class 2606 OID 16490)
-- Name: chairs chairs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chairs
    ADD CONSTRAINT chairs_pkey PRIMARY KEY (id_chair);


--
-- TOC entry 2993 (class 2606 OID 16450)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id_city);


--
-- TOC entry 2999 (class 2606 OID 16474)
-- Name: connections connections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id_connection);


--
-- TOC entry 2989 (class 2606 OID 16434)
-- Name: counters counters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.counters
    ADD CONSTRAINT counters_pkey PRIMARY KEY (id);


--
-- TOC entry 2995 (class 2606 OID 16458)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id_country);


--
-- TOC entry 3007 (class 2606 OID 16506)
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id_faculty);


--
-- TOC entry 3011 (class 2606 OID 16519)
-- Name: military military_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.military
    ADD CONSTRAINT military_pkey PRIMARY KEY (id, id_num_military);


--
-- TOC entry 3027 (class 2606 OID 33037)
-- Name: object_comment_attachments object_comment_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.object_comment_attachments
    ADD CONSTRAINT object_comment_attachments_pkey PRIMARY KEY (id_object, id_comment, id, id_attachment_num, object_type);


--
-- TOC entry 3031 (class 2606 OID 33028)
-- Name: object_comment_liked object_comment_liked_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.object_comment_liked
    ADD CONSTRAINT object_comment_liked_pkey PRIMARY KEY (id, id_object, id_comment, id_liked_user, object_type);


--
-- TOC entry 3025 (class 2606 OID 33030)
-- Name: object_comments object_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.object_comments
    ADD CONSTRAINT object_comments_pkey PRIMARY KEY (id_comment, id_object, id, object_type);


--
-- TOC entry 3033 (class 2606 OID 33042)
-- Name: object_liked object_liked_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.object_liked
    ADD CONSTRAINT object_liked_pkey PRIMARY KEY (id, id_object, id_liked_user, object_type);


--
-- TOC entry 3019 (class 2606 OID 16582)
-- Name: school school_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id_school);


--
-- TOC entry 3013 (class 2606 OID 16527)
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (unit_id);


--
-- TOC entry 3005 (class 2606 OID 16498)
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id_university);


--
-- TOC entry 2984 (class 2606 OID 16402)
-- Name: user_data_table userDataTable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_data_table
    ADD CONSTRAINT "userDataTable_pkey" PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 16425)
-- Name: userDataTable userDataTable_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userDataTable"
    ADD CONSTRAINT "userDataTable_pkey1" PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 16466)
-- Name: user_connections user_connections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_connections
    ADD CONSTRAINT user_connections_pkey PRIMARY KEY (id, id_connection);


--
-- TOC entry 3009 (class 2606 OID 16511)
-- Name: user_friends user_friends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_friends
    ADD CONSTRAINT user_friends_pkey PRIMARY KEY (id_friend, id);


--
-- TOC entry 3029 (class 2606 OID 41212)
-- Name: user_occupation user_occupation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_occupation
    ADD CONSTRAINT user_occupation_pkey PRIMARY KEY (id);


--
-- TOC entry 3039 (class 2606 OID 33016)
-- Name: user_photos user_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_photos
    ADD CONSTRAINT user_photos_pkey PRIMARY KEY (id_photo, id);


--
-- TOC entry 3015 (class 2606 OID 16565)
-- Name: user_relatives user_relatives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_relatives
    ADD CONSTRAINT user_relatives_pkey PRIMARY KEY (id, id_num_relative);


--
-- TOC entry 3017 (class 2606 OID 16574)
-- Name: user_school user_school_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_school
    ADD CONSTRAINT user_school_pkey PRIMARY KEY (id_num_school, id);


--
-- TOC entry 3001 (class 2606 OID 16482)
-- Name: user_university user_university_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_university
    ADD CONSTRAINT user_university_pkey PRIMARY KEY (id, id_num_university);


--
-- TOC entry 3021 (class 2606 OID 16606)
-- Name: user_wall_posts user_wall_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_wall_posts
    ADD CONSTRAINT user_wall_posts_pkey PRIMARY KEY (id_wallpost, id);


--
-- TOC entry 3023 (class 2606 OID 33039)
-- Name: wall_post_attachments wall_post_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wall_post_attachments
    ADD CONSTRAINT wall_post_attachments_pkey PRIMARY KEY (id_wall_post, id, id_attachment_num);


--
-- TOC entry 3037 (class 2606 OID 24860)
-- Name: wall_post_comment_reposted wall_post_comment_reposted_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wall_post_comment_reposted
    ADD CONSTRAINT wall_post_comment_reposted_pkey PRIMARY KEY (id_reposted_user, id_comment, id_wallpost, id);


--
-- TOC entry 3035 (class 2606 OID 24855)
-- Name: wall_post_reposted wall_post_reposted_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wall_post_reposted
    ADD CONSTRAINT wall_post_reposted_pkey PRIMARY KEY (id, id_wallpost, id_reposted_user);


--
-- TOC entry 2985 (class 1259 OID 33074)
-- Name: fki_city; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_city ON public."userDataTable" USING btree (city_id);


-- Completed on 2020-12-29 19:33:53

--
-- PostgreSQL database dump complete
--

