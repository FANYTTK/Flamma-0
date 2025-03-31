--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-31 10:33:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 228 (class 1259 OID 16516)
-- Name: alertas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alertas (
    alertaid integer NOT NULL,
    simulacionid integer,
    fechageneracion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    nivelalerta character varying(50),
    mensaje text,
    alertaconfirmada boolean DEFAULT false
);


ALTER TABLE public.alertas OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16515)
-- Name: alertas_alertaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alertas_alertaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alertas_alertaid_seq OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 227
-- Name: alertas_alertaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alertas_alertaid_seq OWNED BY public.alertas.alertaid;


--
-- TOC entry 232 (class 1259 OID 16545)
-- Name: asociacionparametrossimulacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asociacionparametrossimulacion (
    asociacionid integer NOT NULL,
    simulacionid integer,
    parametroid integer
);


ALTER TABLE public.asociacionparametrossimulacion OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16544)
-- Name: asociacionparametrossimulacion_asociacionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asociacionparametrossimulacion_asociacionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asociacionparametrossimulacion_asociacionid_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 231
-- Name: asociacionparametrossimulacion_asociacionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asociacionparametrossimulacion_asociacionid_seq OWNED BY public.asociacionparametrossimulacion.asociacionid;


--
-- TOC entry 235 (class 1259 OID 16577)
-- Name: asociacionresultadosimagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asociacionresultadosimagenes (
    asociacionid integer NOT NULL,
    resultadoid integer,
    imagenid integer
);


ALTER TABLE public.asociacionresultadosimagenes OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16576)
-- Name: asociacionresultadosimagenes_asociacionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asociacionresultadosimagenes_asociacionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asociacionresultadosimagenes_asociacionid_seq OWNER TO postgres;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 234
-- Name: asociacionresultadosimagenes_asociacionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asociacionresultadosimagenes_asociacionid_seq OWNED BY public.asociacionresultadosimagenes.asociacionid;


--
-- TOC entry 233 (class 1259 OID 16561)
-- Name: asociacionusuariossimulacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asociacionusuariossimulacion (
    usuarioid integer NOT NULL,
    simulacionid integer NOT NULL,
    rol character varying(50)
);


ALTER TABLE public.asociacionusuariossimulacion OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16594)
-- Name: configuracionsimulaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracionsimulaciones (
    configid integer NOT NULL,
    simulacionid integer,
    nombreconfig character varying(100),
    valor text
);


ALTER TABLE public.configuracionsimulaciones OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16593)
-- Name: configuracionsimulaciones_configid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuracionsimulaciones_configid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.configuracionsimulaciones_configid_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 236
-- Name: configuracionsimulaciones_configid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracionsimulaciones_configid_seq OWNED BY public.configuracionsimulaciones.configid;


--
-- TOC entry 230 (class 1259 OID 16532)
-- Name: historialsimulacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historialsimulacion (
    historialid integer NOT NULL,
    simulacionid integer,
    fechacambio timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(50)
);


ALTER TABLE public.historialsimulacion OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16531)
-- Name: historialsimulacion_historialid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historialsimulacion_historialid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historialsimulacion_historialid_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 229
-- Name: historialsimulacion_historialid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historialsimulacion_historialid_seq OWNED BY public.historialsimulacion.historialid;


--
-- TOC entry 226 (class 1259 OID 16496)
-- Name: imagenesgeneradas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagenesgeneradas (
    imagenid integer NOT NULL,
    resultadoid integer,
    simulacionid integer,
    urlimagen text,
    tipoimagen character varying(50),
    fechageneracion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.imagenesgeneradas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16495)
-- Name: imagenesgeneradas_imagenid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagenesgeneradas_imagenid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.imagenesgeneradas_imagenid_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 225
-- Name: imagenesgeneradas_imagenid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagenesgeneradas_imagenid_seq OWNED BY public.imagenesgeneradas.imagenid;


