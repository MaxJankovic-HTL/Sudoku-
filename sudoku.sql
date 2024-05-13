--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: achieved; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achieved (
    uid integer NOT NULL,
    aid integer NOT NULL,
    datum date DEFAULT CURRENT_DATE
);


ALTER TABLE public.achieved OWNER TO postgres;

--
-- Name: achievments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievments (
    aid integer NOT NULL,
    name text NOT NULL,
    bedingung text NOT NULL
);


ALTER TABLE public.achievments OWNER TO postgres;

--
-- Name: achievments_aid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievments_aid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.achievments_aid_seq OWNER TO postgres;

--
-- Name: achievments_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievments_aid_seq OWNED BY public.achievments.aid;


--
-- Name: challenge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.challenge (
    challenge_id integer NOT NULL,
    challenger_id integer,
    challenged_id integer,
    sid integer,
    challenge_date date DEFAULT CURRENT_DATE,
    status character(1) NOT NULL
);


ALTER TABLE public.challenge OWNER TO postgres;

--
-- Name: challenge_challenge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.challenge_challenge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.challenge_challenge_id_seq OWNER TO postgres;

--
-- Name: challenge_challenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.challenge_challenge_id_seq OWNED BY public.challenge.challenge_id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    history_id integer NOT NULL,
    sid integer,
    datum date DEFAULT CURRENT_DATE,
    "time" time without time zone NOT NULL,
    done character(1) NOT NULL,
    difficulty text NOT NULL,
    mistakes integer
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.history_history_id_seq OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_history_id_seq OWNED BY public.history.history_id;


--
-- Name: rows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rows (
    row_id integer NOT NULL,
    "values" text NOT NULL,
    solution text NOT NULL,
    row_number integer NOT NULL,
    sid integer
);


ALTER TABLE public.rows OWNER TO postgres;

--
-- Name: rows_row_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rows_row_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rows_row_id_seq OWNER TO postgres;

--
-- Name: rows_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rows_row_id_seq OWNED BY public.rows.row_id;


--
-- Name: sud_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sud_user (
    uid integer NOT NULL,
    name text NOT NULL,
    alter integer NOT NULL,
    level integer DEFAULT 0,
    geschlecht character(1) NOT NULL,
    history_id integer
);


ALTER TABLE public.sud_user OWNER TO postgres;

--
-- Name: sud_user_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sud_user_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sud_user_uid_seq OWNER TO postgres;

--
-- Name: sud_user_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sud_user_uid_seq OWNED BY public.sud_user.uid;


--
-- Name: sudoku; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sudoku (
    sid integer NOT NULL
);


ALTER TABLE public.sudoku OWNER TO postgres;

--
-- Name: achievments aid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievments ALTER COLUMN aid SET DEFAULT nextval('public.achievments_aid_seq'::regclass);


--
-- Name: challenge challenge_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge ALTER COLUMN challenge_id SET DEFAULT nextval('public.challenge_challenge_id_seq'::regclass);


--
-- Name: history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history ALTER COLUMN history_id SET DEFAULT nextval('public.history_history_id_seq'::regclass);


--
-- Name: rows row_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rows ALTER COLUMN row_id SET DEFAULT nextval('public.rows_row_id_seq'::regclass);


--
-- Name: sud_user uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sud_user ALTER COLUMN uid SET DEFAULT nextval('public.sud_user_uid_seq'::regclass);


--
-- Data for Name: achieved; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achieved (uid, aid, datum) FROM stdin;
1	1	2024-05-13
\.


--
-- Data for Name: achievments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievments (aid, name, bedingung) FROM stdin;
1	500 wins	Insgesamt 500 Sudokus schaffen.
\.


--
-- Data for Name: challenge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.challenge (challenge_id, challenger_id, challenged_id, sid, challenge_date, status) FROM stdin;
1	1	2	1	2024-05-13	P
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (history_id, sid, datum, "time", done, difficulty, mistakes) FROM stdin;
1	1	2024-05-13	00:04:21	Y	hard	0
2	1	2024-05-13	00:07:48	N	hard	15
\.


