--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    year_released integer NOT NULL,
    genre text NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    genre text NOT NULL,
    name text NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_albums_songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists_albums_songs (
    id integer NOT NULL,
    artists_id integer,
    albums_id integer,
    songs_id integer
);


ALTER TABLE public.artists_albums_songs OWNER TO postgres;

--
-- Name: artists_albums_songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_albums_songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_albums_songs_id_seq OWNER TO postgres;

--
-- Name: artists_albums_songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_albums_songs_id_seq OWNED BY public.artists_albums_songs.id;


--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_id_seq OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: playlists_songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists_songs (
    id integer NOT NULL,
    playlists_id integer,
    songs_id integer
);


ALTER TABLE public.playlists_songs OWNER TO postgres;

--
-- Name: playlists_songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_songs_id_seq OWNER TO postgres;

--
-- Name: playlists_songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_songs_id_seq OWNED BY public.playlists_songs.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    title text NOT NULL,
    song_minutes text NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    age integer NOT NULL,
    user_name text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: artists_albums_songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums_songs ALTER COLUMN id SET DEFAULT nextval('public.artists_albums_songs_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: playlists_songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_songs ALTER COLUMN id SET DEFAULT nextval('public.playlists_songs_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, year_released, genre, title) FROM stdin;
1	2016	HipHop/Rap	Views
2	2011	HipHop/Rap	Cole World: The Sideline Story
3	2004	HipHop/Rap	The College Dropout
4	2017	R&B/Soul	Ctrl
5	2005	R&B/Soul	Chris Brown
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, genre, name, age) FROM stdin;
1	HipHop	Drake	36
2	HipHop	J.Cole	38
3	R&b/Soul	Chris Brown	33
4	HipHop	Kanye West	45
5	R&B/Soul	SZA	33
\.


--
-- Data for Name: artists_albums_songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists_albums_songs (id, artists_id, albums_id, songs_id) FROM stdin;
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, title) FROM stdin;
\.


--
-- Data for Name: playlists_songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists_songs (id, playlists_id, songs_id) FROM stdin;
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, title, song_minutes) FROM stdin;
1	Yo Excuse Me Miss	3:48
2	20 Something	3:18
3	U With Me	4:57
4	We Dont Care	4:00
5	Sideline Story	3:58
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, age, user_name) FROM stdin;
1	25	Imh_
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_id_seq', 5, true);


--
-- Name: artists_albums_songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_albums_songs_id_seq', 1, false);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 5, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 1, false);


--
-- Name: playlists_songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_songs_id_seq', 1, false);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: artists_albums_songs artists_albums_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums_songs
    ADD CONSTRAINT artists_albums_songs_pkey PRIMARY KEY (id);


--
-- Name: artists artists_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_name_key UNIQUE (name);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: playlists_songs playlists_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- Name: artists_albums_songs artists_albums_songs_albums_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums_songs
    ADD CONSTRAINT artists_albums_songs_albums_id_fkey FOREIGN KEY (albums_id) REFERENCES public.albums(id);


--
-- Name: artists_albums_songs artists_albums_songs_artists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums_songs
    ADD CONSTRAINT artists_albums_songs_artists_id_fkey FOREIGN KEY (artists_id) REFERENCES public.artists(id);


--
-- Name: artists_albums_songs artists_albums_songs_songs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums_songs
    ADD CONSTRAINT artists_albums_songs_songs_id_fkey FOREIGN KEY (songs_id) REFERENCES public.songs(id);


--
-- Name: playlists_songs playlists_songs_playlists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_playlists_id_fkey FOREIGN KEY (playlists_id) REFERENCES public.playlists(id);


--
-- Name: playlists_songs playlists_songs_songs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_songs
    ADD CONSTRAINT playlists_songs_songs_id_fkey FOREIGN KEY (songs_id) REFERENCES public.songs(id);


--
-- PostgreSQL database dump complete
--

