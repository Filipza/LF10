--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: location_type; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public.location_type AS ENUM (
    'Altglas',
    'Altkleider',
    'Altpapier',
    'Elektrokleingeräte',
    'Recyclinghof'
);


ALTER TYPE public.location_type OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    depotnr character varying(15) NOT NULL,
    city text NOT NULL,
    postalcode integer NOT NULL,
    street text NOT NULL,
    coordinates point NOT NULL,
    papercount integer DEFAULT 0 NOT NULL,
    whiteglasscount integer DEFAULT 0 NOT NULL,
    greenglasscount integer DEFAULT 0 NOT NULL,
    brownglasscount integer DEFAULT 0 NOT NULL,
    electrocount integer DEFAULT 0 NOT NULL,
    clothcount integer DEFAULT 0 NOT NULL,
    rating integer,
    info text
);


ALTER TABLE public.locations OWNER TO admin;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO admin;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.locations (id, depotnr, city, postalcode, street, coordinates, papercount, whiteglasscount, greenglasscount, brownglasscount, electrocount, clothcount, rating, info) FROM stdin;
1	DC2015	Hamburg	22769	Langenfelder Strasse 121	(53.568629167004666,9.945409486264804)	2	1	1	1	0	0	5	
2	DC2137	Hamburg	22559	Sülldorfer Brooksweg 48	(53.57835321562144,9.772192319409069)	2	1	1	1	0	0	5	vor Parkplatz
3	DC2138	Hamburg	22559	Tinsdaler Heideweg 106	(53.57132189552682,9.741757852439036)	3	1	1	1	0	0	5	
4	DC2146	Hamburg	22589	Op'n Hainholt 1	(53.580702010421355,9.810372070538522)	2	1	1	1	0	0	5	Ecke Iserbrooker Weg
5	DC1147	Hamburg	22309	Meister-Francke-Strasse 25	(53.60560581491124,10.043783110025924)	1	0	0	0	0	0	5	
6	DC3025	Hamburg	22523	Upn Hornack 1	(53.61090612780187,9.900318556136485)	2	1	1	1	0	0	5	
7	DC3049	Hamburg	20255	Eidelstedter Weg 	(53.58191237767224,9.94263910730384)	3	1	1	1	0	0	5	ggü. Eidelstedter Weg 118: Ecke Lutterothstraße:
8	DC3055	Hamburg	20257	Faberstrasse 2	(53.57308393174318,9.944376454688438)	3	1	1	1	0	0	5	Ecke Eimsbütteler Markt: neben den Parkplätzen
9	DC3167	Hamburg	22453	Cord-Dreyer-Weg 	(53.62556501583482,9.961276698617942)	2	1	1	1	0	0	5	ggü. Cord-Dreyer-Weg 1: Ecke Fuhlsbütteler Weg
10	DC3170	Hamburg	22453	Hinschkoppel 	(53.62208338799165,9.956382245125523)	3	1	1	1	0	0	5	
11	DC3174	Hamburg	22453	Rahweg 77	(53.63720601364982,9.974935946018066)	2	1	1	1	0	0	5	Ecke Münchhausenweg:
12	DC3185	Hamburg	22455	Vielohweg 124	(53.63968675489965,9.93878485020962)	2	1	1	1	0	0	5	
13	DC3189	Hamburg	22455	Wernigeroder Weg 41	(53.636143848574974,9.949401548430599)	2	1	1	1	0	0	5	
14	DC3217	Hamburg	22457	Grosser Ring 13	(53.642201493607544,9.923475147427157)	2	1	1	1	0	0	5	
15	DC3242	Hamburg	22525	Försterweg 16	(53.5789316642856,9.932951764218155)	2	1	1	1	0	0	5	Ecke Frühlingstraße
16	DC3268	Hamburg	22337	Im Grünen Grunde 7	(53.62322217989819,10.031565906114984)	1	0	0	0	0	0	5	
17	DC3266	Hamburg	22415	Wrangelkoppel 	(53.64799762158592,9.995934452097757)	3	1	1	1	0	0	5	Ecke Krohnstieg: in der Parkbucht
18	DC3256	Hamburg	22527	Stellinger Steindamm 	(53.59705283323847,9.929975014690593)	3	1	1	1	0	0	5	ggü. Stellinger Steindamm 51: Ecke Gazellenkamp
19	DC3224	Hamburg	22457	Königskinderweg 	(53.651933223653714,9.917996424686674)	2	1	1	1	0	0	5	Ecke Grothwisch: Kehre
20	DC2056	Hamburg	22609	Heinrich-Plett-Strasse 41	(53.56058724814187,9.863770723457545)	2	1	1	1	0	0	5	ggü. Botanischer Garten:
21	DC2070	Hamburg	22547	Franzosenkoppel 	(53.60516863849083,9.875687553943438)	2	1	1	1	0	0	5	ggü. Franzosenkoppel 103: Ecke Ueckerstraße
22	DC3267	Hamburg	22419	Beckermannweg 	(53.66736655831617,10.01139743098679)	5	2	1	1	0	0	5	Ecke Neubergerweg
23	DC4100	Hamburg	21149	Am Neugrabener Bahnhof 29	(53.473483757895295,9.852056046002643)	2	0	0	0	0	0	5	Parkplatz
24	DC4101	Hamburg	21149	Neugrabener Markt 4	(53.469838881649295,9.851358221114426)	5	2	2	1	1	1	5	Parkplatz neben Marktfläche
25	DC4102	Hamburg	21149	Cuxhavener Strasse 	(53.47198392532155,9.88411920975421)	3	1	1	1	0	0	5	Ecke Talweg: ggü. Nr.180
26	DC4104	Hamburg	21149	Falkenbergsweg 158	(53.44931152695742,9.868147126782318)	3	1	1	1	0	0	5	Buskehre
27	DC4110	Hamburg	21147	Neumoorstück 1	(53.47784085172479,9.866308018261343)	2	0	0	0	0	0	5	Schulparkplatz: auf Mittelinsel
28	DC4112	Hamburg	21147	Twistering 2	(53.47742409570949,9.877453214612952)	2	1	1	1	0	0	5	Ecke Neuwiedenthaler Straße
29	DC2036	Hamburg	22761	Silcherstrasse 38	(53.568346721870206,9.903226459040651)	3	1	1	1	0	0	5	Ecke Bahrenfelder Chaussee
30	DC1065	Hamburg	22301	Possmoorweg 22	(53.58648822699205,10.010692315635808)	1	0	0	0	0	0	5	
31	DC3194	Hamburg	22297	Wesselyring 14	(53.60327493704461,10.014356525841501)	2	0	0	0	0	0	5	
32	DC2069	Hamburg	22547	Farnhornweg 	(53.59305817935052,9.898174519133176)	1	1	1	1	0	0	5	Ecke Hellgrundweg
33	DC4044	Hamburg	21129	Estebogen 3	(53.53016564331564,9.772771942796071)	1	1	1	1	0	0	5	gegenüber Bushaltestelle
34	DC2042	Hamburg	22587	Mühlenberger Weg 	(53.56138416163716,9.812466016036483)	2	1	2	0	0	0	5	ggü. Nr. 64
35	DC2049	Hamburg	22607	Beselerplatz 	(53.55987207793176,9.887733885661175)	3	1	2	1	0	0	5	ggü. Nr. 11
36	DC2051	Hamburg	22607	Flottbeker Marktweg 	(53.56937541485412,9.875893231254082)	3	1	1	1	0	0	5	ggü. Nr. 1
37	DC2052	Hamburg	22607	Kalckreuthweg 90	(53.56545311940054,9.880629711921394)	3	1	1	1	1	1	5	vor dem Einkaufsmarkt
38	DC2060	Hamburg	22587	Hasenhöhe 	(53.57004733411143,9.819627578670328)	1	1	1	1	0	0	5	Ecke Sachtestieg:zwischen Nr. 81 und Nr. 83
39	DC2062	Hamburg	22589	Reinheimerweg 	(53.583315833311865,9.815202594791414)	2	1	1	1	0	0	5	ggü. Reinheimerweg 15: Ecke Sapperweg
40	DC2063	Hamburg	22589	Schenefelder Diek 9	(53.56974354867474,9.82269024984796)	3	1	1	1	0	0	5	Ecke Simrockstraße
41	DC2065	Hamburg	22589	Sülldorfer Landstrasse 	(53.577343902299965,9.8139343528215)	2	1	1	1	0	0	5	ggü. Nr. 46: auf dem Parkplatz vor dem S-Bahnhof Iserbrook
42	DC4047	Hamburg	21077	Beerentalweg 	(53.443015820970004,9.93827318508832)	1	1	1	1	0	0	5	gegenüber Langenberg
43	DC2074	Hamburg	22547	Luruper Hauptstrasse 61	(53.5854067392618,9.879230205107827)	2	1	1	1	0	0	5	
44	DC4049	Hamburg	21073	Gottschalkring 	(53.452100850974,9.971687307418941)	2	0	0	0	0	0	5	gegenüber Tankstelle:hinter Bremer Straße 94:vor Zugang zum KlgV 746
45	DC2054	Hamburg	22607	Windmühlenweg 51	(53.56957131867191,9.870158548688124)	2	1	1	1	0	0	5	
46	DC2124	Hamburg	22763	Othmarscher Kirchenweg 108	(53.551356504173256,9.909199862620795)	2	1	1	1	0	0	5	
47	DC3026	Hamburg	22523	Redingskamp 	(53.61235918702576,9.890795638286022)	2	1	1	1	0	0	5	ggü. Nr. 121: Ecke Fuchsienweg
48	DC4072	Hamburg	21147	An der Strecke 	(53.47258246415472,9.895820158378262)	3	1	1	1	0	0	5	Sackgasse: gegenüber Nr. 7
49	DC3109	Hamburg	20251	Falkenried 65	(53.583825590745164,9.973459527552697)	3	0	0	0	0	0	5	Ecke Abendrothsweg
50	DC3114	Hamburg	20253	Wrangelstrasse 77	(53.58167018985244,9.968275563277876)	3	1	1	1	1	1	5	ggü. Haus 77
51	DC3046	Hamburg	20255	Eichenstrasse 37	(53.57538480059009,9.95936737031351)	3	1	1	0	0	0	5	Ecke Schulweg
52	DC3118	Hamburg	22417	Tangstedter Landstrasse 263	(53.66771525783398,10.024808227281332)	2	1	1	1	0	0	5	
53	DC3126	Hamburg	22417	Kiwittsmoor 39	(53.67916791540534,10.021688000322934)	4	2	2	1	0	0	5	Ecke Stockflethweg:vor Wohnheim
54	DC3124	Hamburg	22417	Fritz-Schumacher-Allee 200	(53.669339856668756,10.030582585973889)	4	1	1	1	0	0	5	vor Schule: Ecke Hohe Liedt
55	DC3129	Hamburg	22417	Tangstedter Landstrasse 221	(53.66269091618927,10.022667308117875)	3	0	0	0	0	0	5	
56	DC3130	Hamburg	22417	Tangstedter Landstrasse 	(53.67961786601957,10.030604716415237)	6	1	1	1	0	0	5	Ecke Stockflethweg:Bushaltestelle Hasloher Kehre
57	DC3133	Hamburg	22417	Laukamp 	(53.66512378135364,10.020096284906566)	2	0	0	0	0	0	5	Ecke Wattkorn
58	DC3134	Hamburg	22419	Diekwisch 11	(53.65907415812608,10.015893793584219)	2	0	0	0	0	0	5	Ecke Diekmoorweg
59	DC3139	Hamburg	22419	Suckweg 35	(53.65931835556694,9.996476084633787)	3	1	1	1	0	0	5	Ecke Masenkamp
60	DC3140	Hamburg	22419	Suckweg 118	(53.655395504152885,9.988851528763755)	1	1	1	0	0	0	5	Ecke Twisselwisch: vor Kleingartenverein
61	DC3144	Hamburg	22529	Beim Opferstein 2	(53.605420468222675,9.951859136644753)	1	0	0	0	0	0	5	Ecke Hinter der Lieth
62	DC3145	Hamburg	22529	Deelwisch 	(53.602027635898864,9.941057541563774)	5	1	1	1	0	0	5	ggü. Deelwisch 1: Ecke Hinter der Lieth
63	DC4052	Hamburg	21073	Kirchenhang 29	(53.45445805555675,9.95683794936798)	1	0	1	0	0	0	5	Ecke Eichenhöhe: vor Altenheim
64	DC2078	Hamburg	22549	Akeleiweg 	(53.58166345261995,9.868790331773818)	2	1	1	1	0	0	5	ggü. Nr. 39: Ecke Achtern Styg
65	DC4053	Hamburg	21077	Hainholzweg 69	(53.44989697225302,9.936919011700677)	1	1	1	1	0	0	5	Parkstreifen Nebenfahrbahn: Ecke In der alten Forst Busendhaltestelle
66	DC2097	Hamburg	22589	Osdorfer Landstrasse 301	(53.57425432254952,9.836368232046384)	2	1	2	1	0	0	5	ggü. Nr. 301: Ecke Rugenfeld
67	DC3012	Hamburg	22523	Alpenrosenweg 43	(53.6085043265873,9.890591880374124)	2	1	1	1	0	0	5	Ecke Redingskamp
68	DC2107	Hamburg	22609	Vogt-Groth-Weg 	(53.56911904693654,9.852522322177887)	2	1	1	1	0	0	5	Ecke Hatjeweg:vor Kleingartenverein
69	DC3013	Hamburg	22523	Baumacker 	(53.61797369787006,9.896690905945093)	2	1	1	1	0	0	5	ggü. Nr. 13: Ecke Hellasweg
70	DC4064	Hamburg	21073	Am Irrgarten 9	(53.46024543217916,9.97102337146581)	2	1	1	1	0	0	5	Denickestraße gegenüber Nr. 14:vor dem Gesundheitsamt
71	DC2108	Hamburg	22605	Emkendorfstrasse 43	(53.554561926590985,9.893687233323874)	2	1	1	1	0	0	5	Ecke Lavaterweg: ggü. Nr. 43
72	DC4065	Hamburg	21073	Baererstrasse 45	(53.45330920479304,9.979230985226518)	4	2	1	1	1	1	5	am Sportplatz
73	DC3148	Hamburg	22529	Gazellenkamp 	(53.599414399776485,9.95012104152746)	2	1	1	1	0	0	5	ggü. Gazellenkamp 38
74	DC3149	Hamburg	22529	Grandweg 	(53.58671596706977,9.96719109891272)	2	1	1	1	0	0	5	ggü. Grandweg 121: Ecke Troplowitzstraße
75	DC3151	Hamburg	22529	Hinter der Lieth 54	(53.60372999500828,9.945615072241726)	2	1	1	1	1	1	5	ggü. 61: neben U-Bahn-Station Hagendeel:
76	DC4066	Hamburg	21073	Bremer Strasse 115	(53.45169596433133,9.972417421101428)	2	2	1	1	0	0	5	Ecke Marmstorfer Weg
77	DC4070	Hamburg	21073	Sand 	(53.461955872487074,9.979548977855098)	3	1	1	0	0	0	5	gegenüber Nr. 24: Ecke Neue Straße:am Zebrastreifen
78	DC3015	Hamburg	22523	Baumacker 	(53.61648853640155,9.897532971641605)	2	1	1	1	0	0	5	vor der Schule: ggü. Nr. 5a: Ecke Dürenackersweg
79	DC3017	Hamburg	22523	Haseldorfer Weg 2	(53.60497861821788,9.89660966784289)	2	1	1	1	0	0	5	Ecke Elbgaustraße
80	DC3019	Hamburg	22523	Heidacker 	(53.62081371166986,9.898908205318806)	3	1	1	1	0	0	5	ggü. Nr. 68: Ecke Hörgensweg
81	DC5008	Hamburg	22175	Karlshöhe 	(53.623983181114085,10.110835952643505)	4	2	2	1	0	1	5	Ecke Pezolddamm: ggü. Tankstelle: hinter Bushalteselle
82	DC3020	Hamburg	22523	Krupunder Weg 1	(53.617627121449836,9.88954218938192)	2	1	1	1	0	0	5	Ecke Pinneberger Chaussee
83	DC2053	Hamburg	22607	Röbbek 	(53.566290507180284,9.874723334766305)	3	1	1	1	0	0	5	ggü. Nr. 13: Ecke Seestraße
84	DC2119	Hamburg	22763	Friedensallee 109	(53.5578049675634,9.915430440134145)	2	2	1	1	0	0	5	
85	DC2057	Hamburg	22609	Heinrich-Plett-Strasse 8	(53.56857762094043,9.866486346996581)	2	1	1	1	0	0	5	ggü. Nr. 8: Ecke Ostermeyerstraße
86	DC2121	Hamburg	22763	Grosse Brunnenstrasse 57	(53.55200219141915,9.925489313588322)	2	1	1	1	0	0	5	
87	DC4081	Hamburg	21075	Buxtehuder Strasse 71	(53.46925637068484,9.963189443822504)	3	1	1	1	0	0	5	Ecke Bissingstraße
88	DC4085	Hamburg	21075	Triftstrasse 102	(53.45812419745421,9.942893289878496)	1	1	1	1	0	0	5	Ecke Triftweg
89	DC4088	Hamburg	21077	Binnenfeld 	(53.44040473374386,9.962352502066027)	2	1	1	1	0	0	5	gegenüber Nr. 20: Ecke Haanbalken: 2 Standplätze
90	DC3028	Hamburg	22523	Reemstückenkamp 15	(53.614843635498595,9.910560909215334)	2	1	1	1	0	0	5	
91	DC4090	Hamburg	21077	In de Bans 	(53.44002456253523,9.95994419891872)	2	1	1	1	0	0	5	ggü. Nr.1: Ecke Ernst-Bergeest-Weg
92	DC4091	Hamburg	21077	Langenbeker Weg 76	(53.43557797412386,9.978212612164649)	2	1	1	1	1	1	5	ggü. Am Frankenberg: neben Busendhaltestelle
93	DC4094	Hamburg	21077	Zum Jägerfeld 13	(53.4346191748141,9.976946051938402)	1	0	0	0	0	0	5	Kehre
94	DC3034	Hamburg	22523	Schneeballweg 15	(53.609492417905294,9.880475858327138)	2	1	1	1	0	0	5	Ecke Magnolienweg: In der Kehre
95	DC4078	Hamburg	21147	Striepenweg 	(53.47415462445682,9.885977015750829)	1	0	0	0	0	0	5	Einfahrt zur Kirche: Ecke Lange Striepen
96	DC5113	Hamburg	22309	Gropiusring 55	(53.612877143481676,10.060638198515171)	2	0	0	0	0	0	5	ggü. Nr. 52
97	DC4196	Hamburg	21079	Trelder Weg 1	(53.43948275011876,9.989758218232769)	2	2	1	1	1	1	5	ggü. Sparkasse
98	DC4036	Hamburg	21031	Reinbeker Redder 266	(53.51254186956313,10.204397611426057)	2	1	1	1	1	1	5	auf der Mittelinsel vor der Ringstraße
99	DC5127	Hamburg	22359	Klosterwisch 	(53.6464470368004,10.151896300358667)	1	0	0	0	0	0	5	ggü. Nr. 9
100	DC1198	Hamburg	22081	Gluckstrasse 22	(53.57256582424807,10.041108523706036)	3	0	0	0	0	0	5	ggü. Marschnerstrasse
101	DC5092	Hamburg	22149	Brockdorffstrasse 96	(53.595025871378084,10.168709909815444)	3	2	1	1	0	0	5	vor Am Ohlendorffturm
102	DC5121	Hamburg	22047	Ölmühlenweg 10	(53.58145099977413,10.102248867683706)	2	1	1	0	0	0	5	Einfahrt Stadtentwässerung
103	DC1004	Hamburg	22119	Stoltenstrasse 26	(53.56245541778368,10.095014538640918)	3	1	1	1	0	0	5	vor Kaserne
104	DC1077	Hamburg	22111	Horner Landstrasse 85	(53.551889863232056,10.073833557049813)	3	1	1	1	0	0	5	Nähe Bushaltestelle
105	DC1110	Hamburg	22119	Dringsheide 21	(53.563960492388176,10.122239664829632)	1	0	0	0	0	0	5	ggü. Parkhaus: Spielplatz
106	DC1179	Hamburg	22089	Papenstrasse 137	(53.5650037227114,10.053715755934725)	4	2	2	1	0	0	5	Kehre
107	DC1046	Hamburg	22049	Krausestrasse 79	(53.57645357232107,10.058757623085482)	2	1	1	1	1	1	5	Dittmarscher Str.
108	DC1140	Hamburg	20535	Carl-Petersen-Strasse 40	(53.55826518668794,10.043527969030654)	2	0	0	0	0	0	5	ggü. Palmerstr.: Ecke Schwarze Str.
109	DC3105	Hamburg	20149	Harvestehuder Weg 112	(53.580605571132864,9.990421098187014)	4	1	1	1	0	0	5	Ecke Abteistraße: ggü. Kirche
110	DC5020	Hamburg	22043	Rauchstrasse 120	(53.57359186703484,10.103311017569009)	2	1	1	1	0	0	5	ggü. Nr. 120-122
111	DC1139	Hamburg	22119	Böcklerstrasse 	(53.56352028136425,10.107798520299957)	3	1	1	1	0	0	5	Nähe Dannerallee
164	DC4016	Hamburg	21029	Neuer Weg 64A	(53.48342062228683,10.211460874280828)	4	2	2	1	1	1	5	vor Frascatiplatz:ggü. Nr.43a
112	DC1131	Hamburg	22113	Andreas-Meyer-Strasse 47	(53.513615775286105,10.085768491457715)	3	1	1	1	0	0	5	Nähe Bushaltestelle: neben Andreas-Meyer-Str. 51
113	DC1106	Hamburg	22115	Am Mühlenbach 10	(53.5328086554455,10.153991613721686)	1	0	0	0	0	0	5	ggü. 10-16: Ecke Hollkoppelweg:Telefonzelle
114	DC2100	Hamburg	22549	Rugenbarg 9	(53.57404176627038,9.846631728759029)	3	2	2	1	0	0	5	Ecke Diekweg
115	DC4156	Hamburg	21109	Krieterstrasse 30	(53.49713219066348,10.010861207360527)	2	1	1	1	0	0	5	ggü. Einkaufsmarkt
116	DC4168	Hamburg	21109	Otto-Brenner-Strasse 	(53.48338019760884,10.010864471462781)	3	1	1	1	0	0	5	vor dem Kinderbauernhof: ggü Parkanlage Am Callabrack: vor dem Stübenhofer Weg
117	DC4005	Hamburg	21035	Fanny-Lewald-Ring 	(53.4810541904292,10.17319710781659)	3	1	1	1	0	0	5	vor der Schule: ggü. Nr.69
118	DC4007	Hamburg	21033	Friedrich-Frank-Bogen 116	(53.490352749175244,10.178705432479825)	3	2	1	1	0	0	5	1 Standplatz vor Nr.116:1 Standplatz auf Mittelinsel
119	DC4014	Hamburg	21033	Kurt-A.-Körber-Chaussee 51	(53.48854203624552,10.195316001317856)	1	1	1	1	0	0	5	auf dem Hauni Parkplatz:ggü. Tankstelle
120	DC4030	Hamburg	21033	Krusestrasse 1	(53.49585714307285,10.191474209343445)	1	1	1	1	0	0	5	Ecke Bergedorfer Straße: neben Sportplatz:
121	DC4032	Hamburg	21031	Leuschnerstrasse 91	(53.50476489383812,10.203393436821491)	2	1	1	1	0	0	5	ggü. Plettenbergstraße:
122	DC4040	Hamburg	21039	Altengammer Marschbahndamm 	(53.42461681089223,10.254371469547204)	3	2	2	1	0	0	5	neben Schuppen: ggü Altengammer Hausdeich 7: zwischen Alten- und Neuengammer Hausdeich
123	DC4200	Hamburg	21029	August-Bebel-Strasse 27	(53.485300194837635,10.221408933741865)	1	1	1	1	0	0	5	vor Spielplatz: ggü. Nr.24:neben Möllers Kamp
124	DC5134	Hamburg	22041	Böhmestrasse 	(53.574608879274166,10.079433674577377)	3	0	0	0	0	0	5	Ecke Morewoodstraße
125	DC5132	Hamburg	22041	Am Neumarkt 40	(53.575328779292136,10.09245645429604)	4	2	1	1	1	1	5	ggü. Walter-Frahm-Stieg
126	DC1032	Hamburg	22119	Hermannstal 78	(53.551045158779075,10.094938376844176)	3	1	1	1	0	0	5	vor Schule
127	DC1104	Hamburg	22115	Rahewinkel 	(53.52613068313849,10.15055888602667)	2	1	1	1	0	0	5	Ecke Kandinskyallee vor EKZ
128	DC1133	Hamburg	22117	Möllner Landstrasse 159	(53.53900224497508,10.12858481228699)	2	0	0	0	0	0	5	Nähe Kirche
129	DC1135	Hamburg	22117	Steinfurther Allee 1	(53.540767628449835,10.137744369738572)	1	0	0	0	0	0	5	ggü. Nr. 2, Grünanlage
130	DC4015	Hamburg	21033	Ladenbeker Furtweg 178	(53.493191473868755,10.181540859322737)	3	1	1	1	0	0	5	vor Sportplatz: ggü. Schule
131	DC4027	Hamburg	21031	Goerdelerstrasse 7	(53.50339693966498,10.213267178128536)	2	1	1	1	0	0	5	ggü. Nr.26: An der Rückfront der Ladenzeile
132	DC1080	Hamburg	22083	Weidestrasse 85	(53.580080523713285,10.031191721756292)	2	0	0	0	0	0	5	ggü. Nr. 85: Ecke Weberstrasse
133	DC5031	Hamburg	22339	Grützmühlenweg 28	(53.646139599123565,10.0419567182399)	2	2	2	1	0	0	5	Höhe Sportplatz
134	DC4056a	Hamburg	21129	Benittstrasse 	(53.535188253687586,9.878929950869955)	2	1	1	0	0	0	5	neben Haltestelle Finkenwerder Landungsbrücke
135	DC4145	Hamburg	21107	Georg-Wilhelm-Strasse 92	(53.50752253429534,9.992406305924186)	2	1	1	1	0	0	5	am Parkplatz:ggü. Nr. 77 Polizei
136	DC4034	Hamburg	21031	Mendelstrasse 51	(53.508608252156144,10.185124897925762)	3	2	2	1	1	1	5	vor Einkaufsmarkt Weberade 21:Ecke Weberade
137	DC1027	Hamburg	22081	Friedrichsberger Strasse 61	(53.577862807118535,10.048560781162218)	3	1	1	1	0	0	5	ggü. Erika Mann Bogen
138	DC5018	Hamburg	22179	Turnierstieg 39	(53.5997870457603,10.091716316493242)	2	2	2	2	0	0	5	Ecke Barmwisch
139	DC5019	Hamburg	22397	Im Ellernbusch 78	(53.70506778955309,10.10338142423153)	9	3	3	2	1	2	5	Ecke Poppenbütteler Chaussee
140	DC5032	Hamburg	22339	Hummelsbüttler Dorfstrasse 9	(53.643225259510416,10.04492957314667)	5	3	3	1	0	0	5	
141	DC5138	Hamburg	22143	Mehlandsredder 	(53.60674158842561,10.17540495236098)	3	1	1	1	0	0	5	Ecke Sieker Landstraße
142	DC3206	Hamburg	20144	Grindelberg 62	(53.57529584410439,9.97772898161476)	2	1	1	1	0	0	5	ggü. Nr. 43: Höhe Bezirksamt
143	DC1116	Hamburg	22115	Mondrianweg 4	(53.53291572273669,10.145485763821346)	1	0	0	0	0	0	5	ggü. Max-Pechstein-Str. 20: vor Kindertagesheim
144	DC1205	Hamburg	22119	Dringsheide 17	(53.5635640009575,10.122488841604257)	1	0	0	0	0	0	5	
145	DC4026	Hamburg	21033	Billwiese 21	(53.49196744065907,10.19142021952008)	1	1	1	1	0	0	5	auf dem Parkplatz vom Studentenwohnheim
146	DC4031	Hamburg	21031	Leuschnerstrasse 103	(53.50875176364042,10.198620428424986)	3	2	2	1	1	1	5	neben Parkanlage
147	DC4035	Hamburg	21031	Mendelstrasse 24	(53.508046329615496,10.18737741325981)	1	0	0	0	0	0	5	Ecke Schulenburgring:vor der Kirche:neben Haltestelle Schulenburgring ::
148	DC1183	Hamburg	22081	Von-Essen-Strasse 75	(53.575173757445604,10.04457002089456)	3	1	1	1	0	0	5	ggü. Nr. 75, Ecke Holsteinischer Kamp
149	DC5069	Hamburg	22143	Bargteheider Strasse 	(53.61403406366364,10.156007083441645)	5	2	2	1	0	0	5	ggü. Nr. 233: zwischen Oldenfelder Straße und Oldenfelder Stieg
150	DC5124	Hamburg	22359	Buchenkamp 	(53.65275133730446,10.186579820151177)	3	1	1	1	0	0	5	Ecke Moorbekweg: ggü. U-Bahn Buchenkamp
151	DC5087	Hamburg	22147	Bartiner Weg 	(53.62243620007705,10.136578466318714)	1	0	0	0	0	0	5	ggü. Nr. 13
152	DC1130	Hamburg	22113	Halskestrasse 32	(53.52430237197448,10.07732652334668)	2	0	1	0	0	0	5	ggü. Kleingarten Nr.21
153	DC1086	Hamburg	22115	Steinbeker Hauptstrasse 171	(53.52426583829825,10.142203733164154)	2	1	1	1	0	0	5	Gustav-Klimt-Weg
154	DC1094	Hamburg	22119	Dannerallee 2a	(53.55955587125766,10.108518902129775)	2	1	1	1	0	0	5	Dannerallee ggü.2a-c: ggü. Dietzweg: vor Einkaufsmarkt
155	DC1012	Hamburg	20537	Luisenweg 22	(53.553122427266594,10.049313511403623)	2	1	1	1	0	0	5	Nähe Dimpfelweg
156	DC1172	Hamburg	20537	Schurzallee-Nord 12	(53.55239946480753,10.067637316311805)	4	1	1	1	0	0	5	Kreuzung Ewaldsweg Rückersweg: ggü. Schurzallee Nord Nr. 12
157	DC1173	Hamburg	20537	Brausspark 	(53.55186897753361,10.06564959795223)	3	0	0	0	0	0	5	ggü. Sportplatz: zw. Droopweg und Eitzenweg
158	DC1182	Hamburg	20537	Hübbesweg 4	(53.5539223390144,10.060627586051316)	2	1	1	1	0	0	5	vor Einkaufsmarkt: ggü. Nr. 9
159	DC1142	Hamburg	20535	Carl-Petersen-Strasse 76	(53.55794419674977,10.047688291429976)	2	2	2	0	0	0	5	beim Einkaufsmarkt: ggü. Nr. 75
160	DC1168	Hamburg	20535	Hammer Berg 16	(53.55510684368782,10.062617429350812)	5	2	1	1	0	0	5	Nähe U-Bahn
161	DC1169	Hamburg	20535	Sievekingsallee 2	(53.559774764961695,10.040026499918186)	2	1	1	1	0	0	5	Nähe Burgstr.
162	DC3111	Hamburg	20251	Eppendorfer Weg 236	(53.582963654267495,9.97473653194259)	6	2	2	1	1	1	5	ggü. Eppendorfer Weg 236: ggü. Spielplatz
163	DC4169	Hamburg	21109	Prassekstrasse 	(53.490473897116054,10.009311924182981)	2	1	1	0	0	0	5	Ecke Hinter der Dorfkirche:ggü. Hinter der Dorfkirche 70a: vor
165	DC5046	Hamburg	22045	Kelloggstrasse 33	(53.57855494950649,10.130633955067543)	2	0	0	0	0	0	5	Ecke Kreuzburger Strasse
166	DC5093	Hamburg	22149	Düpheid 40	(53.58719657382979,10.1583803543274)	1	1	1	1	0	0	5	Nebenfahrbahn: ggü. Hüllenkoppel
167	DC5096	Hamburg	22149	Kielkoppelstrasse 	(53.588471457865815,10.172411153412046)	2	1	1	0	0	0	5	ggü.Geesthachter Weg
168	DC1047	Hamburg	22049	Dithmarscher Strasse 20	(53.57765526732075,10.059976782530557)	3	0	0	0	0	0	5	
169	DC2007	Hamburg	22767	Struenseestrasse 37	(53.54747007615329,9.945820975092788)	2	1	1	1	0	0	5	
170	DC2011	Hamburg	22765	Holstenstrasse 156	(53.55886651581166,9.948844860454358)	3	2	2	1	1	1	5	
171	DC4175	Hamburg	21107	Am Veringhof 7	(53.51324956206053,9.985421665046044)	4	1	1	1	0	0	5	In der Kehre
172	DC5070	Hamburg	22143	Boltwischen 	(53.61274387890882,10.169541689886378)	2	0	0	0	0	0	5	Ecke Eichwischen: ggü. Boltwischen 18
173	DC5110	Hamburg	22309	Fritz-Flinte-Ring 57	(53.612266908941514,10.053168474913054)	2	0	0	0	0	0	5	
174	DC1050	Hamburg	22049	Dulsberg-Nord 31	(53.58465313114841,10.064227698853605)	1	1	1	1	0	0	5	Haderslebener Str.
175	DC1051	Hamburg	22049	Tondernstrasse 17	(53.587054379841426,10.06369910131912)	3	1	1	1	0	0	5	Nordschleswiger Str.6, ggü. Tondernstr 17
176	DC4159	Hamburg	21107	Mannesallee 13	(53.514128470100275,9.992369426113756)	2	0	0	0	0	0	5	vor dem Kindergarten
177	DC4118	Hamburg	21149	Scheideholzkehre 2	(53.47149069309965,9.84074538726171)	5	1	1	1	0	0	5	1 Standplatz Ecke Scheideholzweg:1 Standplatz um die Ecke im Scheideholzweg
178	DC5015	Hamburg	22179	Fahrenkrön 	(53.619112638112554,10.096997764577319)	5	2	2	1	0	0	5	Ecke Berner Chaussee: ggü. Nr. 140
179	DC5028	Hamburg	22047	Johannes-Frömming-Strasse 	(53.594025250718055,10.099512183205306)	1	1	1	1	0	0	5	vor Parkplatz 3x Glas und 1xPPK
180	DC5064	Hamburg	22399	Poppenbüttler Hauptstrasse 	(53.65961142658977,10.085899595739635)	8	3	2	1	1	1	5	Poppenbüttler Markt: ggü. Poppenbüttler Hauptstrasse 1b
181	DC5123	Hamburg	22359	Gussau 75	(53.65891450053605,10.174580445140288)	4	1	1	0	1	1	5	Ecke Auf den Wöörden
182	DC2038	Hamburg	22761	Von-Sauer-Strasse 	(53.56564572096084,9.908886905551997)	2	1	1	1	0	0	5	vor Einkaufsmarkt: ggü. Nr.10
183	DC3003	Hamburg	22297	Heilholtkamp 	(53.61061956809488,10.017714379570762)	3	0	0	0	0	0	5	ggü. Nr 54: Ecke Frühlingsgarte
184	DC3042	Hamburg	20144	Bundesstrasse 88	(53.57184626794944,9.969319714420205)	3	1	1	1	0	0	5	Ecke Garbestraße: ggü. Bundesstraße 88
185	DC1021	Hamburg	22085	Winterhuder Weg 11	(53.57196643503097,10.024900501951077)	4	2	1	1	0	0	5	vor Schule
186	DC5084	Hamburg	22145	Wildschwanbrook 	(53.62892003215273,10.174859593244097)	2	0	0	0	0	0	5	ggü. Nr. 61
187	DC5119	Hamburg	22045	Ostende 	(53.583792142536886,10.1158184079678)	3	1	1	1	0	0	5	Ecke Stein-Hardenberg-Strasse: Parkplatz
188	DC4142	Hamburg	21109	Georgswerder Bogen 12	(53.51893537841418,10.020895606470575)	2	1	1	1	0	0	5	Autohof: ggü. Nr.11
189	DC4143	Hamburg	21107	Georg-Wilhelm-Strasse 274	(53.48793756407282,9.990293297223584)	2	1	1	1	0	0	5	Ecke Haulander Weg:1 Standplatz neben Nr.274:1 Standplatz neben
190	DC4165	Hamburg	21109	Karl-Arnold-Ring 	(53.48538862033472,10.01760575282703)	2	0	0	0	0	0	5	vor Ottensweide Nr.7:Ecke Ottensweide
191	DC5035	Hamburg	22399	Heidkamp 7	(53.660269361570265,10.061517688070229)	2	0	0	0	0	0	5	
192	DC1042	Hamburg	22049	Stormarner Strasse 18	(53.57653551471699,10.060097602152176)	2	2	1	1	0	0	5	ggü. Dithmarscher Strasse
193	DC1053	Hamburg	22049	Elsässer Strasse 	(53.583746525245466,10.061556836752064)	2	0	0	0	0	0	5	Dulsberg-Nord: Parkstreifen/Insel vor Nr. 10
194	DC4151	Hamburg	21109	Kirchdorfer Strasse 51	(53.498755878787044,10.024857473648849)	2	1	1	1	1	1	5	Ecke Bei der Schmiede: ggü. Im Schönenfelde
195	DC4042	Hamburg	21037	Beim Bieberhof 	(53.48643552902472,10.07548417326043)	1	1	1	1	0	0	5	auf dem Parkplatz zum KLGV 618
196	DC4043	Hamburg	21037	Tatenberger Deich 	(53.497292987915166,10.078150183802753)	1	1	1	1	0	0	5	ggü. Nr.193 : Ecke Tatenberger Weg
197	DC5026	Hamburg	22159	Busbrookhöhe 2	(53.61835168366636,10.12535956686433)	1	1	1	1	0	0	5	Ecke Berner Heerweg: vor Klgv. 576 " Am Knill"
198	DC4192	Hamburg	21079	Reeseberg 175	(53.44162479128817,10.003831648242933)	3	1	1	1	0	0	5	ggü. Höpenstrasse
199	DC5094	Hamburg	22149	Ellerneck 	(53.59096822017067,10.14235318739274)	2	1	1	1	0	0	5	hinter Garagenzufahrt: ggü. Nr. 52
200	DC1039	Hamburg	22111	Tribünenweg 36	(53.561085896312456,10.077525586818492)	1	0	0	0	0	0	5	Kehre
201	DC4058	Hamburg	21129	Norderkirchenweg 71	(53.5289170467758,9.86411318262739)	4	1	1	1	0	0	5	auf dem Parkplatz vor der Kirche: bei Bushaltestelle
202	DC4190	Hamburg	21077	Max-Halbe-Strasse 6	(53.44517157956475,9.986540134179663)	2	0	0	0	0	0	5	Ecke Arno-Holz-Weg
203	DC1031	Hamburg	22111	Sandkamp 36	(53.553492540749374,10.089123288230592)	3	1	1	1	0	0	5	Nähe Meurerweg
204	DC1102	Hamburg	22117	Archenholzstrasse 42	(53.5423802171363,10.116925040871584)	2	1	1	0	0	0	5	ggü. Archenholzstr. 42-44: Parkbucht
205	DC3199 	Hamburg	22337	Beisserstrasse 26	(53.610025869605394,10.041398701472414)	2	0	0	0	0	0	5	ggü.Beisserstrasse 26
206	DC1002	Hamburg	20537	Osterbrookplatz 10	(53.54691009975679,10.058508213878687)	3	1	1	1	1	1	5	ggü. Nr. 10
207	DC5017	Hamburg	22179	Heukoppel 5	(53.61244859306386,10.079706279010725)	2	2	2	1	0	0	5	Heukoppel ggü.5
208	DC2089	Hamburg	22549	Goosacker 41	(53.57121261257354,9.84956224969392)	1	0	0	0	0	0	5	liegt auf dem Schulgelände
209	DC5137	Hamburg	22047	Friedrich-Ebert-Damm 72	(53.58628875587768,10.086623641995512)	3	1	1	1	1	1	5	Ecke Stephanstraße, Bei der Bushaltestelle
210	DC5116	Hamburg	22309	Steilshooper Allee 8	(53.60822639704171,10.048233241678322)	2	0	0	0	0	0	5	
211	DC1132	Hamburg	22113	Liebigstrasse 54	(53.53303568928957,10.092406777938146)	3	1	1	0	0	0	5	zwischen Nr. 54 und 60
212	DC1184	Hamburg	22119	Querkamp 	(53.55315279362621,10.098319273199017)	1	0	0	0	0	0	5	Nähe Speckenreye
213	DC2014	Hamburg	22769	Düppelstrasse 23	(53.56447260843034,9.947536762526838)	2	1	1	1	0	0	5	Ecke Koldingstraße
214	DC3209	Hamburg	20148	Mittelweg 120	(53.5718781483521,9.994441436089568)	2	0	0	0	0	0	5	ggü. Böhmersweg: vor der Schule
215	DC3212	Hamburg	20357	Sternschanze 2	(53.56426730581289,9.96741149042195)	3	1	1	1	0	0	5	vor Sportplatz: Nähe Wasserturm
216	DC4063	Hamburg	21129	Rüstringer Weg 	(53.52919588891624,9.88039382525243)	1	1	1	1	0	0	5	vor Auricher Damm 10
217	DC5047	Hamburg	22149	Köpenicker Strasse 	(53.58804111772677,10.143652883657179)	4	1	1	1	0	0	5	ggü. Nr. 71a: Grünfläche Schule
218	DC5104	Hamburg	22309	Borchertring 	(53.61710023587648,10.062822619928705)	3	1	1	1	0	0	5	zwischen Nr. 47 und Nr. 51: Parkhaus
219	DC1101	Hamburg	22117	Dudenweg 	(53.54002912938717,10.127525841476816)	1	0	0	0	0	0	5	Ecke Merkenstr.
220	DC4173	Hamburg	21107	Rotenhäuser Damm 90	(53.50717874982034,9.99061680873739)	1	0	0	0	0	0	5	vor Kindergarten
221	DC4017	Hamburg	21035	Rahel-Varnhagen-Weg 50	(53.487789328900874,10.176623110456235)	3	2	1	1	0	0	5	ggü. Nr.21
222	DC5097	Hamburg	22149	Schimmelreiterweg 	(53.591352323830286,10.184520057896215)	4	1	1	1	0	0	5	Ecke Sorenkoppel
223	DC5105	Hamburg	22309	Edwin-Scharff-Ring 	(53.61167343874489,10.045864589787085)	2	0	1	0	0	0	5	ggü. Nr. 4: Ende Gründgensstrasse
224	DC1156	Hamburg	22305	Rübenkamp 7	(53.58917325429214,10.04136991457867)	3	1	1	1	0	0	5	Ecke Hufnerstrasse
225	DC4193	Hamburg	21079	Reeseberg 115	(53.44413766557803,9.999562882326142)	3	1	1	1	0	0	5	Ecke Wasmerstraße
226	DC4033	Hamburg	21033	Marnitzstrasse 2	(53.498611416751096,10.20142716882455)	2	2	2	1	0	0	5	vor Sportplatz
227	DC5043	Hamburg	22043	Rodigallee 	(53.57056728235805,10.10696376394793)	1	0	0	0	0	0	5	ggü. Schimmelmannallee
228	DC5077	Hamburg	22143	Warnemünder Weg 	(53.61279139213853,10.164714129097895)	2	0	0	0	0	0	5	ggü. Hs.-Nr. 42:  Ecke Eichberg
229	DC4010	Hamburg	21029	Pollhof 	(53.47910538705424,10.232700885922569)	4	1	1	1	0	0	5	vor Holtenklinker Straße 174:neben Bahnlinie
230	DC5074	Hamburg	22143	Heestweg 	(53.60161118888469,10.149287369190873)	3	1	1	1	0	0	5	Ecke Altrahlstedter Redder: Jumika (Verkehrsübungsplatz)
231	DC3083	Hamburg	20149	Isestrasse 68	(53.583062690573634,9.984864469041446)	5	0	0	0	0	1	5	Ecke Hochallee 127
232	DC3103	Hamburg	20144	Parkallee 64	(53.57835064727591,9.984157243079018)	5	1	2	1	0	0	5	Innocentiapark
233	DC4178	Hamburg	21107	Stenzelring 1	(53.51833053089729,10.000491954577033)	1	1	1	1	0	0	5	Ecke Schlenzigstraße:2. Standplatz auf anderer Straßenseite
234	DC4001	Hamburg	21037	Allermöher Deich 	(53.481837972194676,10.117821935659427)	1	1	1	1	0	0	5	ggü. Nr.41 : Haltestelle Pumpwerk
235	DC4202	Hamburg	21031	Bockhorster Weg 	(53.5169658495167,10.169529059312406)	2	1	1	1	0	0	5	vor Schule: ggü. Nr.3: Nähe Heidhorst
236	DC5089	Hamburg	22147	Greifenberger Strasse 61	(53.61778121336423,10.143448353736714)	2	1	1	1	0	0	5	zwischen Nr. 57 und Parkdeck- Zu/Abfahrt
237	DC4059	Hamburg	21129	Osterfelddeich 	(53.51991155649976,9.885274374748478)	3	1	1	1	0	0	5	ggü. Nr.2: auf dem Parkplatz: Ecke Aue-Hauptdeich
238	DC5037	Hamburg	22399	Tegelsbarg 	(53.65396991886606,10.062269717806078)	2	2	2	1	1	1	5	Ecke Norbert-Schmidt-Platz: ggü. Nr. 12
239	DC3052	Hamburg	20255	Stellinger Weg 33	(53.57929822946254,9.949101760128892)	4	2	2	0	1	1	5	Ecke Helkamp
240	DC3155	Hamburg	22529	Lohbekstieg 	(53.59205428278046,9.955299848824879)	1	1	1	0	0	0	5	Ecke Lohkoppelweg:
241	DC3159	Hamburg	22529	Oddernskamp 	(53.600563538367915,9.951848240014824)	2	1	1	1	0	0	5	ggü. Tankstelle
242	DC3056	Hamburg	20257	Pinneberger Weg 2	(53.57003607872011,9.948670260967585)	2	1	1	1	0	0	5	Ecke Sandweg
243	DC3058	Hamburg	20257	Sophienallee 37	(53.570203210112986,9.953348934657479)	2	1	1	1	0	0	5	ggü. Sophienallee 37: in der Kehre
244	DC3059	Hamburg	20259	Bismarckstrasse 26	(53.57293015948465,9.962356254315443)	5	1	1	0	0	0	5	ggü. Bismarckstraße 26
245	DC3166	Hamburg	22453	Bondenwald 	(53.618132169205424,9.940230005229852)	2	1	1	1	0	0	5	ggü.Bondenwald 51:vor Parkplatz
246	DC3071	Hamburg	20249	Loogestrasse 	(53.586231710865015,9.988709689226248)	8	1	2	1	0	0	5	Ecke Loogestieg
247	DC3171	Hamburg	22453	Langenhorst 1	(53.61043675537358,9.956475809658533)	1	1	1	1	0	0	5	Ecke Niendorfer Straße
248	DC3177	Hamburg	22455	Georg-Appel-Strasse 8	(53.64699252788088,9.952651902251194)	2	1	1	1	0	0	5	zwischen Bacherweg und Kurt-Ledien-Weg
249	DC3184	Hamburg	22455	Sachsenweg 87	(53.64206312333281,9.95989638428033)	4	1	1	1	0	0	5	ggü. Sportzentrum Sachsenweg
250	DC3200	Hamburg	22337	Rübenkamp 320	(53.61416100481538,10.032466450624787)	2	0	0	0	0	0	5	Ecke Feuerbergstraße
251	DC3085	Hamburg	22335	Hummelsbütteler Kirchenweg 4	(53.63350505893175,10.01942412237813)	1	0	0	0	0	0	5	Ecke Erdkampsweg
252	DC3201	Hamburg	22337	Rübenkamp 266	(53.610212144270115,10.033300125821896)	2	0	0	0	0	0	5	
253	DC3202	Hamburg	22337	Stübeheide 	(53.6315978701626,10.047652210955237)	2	1	1	1	0	0	5	Kreisverkehr: ggü.Schluchtweg
254	DC3203	Hamburg	22337	Stübeheide 168	(53.63337736496975,10.055215409100953)	2	0	0	0	0	0	5	Ecke Tornberg
255	DC3204	Hamburg	22337	Tornberg 24	(53.63111276226283,10.055025319579793)	2	0	0	0	0	0	5	Ecke Sodenkamp
256	DC3088	Hamburg	22335	Wacholderweg 	(53.631592889857544,10.026013033645267)	5	2	2	1	0	0	5	ggü. Wacholderweg 40: Ecke Bergkoppelweg
257	DC3213	Hamburg	22457	Albertine-Assor-Strasse 2	(53.63197526795434,9.899652336836917)	3	1	1	1	0	0	5	ggü. Albertine-Assor-Straße 2
258	DC3215	Hamburg	22457	Schleswiger Damm 195	(53.64430571769598,9.913551666590187)	2	0	0	0	0	0	5	Ecke Georges-André-Kohn-Straße
259	DC3090	Hamburg	22339	Ohkamp 43	(53.63856618169792,10.020887994470852)	1	0	0	0	0	0	5	Ecke Ohkampring
260	DC3230	Hamburg	22459	Sellhopsweg 2	(53.62914425369945,9.929055685337676)	2	1	1	1	0	0	5	Ecke Frohmestraße
261	DC3276	Hamburg	20255	Stellinger Weg 	(53.58105648155277,9.9465099473506)	4	1	1	1	0	0	5	ggü. Stellinger Weg 53
262	DC3275	Hamburg	20249	Robert-Koch-Strasse 36	(53.5899291095037,9.985881897260601)	3	1	2	1	1	1	5	
263	DC2068	Hamburg	22547	Fahrenort 	(53.599637550298254,9.868684259302096)	2	1	1	1	0	0	5	ggü. Nr. 77: vor der Schule
264	DC4050	Hamburg	21075	Schattengang 	(53.45474856127997,9.949770416755886)	3	1	1	1	0	0	5	Ecke Ehestorfer Weg 31a
265	DC2093	Hamburg	22549	Bornheide 10	(53.58373654107041,9.854557337002506)	3	1	1	1	0	0	5	ggü. Brandstücken
266	DC4069	Hamburg	21073	Mergellstrasse 19	(53.45629790797821,9.969973399082093)	3	1	1	1	0	0	5	Ecke Hirschfeldstraße 8
267	DC3023	Hamburg	22523	Lohkampstrasse 	(53.616380781868116,9.87430806224871)	2	1	1	1	0	0	5	ggü. Nr. 275: Ecke Burbekstraße
268	DC2116	Hamburg	22763	Bernadottestrasse 22	(53.548225673494954,9.921680100906475)	2	1	1	1	0	0	5	
269	DC4096	Hamburg	21129	Hasselwerder Strasse 98	(53.521391035212154,9.810706030290609)	1	1	1	1	0	0	5	rechts neben Nr. 98: Nähe Kirche
270	DC3030	Hamburg	22523	Wiebelstrasse 	(53.603654108021644,9.906171372896303)	4	2	2	1	0	0	5	Ecke Furtweg: ggü des Parkplatzes
271	DC3117	Hamburg	22419	Essener Strasse 96	(53.674688837898266,9.997610944193047)	3	0	0	0	0	0	5	Ecke Heynemannstraße
272	DC3135	Hamburg	22419	Foorthkamp 	(53.6609151341966,10.016911824246279)	4	2	2	1	1	1	5	Ecke Diekmoorweg: Parkplatz
273	DC3137	Hamburg	22419	Langenhorner Chaussee 647	(53.677141325703644,10.000884024123348)	1	1	1	1	0	0	5	Busbahnhof
274	DC3152	Hamburg	22527	Hagenbeckstrasse 	(53.59219896953945,9.940153921973497)	2	1	1	1	0	0	5	Ecke Koppelstraße:
275	DC3154	Hamburg	22529	Lenzweg 2	(53.58336700710575,9.9479100349942)	2	1	1	1	0	0	5	vor Parkbucht
276	DC3175	Hamburg	22453	Hermundurenweg 	(53.631089229924164,9.967565971988336)	2	1	1	1	0	0	5	ggü. Nr. 19: Ecke Teutonenweg
277	DC1150	Hamburg	22307	Otto-Speckter-Strasse 63	(53.601982106838285,10.045394579885004)	3	1	1	1	0	0	5	
278	DC1151	Hamburg	22307	Genslerstrasse 20	(53.5930894215,10.040973706319894)	3	0	0	0	0	0	5	Ecke Oldachstrasse
279	DC1154	Hamburg	22305	Habichtstrasse 98	(53.593444753882025,10.051855483532995)	3	1	1	1	0	0	5	
280	DC1155	Hamburg	22305	Steilshooper Strasse 31	(53.58585295139014,10.048314491764634)	1	0	0	0	0	0	5	
281	DC1162	Hamburg	22305	Hellbrookstrasse 92	(53.59153319036021,10.052042963958874)	3	1	1	1	0	0	5	
282	DC1059	Hamburg	22301	Dorotheenstrasse 38	(53.581590881163635,10.00928689600194)	2	0	0	0	0	0	5	
283	DC1060	Hamburg	22299	Bebelallee 3	(53.59454670226791,9.995509443169937)	4	1	1	1	0	0	5	Ecke Hudtwalker Straße
284	DC1062	Hamburg	22303	Stammannstrasse 13	(53.58634278479495,10.02281616455704)	6	2	1	1	0	0	5	Ecke Hölderlinallee
285	DC1069	Hamburg	22303	Borgweg 11	(53.59094857855313,10.01553435266027)	2	1	1	1	0	0	5	
286	DC1070	Hamburg	22299	Grasweg 11	(53.59267410447211,10.00343882461772)	3	0	0	0	0	0	5	Ecke Ulmenstraße
287	DC1071	Hamburg	22301	Rondeel 35	(53.586196472238214,10.003149696510167)	3	0	0	0	0	0	5	
288	DC1072	Hamburg	22301	Gottschedstrasse 27	(53.590610643396815,10.009680517944375)	4	1	2	1	1	2	5	
289	DC3262	Hamburg	20249	Meenkwiese 20	(53.59918057450665,9.994384009549805)	3	1	1	1	1	1	5	
290	DC1006	Hamburg	22087	Barcastrasse 1	(53.56075350690144,10.015162548204742)	3	1	1	1	1	0	5	
291	DC1009	Hamburg	20537	Borgfelder Strasse 16	(53.55402954215579,10.029155912068564)	2	1	1	1	1	0	5	
292	DC1011	Hamburg	20535	Klaus-Groth-Strasse 103	(53.55600815794946,10.039486910179061)	7	3	2	1	1	1	5	Ecke Burgstraße:
293	DC1015	Hamburg	22087	Armgartstrasse 24	(53.565478132372576,10.022292804825844)	2	1	1	1	0	0	5	
294	DC1189	Hamburg	22089	Wartenau 16	(53.56549728082,10.033072101045455)	3	1	1	1	0	0	5	
295	DC2099	Hamburg	22549	Rugenbarg 214	(53.584525620839024,9.863440912080804)	2	1	1	1	0	0	5	ggü. Nr. 214
296	DC4067	Hamburg	21079	Kanalplatz 5	(53.466372750113024,9.984468873826753)	3	1	1	1	0	0	5	vor Nr. 5: Nebenfahrbahn: Parkstreifen
297	DC3156	Hamburg	22529	Lokstedter Steindamm 20	(53.59646938334918,9.965920433322648)	2	1	1	1	0	0	5	zwischen Sottorfallee und Siebenschön
298	DC3168	Hamburg	22453	Garstedter Weg 11	(53.62096422033808,9.954128714561975)	5	1	1	1	1	1	5	nähe Bushaltestelle Fuhlsbütteler Weg:
299	DC3172	Hamburg	22453	Ostfalenweg 34	(53.63983496748459,9.981050946625624)	1	1	1	1	0	0	5	Ecke Bayernweg:
300	DC3180	Hamburg	22455	Ohmoor 30	(53.63764891411541,9.964831791193914)	2	1	1	0	0	0	5	Ecke Hessenweg
301	DC3183	Hamburg	22455	Sachsenweg 19	(53.63751216207545,9.958178008715771)	2	1	1	1	0	0	5	
302	DC3188	Hamburg	22455	Wernigeroder Weg 7	(53.63323935113667,9.948048317748452)	2	1	1	1	0	0	5	::::
303	DC3077	Hamburg	20251	Wendloher Weg 	(53.59626776195157,9.981393655681588)	2	0	0	0	0	0	5	ggü. Wndloher Weg 5
304	DC3190	Hamburg	22459	Max-Zelck-Strasse 28	(53.62273860916207,9.94874754641927)	2	2	1	1	0	0	5	::::
305	DC3087	Hamburg	22335	Schlehdornweg 	(53.63299414073419,10.016874920936791)	2	0	0	0	0	0	5	ggü. Schlehdornweg 22: vor dem Sportplatz
306	DC3214	Hamburg	22457	Burgwedelkamp 21	(53.64186927093717,9.912188710467218)	3	1	1	1	0	0	5	ggü. Burgwedeltwiete
307	DC3216	Hamburg	22457	Geschwister-Witonski-Strasse 1	(53.646491640949044,9.913120131102374)	2	1	1	1	0	0	5	Ecke Lüttenredder
308	DC3091	Hamburg	22339	Ohkamp 	(53.63986178804723,10.01995759361736)	3	2	1	1	0	0	5	Ecke Flughafenstraße:
309	DC3098	Hamburg	22453	Stavenhagenstrasse 	(53.611509526545106,9.971574628811274)	2	0	0	0	0	0	5	ggü. Stavenhagenstraße 3: Ecke Ploogstieg
310	DC3274	Hamburg	20251	Curschmannstrasse 10	(53.585872102825164,9.979715235191925)	2	0	0	0	0	0	5	Ecke Hans-Mulch-Weg:
311	DC3272	Hamburg	20251	Eppendorfer Landstrasse 	(53.59693632958928,9.98842227334916)	3	1	1	1	0	0	5	Ecke Schubackstraße: neben der Bushaltestelle
312	DC3244	Hamburg	22527	Olloweg 	(53.60259011610731,9.91356962551003)	3	1	1	1	0	0	5	Ecke Kieler Straße
313	DC3259	Hamburg	22527	Jütländer Allee 	(53.60086160344492,9.931343879020934)	1	1	1	1	0	0	5	Ecke Vogt-Kölln-Straße
314	DC3254	Hamburg	22527	Spannskamp 24	(53.58873624147959,9.937912576303649)	2	1	1	1	0	0	5	
315	DC3249	Hamburg	22525	Wittenmoor 	(53.593983141288625,9.916686209112594)	2	1	1	1	0	0	5	ggü. Wittenmoor 27: Ecke Doerrisweg
316	DC3247	Hamburg	22525	Schmalenbrook 	(53.58437266242311,9.926152438381745)	1	1	1	1	0	0	5	
317	DC3239	Hamburg	22525	Ernst-Horn-Strasse 8	(53.58062347427734,9.9288565347056)	1	1	1	1	0	0	5	
318	DC3238	Hamburg	22457	Wählingsallee 8	(53.63166497824671,9.919614232345786)	2	1	1	1	0	0	5	Ecke Wählingsweg
319	DC3237	Hamburg	22459	Sperberhorst 	(53.63427146156792,9.956486364376442)	1	1	1	1	0	0	5	ggü. Nr. 10
320	DC2122	Hamburg	22763	Neumühlen 53	(53.54433758237217,9.91469242298897)	2	1	1	1	0	0	5	
321	DC3236	Hamburg	22523	Spanische Furt 	(53.62341629218769,9.911143990630894)	2	0	0	0	0	0	5	ggü. Spanische Furt 16: Ecke Lerchenkamp
322	DC3235	Hamburg	22459	Adlerhorst 5	(53.63068843114672,9.9548455671536)	1	1	1	1	0	0	5	
323	DC3193	Hamburg	22309	Eichenlohweg 17	(53.60963577428063,10.043819450229115)	6	3	3	2	0	0	5	Einkaufsmarkt: Parkplatz: ggü.Tennishalle
324	DC2026	Hamburg	22607	Osdorfer Weg 42	(53.56708422552651,9.892394634928163)	2	1	1	1	0	0	5	Ecke Grotenkamp
325	DC4002	Hamburg	21035	Wilhelm-Osterhold-Stieg 22	(53.48441124999699,10.155912024636732)	4	1	1	1	0	0	5	
326	DC3002	Hamburg	22297	Carl-Cohn-Strasse 71	(53.60748580911339,10.004946798329946)	4	0	0	0	0	0	5	
327	DC3004	Hamburg	22297	Heubergredder 38	(53.60698155568304,10.011477742958201)	2	2	1	1	1	1	5	U-Bahn Alsterdorf
328	DC3005	Hamburg	22297	Maienweg 47	(53.61445144080494,10.006161335949425)	2	0	0	0	0	0	5	ggü. Maienweg 47
329	DC3009	Hamburg	22297	Alsterkrugchaussee 184	(53.607701308096,9.99238859229523)	2	0	0	0	0	0	5	Ecke Wilhelm-Metzger-Strasse
330	DC3010	Hamburg	22335	Suhrenkamp 43	(53.618715350046244,10.012767387473374)	4	1	1	0	0	0	5	ggü. Suhrenkamp 43
331	DC3065	Hamburg	22297	Bebelallee 141	(53.60955884272012,10.007743050643638)	2	0	0	0	0	0	5	
332	DC2009	Hamburg	22767	Virchowstrasse 30	(53.55162447452295,9.947288438479605)	2	1	1	1	0	0	5	Nähe Kleine Bergstraße
333	DC2150	Hamburg	20359	Trommelstrasse 11	(53.54850231826901,9.95505689918139)	1	1	1	1	0	0	5	Bei Haus Nr.11 (vor Spielplatz)
334	DC2154	Hamburg	22767	Louise-Schroeder-Strasse 5	(53.55169789474678,9.955252690702423)	2	1	1	1	0	0	5	
335	DC2013	Hamburg	22769	Alsenplatz 1	(53.56624116090339,9.952638836632996)	3	1	1	1	1	2	5	Parkplatz, ggü. 1
336	DC2158	Hamburg	22765	Harkortstrasse 125	(53.56040055774329,9.939891962089233)	3	1	1	1	0	0	5	
337	DC2020	Hamburg	22525	Winsbergring 22	(53.575689531978405,9.912981524965017)	1	1	1	1	0	0	5	
338	DC2024	Hamburg	22607	Notkestrasse 5	(53.57340447449037,9.890118943730748)	2	1	1	1	1	1	5	
339	DC2034	Hamburg	22761	Ruhrstrasse 11	(53.56163554840382,9.928307845578692)	2	1	1	1	0	0	5	
340	DC2096	Hamburg	22549	Immenbusch 13	(53.58557841601342,9.85328794699685)	2	1	1	1	0	0	5	
341	DC4098	Hamburg	21129	Vierzigstücken 	(53.50846329506497,9.834663406063601)	2	1	1	1	0	0	5	gegenüber Nr. 39a: Nähe Achtern Brack
342	DC3158	Hamburg	22529	Niendorfer Strasse 	(53.60280708214423,9.953859987765876)	2	1	1	1	0	0	5	ggü. Niendorfer Straße 12
343	DC3161	Hamburg	22529	Stresemannallee 1	(53.59144310554604,9.960014999540695)	3	1	1	1	0	0	5	vor Gärtnerei
344	DC3197	Hamburg	22337	Steenkoppel 	(53.60852957867544,10.037735648114348)	3	1	1	1	0	0	5	Ecke Böckelweg: Sackgasse
345	DC3218	Hamburg	22457	Halstenbeker Strasse 71	(53.625195925120494,9.899242564190113)	2	1	1	1	0	0	5	
346	DC3257	Hamburg	22527	Stellinger Steindamm 	(53.59451329316868,9.928132331640906)	2	1	1	1	0	0	5	ggü. Stellinger Steindamm 17
347	DC3222	Hamburg	22457	Kalvslohtwiete 2	(53.62983230084264,9.893629627268677)	1	1	1	1	0	0	5	
348	DC4132	Hamburg	20539	Sieldeich 11	(53.52734819003256,10.021348085521504)	2	1	1	0	0	0	5	vor Einkaufsmarkt: ggü. Nr. 38
349	DC4133	Hamburg	21107	An der Hafenbahn 5	(53.520272697685996,10.010930672670206)	2	1	1	1	0	0	5	Kehre
350	DC4114	Hamburg	21149	Ohrnsweg 8	(53.47368530220474,9.824534041199854)	1	1	1	1	0	0	5	vor Nr. 8a-c
351	DC4116	Hamburg	21147	Rehrstieg 47	(53.478244788606425,9.874666572657588)	2	2	1	1	0	0	5	vor Nr. 47
352	DC4117	Hamburg	21149	Scharlbarg 3	(53.47076408296872,9.826968752134816)	4	1	1	1	0	0	5	Ecke Cuxhavener Straße: ggü. Nr.2b
353	DC4120	Hamburg	21079	Grossmoorbogen 2	(53.46292948337074,10.010561720873653)	3	1	1	1	0	0	5	zwischen Fünfhausener Landweg und Neuländer Straße
354	DC4121	Hamburg	21079	Neuländer Elbdeich 	(53.470684638319675,10.02601819695259)	3	1	1	1	0	0	5	ggü. Nr. 194
355	DC2111	Hamburg	22605	Trenknerweg 101	(53.546839534136694,9.905386608620228)	3	1	1	1	0	0	5	
356	DC3032	Hamburg	22523	Wildacker 	(53.62207963095718,9.890584018428905)	1	1	1	1	0	0	5	ggü. Nr. 34
357	DC3121	Hamburg	22419	Tarpenring 23	(53.66378582920756,9.99425308770316)	5	2	1	1	0	0	5	
358	DC4122	Hamburg	21079	Communionsweg 	(53.45656206439948,9.998486764820656)	2	1	1	1	0	0	5	Ecke Lewenwerder
359	DC4123	Hamburg	21077	Sinstorfer Kirchweg 61	(53.42409518227415,9.965600672057887)	5	3	3	3	0	0	5	Raststätte Harburger Berge: Richtung Norden: 1 Standplatz auf
360	DC4124	Hamburg	21077	Maldfeldstrasse 	(53.42384301594574,9.963032526207387)	3	1	1	1	0	0	5	Raststätte Harburger Berge: Richtung Süden:
361	DC4125	Hamburg	21079	Hermannsburger Weg 	(53.42823882060331,9.985469606714226)	2	2	1	1	0	0	5	Ecke Rönneburger Kirchweg: ggü. Rönneburger Kirchweg 16
362	DC4127	Hamburg	21077	Sinstorfer Weg 	(53.429164838280855,9.972724120136283)	1	1	1	1	0	0	5	Ecke Moorlage: vor KLGV 773: Höhe Parkplatz
363	DC4128	Hamburg	21077	Winsener Strasse 233	(53.42084059571834,9.98142543403918)	8	2	1	1	0	0	5	vor Baumarkt:ggü. Maldfeldstraße
364	DC4134	Hamburg	21109	Jakobsberg 9	(53.483969671834714,10.026274071381104)	7	0	0	0	0	0	5	Raststätte Stillhorn Ostseite: Richtung Norden: 1 Standplatz ggü
365	DC1190	Hamburg	22087	Lübecker Strasse 54	(53.55932137975376,10.027301267767433)	2	1	1	1	1	1	5	
366	DC1119	Hamburg	20539	Billstrasse 61	(53.541046193862556,10.038149853055222)	1	1	1	1	0	0	5	
367	DC1124	Hamburg	20539	Hardenstrasse 51	(53.53704486273055,10.031670048198944)	3	1	1	1	0	0	5	
368	DC1127	Hamburg	20539	Vierländer Damm 78	(53.53309718519627,10.048130498079471)	1	2	1	1	0	0	5	
369	DC1159	Hamburg	20539	Billhorner Röhrendamm 151	(53.53546824785382,10.03739378605258)	1	1	1	1	0	0	5	
370	DC1202	Hamburg	20539	Ausschläger Billdeich 62	(53.542000500899555,10.051830649698697)	2	1	1	1	0	0	5	
371	DC2002	Hamburg	22765	Haubachstrasse 78	(53.56052672422932,9.94450694718557)	2	1	1	1	0	0	5	
372	DC1087	Hamburg	20095	Messberg 1	(53.54773579427443,10.001731848528856)	3	1	1	1	1	1	5	
373	DC5001	Hamburg	22359	Stüffelring 61	(53.669338090825825,10.140625083248922)	3	0	0	0	0	0	5	Ecke Volksdorfer Damm
374	DC2018	Hamburg	22525	Hellgrundweg 45	(53.587800515555024,9.896129199459196)	2	1	1	1	0	0	5	
375	DC2019	Hamburg	22525	Rondenbarg 6	(53.57310405129389,9.92544541273327)	2	1	1	1	0	0	5	
376	DC1016	Hamburg	22085	Hofweg 31	(53.570717087140416,10.016908933642215)	3	0	0	0	0	0	5	Ecke Averhoffstraße
377	DC1067	Hamburg	22303	Geisslertwiete 2	(53.58627267075791,10.029461912189284)	4	0	0	0	0	0	5	Ecke Jarrestrasse
378	DC3078	Hamburg	20251	Frickestrasse 30	(53.59346580901303,9.978298200763446)	5	2	2	1	0	0	5	ggü. Schedestraße
379	DC2029	Hamburg	22607	Zum Hünengrab 2	(53.569192911785315,9.87995856509969)	2	1	1	1	0	0	5	Ecke Osdorfer Landstraße
380	DC2032	Hamburg	22761	Regerstrasse 69	(53.569826727223784,9.917085480751197)	2	1	1	1	0	0	5	
381	DC2035	Hamburg	22761	Schützenstrasse 74	(53.56546204726737,9.929915846811383)	2	1	1	1	0	0	5	Ecke Leverkusenstraße
382	DC2037	Hamburg	22761	Theodorstrasse 41	(53.57081222062114,9.898205571144501)	2	1	1	1	0	0	5	Ecke Luruper Chaussee
383	DC2033	Hamburg	22761	Regerstrasse 36	(53.56825761421984,9.91100843047828)	2	1	1	1	0	0	5	
384	DC1143	Hamburg	22305	Rudolphiplatz 1	(53.58770027660306,10.058624449960902)	3	2	1	1	0	0	5	Ecke Lämmersieth
385	DC1145	Hamburg	22305	Krausestrasse 8	(53.58572350657114,10.052512579871246)	3	0	0	0	0	0	5	Ecke Geierstrasse, Höhe Krausestrasße ggü. 8
386	DC1146	Hamburg	22305	Drosselstrasse 2	(53.58718842215883,10.051060818186974)	1	1	1	1	0	0	5	
387	DC5039	Hamburg	22043	Bei den Höfen 32	(53.57251838098041,10.134555164361993)	3	0	0	0	0	0	5	neben der Parkplatzausfahrt
388	DC5061	Hamburg	22395	Alsterredder 	(53.65922496096366,10.095093844933176)	3	0	0	0	0	0	5	ggü. Nr. 46
389	DC5091	Hamburg	22147	Stargarder Strasse 	(53.61259362747766,10.126548342265394)	5	2	2	1	0	0	5	neben Zuwegung zum Kleingarten
390	DC1057	Hamburg	20537	Süderstrasse 	(53.54681654991957,10.061674192095575)	3	1	1	1	0	0	5	Ecke Diagonalstr.: ggü. Kleingartenverein: Richtung Tierheim
391	DC1114	Hamburg	22115	Grosse Holl 43	(53.53112353850409,10.152006131590728)	1	0	0	0	0	0	5	ggü. 43: Ecke Hollkoppelweg
392	DC1134	Hamburg	22111	Reclamstrasse 19	(53.53993425338348,10.110562900048778)	2	1	1	1	0	0	5	beim Einkaufsmarkt
393	DC5005	Hamburg	22175	Lüdmoor 	(53.62709431079807,10.09682860642969)	3	1	1	1	0	0	5	Ecke Kätnermoor
394	DC2077	Hamburg	22547	Franzosenkoppel 	(53.598245278785924,9.88121505318572)	2	1	1	1	0	0	5	ggü. Nr. 15
395	DC4097	Hamburg	21129	Nincoper Ort 	(53.51474373632826,9.793503345098603)	2	1	1	1	0	0	5	gegenüber Nr.10: Rückseite Freiwillige Feuerwehr
396	DC1174	Hamburg	20537	Wichernsweg 9	(53.553376956571746,10.064484394219543)	2	0	0	0	0	0	5	Ggü. Ewaldsweg
397	DC5027	Hamburg	22159	Berner Allee 	(53.62715161978969,10.123124641362853)	4	2	2	1	0	0	5	Bushaltestelle Lienaustraße: Mittelinsel: Ecke Lienaustraße
398	DC2023	Hamburg	22607	Ebertallee 119	(53.570296793596654,9.88983738578428)	2	1	1	1	0	0	5	Ecke Quickborn:Mittelstreifen
399	DC2109	Hamburg	22605	Hochrad 15	(53.55441276556578,9.874650238178956)	2	1	1	1	0	0	5	
400	DC2125	Hamburg	22765	Arnoldstrasse 42	(53.54900342944021,9.926623217698001)	4	1	1	1	1	1	5	ggü. 42
401	DC2160	Hamburg	22767	Gählerstrasse 1	(53.554923996839456,9.95197746468938)	3	1	1	0	0	0	5	Ecke Holstenstraße
402	DC2025	Hamburg	22607	Notkestrasse 23b	(53.572600765788714,9.884892585293933)	3	1	1	1	0	0	5	Ecke Im Hag
403	DC1064	Hamburg	22303	Goldbekplatz 6	(53.58425685719101,10.011303570740512)	5	0	0	0	0	0	5	
404	DC3016	Hamburg	22523	Torfweg 	(53.611009414486304,9.885876889150815)	1	1	1	1	0	0	5	neben Nr. 57:Ecke Goldnesselweg
405	DC3038	Hamburg	22527	Niendorfer Gehege 	(53.609794441898785,9.920814705393155)	3	1	1	1	0	0	5	70m östlich Niendorfer Gehege 177
406	DC3120	Hamburg	22415	Olenland 	(53.65435134480784,10.025088825960074)	6	2	2	1	0	0	5	Ecke Wördenmoorweg
407	DC5057	Hamburg	22391	Emekesweg 1	(53.64686617607489,10.076533362909702)	2	0	0	0	0	0	5	
408	DC2017	Hamburg	22769	Memellandallee 7	(53.56871829120527,9.942687432679886)	2	1	1	1	0	0	5	Ecke Waidmannstrasse
409	DC4162	Hamburg	21107	Rotenhäuser Damm 45	(53.510477934833965,9.991235328830602)	2	1	1	1	0	0	5	Ecke Neuhöfer Strasse
410	DC2123	Hamburg	22763	Neumühlen 1	(53.54478283263198,9.92661616416782)	3	1	1	1	0	0	5	
411	DC5044	Hamburg	22045	Charlottenburger Strasse 77	(53.58454531395779,10.141617118156777)	2	1	1	1	1	1	5	ggü. Hs.-Nr. 77: Berliner Platz
412	DC4167	Hamburg	21109	Otto-Brenner-Strasse 6	(53.48986960767409,10.019692933335735)	3	1	1	1	0	0	5	ggü. Tankstelle:ggü. Nr.6
413	DC4130	Hamburg	20539	Am Zollhafen 24	(53.52290736303764,10.021900594118332)	3	1	1	0	0	0	5	ggü.Nr. 24: gegenüber Kita: Ecke Hovestieg
414	DC1076	Hamburg	22111	Horner Rampe 46	(53.54175451915482,10.083460728482116)	4	1	1	1	0	0	5	Nähe Billufer
415	DC3125	Hamburg	20144	Isestrasse 13	(53.579057218642674,9.977997616305696)	2	0	0	0	0	0	5	ggü. Innocentiastrasse
416	DC2085	Hamburg	22609	Jürgensallee 57	(53.55732410784963,9.861907355315077)	2	1	1	1	1	1	5	ggü. Nr. 57: Derby Park
417	DC4150	Hamburg	21107	Rüdemannweg 5	(53.50172501759904,9.990125265718945)	1	0	0	0	0	0	5	
418	DC2114	Hamburg	22763	Behringstrasse 36a	(53.5540843726941,9.920862225374975)	2	1	1	1	0	0	5	
419	DC3116	Hamburg	22415	Rittmerskamp 	(53.651433469786376,10.001574870270392)	3	1	1	1	1	1	5	Ecke Samlandweg
420	DC5058	Hamburg	22043	Hammer Strasse 124	(53.56285090011971,10.066036762575296)	1	0	0	0	0	0	5	In der Kehre: Bei der Schule
421	DC1144	Hamburg	22305	Maurienstrasse 21	(53.5857772644752,10.04605919563229)	2	1	1	1	0	0	5	Ecke Fuhlsbüttler Straße
422	DC1185	Hamburg	22087	Hohenfelder Allee 1	(53.560713474114884,10.02735951611722)	1	0	0	0	0	0	5	
423	DC1191	Hamburg	22115	Feiningerstrasse 20	(53.52826744853912,10.14919737506187)	1	2	0	1	1	1	5	ggü. 20-22: Ecke Kandinskyallee: ggü. U-Bahn
424	DC2030	Hamburg	22761	Bahrenfelder Steindamm 45	(53.56037004740197,9.92673883969432)	2	1	1	1	0	0	5	Ecke Thomasstraße
425	DC2131	Hamburg	22559	Grot Sahl 36	(53.58897038091606,9.76069999269561)	2	1	1	1	0	0	5	Ecke Gudrunstraße
426	DC3251	Hamburg	22527	Hagenbeckstrasse 104	(53.58758596158192,9.942802769500705)	1	1	1	1	0	0	5	
427	DC3113	Hamburg	20146	Schlüterstrasse 70	(53.569582420524966,9.986392368526829)	2	0	0	0	0	0	5	Ecke Hartungstrasse:
428	DC2086	Hamburg	22609	Elbschlossstrasse 13	(53.55153069934382,9.852046812051606)	2	1	1	1	0	0	5	ggü. Georg-Bonne-Straße 2:Ecke Am Internationalen Seegerichtshof
429	DC4163	Hamburg	21109	Niedergeorgswerder Deich 64	(53.51157815561421,10.021145661651962)	2	0	0	0	0	0	5	Bushaltestelle Rahmwerder Strasse
430	DC4074	Hamburg	21147	Hardauring 32	(53.47745354971417,9.88378950165018)	2	1	1	1	1	1	5	neben Anlieferung Supermarkt:
431	DC2079	Hamburg	22549	Grandkuhlenweg 11	(53.58496098360365,9.869168029504044)	14	3	3	2	1	2	5	ggü. Nr. 11, auf dem Parkplatz vor dem Einkaufsmarkt
432	DC4160	Hamburg	21109	Moorwerder Westerdeich 	(53.47763791572452,10.042672571453187)	2	1	1	1	0	0	5	zwischen Moorwerder Brückendamm und Am Heuckenlock
433	DC4183	Hamburg	21109	Wittestrasse 	(53.50002602837441,10.008883233942813)	2	0	0	0	0	0	5	ggü. Keindorffstraße:ggü. Nr. 19:vor Jungnickelstraße 13
434	DC1019	Hamburg	22087	Hartwicusstrasse 21	(53.566065554681366,10.021059308785864)	3	0	0	0	1	0	5	Ecke Mundsburger Damm: ggü. 21: Hinter der Tankstelle
435	DC5048	Hamburg	22045	Kuehnstrasse 	(53.58455633211337,10.132773413432492)	3	1	1	1	0	0	5	ggü. Nr. 182: Parkplatz
436	DC5053	Hamburg	22043	Jüthornstrasse 110	(53.5685961737736,10.091159529990614)	2	1	1	1	0	0	5	ggü. Alphonsstrasse: Bushaltestelle AK Wandsbek
437	DC5145	Hamburg	22391	Schwarzdornweg 10	(53.63451515824205,10.06884716881751)	3	0	0	0	0	0	5	Ecke Eckerkamp
438	DC5114	Hamburg	22309	Noldering 	(53.60483837558592,10.046259489239933)	2	0	0	0	0	0	5	Ecke Schmachthäger Straße
439	DC1167	Hamburg	20535	Marienthaler Strasse 64	(53.56282179252396,10.046023456537728)	3	1	1	1	0	0	5	ggü. Marienthaler Str. 64: Rießerstr.: auf Grüninsel
440	DC1175	Hamburg	20535	Hammer Steindamm 131	(53.55830175258735,10.0539774743533)	4	2	1	1	0	0	5	Bei der Vogelstange: vor Stadion: ggü. Sportplatz
441	DC1176	Hamburg	20535	Moorende 2	(53.55975498590347,10.05083354161304)	3	1	1	1	0	0	5	Ecke Sievekingsdamm: ggü. Nr. 2
442	DC1003	Hamburg	20537	Borstelmannsweg 103	(53.549753694507615,10.052291804611926)	2	1	1	1	0	0	5	Wendenstr.
443	DC2142	Hamburg	20357	Grabenstrasse 10	(53.560578305652776,9.972379515992039)	2	1	1	1	0	0	5	ggü. Schule: Ende Flora-Neumann-Straße
444	DC1043	Hamburg	22081	Alter Teichweg 25	(53.58209287393925,10.051161643573503)	3	1	1	1	0	0	5	ggü. 25-27, Nähe Damerowsweg
445	DC5088	Hamburg	22147	Falkenburger Ring 12	(53.62373039986479,10.137417016069525)	1	0	0	0	0	0	5	vor Spielplatz neben 12 a
446	DC5106	Hamburg	22309	Erich-Ziegel-Ring 	(53.614980201966716,10.060060613552034)	3	1	1	1	0	0	5	zwischen Nr. 41 und Nr. 43a: Parkhaus
447	DC5107	Hamburg	22309	Erich-Ziegel-Ring 16	(53.61494475222112,10.063609315681916)	2	0	0	0	0	0	5	
448	DC2141	Hamburg	20357	Sternstrasse 2	(53.55839115956066,9.96720405137627)	3	1	1	1	0	0	5	Schlachthofpassage
449	DC3141	Hamburg	22527	Lokstedter Höhe 1	(53.59331083192695,9.94618070848569)	2	1	1	1	0	0	5	
450	DC3029	Hamburg	22523	Rungwisch 28	(53.61064583331173,9.909960231237047)	3	1	1	1	0	0	5	ggü. Nr. 28
451	DC2120	Hamburg	22763	Hohenzollernring 104	(53.55664727434884,9.918426376312102)	3	1	2	0	1	1	5	Ecke Friedensallee 83
452	DC5148	Hamburg	22397	Wragekamp 12	(53.71162557981012,10.106902275364666)	4	1	1	1	0	0	5	
453	DC4060	Hamburg	21129	Ostfrieslandstrasse 46	(53.52816523642588,9.87917687797999)	1	1	1	1	0	0	5	auf dem Parkplatz:Ecke Dangaster Weg
454	DC5025	Hamburg	22159	Berner Heerweg 117	(53.600887048894386,10.118300633673941)	2	1	1	1	0	0	5	Ecke Stichstrasse bei Nr. 117
455	DC5128	Hamburg	22145	Meiendorfer Weg 	(53.63935603246072,10.156098911334947)	2	0	0	0	0	0	5	ggü. Nr. 124: Einfahrt P + P Parkplatz U-Bahn Meiendorfer Weg
456	DC2080	Hamburg	20355	Enckeplatz 1	(53.552160790085395,9.9768178113183)	2	1	1	1	0	0	5	Nähe Neanderstraße
457	DC1054	Hamburg	22049	Alter Teichweg 65	(53.58394041944751,10.058227596061279)	2	1	1	1	1	1	5	ggü. Weichselmünder Str.: vor Supermarkt
458	DC1091	Hamburg	22117	Morsumer Weg 19	(53.54060209713731,10.139640473609512)	3	0	0	0	0	0	5	ggü. Bahnhof
459	DC1108	Hamburg	22115	Steinbeker Grenzdamm 2	(53.52378400894819,10.150748383043998)	2	2	1	1	0	0	5	ggü. Bienenbusch
460	DC1138	Hamburg	22117	Öjendorfer Steinkamp 22	(53.54071920344873,10.132231529680224)	1	0	0	0	0	0	5	Öjendorfer Steinkamp Hausnummer 22
461	DC4011	Hamburg	21031	Sander Damm 25	(53.49250472179392,10.205578832993709)	1	1	1	1	0	0	5	ggü. Nr.25: Vor dem Parkhaus
462	DC1084	Hamburg	22083	Beim Alten Schützenhof 19	(53.57588049945763,10.029860620245008)	4	0	0	0	0	0	5	zwischen Bartohlomäusstrasse und Frahmheinstrasse
463	DC5011	Hamburg	22177	Heinrich-Helbing-Strasse 48	(53.59877764802083,10.05590657982442)	3	2	1	1	0	0	5	ggü. Middendorfstraße
464	DC5024	Hamburg	22159	Berner Heerweg 61	(53.59624351945952,10.115877696913005)	2	1	1	1	0	0	5	Ecke Wagnerkoppel
465	DC2003	Hamburg	22767	Bugdahnstrasse 31	(53.55128623988531,9.939429479319157)	5	1	1	1	1	0	5	
466	DC4021	Hamburg	21035	Weidenbaumsweg 69	(53.48688003360639,10.20278338230095)	2	1	1	1	0	0	5	ggü. Nr.50: 70m vor Stuhlrohrstraße
467	DC4087	Hamburg	21037	Ochsenwerder Landscheideweg 279	(53.44621179055334,10.125525125830649)	4	2	3	1	0	0	5	vor Gewässer: ggü. Nr.276
468	DC5030	Hamburg	22159	Traberweg 	(53.59821256389795,10.101447758084037)	3	1	1	1	0	0	5	U-Bahn "Trabrennbahn"
469	DC5003	Hamburg	22395	Bergstedter Kirchenstrasse 	(53.673149016089845,10.123778618890409)	2	2	2	2	0	0	5	ggü. Nr. 15
470	DC5152	Hamburg	22159	Max-Herz-Ring 	(53.59570662776047,10.1058912102561)	1	1	1	1	0	0	5	Ecke Ebersreye: Parkplatz
471	DC5151	Hamburg	22159	An der Walddörferbahn 	(53.604426158613094,10.11587924643173)	4	2	2	0	1	1	5	ggü. EKZ Farmsen: Parkplatz
472	DC5051	Hamburg	22041	Knutzenweg 	(53.569792692207585,10.062241881777577)	2	1	1	1	0	0	5	ggü. Nr. 28: Parkhauszufahrt
473	DC5062	Hamburg	22395	Saseler Damm 75	(53.65647839867281,10.08528255907594)	1	0	0	0	0	0	5	
474	DC5141	Hamburg	22047	Wandsbeker Schützenhof 	(53.5952193284171,10.085115197724114)	2	0	0	0	0	0	5	Ecke Rauschener Ring: ggü. Nr.40
475	DC3207	Hamburg	20146	Allende-Platz 2	(53.56753533801973,9.983013863645535)	3	1	1	1	0	0	5	am hinteren Ende vom Abaton Parkplatz
476	DC3210a	Hamburg	20148	Mollerstrasse 20	(53.57052848083994,9.99257793545931)	4	0	0	0	0	0	5	Ecke Heimhuder Straße: ggü. Kirche
477	DC2126	Hamburg	22765	Gaussstrasse 60	(53.55830573573395,9.932029619823128)	3	1	1	1	0	0	5	
478	DC5071	Hamburg	22143	Grosslohering 70	(53.60189639819921,10.182064423471918)	3	1	1	1	1	1	5	Parkbucht
479	DC5099	Hamburg	22393	Kätnerwiese 	(53.640391323793736,10.117698695258866)	3	0	0	0	0	0	5	Ecke Hasenweg
480	DC5108	Hamburg	22309	Erich-Ziegel-Ring 64	(53.61392663979095,10.061765481429257)	2	0	0	0	0	0	5	
481	DC5122	Hamburg	22359	Ahrensburger Platz 	(53.65568398106443,10.176096878804568)	3	1	1	1	0	0	5	Ecke Ahrensburger Weg
482	DC5111	Hamburg	22309	Gropiusring 15	(53.611864849668414,10.055055589544258)	1	0	0	0	0	0	5	zwischen Nr. 15-21
483	DC2082	Hamburg	20459	Schaarmarkt 	(53.546298910414365,9.978042374418447)	1	1	1	1	1	1	5	Nähe Ditmar-Koel-Straße: neben Michel-Tiefgarage
484	DC2143	Hamburg	20459	Eichholz 	(53.54665795214065,9.975979967923145)	2	0	0	0	0	0	5	Kehre: ggü. Eichholz 11
485	DC1098	Hamburg	22117	Möllner Landstrasse 137	(53.53865196142782,10.123950788640219)	6	2	2	1	1	1	5	U-Bahn Merkenstr.: Einkaufsmarkt
486	DC1100	Hamburg	22117	Oststeinbeker Weg 34	(53.537335398694665,10.13665355577785)	2	0	0	0	0	0	5	Nähe Wegkoppel
487	DC1105	Hamburg	22115	Paul-Klee-Strasse 3	(53.5265364920737,10.148192924483467)	1	0	0	0	0	0	5	Parkplatz Ev.-Luth.-Gemeindezentrum
488	DC1113	Hamburg	22115	Godenwind 29	(53.525131419040605,10.145368729866188)	1	0	0	0	0	0	5	Wilhelm-Lehmbruck-Str.
489	DC1195	Hamburg	22119	Manshardtstrasse 	(53.55789883645854,10.122386300472815)	3	1	1	1	0	0	5	vor dem Friedhof
490	DC1200	Hamburg	22111	Legienstrasse 	(53.54541684745566,10.097487626653878)	3	1	1	1	0	0	5	ggü. Helma-Steinbach-Weg 24
491	DC1206	Hamburg	20097	Rosenallee 	(53.549088767984,10.01507226817526)	2	1	1	0	0	0	5	Ecke Spaldingstrasse
492	DC1207	Hamburg	20097	Repsoldstrasse 	(53.548036328986605,10.013741873094137)	3	1	1	0	0	0	5	neben Hochstr., Nordkanalstr.
493	DC1111	Hamburg	22115	Kandinskyallee 25	(53.52851701514944,10.149978902807836)	2	0	0	0	0	0	5	Ecke Große Holl: ggü. Schule
494	DC1112	Hamburg	22115	An der Glinder Au 59	(53.5352046086409,10.138607069095631)	3	1	1	1	0	0	5	Nähe Sonnenland
495	DC2140	Hamburg	20357	Lagerstrasse 11	(53.56251841726318,9.970348674334241)	3	1	1	1	0	0	5	ggü.11, ggü. Einfahrt Schlachthof
496	DC2046	Hamburg	22605	Baurstrasse 5	(53.55951605426992,9.900529341179718)	3	1	1	1	0	0	5	ggü. Nr. 5
497	DC2094	Hamburg	22549	Bornheide 37	(53.58532180951221,9.851957523858307)	3	1	1	1	0	0	5	ggü. Nr. 37
498	DC3054	Hamburg	20257	Bei der Apostelkirche 20	(53.57639108958877,9.945588358735865)	4	1	1	1	0	0	5	ggü. 20: Ecke Hellkamp:
499	DC3075	Hamburg	20251	Frickestrasse 20	(53.591992837729094,9.980232582425504)	3	1	1	1	0	0	5	ggü. Frickestraße 20
500	DC5009	Hamburg	22177	Fabriciusstrasse 105	(53.6026585994282,10.06344043021056)	4	2	1	1	0	0	5	ggü. Nr. 105 und Teerosenweg
501	DC4155	Hamburg	21109	Krieterstrasse 7	(53.49860304666001,10.0126846467466)	1	0	0	0	0	0	5	Auf Mittelinsel vom Parkplatz:ggü. Wilhelm-Strauß-Weg
502	DC3104	Hamburg	20144	Brahmsallee 	(53.57259161123629,9.981732676657339)	2	1	1	1	0	0	5	Ecke Hallerstraße
503	DC4136	Hamburg	21107	Bonifatiusstrasse 	(53.50331400596759,9.989974248966451)	3	1	1	1	0	0	5	Ecke Bauwiesenstraße 25
504	DC4179	Hamburg	21109	Thielenstrasse 33	(53.50160482297593,10.012644497677913)	2	2	2	0	0	0	5	
505	DC4061	Hamburg	21129	Rudolf-Kinau-Allee 19	(53.53257672307416,9.849446836806052)	2	2	1	1	0	0	5	Neben Ladenzeile:ggü. Neßkatenweg:vor Parkanlage
506	DC4023	Hamburg	21033	Mittlerer Landweg 65	(53.49724939817541,10.131967673996705)	3	1	1	1	0	0	5	S-Bahn Mittlerer Landweg:zwischen den Bahnbrücken
507	DC1025	Hamburg	22081	Von-Essen-Strasse 59	(53.57324251334805,10.044049307591676)	3	0	0	0	0	0	5	Ecke Gluckstrasse
508	DC5034	Hamburg	22339	Teetzparkweg 	(53.63486684259438,10.037569131517952)	3	1	1	1	0	0	5	ggü. Nr. 18
509	DC5131	Hamburg	22393	Waldweg 	(53.653742368964416,10.159102570551536)	6	2	3	1	0	0	5	nähe Halenreie
510	DC1088	Hamburg	22119	Manshardtstrasse 127	(53.55848539762233,10.111853208981104)	2	1	1	1	0	0	5	Nähe Drosselbartweg: ggü. Manshardtstr. 127
511	DC1090	Hamburg	22117	Kaltenbergen 1	(53.54268690198895,10.143221828244744)	2	1	1	1	0	0	5	
512	DC1137	Hamburg	22115	Grosse Holl 8	(53.52867271030914,10.152867564868624)	1	0	0	0	0	0	5	ggü. Große Holl 8: Strietkoppel ggü. 21
513	DC4089	Hamburg	21077	Beutnerring 2	(53.4433437841971,9.955796778921853)	2	1	1	1	1	1	5	Ecke Ernst-Bergeest-Weg
514	DC4082	Hamburg	21075	Denickestrasse 100	(53.45909575112222,9.955499835729787)	4	1	1	1	1	1	5	Parkstreifen: ggü. Nr. 100: Ecke Weusthoffstraße
515	DC4172	Hamburg	21109	Roseliusweg 11	(53.50156196652898,10.01807491168683)	2	1	1	1	0	0	5	ggü. Nr.16: vor der Kehre
516	DC4057	Hamburg	21129	Köhlfleet-Hauptdeich 7	(53.532890862896174,9.881896638731785)	4	2	1	1	0	0	5	in der Kehre neben Einkaufsmarkt: hinter Hochwasserschutzanlage :Am
517	DC4006	Hamburg	21035	Felix-Jud-Ring 	(53.48223971700783,10.151685564132537)	3	1	1	1	0	0	5	vor KLGV 630:ggü. Herbert-Pardo-Weg
518	DC5147	Hamburg	22397	Westerfelde 	(53.69510137679762,10.136823342353791)	9	2	2	1	1	1	5	P+R U-Bahn Ohlstedt: Ecke Alte Dorfstrasse
519	DC5065	Hamburg	22399	Heimgarten 	(53.66977650887716,10.0608488054)	1	1	1	1	0	0	5	Haubenlerchenweg: ggü. Heimgarten 56
520	DCXXXX	Hamburg	22081	Gluckstrasse 	(53.57392043092845,10.046888742434403)	2	0	0	0	0	0	5	Ecke Bürgerstrasse
521	DC2044	Hamburg	22589	Schenefelder Landstrasse 76	(53.56704262587931,9.826749053291664)	3	1	1	1	1	1	5	ggü. Nr. 76
522	DC1005	Hamburg	20537	Hammer Deich 3	(53.54680113679231,10.04060324010048)	1	1	1	1	0	0	5	Parkplatz Shell-Tankstelle
523	DC4148	Hamburg	20539	Harburger Chaussee 77	(53.52082954167009,10.00732685792486)	3	1	1	1	1	1	5	Bushaltestelle Harburger Chaussee:ggü. Nr. 71-77
524	DC4153	Hamburg	21109	Korallusring 9	(53.503476798603664,10.01269009330483)	3	0	0	0	0	0	5	
525	DC4013	Hamburg	21029	Justus-Brinckmann-Strasse 1A	(53.48123924991351,10.229097545936465)	3	1	1	1	0	0	5	Justus-Brinckmann-Strasse Nr. 5
526	DC1026	Hamburg	22081	Von-Essen-Strasse 113	(53.577944372977875,10.046004072735942)	5	1	1	1	0	0	5	ggü. Nr. 113: Ecke Zeisigstr.: vor Schule
527	DC5029	Hamburg	22159	Rahlstedter Weg 	(53.60237655786751,10.12759369963595)	1	1	1	0	0	0	5	Ecke Weißenhof
528	DC1165	Hamburg	22089	Richardstrasse 68	(53.56886230820455,10.038674789480341)	4	0	0	0	0	0	5	Ecke Blumenau: ggü. Richardstr. 68
529	DC1171	Hamburg	22089	Eilbeker Weg 202	(53.57333725312411,10.05545477093081)	1	0	0	0	0	0	5	Ecke Rückerstr.: ggü. Eilbeker Weg 202
530	DC1055	Hamburg	22119	Manshardtstrasse 	(53.55554848175572,10.093813085832778)	1	1	1	1	0	0	5	Nähe Speckenreye: ggü. Schule
531	DC1056	Hamburg	22119	Stoltenstrasse 35	(53.55844537679094,10.095713632207545)	2	0	0	0	0	0	5	Ecke Manshardtstr.
532	DC4203	Hamburg	21031	Osterrade 49	(53.51090471461279,10.181279159836102)	2	1	1	1	0	0	5	Ecke Bodestraße
533	DC5054	Hamburg	22043	Osterkamp 	(53.567854305784664,10.099965236961722)	4	1	1	1	1	1	5	ggü. Vereinshaus Concordia
534	DC5056	Hamburg	22399	Kiwittredder 	(53.67280680785153,10.055058541283902)	5	1	1	1	0	0	5	Ecke Kupferteichweg: Parkplatz
535	DC5142	Hamburg	22049	Lesserstrasse 7	(53.579986245628476,10.07228019266226)	2	1	1	1	0	0	5	
536	DC1040	Hamburg	22111	Beim Rauhen Hause 92	(53.55118191864588,10.078937448303682)	3	2	2	1	1	1	5	ggü. Einkaufsmarkt
537	DC1061	Hamburg	22087	Eilenau 	(53.56599106319776,10.030271853512463)	2	0	0	0	0	0	5	ggü. 20 Ecke Lessingstrasse
538	DC4201	Hamburg	21039	Odemanns Heck 12	(53.44762196075275,10.22109872859996)	2	1	1	1	0	0	5	Vor der Schule Curslack
539	DC2149	Hamburg	20359	Beim Grünen Jäger 11	(53.55766161463063,9.963283438880833)	2	0	0	0	0	0	5	Gegenüber Beim Grünen Jäger 11
540	DC4046	Hamburg	21077	Beerentalweg 19	(53.450145376823926,9.95539259999728)	3	1	1	1	1	1	5	ggü. Beerentaltwiete
541	DC2095	Hamburg	22549	Böttcherkamp 	(53.593062653715364,9.854358294546804)	2	1	1	1	0	0	5	ggü. Böttcherkamp 194: Ecke Bornheide
542	DC2016	Hamburg	22769	Missundestrasse 11a	(53.56277943836322,9.952159188935534)	3	1	1	0	0	0	5	ggü. 2
543	DC4113	Hamburg	21147	Neuwiedenthaler Strasse 3	(53.476904984174034,9.865229141124626)	2	1	1	1	0	0	5	Höhe Freibad: auf Mittelinsel: Parkstreifen
544	DC4086	Hamburg	21037	Kirchwerder Elbdeich 68	(53.40056501659716,10.17411852605289)	5	1	1	1	0	0	5	Neben der Flüchtlingsunterkunft: Elbradwanderweg
545	DC5130	Hamburg	22359	Ohlendorffs Tannen 41	(53.66879650105154,10.147434841568787)	5	2	2	1	1	1	5	Ecke Volksdorfer Damm
546	DC2155	Hamburg	22607	Corneliusstrasse 13	(53.56283382962472,9.889195720547221)	2	1	1	1	1	1	5	Ecke Cranachstrasse
547	DC3035	Hamburg	22523	Ekenknick 3	(53.60784239187173,9.903435185085963)	2	1	1	1	0	0	5	Rückseite Eidelstedter Marktplatz: Kehre
548	DC3246	Hamburg	22527	Högenstrasse 54	(53.581091100525896,9.938554750099376)	4	1	1	1	1	1	5	ggü. Langenfelder Damm 65: neben Aldi
549	DC3163	Hamburg	22529	Veilchenweg 32a	(53.588809775919415,9.95990325132277)	2	1	1	1	0	0	5	Ecke Lianenweg: ggü. 32a
550	DC3245	Hamburg	22525	Kamerbalken 9	(53.59217062220758,9.92381478684499)	1	1	1	1	0	0	5	Ecke Alte Volksparkstraße: Bei Netto
551	DC5083	Hamburg	22145	Spitzbergenweg 36d	(53.62818283399446,10.16692850824242)	4	1	2	1	1	1	5	ggü. Nr. 41
552	DC5078	Hamburg	22145	Saseler Strasse 119	(53.62821922395857,10.150434010607126)	3	2	2	1	0	0	5	Ecke Alaskaweg: vor Bushaltestelle
553	DC1083	Hamburg	22081	Uferstrasse 21	(53.57197433985843,10.043161743839233)	3	1	1	1	0	0	5	ggü. Nr. 21
554	DC2087	Hamburg	22609	Tönninger Weg 1	(53.56900524653265,9.84686962219504)	1	1	1	1	0	0	5	ggü. Nr. 1: Ecke Langelohstraße
555	DC4170	Hamburg	21107	Rüdemannweg 27	(53.50235961954663,9.988642690743948)	3	0	0	0	0	0	5	
556	DC2106	Hamburg	22609	Ohnhorststrasse 1	(53.558753859373816,9.86288631664208)	2	1	1	1	1	1	5	vor Parkhaus: S-Bahnhof Klein Flottbek
557	DC5102	Hamburg	22395	Feldblumenweg 24	(53.664752243850195,10.101311706436512)	3	0	0	0	0	0	5	ggü. Nr. 29: Ecke Hohensasel
558	DC1161	Hamburg	22089	Eilbektal 	(53.57384802286893,10.052871390236579)	2	1	1	1	0	0	5	ggü. Hausnummer 68, Ecke Seumestraße
559	DC2129	Hamburg	22765	Scheel-Plessen-Strasse 8	(53.55337360944897,9.93421468853864)	2	1	1	0	0	0	5	ggü. Hausnummer 8
560	DC3108	Hamburg	20253	Kaiser-Friedrich-Ufer 	(53.57550119880041,9.970096892737523)	2	1	1	0	0	0	5	Ecke Bogenstraße: ggü. Schule
561	DC3226	Hamburg	22457	Pinneberger Strasse 40	(53.63370818619569,9.905152353856403)	1	1	1	1	0	0	5	Bushaltestelle Schnelsen
562	DC5101	Hamburg	22393	Volksdorfer Weg 112	(53.64200775905838,10.11295526535082)	1	0	0	0	0	0	5	Ecke Gilcherweg: neben Nr. 112
563	DC4018	Hamburg	22767	Finkenstrasse 	(53.54920580409587,9.955963657022219)	1	1	1	0	0	0	5	ggü. 9
564	DC3234	Hamburg	22459	Frohmestrasse 70a	(53.631044131345455,9.924907251701427)	3	1	1	1	0	0	5	
565	DC1020	Hamburg	22085	Hebbelstrasse 7a	(53.577020674931994,10.017799377771876)	2	0	0	0	0	0	5	Ecke Schenkendorfstrasse
566	DC4105	Hamburg	21079	Grossmoorbogen 1	(53.46186668628078,10.015122872934285)	4	1	1	1	0	0	5	Kundenparkplatz der Metro neben der Leergutannahme
567	DC4039	Hamburg	21031	Kurt-Adams-Platz 1	(53.50780985337994,10.210625932202563)	2	1	1	1	0	0	5	Ecke Röpraredder:neben Haltestelle Harnackring
568	DC1170	Hamburg	20535	Horner Weg 108	(53.55546603246412,10.067888154023354)	2	1	1	1	1	1	5	ggü. Parkplatz: Kleingarten: zw. Bahngleis und Hohle Rönne
569	DC1008	Hamburg	20537	Steinbeker Strasse 32	(53.5450454304287,10.051293305615056)	2	1	1	1	0	0	5	ggü. Schadesweg
570	DC1078	Hamburg	22119	Bergmannring 	(53.55761787204409,10.102440497429992)	3	2	2	1	0	0	5	Nähe Querkamp: Parkstreifen ggü. Einkaufsmarkt
571	DC3211	Hamburg	20148	Mittelweg 177	(53.563820498471344,9.99420712121958)	2	1	1	1	0	0	5	ggü. 177: neben Moorweide
572	DC1178	Hamburg	22089	Hasselbrookstrasse 68	(53.56391126444141,10.044318495846582)	3	1	1	1	1	1	5	ggü. 68: vor KITA
573	DC2004	Hamburg	22767	Schleestrasse 2	(53.54644888148664,9.945521361888055)	2	1	1	1	0	0	5	Ecke Amundsenstraße
574	DC3066	Hamburg	20357	Weidenallee 2	(53.56590093653155,9.965761071595827)	6	2	2	1	1	0	5	Ecke Kleiner Schäferkamp: ggü. Amandastraße
575	DC3102	Hamburg	20144	Brahmsallee 82	(53.58076168727284,9.981721975300623)	4	0	0	0	0	0	5	ggü. Nr. 82: Ecke Isestraße
576	DC3008	Hamburg	22297	Wilhelm-Metzger-Strasse 1	(53.6058614486173,9.996487242261159)	3	1	1	1	0	0	5	Ecke Rathenaustraße
577	DC5139	Hamburg	22047	Tilsiter Strasse 80	(53.591437425105184,10.088270800541295)	2	0	1	2	0	0	5	ggü. Voßkulen
578	DC3227	Hamburg	22457	Schleswiger Damm 264	(53.64804625483073,9.909412647855431)	2	1	1	1	0	0	5	ggü.Schleswiger Damm 264: Kehre
579	DC4135	Hamburg	21109	Altenfelder Weg 17	(53.483322681587715,10.02434604232311)	4	1	0	3	0	0	5	BAB Raststätte Stillhorn Westseite: Richtung Süden: beim LKW Parken
580	DC1034	Hamburg	22081	Holsteinischer Kamp 1	(53.57469216923391,10.037178563839442)	2	1	1	0	0	0	5	U-Bahn, Louis-Braille-Platz
581	DC3107	Hamburg	20149	Rothenbaumchaussee 123	(53.57315021395008,9.988784976082476)	4	1	1	1	1	1	5	ggü. Nr. 123: U-Bahn Hallerstraße
582	DC5136	Hamburg	22047	Friedrich-Ebert-Damm 52	(53.585036696912404,10.080465721296177)	3	1	1	1	0	0	5	Ecke Thiedeweg
583	DC3264	Hamburg	22299	Lattenkamp 4	(53.597286353705194,9.996512978159688)	5	2	2	1	0	0	5	Ecke Alsterdorfer Straße / Grünfläche
584	DC1118	Hamburg	22115	Kollwitzring 71	(53.53238136298532,10.1409353029637)	1	1	1	1	0	0	5	ggü. Nr. 71: Ecke Sackgasse
585	DC2083	Hamburg	20459	Neumayerstrasse 1	(53.5485060097158,9.973749764061346)	1	1	1	1	0	0	5	Ecke Zeughausstraße: Nähe Einfahrt Feuerwehr
586	DC1192	Hamburg	22117	Papyrusweg 12	(53.53920485625195,10.123685734639949)	2	1	1	1	0	0	5	ggü. Honsbergenstraße
587	DC1121	Hamburg	22113	Werner-Siemens-Strasse 30	(53.530608213736585,10.090104525866744)	2	1	1	1	0	0	5	ggü. Werner-Siemens-Str. 30: vor Entsorgungsfirma
588	DC4068	Hamburg	21073	Hastedtplatz 2	(53.456266220292086,9.977337359843808)	2	2	1	1	0	0	5	Einmündung Bremer Straße
589	DC3062	Hamburg	20259	Henriettenweg 14	(53.57278844872885,9.95859345275842)	4	1	1	0	1	1	5	vor dem Parkplatz
590	DC4109	Hamburg	21149	Neugrabener Bahnhofstrasse 130	(53.45952917824472,9.851700902198228)	2	0	0	0	0	0	5	Buskehre:ggü. Nr.135
591	DC1079	Hamburg	22083	Imstedt 18	(53.57942985842418,10.02828829316248)	3	1	1	1	0	0	5	vor Schule
592	DC1014	Hamburg	22111	Legienstrasse 68	(53.549065645335446,10.100409255683001)	2	1	1	1	0	0	5	Ecke Ihlestrasse
593	DC3079	Hamburg	20251	Frickestrasse 52	(53.59565889823318,9.978114492109205)	4	0	0	0	0	0	5	ggü. Frickestraße 55: Ecke Im Tale
594	DC4073	Hamburg	21147	Heykenstieg 	(53.482285071225284,9.907050331031845)	2	1	1	1	0	0	5	Ecke Georg-Heyken-Straße: neben Bushaltestelle
595	DC3157	Hamburg	22529	Lokstedter Steindamm 72	(53.589696651377906,9.967570722974443)	1	1	1	1	0	0	5	neben Tennishalle
596	DC5080	Hamburg	22145	Hellmesbergerweg 23	(53.632603524740546,10.180520177938222)	5	2	2	1	0	0	5	Baumarkt
597	DC2012	Hamburg	22765	Schnellstrasse 15	(53.5565145021815,9.943612830092071)	2	1	1	1	0	0	5	Ecke Max-Brauer-Allee
598	DC4004	Hamburg	21029	Curslacker Neuer Deich 	(53.47185031712125,10.203931379134273)	5	2	1	1	0	1	5	bei Haltestelle Siedlung Curslack (Nord) : vor KLGV 609 : ggü. Nr.87-80
599	DC5129	Hamburg	22359	Uppenhof 	(53.647652990842104,10.161154736717707)	7	2	2	1	0	0	5	Ecke Groten Hoff: vor Supermarkt
600	DC1041	Hamburg	22111	Bauerberg 	(53.55314663720608,10.082905097727048)	2	1	1	1	0	0	5	Nähe Am Gojenboom
601	DC5010	Hamburg	22177	Fabriciusstrasse 	(53.61966040642751,10.075517164019777)	2	1	1	1	0	0	5	ggü. Nr. 310: beim Friedhof
602	DC1117	Hamburg	22115	Mümmelmannsberg 54	(53.52977639452111,10.141339752139196)	1	1	1	1	0	0	5	Schule
603	DC1022	Hamburg	22085	Zimmerstrasse 57	(53.575026942721394,10.020531596036857)	4	1	2	1	0	0	5	Ecke Winterhuder Weg: ggü. Tankstelle
604	DC2043	Hamburg	22587	Rissener Landstrasse 	(53.56851767680339,9.792031510299461)	2	1	1	1	0	0	5	ggü. Rissener Landstraße 44
605	DC2072	Hamburg	22547	Langbargheide 22	(53.59529677996089,9.890280813700334)	2	2	1	1	0	0	5	
606	DC4048	Hamburg	21077	Beerentalweg 144	(53.4481630912022,9.943850850522084)	2	0	0	0	0	0	5	Ecke Strucksbarg
607	DC1081	Hamburg	22083	Osterbekstrasse 	(53.58467839035367,10.034450215515102)	6	2	2	1	1	1	5	ggü. Parz. 49/50: Nähe Saarlandstrasse
608	DC1085	Hamburg	22083	Beethovenstrasse 53	(53.57729675291387,10.026816169437769)	5	2	2	1	1	1	5	vor Badeanstalt
609	DC5006	Hamburg	22175	Hohnerkamp 8	(53.61901487154149,10.089695973464567)	1	0	0	0	0	0	5	Ecke Hannenstieg
610	DC4054	Hamburg	21129	Alte Aue 1	(53.53138749360464,9.8842173816945)	4	1	1	1	1	1	5	im Parkstreifen: gegenüber Anlieferzone Supermarkt: Nähe Aue-Insel
774	DC2028	Hamburg	22607	Stiefmütterchenweg 25	(53.576303665020156,9.86804147028969)	1	1	1	1	0	0	5	
611	DC4080	Hamburg	21075	Bissingstrasse 	(53.465659232187825,9.967575454066484)	3	1	1	1	1	1	5	gegenüber Nr. 13: Parkstreifen:an der Parkanlage Schwarzenberg
612	DC3123	Hamburg	22415	Wörenstieg 35	(53.65415990473535,10.014818135421502)	2	0	0	0	0	0	5	Ecke Wördenmoorweg
613	DC3073	Hamburg	20249	Kellinghusenstrasse 	(53.589976512752386,9.991995428616756)	2	1	1	1	0	0	5	Ecke Kunhardstraße: vor dem Parkplatz:
614	DC5021	Hamburg	22159	Tegelweg 	(53.60631101071531,10.105820263426862)	2	1	1	1	0	0	5	Ecke Am Luisenhof, Kleingärten
615	DC4185	Hamburg	21109	Kirchdorfer Strasse 185	(53.485487575786756,10.013622808081477)	2	0	0	0	0	0	5	vor dem Kindergarten
616	DC3179	Hamburg	22455	Märkerweg 66	(53.64372164471148,9.957010676926123)	2	1	1	1	0	0	5	zwischen Keltenweg und Pommernweg:nähe Sportplatz:::
617	DC3187	Hamburg	22455	Wagrierweg 3	(53.6398824998361,9.945759681735883)	3	2	2	1	0	0	5	Kehre vor Budnikowsky (Parkplatz)
618	DC3080	Hamburg	20251	Ernst-Thälmann-Platz 	(53.59527636897638,9.984261531155934)	3	0	0	0	0	0	5	ggü. Ernst-Thälmann-Platz 5: Ecke Tarpenbekstraße
619	DC1128	Hamburg	20539	Freihafenstrasse 17	(53.53345832114698,10.050879250237177)	1	0	0	0	0	0	5	
620	DC3018	Hamburg	22523	Heidacker 	(53.619979345409085,9.892212870461485)	1	1	1	1	0	0	5	ggü. Nr. 26:Ecke Grenzacker
621	DC3253	Hamburg	22527	Nienredder 1	(53.59946362462904,9.921858005371579)	2	1	1	1	0	0	5	Ecke Wördemannsweg
622	DC4115	Hamburg	21147	Rehrstieg 73	(53.48063148653634,9.87305375516468)	2	1	1	1	1	1	5	Höhe Garagen
623	DC4009	Hamburg	21035	Henriette-Herz-Ring 34	(53.48244237130931,10.174516909990643)	3	1	1	1	0	0	5	ggü. Schule
624	DC2112	Hamburg	22605	Bernadottestrasse 160	(53.54952475592796,9.897730646697799)	2	1	2	1	0	0	5	Bernadottestraße 160 Liebermannstraße: ggü. Tankstelle
625	DC3021	Hamburg	22337	Alsterdorfer Markt 1	(53.61226424850843,10.023201972568598)	2	0	3	0	0	0	5	
626	DC5073	Hamburg	22143	Grosslohering 	(53.60222735597736,10.179130067493322)	3	1	1	1	0	0	5	ggü. Nr. 4
627	DC5133	Hamburg	22041	Efftingestrasse 17	(53.575502054196065,10.083319991022382)	1	1	1	1	0	0	5	
628	DC1115	Hamburg	22115	Asbrookdamm 44	(53.523036471085206,10.151135768478213)	2	1	1	1	0	0	5	ggü. Asbrookdamm 44
629	DC4038	Hamburg	21031	Havighorster Weg 283	(53.51386544771848,10.210660457489306)	3	2	1	1	0	0	5	neben EKZ-Parkplatz, vorher Reinbeker Redder 283
630	DC5079	Hamburg	22145	Bargkoppelweg 	(53.621323463076074,10.153220813883765)	5	1	1	1	0	0	5	ggü. Nr. 49
631	DC3057	Hamburg	20257	Rellinger Strasse 37	(53.575603581847005,9.941260150075268)	3	1	1	1	1	1	5	ggü. 37: Ecke Voigtstraße: vor dem Spielplatz
632	DC5085	Hamburg	22145	Wildschwanbrook 	(53.629738261071495,10.177202420162235)	1	0	0	0	0	0	5	ggü. Nr. 105
633	DC5118	Hamburg	22045	Am Pulverhof 	(53.59410811727449,10.135697036048304)	6	1	1	1	1	1	5	ggü. Nr. 17: vor Bahnübergang
634	DC5012	Hamburg	22177	Krügers Redder 8	(53.613205930578765,10.073746801645763)	2	0	0	0	0	0	5	
635	DC1036	Hamburg	22083	Adolph-Schönfelder-Strasse 37	(53.5778187578102,10.032753102668938)	3	1	1	1	0	0	5	zwischen Nr. 39-45: vor Grünfläche
636	DC1029	Hamburg	22111	Rennbahnstrasse 96	(53.56046258358551,10.080839513557573)	2	1	1	1	0	0	5	ggü. Rennbahnstr. 91: Derby
637	DC1066	Hamburg	22303	Grossheidestrasse 34	(53.58772814948218,10.023736396112556)	2	0	0	0	0	0	5	
638	DC1035	Hamburg	22081	Marschnerstrasse 21	(53.57520607143957,10.039068780962072)	2	1	1	1	0	0	5	ggü. Nr. 25: Ecke Holsteinischer Kamp
639	DC1107	Hamburg	22119	Michael-Hering-Weg 3a	(53.54359420357668,10.114843473309298)	2	0	0	0	0	0	5	Michael-Hering-Weg 3a-d: Ecke Liebezeitstr.
640	DC4157	Hamburg	21107	Georg-Wilhelm-Strasse 218	(53.492114209232874,9.990467355312985)	2	1	1	1	0	0	5	Ecke Kuckuckshorn
641	DC3195	Hamburg	22335	Am Hasenberge 	(53.62255651226334,10.029416509392068)	4	1	1	1	0	0	5	Ecke Justus-Strandes-Weg
642	DC3173	Hamburg	22453	Papenreye 33	(53.61342144123474,9.966659652689186)	5	1	2	1	0	0	5	Einkaufsmarkt: bei Warenannahme
643	DC5059	Hamburg	22391	Tennigkeitweg 	(53.65049438283852,10.092213028133587)	2	0	0	0	0	0	5	ggü. Nr. 6: neben P+R S-Bahn Poppenbüttel
644	DC4129	Hamburg	20539	Am Zollhafen 5	(53.522838007893384,10.017639204447216)	1	1	1	1	1	1	5	ggü. Nr. 5: neben Bushaltestelle Wilhelmsburger Platz
645	DC3112	Hamburg	20253	Kaiser-Friedrich-Ufer 22	(53.57689752960056,9.973378220989064)	5	1	1	1	1	0	5	ggü. Hohe Weide Nr. 82
646	DC3164	Hamburg	22529	Veilchenweg 26a	(53.58883881745588,9.96124029911825)	2	1	1	1	0	0	5	Ecke Veilchenstieg: ggü.26a
647	DC1148	Hamburg	22309	Meister-Francke-Strasse 37	(53.60678312701393,10.043467460464147)	3	0	0	0	0	0	5	
648	DC3027	Hamburg	22527	Kieler Strasse 700	(53.6074576489494,9.906238834102808)	1	1	1	1	1	1	5	ggü. Eidelstedter Center
649	DC2128	Hamburg	22765	Ottenser Marktplatz 11	(53.54803211667873,9.932726854658375)	3	1	1	1	0	0	5	ggü. 11
650	DC1160	Hamburg	22307	Lauensteinstrasse 50	(53.60091727390409,10.03649371764475)	3	1	1	1	0	0	5	
651	DC1152	Hamburg	22307	Schwalbenplatz 18	(53.59543608819437,10.046434640217315)	3	2	2	1	0	0	5	
652	DC4076	Hamburg	21147	Striepenweg 40	(53.47384725363883,9.87678891315064)	1	2	1	0	0	0	5	ggü. Nr. 37, Einkaufsmarkt
653	DC3132	Hamburg	22415	Tangstedter Landstrasse 6	(53.6466040932922,10.013257880972313)	5	2	2	1	0	0	5	ggü. Tangstedter Landstrasse 10, Ecke Langenhorner Chaussee
654	DC3270	Hamburg	20251	Salomon-Heine-Weg 	(53.600850274411414,9.988242733650623)	3	1	1	1	0	0	5	ggü. Salomon-Heine-Weg 58
655	DC3050	Hamburg	20257	Sartoriusstrasse 2	(53.57805353759014,9.941638143481978)	4	1	1	1	0	0	5	Ecke Methfesselstrasse,
656	DC3205	Hamburg	22337	Wellingsbütteler Landstrasse 73	(53.63021846066244,10.037446993385993)	6	3	3	2	1	1	5	ggü. Wellingsbütteler Landstraße 78: Parkplatz
657	DC5041	Hamburg	22043	Gleiwitzer Bogen 83	(53.56823850660819,10.138337908908005)	1	1	1	0	0	0	5	Nähe Parkplatz
658	DC5042	Hamburg	22043	Rodigallee 	(53.57084799719413,10.120327242931712)	1	1	1	1	0	0	5	ggü. Kirche Nr. 205
659	DC4079	Hamburg	21079	Am Radeland 	(53.47180362105729,9.93235058089597)	2	1	1	1	0	0	5	zwischen Tempowerkring und Zum Fürstenmoor: vor HIT-Technologiepark der
660	DC3036	Hamburg	22527	Karkwurt 	(53.606830988630755,9.90908359247025)	2	1	1	1	0	0	5	ggü. Karkwurt 3: vor der Parkanlage
661	DC3110	Hamburg	20251	Hegestrasse 1	(53.58270159800449,9.980751014329156)	3	0	0	0	0	0	5	
662	DC3225	Hamburg	22457	Glissmannweg 8	(53.63555576002031,9.916675946615552)	2	1	1	1	0	0	5	
663	DC3181	Hamburg	22455	Paul-Sorge-Strasse 	(53.633942068291624,9.952726872651173)	2	1	1	1	0	0	5	vor Gesamtschule Niendorf
664	DC3086	Hamburg	22335	Ratsmühlendamm 53	(53.62675683388935,10.016977895438142)	6	2	1	1	1	1	5	zwischen Einmündung Eschenweg und Olendörp: vor der KITA:
665	DC3024	Hamburg	22523	Pinneberger Chaussee 132	(53.619967503970706,9.887649611449705)	2	1	1	1	0	0	5	Ecke Ameisenkamp:vor dem Einkaufsmarkt
666	DC3186	Hamburg	22455	Wagrierweg 27	(53.641757141835164,9.942161205576829)	2	1	1	1	0	0	5	Kehre vor Budnikowsky (Parkplatz)
667	DC2135	Hamburg	22559	Rheingoldweg 3	(53.58392872139414,9.753162574455237)	2	1	1	1	0	0	5	Ecke Sandmoorweg
668	DC4140	Hamburg	21109	Finkenriek 	(53.47935772553601,10.018703187450877)	2	1	1	1	0	0	5	Ecke Stillhorner Weg 4
669	DC4158	Hamburg	21107	Kurdamm 8	(53.49610492085413,9.991505520140343)	2	1	1	1	0	0	5	vor Grünanlage:neben Parkplatz :ggü. Nr.7
670	DC4161	Hamburg	21109	Zur Guten Hoffnung 62	(53.492643860839785,10.01348698077888)	2	1	1	1	0	0	5	Ecke Neuenfelder Straße
671	DC4176	Hamburg	21109	Schönenfelder Strasse 2	(53.50261410495149,10.014284976102832)	2	1	1	1	0	0	5	Ecke Korallusring:ggü. Nr.11
672	DC4024	Hamburg	21031	Lohbrügger Markt 5	(53.495554402702574,10.207495790596852)	3	2	2	1	1	1	5	vor Marktfläche:ggü. Am Beckerkamp 2
673	DC4177	Hamburg	21107	Ernst-August-Stieg 7	(53.5199231835133,9.983293797225883)	2	1	1	0	0	0	5	Kehre ggü. Supermarkt Parkplatz
674	DC5007	Hamburg	22175	Am Stühm-Nord 201	(53.633789129503505,10.10362437853808)	2	0	0	0	0	0	5	Ecke Karlshöhe
675	DC1052	Hamburg	22049	Eulenkamp 14	(53.58015660056462,10.066614493967617)	4	2	2	1	0	0	5	Eulenkamp 14, nähe Lengerckestr. auf Verkehrsinsel
676	DC5135	Hamburg	22049	Eulenkamp 51	(53.58398012816244,10.072468507083814)	6	1	1	1	0	0	5	Nähe Friedrich-Ebert-Damm
677	DC3044	Hamburg	20253	Goebenstrasse 32	(53.577072846136915,9.96421572032986)	5	2	2	1	0	0	5	ggü. 32: Ecke Eppendorfer Weg:
678	DC2145	Hamburg	20359	Budapester Strasse 16	(53.552127667594576,9.966863845620136)	3	1	1	1	1	1	5	Ecke Clemens-Schultz-Straße
679	DC3074	Hamburg	20249	Haynstrasse 40	(53.58836940106882,9.981095898751919)	1	0	0	0	0	0	5	Ecke Robert-Koch-Stieg
680	DC3153	Hamburg	22529	Lenzweg 	(53.58719830079794,9.94786267659251)	2	1	1	1	0	0	5	zwischen Julius-Vosseler-Straße und Brehmweg
681	DC3097	Hamburg	22453	Moorweg 	(53.60853412283023,9.980431775064098)	3	0	0	0	0	0	5	ggü. Moorweg 32: Ecke Köppenstraße
682	DC4126	Hamburg	21077	Sinstorfer Kirchweg 74	(53.426410311382355,9.960657998702079)	2	1	1	1	0	0	5	Buskehre:ggü. Parkplatz neben Nr.72
683	DC1033	Hamburg	22081	Holsteinischer Kamp 38	(53.57492297428465,10.041103197300341)	2	0	0	0	0	0	5	Ecke Heinskamp
684	DC1038	Hamburg	22083	Elsastrasse 4	(53.576637878477975,10.035574751771854)	2	0	0	0	0	0	5	Ecke Schmalenbekstrasse
685	DC1180	Hamburg	22089	Menckesallee 	(53.569698276823175,10.058939245412729)	3	1	1	0	0	0	5	Nähe Wandsbeker Chaussee: ggü. Taxistand: vor Einkaufsmarkt
686	DC1197	Hamburg	22117	Bonhoefferstrasse 	(53.54474652784677,10.137236216794713)	2	1	1	0	0	0	5	Ecke Kantatenweg
687	DC5100	Hamburg	22393	Saseler Parkweg 1	(53.654947950134925,10.110611243422522)	6	3	3	1	1	1	5	Kehre
688	DC1030	Hamburg	22111	Rhiemsweg 39	(53.55673782008765,10.075138437340641)	2	0	0	0	0	0	5	ggü. Rhiemsweg 39
689	DC4152	Hamburg	21109	Hauland 	(53.477941530614885,9.99839423313616)	4	1	1	1	0	0	5	an der Einfahrt zum KLGV 767 Süderelbe e.V.:hinter König-Georg-Deich
690	DC4003	Hamburg	21029	Vinhagenweg 	(53.488484327470545,10.214937414151114)	2	1	1	1	1	0	5	vor der Parkanlage:Ecke Chrysanderstraße
691	DC2113	Hamburg	22763	Hohenzollernring 4	(53.546862798578196,9.917204231770976)	2	1	1	1	1	1	5	Ecke Philosophenweg
692	DC1075	Hamburg	22119	Am Horner Moor 	(53.55450574527868,10.100364447483118)	1	0	0	0	0	0	5	Nähe Querkamp
693	DC4189	Hamburg	21079	Soltauer Ring 	(53.43713346275485,9.989573662790246)	2	1	1	1	0	0	5	ggü. Nr.12
694	DC1199	Hamburg	22081	Lortzingstrasse 60	(53.5729798414317,10.046682075274612)	2	1	1	1	0	0	5	Ecke Maxstrasse, Wandse-Seite
695	DC3271	Hamburg	22297	Brabandstrasse 15	(53.61305056563347,10.005111761314543)	3	1	1	1	0	0	5	
696	DC2161	Hamburg	20359	Bei den St.Pauli-Landungsbrücken 	(53.545959709563824,9.96614242769553)	1	1	1	1	0	0	5	hinter dem alten Elbtunnel
697	DC3122	Hamburg	22455	Quedlinburger Weg 27	(53.631758930529344,9.939519925896883)	3	1	1	1	0	0	5	ggü. Quedlinburger Weg 27: Ecke Sethweg
698	DC3261	Hamburg	22299	Alsterdorfer Strasse 123	(53.601385937085894,9.996617013613179)	1	0	0	0	0	0	5	
699	DC2133	Hamburg	22559	Klövensteenweg 25	(53.58258571691581,9.76361096288382)	1	1	1	1	0	0	5	Ecke Achtern Sand
700	DC1096	Hamburg	22115	Max-Klinger-Strasse 1	(53.529667239166905,10.143920838739714)	1	0	0	0	0	0	5	ggü. Mümmelmannsberg 59
701	DC5068	Hamburg	22399	Ulzburger Strasse 	(53.65630458230653,10.076705048894196)	2	0	0	0	0	0	5	ggü. Ulzburger Strasse 16a: Minsbekweg
702	DC5004	Hamburg	22175	Am Stühm-Süd 	(53.62882152271612,10.101069873370216)	2	0	0	0	0	0	5	ggü. Nr. 143
703	DC3096	Hamburg	22453	Brückwiesenstrasse 	(53.605974471799854,9.96732190270454)	4	1	1	0	0	0	5	Ecke Lokstedter Damm
704	DC2058	Hamburg	22589	Am Botterbarg 76	(53.579213589805065,9.830427384101736)	2	1	1	1	0	0	5	Ecke Heerbrook
705	DC1188	Hamburg	20535	Hinrichsenstrasse 1	(53.558265799133146,10.0323116554342)	1	1	1	1	0	0	5	Ecke Alfredstraße
706	DC3233	Hamburg	22457	Holsteiner Chaussee 210	(53.62752820718389,9.910047734028957)	3	1	1	1	0	0	5	Ecke Heidlohstraße
707	DC5013	Hamburg	22179	Barenbleek 14	(53.60343270306738,10.095061375718123)	4	0	0	0	0	0	5	Ecke Eenstock
708	DC2110	Hamburg	22605	Reventlowstrasse 31	(53.556346060074944,9.889761994235462)	3	1	1	1	0	0	5	Ecke Walderseestraße
709	DC2136	Hamburg	22559	Rissener Landstrasse 252	(53.57956171792583,9.766482942869832)	2	1	1	1	0	0	5	Ecke Rissener Busch
710	DC3100	Hamburg	22453	Weg beim Jäger 70	(53.61420753737491,9.983888190167944)	6	2	2	1	1	1	5	Bushaltestelle Am Licentiatenberg:Ecke Paeplowweg
711	DC3040	Hamburg	22523	Möhlenort 	(53.60041692560241,9.899406464351765)	3	1	1	1	0	0	5	Möhlenort Ecke Meisterfeldweg
712	DC3115	Hamburg	22415	Flughafenstrasse 77	(53.64013403378676,10.018540832407096)	1	0	0	0	0	0	5	
713	DC3127	Hamburg	22417	Lütte Raak 	(53.656745865715415,10.025337103124476)	3	0	0	0	0	0	5	Ecke Fritz-Schumacher-Allee
714	DC3147	Hamburg	22529	Emil-Andresen-Strasse 	(53.5947070507008,9.954344610353125)	2	1	1	1	0	0	5	ggü. Emil-Andresen-Straße 33: Ecke Lohbekstieg
715	DC3047	Hamburg	22527	Julius-Vosseler-Strasse 136	(53.58268506730257,9.950962176070535)	3	1	1	0	1	1	5	Ecke Eidelstedter Weg:
716	DC3165	Hamburg	22455	Ernst-Mittelbach-Ring 27	(53.64416818404161,9.949506706199063)	4	1	1	1	0	0	5	
717	DC3072	Hamburg	20249	Isekai 19	(53.585677762758046,9.993229268598123)	1	0	0	0	0	0	5	Ecke Geffckenstraße
718	DC3221	Hamburg	22457	Holsteiner Chaussee 321	(53.63931403320806,9.910520506139196)	3	1	1	1	0	0	5	Ecke Peter-Timm-Straße: Bushaltestelle Scheelring
719	DC3093	Hamburg	22459	Niendorfer Kirchenweg 7	(53.61982896622602,9.948325144314813)	2	0	1	0	0	0	5	Kehre (zwei Standplätze->siehe Fotos)
720	DC3255	Hamburg	22527	Spannskamp 	(53.592257205750045,9.936224447684681)	1	1	1	1	0	0	5	ggü. Spannkskamp 43: Ecke Koppelstraße
721	DC4106	Hamburg	21147	Im Neugrabener Dorf 31	(53.4762954007052,9.859708230584241)	4	1	1	1	0	0	5	ggü. Nr.36: ggü. In de Krümm
722	DC4137	Hamburg	21109	Brackstrasse 37	(53.48852040421149,10.007248148002542)	2	1	1	1	0	0	5	zwischen Brackstraße und Leipeltstraße: Höhe Siebenbrüderweide
723	DC4139	Hamburg	21109	Erlerring 5	(53.48463252971739,10.020860418324396)	4	2	2	1	0	0	5	neben Einkaufsmarkt:ggü. Karl-Arnold-Ring 48-50
724	DC4141	Hamburg	21109	Fitgerweg 19	(53.502288395519884,10.019407701195568)	2	0	0	0	0	0	5	an den Garagen:im Stichweg:neben Schönenfelder Straße 61c
725	DC4062	Hamburg	21129	Rüschweg 1	(53.53549121910967,9.857769786985179)	2	1	1	1	0	0	5	auf dem Parkplatz:ggü. Schallnsteed:Ecke Neßdeich
726	DC4028	Hamburg	21031	Korachstrasse 9	(53.51087051946964,10.205845650870879)	1	1	1	1	0	0	5	vor Grünanlage:zwischen Nr.24 und Nr.9:ggü. Schule
727	DC1058	Hamburg	22111	Bauerbergweg 	(53.54865667145093,10.075864660711204)	2	1	1	1	0	0	5	Parkplatz vor B5 Unterführung
728	DC3070	Hamburg	20249	Haynstrasse 30	(53.58716204781374,9.982673816089115)	2	0	0	0	0	0	5	Ecke Lenhartzstraße
729	DC2067	Hamburg	22547	Friedrichshulder Weg 4	(53.60214954642385,9.887624064455697)	1	2	1	1	0	0	5	Parkplatz Einkaufsmarkt
730	DC2031	Hamburg	22765	Friedensallee 357	(53.5626538465049,9.90491494062152)	3	1	1	1	0	0	5	
731	DC1136	Hamburg	22117	Kaltenbergen 35	(53.540822996655244,10.143712495060113)	2	1	1	1	0	0	5	Ecke Rantumer Weg: ggü. Kaltenbergen 35
732	DC1082	Hamburg	22081	Barmbeker Markt 8	(53.580706294744765,10.041721551448598)	3	1	1	1	1	1	5	Barmbeker Markt 8
733	DC2071	Hamburg	22547	Jevenstedter Strasse 177	(53.60212741445134,9.874038643400416)	2	1	1	1	0	0	5	
734	DC3136	Hamburg	22415	Grellkamp 	(53.6550703732255,9.998024945750071)	7	2	2	1	0	0	5	ggü. Grellkamp 62: Ecke Kulenstück
735	DC5014	Hamburg	22179	Bramfelder Dorfplatz 	(53.613750550874286,10.077775170339496)	2	2	2	1	0	0	5	ggü. Nr. 19
736	DC1187	Hamburg	22081	Wohldorfer Strasse 6	(53.577069645921355,10.039489473202925)	2	1	1	1	0	0	5	vor der Post
737	DC5045	Hamburg	22043	Jenfelder Allee 	(53.58028236196115,10.127928424855895)	3	1	1	1	1	1	5	ggü. Nr. 53
738	DC2088	Hamburg	22549	Achtern Born 	(53.587103448747925,9.851294747225982)	2	1	1	1	0	0	5	ggü. Nr. 94: Ecke Bornheide
739	DC2091	Hamburg	22549	Blomkamp 	(53.5770460896607,9.858849078960667)	2	1	1	1	0	0	5	ggü. Nr. 63: Ecke Am Landpflegeheim
740	DC3014	Hamburg	22523	Baumacker 	(53.61335121121463,9.89860281009299)	2	1	1	1	0	0	5	ggü. Nr. 1a: Ecke Pflugacker
741	DC3260	Hamburg	22299	Ohlsdorfer Strasse 55	(53.598194199937616,10.004419116417637)	4	1	1	1	1	2	5	ggü. Kreuzung Bussestraße
742	DC1158	Hamburg	22305	Hellbrookstrasse 43	(53.59151028437446,10.042726559182745)	4	1	1	1	1	1	5	Ecke Morgensternweg
743	DC2132	Hamburg	22559	Herwigredder 66	(53.57453657708498,9.762699910354742)	2	1	1	1	0	0	5	ggü. Schule
744	DC2147	Hamburg	22589	Sülldorfer Landstrasse 263	(53.58040600513709,9.785854578905589)	2	1	1	1	0	0	5	Ecke Wüstland: Bushaltestelle Sieversstücken
745	DC3142	Hamburg	22527	Julius-Vosseler-Strasse 122	(53.58415719598793,9.950364134207756)	3	1	1	1	0	0	5	vor Sportplatz
746	DC4103	Hamburg	21149	Falkenbergsweg 87	(53.45865744167245,9.86662410213801)	4	2	2	1	0	0	5	Ecke Bredenbergsweg : ggü. Nr.96d
747	DC3196	Hamburg	22335	Maienweg 294	(53.624205878822046,10.026305669822678)	2	0	0	0	0	0	5	Höhe Maienweg 294
748	DC2081	Hamburg	20459	Grossneumarkt 24	(53.550071354628685,9.980148106017085)	3	1	1	1	0	0	5	neben Eiscafe
749	DC3258	Hamburg	22527	Tierparkallee 32	(53.59359972564526,9.935928775439288)	2	1	1	1	0	0	5	In der Kehre
750	DC3250	Hamburg	22525	Wittenmoor 11	(53.595041137026996,9.920606496105478)	3	1	1	1	0	0	5	In der Kehre
751	DC1007	Hamburg	20099	Baumeisterstrasse 8	(53.55492619133225,10.01059625821806)	5	1	1	1	0	0	5	Hansaplatz
752	DC1017	Hamburg	22083	Bachstrasse 129	(53.58008881617359,10.021505560575385)	4	1	1	1	0	0	5	Ecke Imstedt: 2 Depotcontainerstandplätze
753	DC4012	Hamburg	21029	Justus-Brinckmann-Strasse 	(53.484711141555785,10.233998093598485)	2	1	1	1	0	0	5	vor Sportplatz: ggü. Seniorenwohnanlage Nr.60
754	DC4025	Hamburg	21033	Am Langberg 38	(53.51410627240177,10.166963328992368)	3	1	1	1	0	0	5	ggü. Bushaltestelle
755	DC5090	Hamburg	22147	Scharbeutzer Strasse 	(53.600063116361056,10.135409186383916)	3	1	1	1	0	0	5	ggü. Herschelstrasse
756	DC5117	Hamburg	22309	Steilshooper Strasse 	(53.60466892519631,10.053585755488903)	5	2	2	1	0	0	5	ggü. Nr. 279
757	DC2010	Hamburg	22769	Eimsbütteler Strasse 	(53.569098048233585,9.949866400758907)	3	1	1	1	0	0	5	ggü. 108: vor dem Bunker
758	DC1141	Hamburg	20537	Wichernsweg 11	(53.55254616526988,10.064037530915785)	3	1	1	1	0	0	5	Nähe Droopweg 39: vor Spielplatz
759	DC2130	Hamburg	22559	Flerrentwiete 94	(53.57594157536358,9.749203569838448)	2	1	1	1	0	0	5	Ecke Bookweetenkamp
760	DC1095	Hamburg	22119	Dringsheide 2	(53.56173636268825,10.12025537319818)	2	1	1	1	0	0	5	Dringsheide 2-8: ggü. Spielplatz
761	DC1028	Hamburg	22111	Vierbergen 26	(53.54700328660556,10.094108973600612)	3	1	1	1	1	1	5	vor U-Bahnhof Legienstraße
762	DC3007	Hamburg	22297	Orchideenstieg 2	(53.60323422895368,9.990580593553707)	3	0	0	0	0	0	5	
763	DC3094	Hamburg	22453	Borsteler Chaussee 287	(53.614013691018926,9.973531819670217)	2	0	0	0	0	0	5	ggü. Borsteler Chausse 287: Ecke Nirnheimweg:
764	DC3228	Hamburg	22457	Schleswiger Damm 173	(53.64138168044998,9.917162024055372)	2	1	1	1	1	0	5	Neben der Aral-Tankstelle
765	DC3001	Hamburg	22297	Alsterdorfer Strasse 301	(53.60918817621815,10.011071159134834)	1	0	0	0	0	0	5	
766	DC3265	Hamburg	22297	Ohlsdorfer Strasse 90	(53.60192520947787,10.008776543398108)	2	0	0	0	0	0	5	
767	DC1023	Hamburg	20099	Brennerstrasse 92	(53.5575161615557,10.018747880398665)	1	1	1	0	0	0	5	Direkt am Überweg Am Lohmühlenpark
768	DC2076	Hamburg	22547	Lüttkamp 56	(53.593388189087555,9.881129182292995)	2	1	1	1	1	1	5	ggü. Nr. 54: Ecke Farnhornweg
769	DC2027	Hamburg	22607	Osdorfer Weg 25	(53.565623474513814,9.895819857013636)	1	1	1	1	0	0	5	
770	DC4205	Hamburg	21147	Moorburger Ring 15b	(53.48271015462166,9.873387555220722)	2	1	1	1	0	0	5	ggü. Neuer Burgweg 1: auf dem Parkstreifen
771	DC5140	Hamburg	22047	Vosskulen 129	(53.59272744899169,10.086850476901256)	2	0	0	0	0	0	5	Ecke Eydtkuhnenweg
772	DC3011	Hamburg	22337	Alsterdorfer Strasse 505	(53.6173007368063,10.026581430288593)	2	0	0	0	0	0	5	
773	DC1093	Hamburg	22115	Max-Pechstein-Strasse 3	(53.530058341639,10.146647709176689)	1	0	0	0	0	0	5	ggü. Max-Pechstein-Str. 3: Mümmelmannsberg
775	DC1163	Hamburg	22307	Langenfort 70	(53.59958214819838,10.049132628725387)	1	0	0	0	0	0	5	
776	DC4055	Hamburg	21129	Aue-Insel 	(53.5310806293559,9.885859303046077)	1	0	0	0	0	0	5	gegenüber Nr. 36: bei Nr. 12 um die Ecke
777	DC3220	Hamburg	22457	Holsteiner Chaussee 	(53.63323028061432,9.911296150341883)	3	1	1	1	0	0	5	Ecke Oldesloer Straße
778	DC4099	Hamburg	21149	Alte Weiden 11a	(53.47197307130243,9.847754407790957)	3	1	1	1	0	0	5	vor Nr.11a-c
779	DC5075	Hamburg	22143	Mecklenburger Strasse 4	(53.6040991283542,10.156671956904798)	3	1	1	1	0	0	5	Höhe Boizenburger Weg: vor Parkhaus
780	DC5002	Hamburg	22395	Bergstedter Chaussee 216	(53.67492194800556,10.139068845148255)	3	0	0	0	0	0	5	Stichstraße Gewerbegebiet
781	DC1068	Hamburg	22299	Sierichstrasse 120	(53.5892517864343,10.000929179323908)	5	2	2	1	0	0	5	Ecke Willistraße
782	DC4146	Hamburg	21077	Maldfeldstrasse 	(53.423307706936676,9.965234593272532)	2	1	1	1	0	0	5	Raststätte Harburger Berge: Richtung Süden:
783	DC5081	Hamburg	22147	Kriegkamp 	(53.62692425622342,10.140155997592094)	2	1	1	1	0	0	5	ggü. Berner Stieg
784	DC5103	Hamburg	22309	Borchertring 29	(53.61697292494154,10.066035635336524)	2	0	0	0	0	0	5	
785	DC1097	Hamburg	22119	Seeschwalbentwiete 19	(53.55006072645815,10.105856973216396)	3	0	0	0	0	0	5	Nähe Albatrosweg: ggü. Seeschwalbentwiete 19
786	DC2098	Hamburg	22549	Osdorfer Landstrasse 118	(53.572026108365485,9.86216084074103)	1	1	1	1	0	0	5	ggü. Elbe EKZ
787	DC3060	Hamburg	22769	Waterloostrasse 6	(53.5671172737352,9.956153112222275)	3	0	0	0	0	0	5	
788	DC4171	Hamburg	21107	Rüdemannweg 11	(53.50231142713709,9.989744379463536)	1	0	0	0	0	0	5	
789	DC3162	Hamburg	22529	Stresemannallee 77	(53.58600227867252,9.956293270375008)	3	1	1	1	0	0	5	zwischen Troplowitzstraße und Glockenblumenweg
790	DC1186	Hamburg	20535	Quellenweg 29	(53.562299808472446,10.062653802515392)	2	1	1	1	0	0	5	
791	DC2045	Hamburg	22587	Sülldorfer Kirchenweg 49	(53.568945592186274,9.80954360470301)	3	1	1	1	0	0	5	ggü. Nr.  53
792	DC1074	Hamburg	22119	Manshardtstrasse 84	(53.55849219619638,10.10312077191397)	3	1	1	1	1	1	5	Nähe Bushaltestelle Rudolph-Roß-Allee: ggü. Manshardtstr. 84
793	DC3099	Hamburg	22453	Borsteler Chaussee 2	(53.61094710026231,9.974500011984055)	7	2	2	1	0	0	5	ggü. 2: Ecke Warnckestraße: hinter der Bushaltestelle:
794	DC3043	Hamburg	20144	Gustav-Falke-Strasse 42	(53.57328211224559,9.973979357705778)	4	1	1	1	0	0	5	Ecke Bogenstraße: ggü. Gustav-Falke-Straße 42
795	DC1122	Hamburg	20535	Riesserstrasse 	(53.56132457031642,10.049072025107101)	2	1	1	0	0	0	5	ggü. 17, Ecke Sievekingsallee
796	DC2151	Hamburg	20359	Paulinenstrasse 10	(53.55485212970272,9.963455748512098)	2	0	0	0	0	0	5	Ecke Paulinenplatz
797	DC2117	Hamburg	22605	Bernadottestrasse 236	(53.54811262077721,9.882690175961322)	3	1	1	1	0	0	5	ggü. Nr. 267
798	DC3273	Hamburg	22529	Stellinger Chaussee 	(53.600510561729216,9.94636596398981)	2	1	1	1	0	0	5	ggü. Stellinger Chaussee 33: Ecke Beim Amsinckpark
799	DC5016	Hamburg	22179	Haldesdorfer Strasse 	(53.601877283559325,10.081975097010995)	3	0	0	0	0	0	5	Ecke Willy-Nissen-Ring
800	DC1204	Hamburg	22119	Dringsheide 9	(53.56300214688345,10.122463984848535)	2	0	0	0	0	0	5	
801	DC5036	Hamburg	22399	Poppenbütteler Weg 97	(53.65103794951061,10.067533647800856)	1	0	0	0	0	0	5	ggü. Nr. 146a: Parkplatz Kirche
802	DC1044	Hamburg	22049	Alter Teichweg 171	(53.5881143910771,10.071592304172743)	2	1	1	1	0	0	5	links und rechts der Zufahrt zum Dulsbergbad: Alter Teichweg ggü.
803	DC4019	Hamburg	21029	Reinbeker Weg 76	(53.49249375636299,10.227460115113857)	4	2	2	1	0	0	5	vor der Schule: ggü. Billstadion
804	DC1201	Hamburg	20537	Sorbenstrasse 22	(53.54951405467215,10.040616604709538)	2	1	1	1	0	0	5	
805	DC1164	Hamburg	22089	Friedrichsberger Strasse 2	(53.57183955009248,10.050983930308645)	1	0	0	0	0	0	5	Ecke Eilbeker Weg: ggü. Friedrichsberger Strasse 2
806	DC3101	Hamburg	20144	Brahmsallee 50	(53.57658636433938,9.981916419249101)	3	1	1	0	0	0	5	Hausnummer 50, hinter den Grindelhochhäusern
807	DC3031	Hamburg	22523	Wiebischenkamp 53a	(53.6144057980198,9.907721023906195)	1	1	1	1	0	0	5	auf Parkstreifen
808	DC4149	Hamburg	21107	Georg-Wilhelm-Strasse 329	(53.4820935491256,9.991514487017636)	2	0	0	1	0	0	5	auf dem Parkplatz hinter Nr.329: an der Mauer der Lagerhalle:
809	DC1063	Hamburg	22085	Grillparzerstrasse 42	(53.5803733701872,10.018789122629503)	2	0	0	0	0	0	5	
810	DC1013	Hamburg	22119	Legienstrasse 172	(53.55495288259417,10.105414521208733)	2	1	1	1	0	0	5	Nähe Bleckenring: ggü. Klgv 132
811	DC1177	Hamburg	20535	Marienthaler Strasse 102	(53.56309346175955,10.051318671221194)	3	0	0	0	0	0	5	Ecke Peterkampsweg
812	DC1149	Hamburg	22307	Wasmannstrasse 14	(53.59614227532061,10.040587870522145)	3	0	0	0	0	0	5	
813	DC3229	Hamburg	22459	Friedrich-Ebert-Strasse 71	(53.62527404496835,9.938036696307913)	3	1	1	1	1	1	5	ggü. Friedrich-Ebert-Strasse 80: vor Schwimmbad
814	DC5149	Hamburg	22177	Bramfelder Chaussee 84	(53.598597621883556,10.067623632725528)	3	1	1	1	0	0	5	Parkplatz Edeka
815	DC5146	Hamburg	22391	Von-Kurtzrock-Ring 16b	(53.635820255819816,10.068154914724989)	4	1	1	1	1	1	5	S-Bahn Hoheneichen: Ecke Langwisch
816	DC2118	Hamburg	22763	Bleickenallee 	(53.55088379289539,9.920001196266135)	2	1	1	1	0	0	5	Vor dem Friedhof:ggü. Nr. 22
817	DC2134	Hamburg	22559	Nagelshof 2	(53.5815229590843,9.753845826771835)	2	1	1	1	0	0	5	ggü.2, vor Einkaufsmarkt
818	DC2148	Hamburg	22589	Sülldorfer Kirchenweg 202	(53.58070185169501,9.795973815885974)	2	1	1	1	1	1	5	Ecke Sülldorfer Landstraße: vor Parkplatz
819	DC3119	Hamburg	22415	Wittekopsweg 57	(53.642330771756235,10.00789257852188)	2	0	0	0	0	0	5	Ecke Bültenblick
820	DC3131	Hamburg	22415	Tangstedter Landstrasse 184	(53.65862896898336,10.0204812697181)	2	0	0	0	0	0	5	
821	DC2115	Hamburg	22763	Behringstrasse 95	(53.55431366277445,9.910891525999329)	1	1	1	1	0	0	5	
822	DC3084	Hamburg	22335	Hermann-Löns-Weg 67	(53.631775438623954,10.01282768449199)	4	0	0	0	0	0	5	Ecke Timm-Kröger-Weg
823	DC3053	Hamburg	20255	Telemannstrasse 35	(53.580059303190204,9.954355906478774)	3	0	0	0	0	0	5	Ecke Lutterothstraße
824	DC3081	Hamburg	22529	Nedderfeld 110	(53.6012645278693,9.981700379591372)	1	1	1	1	0	0	5	
825	DC4084	Hamburg	21075	An der Rennkoppel 	(53.464950566019084,9.9591972633249)	2	1	1	1	0	0	5	Ecke Heimfelder Straße 30: gegenüber Woellmerstraße:gegenüber Spielplatz
826	DC4107	Hamburg	21149	Kleinfeld 27a	(53.472519428818096,9.859187834055499)	2	1	1	1	0	0	5	Ecke Dorflageweg
827	DC4174	Hamburg	21107	Bauwiesenstrasse 	(53.505322112305066,9.988596385429158)	2	1	1	1	0	0	5	Ecke Rotenhäuser Straße:vor Rotenhäuser Straße 84:ggü. Feuerwache
828	DC4008	Hamburg	21035	Henriette-Herz-Ring 18	(53.482877682168954,10.176552273897661)	3	2	1	1	1	1	5	vor Parkplatz Einkaufsmarkt:ggü. Kindergarten:ggü. Marta-Damkowski-Kehre
829	DC3240	Hamburg	22527	Flamingoweg 	(53.59759509005667,9.924975147340918)	2	1	1	0	0	0	5	Ecke Pinguinweg
830	DC3232	Hamburg	22459	Graf-Johann-Weg 38	(53.62439695246771,9.916191324731745)	2	1	1	1	0	0	5	
831	DC4164	Hamburg	21109	Ottensweide 	(53.484948767820875,10.015788026275755)	2	1	1	1	0	0	5	ggü. Nr.12: in der Kurve
832	DC4166	Hamburg	21109	Ottensweide 	(53.485211713661805,10.016466128924275)	2	0	0	0	0	0	5	ggü. Nr. 9: vor Parkplatz
833	DC4195	Hamburg	21079	Schneverdinger Weg 4	(53.44058614962749,9.992228808346592)	2	1	1	1	0	0	5	vor dem Parkplatz
834	DC4022	Hamburg	21035	Wiesnerring 1A	(53.482692244638045,10.199484306606722)	2	1	1	1	0	0	5	neben Einkaufsmarkt
835	DC4029	Hamburg	21031	Korachstrasse 59	(53.51066553521368,10.1999948505381)	1	0	0	0	0	0	5	ggü. Nr.22: an der Ringstrasse:vor den Garagen
836	DC4041	Hamburg	21037	Ochsenwerder Landstrasse 33	(53.47653149505069,10.077899717453857)	4	2	1	1	0	0	5	neben Nr. 33
837	DC1092	Hamburg	22115	Havighorster Redder 57	(53.52751728403818,10.149392950129773)	1	1	1	1	0	0	5	vor EKZ
838	DC3208	Hamburg	20148	Binderstrasse 34	(53.567723115223224,9.984736480460718)	3	1	1	1	0	0	5	am Ende der Sackgasse
839	DC5066	Hamburg	22399	Poppenbütteler Bogen 96	(53.66790702677636,10.06875629916342)	5	2	2	1	0	0	5	südliche Einmündung: vor Autohändler
840	DC5067	Hamburg	22399	Rehmbrook 	(53.6607433054803,10.074858841832711)	3	0	0	0	0	0	5	neben 42a: ggü. Redderkoppel
841	DC1045	Hamburg	22049	Kiefhörn 1	(53.58974209138083,10.069968299252261)	1	1	1	1	0	0	5	ggü. EinmündungThorner Gasse
842	DC1166	Hamburg	20537	Hammer Baum 17	(53.55405276144743,10.04187595317342)	4	0	0	0	0	0	5	ggü. Post
843	DC3006	Hamburg	22297	Möringbogen 	(53.60639422129757,10.012727399695242)	2	0	0	0	0	0	5	Ecke Hindenburgstraße
844	DC1157	Hamburg	22305	Amalie-Dietrich-Stieg 1	(53.589613266627964,10.057471963331189)	2	1	1	1	0	0	5	
845	DC5038	Hamburg	22043	Barsbütteler Strasse 10	(53.57070509093983,10.137904627547238)	3	2	1	1	0	0	5	Ecke Ratiborweg
846	DC5063	Hamburg	22399	Harksheider Strasse 49	(53.664040391999016,10.074407635863642)	14	3	3	1	1	2	5	Ecke Langenhorner Strasse-Ost
847	DC5086	Hamburg	22147	Alter Zollweg 	(53.606567202335334,10.134801134824198)	2	1	1	1	1	1	5	ggü. Grömitzer Weg: ggü. 131
848	DC3095	Hamburg	22453	Brödermannsweg 	(53.60567895390009,9.977151068465012)	4	1	1	1	0	0	5	Neben Brödermannsweg 37
849	DC4184	Hamburg	21107	Zeidlerstrasse 42	(53.51232803285309,9.994575349971376)	1	1	1	1	0	0	5	vor dem Versorgungshäuschen:neben der Stichstraße:ggü. Nr.37
850	DC1024	Hamburg	22081	Gluckstrasse 63	(53.57402469278401,10.046861188344796)	2	0	0	0	0	0	5	Ecke Bürgerstrasse
851	DC1037	Hamburg	22083	Biedermannplatz 2	(53.58007643044888,10.03391244264407)	4	1	1	1	0	0	5	Ecke Weidestrasse, vor Grünanlage
852	DC1196	Hamburg	22119	Rispengrasweg 	(53.561235195633145,10.126566924036982)	2	1	1	1	0	0	5	Nähe Fuchsbergredder: ggü. Zittergrasweg
853	DC1181	Hamburg	22089	Maxstrasse 39	(53.57157502530362,10.047702358973522)	1	0	0	0	0	0	5	Ecke Auenstr.
854	DC3143	Hamburg	22529	Ahornallee 2	(53.599887082138586,9.965667350931101)	2	1	1	1	0	0	5	
855	DC4154	Hamburg	21109	Korallusstrasse 4	(53.503774049179384,10.010925124339071)	1	0	0	0	0	0	5	vor Korallusring 1 :ggü. Nr.13
856	DC2021	Hamburg	22607	Blomkamp 225	(53.580127579757395,9.874608567160232)	3	1	1	1	0	0	5	Ecke Luruper Drift
857	DC5109	Hamburg	22309	Fritz-Flinte-Ring 	(53.61429351701167,10.051933303288099)	3	1	1	1	0	0	5	zwischen Nr. 56 und Nr. 58: Parkhaus
858	DC3064	Hamburg	20357	Altonaer Strasse 59	(53.564479856621666,9.962376076404711)	4	1	1	1	0	0	5	ggü. Nr. 28: zwischen Bartelsstraße und Vereinsstraße
859	DC2040	Hamburg	22587	Dormienstrasse 21	(53.56224602606373,9.808203389508822)	2	2	2	1	1	1	5	Ecke Osterleystrasse
860	DC2050	Hamburg	22607	Ebertallee 20	(53.56490150732462,9.887399633396774)	2	1	1	1	0	0	5	Ecke Kalkreuthweg:Mittelstreifen
861	DC1129	Hamburg	22305	Schwalbenstrasse 	(53.58871726803806,10.046760654143522)	2	1	1	1	0	0	5	vor Penny und ggü 2
862	DC1120	Hamburg	22307	Schlicksweg 40	(53.594344378128845,10.055866505415432)	2	1	1	1	0	0	5	Ecke Oertzweg
863	DC4108	Hamburg	21149	Neckersstücken 1	(53.47141746052737,9.819901768208082)	2	1	1	1	0	0	5	Ecke An de Geest:Höhe Garagen
864	DC4138	Hamburg	21107	Eckermannstrasse 5	(53.51285307559402,9.989281892515695)	2	1	1	0	0	0	5	Ecke Rotenhäuser Wettern:neben dem Kindergarten
865	DC5144	Hamburg	22391	Eckerkamp 	(53.63460138272121,10.075760665185074)	3	1	1	0	0	0	5	Ecke Kelterstrasse: ggü. Nr. 51
866	DC5143	Hamburg	22049	Lesserstrasse 211	(53.5930889063633,10.074773808486855)	2	0	0	0	0	0	5	Ecke Pregelweg
867	DC2005	Hamburg	22767	Biernatzkistrasse 1	(53.548011686248536,9.939860241818064)	3	1	1	1	0	0	5	Ecke Königstraße
868	DC1109	Hamburg	22119	Schiffbeker Weg 147	(53.55487388194844,10.113419368572925)	3	0	0	0	0	0	5	Bushaltestelle
869	DC1193	Hamburg	22111	Marshallweg 8	(53.54587809670983,10.084740810611857)	1	1	1	1	0	0	5	ggü. Marshallweg 8
870	DC2157	Hamburg	22761	Mendelssohnstrasse 23	(53.56386573700558,9.914531293084112)	3	1	1	1	0	0	5	
871	DC3169	Hamburg	22453	Gross Borsteler Strasse 	(53.61004595355911,9.961393979183185)	2	1	1	1	0	0	5	ggü. Bushaltestelle Niendorfer Straße
872	DC3219	Hamburg	22457	Halstenbeker Strasse 	(53.625145984781525,9.895835540372216)	2	1	1	1	0	0	5	
873	DC1153	Hamburg	22307	Fraenkelstrasse 3	(53.59799669018998,10.037765210277945)	5	2	2	1	0	0	5	Ecke Alte Wöhr
874	DC3231	Hamburg	22459	Graf-Anton-Weg 29	(53.62736413042738,9.944456211407223)	2	1	1	1	0	0	5	Ecke Wendlohstraße
875	DC5072	Hamburg	22143	Grosslohering 	(53.598651566016564,10.179327618588715)	1	0	0	0	0	0	5	Heinrich-Schulz-Weg: ggü. Großlohering 23a
876	DC1001	Hamburg	20537	Süderstrasse 302	(53.54742711509545,10.05347610444673)	1	1	1	1	0	0	5	ggü. Osterbrook
877	DC1018	Hamburg	22087	Birkenau 0	(53.56823994735951,10.025948461732275)	4	1	1	1	0	0	5	Ecke Schürbeker Strasse: unter Hochbahn
878	DC3243	Hamburg	22525	Melanchthonstrasse 39	(53.588264703833325,9.927290125167259)	2	1	1	1	1	1	5	Ecke Warnstedtstraße/Gutenbergstraße
879	DC2064	Hamburg	22589	Simrockstrasse 190	(53.576499716938656,9.82145944583742)	2	1	1	0	0	0	5	Ecke Sülldorfer Landstraße
880	DC4051	Hamburg	21075	Ehestorfer Weg 92	(53.455405333711695,9.941647085622959)	1	1	1	1	0	0	5	auf dem Parkstreifen:vor Nr. 94a-c: gegenüber Nr. 99
881	DC3223	Hamburg	22457	Eisenhansweg 18	(53.645278750987735,9.92221632570102)	2	1	1	1	0	0	5	Ecke Königskinderweg
882	DC5022	Hamburg	22159	An der Berner Au 	(53.61631757078795,10.12195021369134)	2	1	1	1	0	0	5	Ecke Neusurenland
883	DC2103	Hamburg	22587	Kronprinzenstrasse 	(53.565064505535474,9.83461104912633)	3	1	1	1	0	0	5	ggü. Nr. 29: Ecke Wildenbruchstraße
884	DC4092	Hamburg	21077	Marmstorfer Weg 	(53.44265284445878,9.969047374801125)	3	2	1	1	0	0	5	gegenüber Nr. 112a: Ecke Nixenstieg
885	DC4095	Hamburg	21079	Moorburger Elbdeich 221	(53.49291003585283,9.93188570574309)	3	1	1	1	0	0	5	ca. 50m neben Freiwilliger Feuerwehr
886	DC3061	Hamburg	20259	Emilienstrasse 78	(53.571948331954076,9.952950449830123)	2	1	1	0	0	0	5	Ecke Fruchtallee
887	DC3178	Hamburg	22455	Kimbernstrasse 5	(53.64028262567564,9.968731995007087)	2	1	1	1	0	0	5	Ecke Kimbernstieg
888	DC3082	Hamburg	22335	Doverkamp 	(53.6302083468123,10.014503230919797)	2	0	0	0	0	0	5	Ecke Alsterkrugchaussee
889	DC4111	Hamburg	21147	Neuwiedenthaler Strasse 50	(53.47680368096449,9.872185682171752)	0	1	1	1	0	0	5	Ecke Ostewinkel
890	DC3039	Hamburg	22523	Reemstückenkamp 9	(53.613426073570174,9.910653682133713)	0	1	1	1	0	0	5	
891	DC4045	Hamburg	21077	Beerentalweg 	(53.44790836295137,9.945851703156277)	0	1	1	1	0	0	5	gegenüber Nr. 118
892	DC5082	Hamburg	22145	Kriegkamp 	(53.629738473297564,10.14589208188147)	0	1	1	1	0	0	5	vor Kreisel (Grünfläche) Saseler Strasse
893	DC5049	Hamburg	22043	Bei den Höfen 	(53.57254113536706,10.135813713354516)	0	2	2	2	0	0	5	ggü. Nr. 23: EKZ
894	DC5120	Hamburg	22045	Ahrensburger Strasse 	(53.580447159150786,10.10335257455233)	0	2	2	1	0	0	5	Parkplatz Edeka: neben Nr. 110 a
895	DC5040	Hamburg	22043	Gleiwitzer Bogen 88	(53.56908632658829,10.13752192416674)	0	1	1	0	0	0	5	
896	DC2153	Hamburg	22549	Böttcherkamp 97	(53.58993861766223,9.866482598961698)	0	1	1	1	0	0	5	
897	DC1073	Hamburg	22303	Jarrestrasse 73	(53.58596508608531,10.028776395957873)	0	1	1	1	0	0	5	
898	DC1019a	Hamburg	22087	Hartwicusstrasse 21	(53.565990595005715,10.021104644578415)	0	2	2	1	0	1	5	Ecke Mundsburger Damm: ggü. 21: Hinter der Tankstelle
899	DC2144	Hamburg	20359	Reeperbahn 1	(53.549899937390094,9.96893119466547)	0	0	1	0	0	0	5	Ecke Zirkusweg
900	DC4020	Hamburg	22115	Asbrookdamm 5	(53.518987865259696,10.15797533724695)	0	0	1	0	0	0	5	Parkplatz beim Kleingartenverein
901	DC4186	Hamburg	21109	Niedergeorgswerder Deich 37	(53.51402044969715,10.020654096847473)	0	1	1	0	0	0	5	ggü. Nr.38: vor Parkplatz KLGV
902	DC5052	Hamburg	22041	Knutzenweg 28	(53.57028601896995,10.062415935529069)	0	1	1	1	0	0	5	Fruchtsäfteladen: Privatparkplatz Hinterhof
903	DC5112	Hamburg	22309	Gropiusring 	(53.61406491593822,10.05809555198225)	0	1	1	0	0	0	5	neben Nr. 43
904	DC4037	Hamburg	21035	Walter-Rudolphi-Weg 29	(53.48994586197771,10.158417737302441)	0	1	1	1	0	0	5	ggü. Fleetplatz / S-Bahnhof Neuallermöhe
905	DC1203	Hamburg	20457	Stockmeyerstrasse 45	(53.5442731224597,10.006825756088324)	0	1	1	1	0	0	5	ggü. der Oberhafenkantine
906	DC5076	Hamburg	22145	Bargkoppelweg 50	(53.618567233037226,10.155039011151779)	0	1	1	1	0	0	5	Parkplatz Metro
907	DC4204	Hamburg	21129	Seehofring 1	(53.52519934087786,9.780471621002485)	0	1	1	1	0	0	5	vor Einkaufsmarkt:in der Zufahrt zum Kleingartenverein
908	DC3210	Hamburg	20148	Mollerstrasse 20	(53.57066303609553,9.992488077375157)	0	1	1	1	1	0	5	Ecke Turmweg: ggü. Nr. 20: ggü. Kirche
909	DC3106	Hamburg	20149	Isestrasse 75	(53.58346645906843,9.985231971409876)	0	1	1	1	1	1	5	Ecke Eppendorfer Baum: U-Bahn-Seite
910	DC4093	Hamburg	21077	Zum Jägerfeld 	(53.4343481619856,9.97559864816932)	0	1	1	1	0	0	5	Ecke Jägerfeldweg: Gegenüber Nr. 2
911	DC2104	Hamburg	22609	Hemmingstedter Weg 	(53.563931425957385,9.855279234863653)	0	1	1	1	0	0	5	ggü. Nr. 141
912	DC4119	Hamburg	21147	Francoper Strasse 	(53.48543118956883,9.866512537022729)	0	1	1	1	0	0	5	links in der Einfahrt zum KLGV 774
913	DC3092	Hamburg	22459	Lerchenkamp 	(53.623456845191505,9.911086727359598)	0	1	1	1	0	0	5	ggü. Lerchenkamp 38: Ecke Spanische Furt
914	DC1198a	Hamburg	22081	Gluckstrasse 22	(53.57258943757106,10.040682997943188)	0	1	1	1	0	0	5	Ecke Marschnerstrasse
915	DC1018a	Hamburg	22087	Birkenau 0	(53.56836532941565,10.025994155653565)	0	0	0	0	0	0	5	Ecke Schürbeker Strasse: unter Hochbahn
916	DC2022	Hamburg	22761	Ruhrstrasse 51	(53.56538770350149,9.925393822053513)	0	0	0	0	0	1	5	Stilbruch Altona: Parkplatz von Stilbruch
917	DC5125	Hamburg	22047	Helbingstrasse 63	(53.586229861126824,10.095495673619318)	0	0	0	0	0	1	5	Stilbruch Wandsbek: Direkt auf dem Parkplatz
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.locations_id_seq', 917, true);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