--
-- Data for Name: rows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rows (row_id, "values", solution, row_number, sid) FROM stdin;
1	5, 3, 0, 0, 7, 0, 0, 0, 0	5, 3, 4, 6, 7, 8, 9, 1, 2	1	1
2	6, 0, 0, 1, 9, 5, 0, 0, 0	6, 7, 2, 1, 9, 5, 3, 4, 8	2	1
3	0, 9, 8, 0, 0, 0, 0, 6, 0	1, 9, 8, 3, 4, 2, 5, 6, 7	3	1
4	8, 0, 0, 0, 6, 0, 0, 0, 3	8, 5, 9, 7, 6, 1, 4, 2, 3	4	1
5	4, 0, 0, 8, 0, 3, 0, 0, 1	4, 2, 6, 8, 5, 3, 7, 9, 1	5	1
6	7, 0, 0, 0, 2, 0, 0, 0, 6	7, 1, 3, 9, 2, 4, 8, 5, 6	6	1
7	0, 6, 0, 0, 0, 0, 2, 8, 0	9, 6, 1, 5, 3, 7, 2, 8, 4	7	1
8	0, 0, 0, 4, 1, 9, 0, 0, 5	2, 8, 7, 4, 1, 9, 6, 3, 5	8	1
9	0, 0, 0, 0, 8, 0, 0, 7, 9	3, 4, 5, 2, 8, 6, 1, 7, 9	9	1
\.


--
-- Data for Name: sud_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sud_user (uid, name, alter, level, geschlecht, history_id) FROM stdin;
1	Max Musterman	18	18	M	1
2	King Charles	80	48	M	2
\.


--
-- Data for Name: sudoku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sudoku (sid) FROM stdin;
1
\.


--
-- Name: achievments_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievments_aid_seq', 1, true);


--
-- Name: challenge_challenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.challenge_challenge_id_seq', 1, true);


--
-- Name: history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_history_id_seq', 2, true);


--
-- Name: rows_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rows_row_id_seq', 9, true);


--
-- Name: sud_user_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sud_user_uid_seq', 2, true);


--
-- Name: achieved achieved_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achieved
    ADD CONSTRAINT achieved_pkey PRIMARY KEY (uid, aid);


--
-- Name: achievments achievments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievments
    ADD CONSTRAINT achievments_pkey PRIMARY KEY (aid);


--
-- Name: challenge challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge
    ADD CONSTRAINT challenge_pkey PRIMARY KEY (challenge_id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);


--
-- Name: rows rows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rows
    ADD CONSTRAINT rows_pkey PRIMARY KEY (row_id);


--
-- Name: sud_user sud_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sud_user
    ADD CONSTRAINT sud_user_pkey PRIMARY KEY (uid);


--
-- Name: sudoku sudoku_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sudoku
    ADD CONSTRAINT sudoku_pkey PRIMARY KEY (sid);


--
-- Name: achieved achieved_aid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achieved
    ADD CONSTRAINT achieved_aid_fkey FOREIGN KEY (aid) REFERENCES public.achievments(aid);


--
-- Name: achieved achieved_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achieved
    ADD CONSTRAINT achieved_uid_fkey FOREIGN KEY (uid) REFERENCES public.sud_user(uid);


--
-- Name: challenge challenge_challenged_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge
    ADD CONSTRAINT challenge_challenged_id_fkey FOREIGN KEY (challenged_id) REFERENCES public.sud_user(uid);


--
-- Name: challenge challenge_challenger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge
    ADD CONSTRAINT challenge_challenger_id_fkey FOREIGN KEY (challenger_id) REFERENCES public.sud_user(uid);


--
-- Name: challenge challenge_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.challenge
    ADD CONSTRAINT challenge_sid_fkey FOREIGN KEY (sid) REFERENCES public.sudoku(sid);


--
-- Name: history history_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_sid_fkey FOREIGN KEY (sid) REFERENCES public.sudoku(sid);


--
-- Name: rows rows_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rows
    ADD CONSTRAINT rows_sid_fkey FOREIGN KEY (sid) REFERENCES public.sudoku(sid);


--
-- Name: sud_user sud_user_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sud_user
    ADD CONSTRAINT sud_user_history_id_fkey FOREIGN KEY (history_id) REFERENCES public.history(history_id);


--
-- PostgreSQL database dump complete
--