--
-- TOC entry 222 (class 1259 OID 16469)
-- Name: parametrossimulacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parametrossimulacion (
    parametroid integer NOT NULL,
    simulacionid integer,
    temperatura double precision,
    humedad double precision,
    oxigenacion double precision,
    presionatmosferica double precision,
    velocidadviento double precision,
    direccionviento character varying(50),
    tipovegetacion character varying(50),
    altitud double precision,
    origenincendio character varying(50),
    nivelriesgo double precision
);


ALTER TABLE public.parametrossimulacion OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16468)
-- Name: parametrossimulacion_parametroid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parametrossimulacion_parametroid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parametrossimulacion_parametroid_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 221
-- Name: parametrossimulacion_parametroid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parametrossimulacion_parametroid_seq OWNED BY public.parametrossimulacion.parametroid;


--
-- TOC entry 239 (class 1259 OID 16608)
-- Name: registroeventossimulacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registroeventossimulacion (
    eventid integer NOT NULL,
    simulacionid integer,
    usuarioid integer,
    tipoevento character varying(100),
    descripcion text,
    fechahora timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.registroeventossimulacion OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16607)
-- Name: registroeventossimulacion_eventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registroeventossimulacion_eventid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.registroeventossimulacion_eventid_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 238
-- Name: registroeventossimulacion_eventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registroeventossimulacion_eventid_seq OWNED BY public.registroeventossimulacion.eventid;


--
-- TOC entry 224 (class 1259 OID 16481)
-- Name: resultados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resultados (
    resultadoid integer NOT NULL,
    simulacionid integer,
    nombreescenario character varying(60),
    fechageneracion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    datosanaliticos text,
    estadosimulacion character varying(50)
);


ALTER TABLE public.resultados OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16480)
-- Name: resultados_resultadoid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resultados_resultadoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resultados_resultadoid_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 223
-- Name: resultados_resultadoid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resultados_resultadoid_seq OWNED BY public.resultados.resultadoid;


--
-- TOC entry 220 (class 1259 OID 16454)
-- Name: simulaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.simulaciones (
    simulacionid integer NOT NULL,
    usuarioid integer,
    descripcion text,
    fechacreacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(30)
);


ALTER TABLE public.simulaciones OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16453)
-- Name: simulaciones_simulacionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.simulaciones_simulacionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.simulaciones_simulacionid_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 219
-- Name: simulaciones_simulacionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.simulaciones_simulacionid_seq OWNED BY public.simulaciones.simulacionid;


--
-- TOC entry 218 (class 1259 OID 16444)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    usuarioid integer NOT NULL,
    nombre character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    fecharegistro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16443)
-- Name: usuarios_usuarioid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_usuarioid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_usuarioid_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_usuarioid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_usuarioid_seq OWNED BY public.usuarios.usuarioid;


--
-- TOC entry 4758 (class 2604 OID 16519)
-- Name: alertas alertaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas ALTER COLUMN alertaid SET DEFAULT nextval('public.alertas_alertaid_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 16548)
-- Name: asociacionparametrossimulacion asociacionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionparametrossimulacion ALTER COLUMN asociacionid SET DEFAULT nextval('public.asociacionparametrossimulacion_asociacionid_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 16580)
-- Name: asociacionresultadosimagenes asociacionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionresultadosimagenes ALTER COLUMN asociacionid SET DEFAULT nextval('public.asociacionresultadosimagenes_asociacionid_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 16597)
-- Name: configuracionsimulaciones configid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracionsimulaciones ALTER COLUMN configid SET DEFAULT nextval('public.configuracionsimulaciones_configid_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 16535)
-- Name: historialsimulacion historialid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historialsimulacion ALTER COLUMN historialid SET DEFAULT nextval('public.historialsimulacion_historialid_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 16499)
-- Name: imagenesgeneradas imagenid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenesgeneradas ALTER COLUMN imagenid SET DEFAULT nextval('public.imagenesgeneradas_imagenid_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16472)
-- Name: parametrossimulacion parametroid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parametrossimulacion ALTER COLUMN parametroid SET DEFAULT nextval('public.parametrossimulacion_parametroid_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 16611)
-- Name: registroeventossimulacion eventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registroeventossimulacion ALTER COLUMN eventid SET DEFAULT nextval('public.registroeventossimulacion_eventid_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16484)
-- Name: resultados resultadoid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultados ALTER COLUMN resultadoid SET DEFAULT nextval('public.resultados_resultadoid_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 16457)
-- Name: simulaciones simulacionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulaciones ALTER COLUMN simulacionid SET DEFAULT nextval('public.simulaciones_simulacionid_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16447)
-- Name: usuarios usuarioid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN usuarioid SET DEFAULT nextval('public.usuarios_usuarioid_seq'::regclass);


--
-- TOC entry 4966 (class 0 OID 16516)
-- Dependencies: 228
-- Data for Name: alertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alertas (alertaid, simulacionid, fechageneracion, nivelalerta, mensaje, alertaconfirmada) FROM stdin;
\.


--
-- TOC entry 4970 (class 0 OID 16545)
-- Dependencies: 232
-- Data for Name: asociacionparametrossimulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asociacionparametrossimulacion (asociacionid, simulacionid, parametroid) FROM stdin;
\.


--
-- TOC entry 4973 (class 0 OID 16577)
-- Dependencies: 235
-- Data for Name: asociacionresultadosimagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asociacionresultadosimagenes (asociacionid, resultadoid, imagenid) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 16561)
-- Dependencies: 233
-- Data for Name: asociacionusuariossimulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asociacionusuariossimulacion (usuarioid, simulacionid, rol) FROM stdin;
\.


--
-- TOC entry 4975 (class 0 OID 16594)
-- Dependencies: 237
-- Data for Name: configuracionsimulaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuracionsimulaciones (configid, simulacionid, nombreconfig, valor) FROM stdin;
\.


--
-- TOC entry 4968 (class 0 OID 16532)
-- Dependencies: 230
-- Data for Name: historialsimulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historialsimulacion (historialid, simulacionid, fechacambio, estado) FROM stdin;
\.


--
-- TOC entry 4964 (class 0 OID 16496)
-- Dependencies: 226
-- Data for Name: imagenesgeneradas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagenesgeneradas (imagenid, resultadoid, simulacionid, urlimagen, tipoimagen, fechageneracion) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 16469)
-- Dependencies: 222
-- Data for Name: parametrossimulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parametrossimulacion (parametroid, simulacionid, temperatura, humedad, oxigenacion, presionatmosferica, velocidadviento, direccionviento, tipovegetacion, altitud, origenincendio, nivelriesgo) FROM stdin;
\.


--
-- TOC entry 4977 (class 0 OID 16608)
-- Dependencies: 239
-- Data for Name: registroeventossimulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registroeventossimulacion (eventid, simulacionid, usuarioid, tipoevento, descripcion, fechahora) FROM stdin;
\.


--
-- TOC entry 4962 (class 0 OID 16481)
-- Dependencies: 224
-- Data for Name: resultados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resultados (resultadoid, simulacionid, nombreescenario, fechageneracion, datosanaliticos, estadosimulacion) FROM stdin;
\.


--
-- TOC entry 4958 (class 0 OID 16454)
-- Dependencies: 220
-- Data for Name: simulaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.simulaciones (simulacionid, usuarioid, descripcion, fechacreacion, estado) FROM stdin;
\.


--
-- TOC entry 4956 (class 0 OID 16444)
-- Dependencies: 218
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usuarioid, nombre, email, fecharegistro) FROM stdin;
\.


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 227
-- Name: alertas_alertaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alertas_alertaid_seq', 1, false);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 231
-- Name: asociacionparametrossimulacion_asociacionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asociacionparametrossimulacion_asociacionid_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 234
-- Name: asociacionresultadosimagenes_asociacionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asociacionresultadosimagenes_asociacionid_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 236
-- Name: configuracionsimulaciones_configid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuracionsimulaciones_configid_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 229
-- Name: historialsimulacion_historialid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historialsimulacion_historialid_seq', 1, false);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 225
-- Name: imagenesgeneradas_imagenid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenesgeneradas_imagenid_seq', 1, false);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 221
-- Name: parametrossimulacion_parametroid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parametrossimulacion_parametroid_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 238
-- Name: registroeventossimulacion_eventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registroeventossimulacion_eventid_seq', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 223
-- Name: resultados_resultadoid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resultados_resultadoid_seq', 1, false);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 219
-- Name: simulaciones_simulacionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.simulaciones_simulacionid_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 217
-- Name: usuarios_usuarioid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_usuarioid_seq', 1, false);


--
-- TOC entry 4781 (class 2606 OID 16525)
-- Name: alertas alertas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas
    ADD CONSTRAINT alertas_pkey PRIMARY KEY (alertaid);


--
-- TOC entry 4785 (class 2606 OID 16550)
-- Name: asociacionparametrossimulacion asociacionparametrossimulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionparametrossimulacion
    ADD CONSTRAINT asociacionparametrossimulacion_pkey PRIMARY KEY (asociacionid);


--
-- TOC entry 4789 (class 2606 OID 16582)
-- Name: asociacionresultadosimagenes asociacionresultadosimagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionresultadosimagenes
    ADD CONSTRAINT asociacionresultadosimagenes_pkey PRIMARY KEY (asociacionid);


--
-- TOC entry 4787 (class 2606 OID 16565)
-- Name: asociacionusuariossimulacion asociacionusuariossimulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionusuariossimulacion
    ADD CONSTRAINT asociacionusuariossimulacion_pkey PRIMARY KEY (usuarioid, simulacionid);


--
-- TOC entry 4791 (class 2606 OID 16601)
-- Name: configuracionsimulaciones configuracionsimulaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracionsimulaciones
    ADD CONSTRAINT configuracionsimulaciones_pkey PRIMARY KEY (configid);


--
-- TOC entry 4783 (class 2606 OID 16538)
-- Name: historialsimulacion historialsimulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historialsimulacion
    ADD CONSTRAINT historialsimulacion_pkey PRIMARY KEY (historialid);


--
-- TOC entry 4779 (class 2606 OID 16504)
-- Name: imagenesgeneradas imagenesgeneradas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenesgeneradas
    ADD CONSTRAINT imagenesgeneradas_pkey PRIMARY KEY (imagenid);


--
-- TOC entry 4775 (class 2606 OID 16474)
-- Name: parametrossimulacion parametrossimulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parametrossimulacion
    ADD CONSTRAINT parametrossimulacion_pkey PRIMARY KEY (parametroid);


--
-- TOC entry 4793 (class 2606 OID 16616)
-- Name: registroeventossimulacion registroeventossimulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registroeventossimulacion
    ADD CONSTRAINT registroeventossimulacion_pkey PRIMARY KEY (eventid);


--
-- TOC entry 4777 (class 2606 OID 16489)
-- Name: resultados resultados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultados
    ADD CONSTRAINT resultados_pkey PRIMARY KEY (resultadoid);


--
-- TOC entry 4773 (class 2606 OID 16462)
-- Name: simulaciones simulaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulaciones
    ADD CONSTRAINT simulaciones_pkey PRIMARY KEY (simulacionid);


--
-- TOC entry 4769 (class 2606 OID 16452)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 4771 (class 2606 OID 16450)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usuarioid);


--
-- TOC entry 4799 (class 2606 OID 16526)
-- Name: alertas alertas_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas
    ADD CONSTRAINT alertas_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4801 (class 2606 OID 16556)
-- Name: asociacionparametrossimulacion asociacionparametrossimulacion_parametroid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionparametrossimulacion
    ADD CONSTRAINT asociacionparametrossimulacion_parametroid_fkey FOREIGN KEY (parametroid) REFERENCES public.parametrossimulacion(parametroid);


--
-- TOC entry 4802 (class 2606 OID 16551)
-- Name: asociacionparametrossimulacion asociacionparametrossimulacion_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionparametrossimulacion
    ADD CONSTRAINT asociacionparametrossimulacion_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4805 (class 2606 OID 16588)
-- Name: asociacionresultadosimagenes asociacionresultadosimagenes_imagenid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionresultadosimagenes
    ADD CONSTRAINT asociacionresultadosimagenes_imagenid_fkey FOREIGN KEY (imagenid) REFERENCES public.imagenesgeneradas(imagenid);


--
-- TOC entry 4806 (class 2606 OID 16583)
-- Name: asociacionresultadosimagenes asociacionresultadosimagenes_resultadoid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionresultadosimagenes
    ADD CONSTRAINT asociacionresultadosimagenes_resultadoid_fkey FOREIGN KEY (resultadoid) REFERENCES public.resultados(resultadoid);


--
-- TOC entry 4803 (class 2606 OID 16571)
-- Name: asociacionusuariossimulacion asociacionusuariossimulacion_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionusuariossimulacion
    ADD CONSTRAINT asociacionusuariossimulacion_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4804 (class 2606 OID 16566)
-- Name: asociacionusuariossimulacion asociacionusuariossimulacion_usuarioid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asociacionusuariossimulacion
    ADD CONSTRAINT asociacionusuariossimulacion_usuarioid_fkey FOREIGN KEY (usuarioid) REFERENCES public.usuarios(usuarioid);


--
-- TOC entry 4807 (class 2606 OID 16602)
-- Name: configuracionsimulaciones configuracionsimulaciones_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracionsimulaciones
    ADD CONSTRAINT configuracionsimulaciones_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4800 (class 2606 OID 16539)
-- Name: historialsimulacion historialsimulacion_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historialsimulacion
    ADD CONSTRAINT historialsimulacion_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4797 (class 2606 OID 16505)
-- Name: imagenesgeneradas imagenesgeneradas_resultadoid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenesgeneradas
    ADD CONSTRAINT imagenesgeneradas_resultadoid_fkey FOREIGN KEY (resultadoid) REFERENCES public.resultados(resultadoid);


--
-- TOC entry 4798 (class 2606 OID 16510)
-- Name: imagenesgeneradas imagenesgeneradas_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenesgeneradas
    ADD CONSTRAINT imagenesgeneradas_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4795 (class 2606 OID 16475)
-- Name: parametrossimulacion parametrossimulacion_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parametrossimulacion
    ADD CONSTRAINT parametrossimulacion_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4808 (class 2606 OID 16617)
-- Name: registroeventossimulacion registroeventossimulacion_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registroeventossimulacion
    ADD CONSTRAINT registroeventossimulacion_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4809 (class 2606 OID 16622)
-- Name: registroeventossimulacion registroeventossimulacion_usuarioid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registroeventossimulacion
    ADD CONSTRAINT registroeventossimulacion_usuarioid_fkey FOREIGN KEY (usuarioid) REFERENCES public.usuarios(usuarioid);


--
-- TOC entry 4796 (class 2606 OID 16490)
-- Name: resultados resultados_simulacionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultados
    ADD CONSTRAINT resultados_simulacionid_fkey FOREIGN KEY (simulacionid) REFERENCES public.simulaciones(simulacionid);


--
-- TOC entry 4794 (class 2606 OID 16463)
-- Name: simulaciones simulaciones_usuarioid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.simulaciones
    ADD CONSTRAINT simulaciones_usuarioid_fkey FOREIGN KEY (usuarioid) REFERENCES public.usuarios(usuarioid);


-- Completed on 2025-03-31 10:33:59

--
-- PostgreSQL database dump complete
--

