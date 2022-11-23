--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.6 (Homebrew)

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

DROP DATABASE IF EXISTS postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: cloudsqlsuperuser
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF8';


ALTER DATABASE postgres OWNER TO cloudsqlsuperuser;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: cloudsqlsuperuser
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: pokemondata2; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pokemondata2;


ALTER SCHEMA pokemondata2 OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.accounts (
    id bigint NOT NULL,
    username character varying(256) NOT NULL,
    password character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    remember_token character varying(100),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE pokemondata2.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.accounts_id_seq OWNED BY pokemondata2.accounts.id;


--
-- Name: campaigns; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.campaigns (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    health_formula text NOT NULL,
    physical_evasion_formula text NOT NULL,
    special_evasion_formula text NOT NULL,
    speed_evasion_formula text NOT NULL,
    is_ptu boolean NOT NULL
);


ALTER TABLE pokemondata2.campaigns OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.campaigns_id_seq OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.campaigns_id_seq OWNED BY pokemondata2.campaigns.id;


--
-- Name: contest_move_abilities; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.contest_move_abilities (
    id bigint NOT NULL,
    name character varying(256) NOT NULL,
    description text NOT NULL
);


ALTER TABLE pokemondata2.contest_move_abilities OWNER TO postgres;

--
-- Name: contest_move_abilities_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.contest_move_abilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.contest_move_abilities_id_seq OWNER TO postgres;

--
-- Name: contest_move_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.contest_move_abilities_id_seq OWNED BY pokemondata2.contest_move_abilities.id;


--
-- Name: migrations; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.migrations (
    migration character varying(255) NOT NULL,
    batch bigint NOT NULL
);


ALTER TABLE pokemondata2.migrations OWNER TO postgres;

--
-- Name: player_pokemon_abilities; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_pokemon_abilities (
    id bigint NOT NULL,
    pokemon_id bigint NOT NULL,
    ability bigint NOT NULL
);


ALTER TABLE pokemondata2.player_pokemon_abilities OWNER TO postgres;

--
-- Name: player_pokemon_abilities_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_pokemon_abilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_pokemon_abilities_id_seq OWNER TO postgres;

--
-- Name: player_pokemon_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_pokemon_abilities_id_seq OWNED BY pokemondata2.player_pokemon_abilities.id;


--
-- Name: player_pokemon_capabilities; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_pokemon_capabilities (
    id bigint NOT NULL,
    pokemon_id bigint NOT NULL,
    capability bigint NOT NULL,
    value smallint NOT NULL,
    "position" smallint NOT NULL
);


ALTER TABLE pokemondata2.player_pokemon_capabilities OWNER TO postgres;

--
-- Name: player_pokemon_capabilities_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_pokemon_capabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_pokemon_capabilities_id_seq OWNER TO postgres;

--
-- Name: player_pokemon_capabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_pokemon_capabilities_id_seq OWNED BY pokemondata2.player_pokemon_capabilities.id;


--
-- Name: player_pokemon_data; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_pokemon_data (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    trainer_id bigint DEFAULT 0 NOT NULL,
    species smallint NOT NULL,
    experience bigint NOT NULL,
    nature smallint NOT NULL,
    gender smallint NOT NULL,
    type1 smallint NOT NULL,
    type2 smallint NOT NULL,
    notes text NOT NULL,
    current_health bigint NOT NULL,
    "position" smallint NOT NULL,
    active boolean DEFAULT false NOT NULL,
    loyalty smallint DEFAULT 1 NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    held_item bigint DEFAULT 0 NOT NULL,
    gm_notes text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE pokemondata2.player_pokemon_data OWNER TO postgres;

--
-- Name: player_pokemon_data_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_pokemon_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_pokemon_data_id_seq OWNER TO postgres;

--
-- Name: player_pokemon_data_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_pokemon_data_id_seq OWNED BY pokemondata2.player_pokemon_data.id;


--
-- Name: player_pokemon_moves; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_pokemon_moves (
    id bigint NOT NULL,
    pokemon_id bigint NOT NULL,
    move bigint NOT NULL,
    is_tutor boolean NOT NULL,
    "position" smallint NOT NULL,
    type_override smallint DEFAULT 0 NOT NULL,
    ppup boolean DEFAULT false NOT NULL
);


ALTER TABLE pokemondata2.player_pokemon_moves OWNER TO postgres;

--
-- Name: player_pokemon_moves_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_pokemon_moves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_pokemon_moves_id_seq OWNER TO postgres;

--
-- Name: player_pokemon_moves_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_pokemon_moves_id_seq OWNED BY pokemondata2.player_pokemon_moves.id;


--
-- Name: player_pokemon_stats; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_pokemon_stats (
    id bigint NOT NULL,
    pokemon_id bigint NOT NULL,
    hp smallint DEFAULT 0 NOT NULL,
    attack smallint DEFAULT 0 NOT NULL,
    defense smallint DEFAULT 0 NOT NULL,
    spattack smallint DEFAULT 0 NOT NULL,
    spdefense smallint DEFAULT 0 NOT NULL,
    speed smallint DEFAULT 0 NOT NULL,
    is_base boolean DEFAULT false NOT NULL
);


ALTER TABLE pokemondata2.player_pokemon_stats OWNER TO postgres;

--
-- Name: player_pokemon_stats_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_pokemon_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_pokemon_stats_id_seq OWNER TO postgres;

--
-- Name: player_pokemon_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_pokemon_stats_id_seq OWNED BY pokemondata2.player_pokemon_stats.id;


--
-- Name: player_trainer_classes; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_trainer_classes (
    id bigint NOT NULL,
    trainer_id bigint NOT NULL,
    class_id bigint NOT NULL
);


ALTER TABLE pokemondata2.player_trainer_classes OWNER TO postgres;

--
-- Name: player_trainer_classes_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_trainer_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_trainer_classes_id_seq OWNER TO postgres;

--
-- Name: player_trainer_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_trainer_classes_id_seq OWNED BY pokemondata2.player_trainer_classes.id;


--
-- Name: player_trainer_features; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_trainer_features (
    id bigint NOT NULL,
    class_id bigint NOT NULL,
    feature_id bigint NOT NULL
);


ALTER TABLE pokemondata2.player_trainer_features OWNER TO postgres;

--
-- Name: player_trainer_features_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_trainer_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_trainer_features_id_seq OWNER TO postgres;

--
-- Name: player_trainer_features_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_trainer_features_id_seq OWNED BY pokemondata2.player_trainer_features.id;


--
-- Name: player_trainers; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.player_trainers (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(256) NOT NULL,
    campaign_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE pokemondata2.player_trainers OWNER TO postgres;

--
-- Name: player_trainers_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.player_trainers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.player_trainers_id_seq OWNER TO postgres;

--
-- Name: player_trainers_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.player_trainers_id_seq OWNED BY pokemondata2.player_trainers.id;


--
-- Name: pokemon_abilities; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.pokemon_abilities (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    frequency character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE pokemondata2.pokemon_abilities OWNER TO postgres;

--
-- Name: pokemon_abilities_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.pokemon_abilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.pokemon_abilities_id_seq OWNER TO postgres;

--
-- Name: pokemon_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.pokemon_abilities_id_seq OWNED BY pokemondata2.pokemon_abilities.id;


--
-- Name: pokemon_capabilities; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.pokemon_capabilities (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE pokemondata2.pokemon_capabilities OWNER TO postgres;

--
-- Name: pokemon_capabilities_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.pokemon_capabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.pokemon_capabilities_id_seq OWNER TO postgres;

--
-- Name: pokemon_capabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.pokemon_capabilities_id_seq OWNED BY pokemondata2.pokemon_capabilities.id;


--
-- Name: pokemon_held_items; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.pokemon_held_items (
    id bigint NOT NULL,
    name character varying(256) NOT NULL,
    description text NOT NULL
);


ALTER TABLE pokemondata2.pokemon_held_items OWNER TO postgres;

--
-- Name: pokemon_held_items_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.pokemon_held_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.pokemon_held_items_id_seq OWNER TO postgres;

--
-- Name: pokemon_held_items_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.pokemon_held_items_id_seq OWNED BY pokemondata2.pokemon_held_items.id;


--
-- Name: pokemon_moves; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.pokemon_moves (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type smallint NOT NULL,
    damage character varying(255) NOT NULL,
    frequency character varying(255) NOT NULL,
    ac smallint NOT NULL,
    attack_type smallint NOT NULL,
    attack_range character varying(255) NOT NULL,
    effects text NOT NULL,
    contest_type character varying(8) NOT NULL,
    contest_dice bigint NOT NULL,
    contest_effect bigint NOT NULL
);


ALTER TABLE pokemondata2.pokemon_moves OWNER TO postgres;

--
-- Name: pokemon_moves_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.pokemon_moves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.pokemon_moves_id_seq OWNER TO postgres;

--
-- Name: pokemon_moves_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.pokemon_moves_id_seq OWNED BY pokemondata2.pokemon_moves.id;


--
-- Name: pokemon_natures; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.pokemon_natures (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    up smallint NOT NULL,
    down smallint NOT NULL
);


ALTER TABLE pokemondata2.pokemon_natures OWNER TO postgres;

--
-- Name: pokemon_natures_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.pokemon_natures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.pokemon_natures_id_seq OWNER TO postgres;

--
-- Name: pokemon_natures_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.pokemon_natures_id_seq OWNED BY pokemondata2.pokemon_natures.id;


--
-- Name: pokemon_reference; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.pokemon_reference (
    id bigint NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE pokemondata2.pokemon_reference OWNER TO postgres;

--
-- Name: pokemon_types; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.pokemon_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE pokemondata2.pokemon_types OWNER TO postgres;

--
-- Name: pokemon_types_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.pokemon_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.pokemon_types_id_seq OWNER TO postgres;

--
-- Name: pokemon_types_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.pokemon_types_id_seq OWNED BY pokemondata2.pokemon_types.id;


--
-- Name: ptu_damage_levels; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.ptu_damage_levels (
    id bigint NOT NULL,
    dice character varying(64) NOT NULL,
    static character varying(64) NOT NULL
);


ALTER TABLE pokemondata2.ptu_damage_levels OWNER TO postgres;

--
-- Name: ptu_pokemon_abilities; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.ptu_pokemon_abilities (
    ability_definition_id bigint NOT NULL,
    frequency text NOT NULL,
    effect text NOT NULL
);


ALTER TABLE pokemondata2.ptu_pokemon_abilities OWNER TO postgres;

--
-- Name: ptu_pokemon_moves; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.ptu_pokemon_moves (
    id bigint NOT NULL,
    move_definition_id bigint NOT NULL,
    frequency character varying(64) NOT NULL,
    ac character varying(4) NOT NULL,
    type bigint NOT NULL,
    damage bigint NOT NULL,
    attack_type smallint NOT NULL,
    attack_range text NOT NULL,
    effect text NOT NULL
);


ALTER TABLE pokemondata2.ptu_pokemon_moves OWNER TO postgres;

--
-- Name: ptu_pokemon_moves_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.ptu_pokemon_moves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.ptu_pokemon_moves_id_seq OWNER TO postgres;

--
-- Name: ptu_pokemon_moves_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.ptu_pokemon_moves_id_seq OWNED BY pokemondata2.ptu_pokemon_moves.id;


--
-- Name: trainer_classes; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.trainer_classes (
    id bigint NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE pokemondata2.trainer_classes OWNER TO postgres;

--
-- Name: trainer_classes_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.trainer_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.trainer_classes_id_seq OWNER TO postgres;

--
-- Name: trainer_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.trainer_classes_id_seq OWNED BY pokemondata2.trainer_classes.id;


--
-- Name: trainer_features; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.trainer_features (
    id bigint NOT NULL,
    name character varying(256) NOT NULL,
    target text NOT NULL,
    uses smallint NOT NULL,
    feature_trigger character varying(256) NOT NULL,
    action character varying(256) NOT NULL,
    trainerclassdefinition_id bigint NOT NULL,
    effect text NOT NULL
);


ALTER TABLE pokemondata2.trainer_features OWNER TO postgres;

--
-- Name: trainer_features_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.trainer_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.trainer_features_id_seq OWNER TO postgres;

--
-- Name: trainer_features_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.trainer_features_id_seq OWNED BY pokemondata2.trainer_features.id;


--
-- Name: user_messages; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.user_messages (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    from_id bigint NOT NULL,
    viewed_at timestamp with time zone DEFAULT '1901-01-01 00:00:00+00'::timestamp with time zone,
    subject character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE pokemondata2.user_messages OWNER TO postgres;

--
-- Name: user_messages_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.user_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.user_messages_id_seq OWNER TO postgres;

--
-- Name: user_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.user_messages_id_seq OWNED BY pokemondata2.user_messages.id;


--
-- Name: user_permission_definitions; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.user_permission_definitions (
    id bigint NOT NULL,
    name character varying(256) NOT NULL,
    description text NOT NULL
);


ALTER TABLE pokemondata2.user_permission_definitions OWNER TO postgres;

--
-- Name: user_permission_definitions_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.user_permission_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.user_permission_definitions_id_seq OWNER TO postgres;

--
-- Name: user_permission_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.user_permission_definitions_id_seq OWNED BY pokemondata2.user_permission_definitions.id;


--
-- Name: user_permissions; Type: TABLE; Schema: pokemondata2; Owner: postgres
--

CREATE TABLE pokemondata2.user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission bigint NOT NULL,
    value bigint NOT NULL
);


ALTER TABLE pokemondata2.user_permissions OWNER TO postgres;

--
-- Name: user_permissions_id_seq; Type: SEQUENCE; Schema: pokemondata2; Owner: postgres
--

CREATE SEQUENCE pokemondata2.user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pokemondata2.user_permissions_id_seq OWNER TO postgres;

--
-- Name: user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: pokemondata2; Owner: postgres
--

ALTER SEQUENCE pokemondata2.user_permissions_id_seq OWNED BY pokemondata2.user_permissions.id;


--
-- Name: campaigns id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.campaigns ALTER COLUMN id SET DEFAULT nextval('pokemondata2.campaigns_id_seq'::regclass);


--
-- Name: contest_move_abilities id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.contest_move_abilities ALTER COLUMN id SET DEFAULT nextval('pokemondata2.contest_move_abilities_id_seq'::regclass);


--
-- Name: player_pokemon_abilities id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_abilities ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_pokemon_abilities_id_seq'::regclass);


--
-- Name: player_pokemon_capabilities id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_capabilities ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_pokemon_capabilities_id_seq'::regclass);


--
-- Name: player_pokemon_data id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_data ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_pokemon_data_id_seq'::regclass);


--
-- Name: player_pokemon_moves id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_moves ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_pokemon_moves_id_seq'::regclass);


--
-- Name: player_pokemon_stats id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_stats ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_pokemon_stats_id_seq'::regclass);


--
-- Name: player_trainer_classes id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_trainer_classes ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_trainer_classes_id_seq'::regclass);


--
-- Name: player_trainer_features id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_trainer_features ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_trainer_features_id_seq'::regclass);


--
-- Name: player_trainers id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_trainers ALTER COLUMN id SET DEFAULT nextval('pokemondata2.player_trainers_id_seq'::regclass);


--
-- Name: pokemon_abilities id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_abilities ALTER COLUMN id SET DEFAULT nextval('pokemondata2.pokemon_abilities_id_seq'::regclass);


--
-- Name: pokemon_capabilities id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_capabilities ALTER COLUMN id SET DEFAULT nextval('pokemondata2.pokemon_capabilities_id_seq'::regclass);


--
-- Name: pokemon_held_items id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_held_items ALTER COLUMN id SET DEFAULT nextval('pokemondata2.pokemon_held_items_id_seq'::regclass);


--
-- Name: pokemon_moves id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_moves ALTER COLUMN id SET DEFAULT nextval('pokemondata2.pokemon_moves_id_seq'::regclass);


--
-- Name: pokemon_natures id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_natures ALTER COLUMN id SET DEFAULT nextval('pokemondata2.pokemon_natures_id_seq'::regclass);


--
-- Name: pokemon_types id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_types ALTER COLUMN id SET DEFAULT nextval('pokemondata2.pokemon_types_id_seq'::regclass);


--
-- Name: ptu_pokemon_moves id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.ptu_pokemon_moves ALTER COLUMN id SET DEFAULT nextval('pokemondata2.ptu_pokemon_moves_id_seq'::regclass);


--
-- Name: trainer_classes id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.trainer_classes ALTER COLUMN id SET DEFAULT nextval('pokemondata2.trainer_classes_id_seq'::regclass);


--
-- Name: trainer_features id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.trainer_features ALTER COLUMN id SET DEFAULT nextval('pokemondata2.trainer_features_id_seq'::regclass);


--
-- Name: user_messages id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.user_messages ALTER COLUMN id SET DEFAULT nextval('pokemondata2.user_messages_id_seq'::regclass);


--
-- Name: user_permission_definitions id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.user_permission_definitions ALTER COLUMN id SET DEFAULT nextval('pokemondata2.user_permission_definitions_id_seq'::regclass);


--
-- Name: user_permissions id; Type: DEFAULT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.user_permissions ALTER COLUMN id SET DEFAULT nextval('pokemondata2.user_permissions_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: contest_move_abilities; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.contest_move_abilities VALUES (0, 'No Effect', 'None');
INSERT INTO pokemondata2.contest_move_abilities VALUES (1, 'Attention Grabber', 'Each adjacent competitor loses 2d6 on their next roll. You gain any dice lost this way.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (2, 'Big Show', 'The Judge you appeal to gains 3 Voltage.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (3, 'Catching Up', 'If both adjacent Competitors have more Appeal Points than you, pick one of them. You roll an additional 1d6 this round for every four points ahead of you they are, rounded up.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (4, 'Crowd Pleaser', 'Ignore all penalties from Contest Type, and instead add 1d6. The Voltage of each Judge is increased by 2.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (5, 'End Set', 'You move to the last, second to last, or third to last Position at the start of the next round. You must choose when performing the Move with End Set.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (6, 'Excitement', 'The Voltage of the Judge you appeal to is raised by 3.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (7, 'Final Appeal', 'You move to the last Position in the next round.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (8, 'Get Ready!', 'If the move you use next round brings the Judge you appealed to this round to 6 Voltage, double the dice gained from Voltage.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (9, 'Good Show!', 'If the Judge you appeal to has the most Voltage, roll an additional 2d6.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (10, 'Hold That Thought', 'The Judge you appeal to cannot have its Voltage reduced this round.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (11, 'Incredible', 'Roll an additional 4d6. Each 5 now counts for an additional Appeal Point, but each 2 now counts for one fewer Appeal Point.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (12, 'Incentives', 'If this Move matches the Contest Type, the Judge you appeal to gains 2 Voltage, and the other Judges lose 2 Voltage.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (13, 'Interrupting Appeal', 'This Move always occurs first, regardless of Position. Lower the Voltage of all other Judges by 1.\r\n');
INSERT INTO pokemondata2.contest_move_abilities VALUES (14, 'Inversed Appeal', 'If this Move is of an Opposing Stat of the Contest, ignore the penalty and instead roll an additional 1d6.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (15, 'Quick Set', 'You move to the first Position at the start of the next round.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (16, 'Reflective Appeal', 'If the Move preceding your own had the same Contest Type, roll an additional 2d6. Increase the Voltage of the Judge you appeal to by 1.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (17, 'Reliable', 'Moves with Reliable can be used every turn. If you used the same Move the previous round, add an additional 1d6 and the Judge you appeal to gains 1 Voltage.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (18, 'Round Ender', 'If you are in last Position, roll an additional 4d6 and the Judge you appeal to gains 2 Voltage.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (19, 'Round Starter', 'If you are in first Position, roll an additional 2d6 and the Judge you appeal to gains 2 Voltage.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (20, 'Sabotage', 'All rolls this round do not give Appeal Points; instead, they give all adjacent competitors that many Fumble Points. For every four points given this way, lower the Voltage of every Judge by 1.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (21, 'Seen Nothing Yet', 'If the Judge you appeal to has 6 Voltage after applying all effects, roll an additional 4d6. Seen Nothing Yet cannot work on this Judge again for the rest of the Contest.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (22, 'Slow Set', 'You move to the last Position at the start of the next round.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (23, 'Special Attention', 'If a Move of the same Contest Type of this Move has not been used this round, roll an additional 3d6. Any Pokemon that uses a Move of this type loses 2d6 on their roll, and reduces the Voltage of the Judge they appeal to by 2.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (24, 'Start Set', 'You move to the first, second, or third Position at the start of the next round. You must choose when performing the Move with Start Set.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (25, 'Torrential Appeal', 'All rolls of 6 explode, granting the normal number of Appeal Points, but allowing you to roll them again. Fumble Points gained on rerolls still count.');
INSERT INTO pokemondata2.contest_move_abilities VALUES (26, 'Unsettling', 'The Judge you appeal to loses 2 Voltage, and each other Judge loses 1 Voltage.');


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_pokemon_abilities; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_pokemon_capabilities; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_pokemon_data; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_pokemon_moves; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_pokemon_stats; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_trainer_classes; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_trainer_features; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: player_trainers; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: pokemon_abilities; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.pokemon_abilities VALUES (1, 'Adaptability', 'Static', 'Effect: When using Moves that deal\r damage and are the same elemental Type\r as the Pokemon with Adaptability, gain\r an additional 2 STAB instead of 1.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (2, 'Aftermath', 'Trigger', 'Effect: When the Pokemon is reduced\r to 0 HP or less, they create a 5-meter\r Burst. Everything in the Burst loses &frac14; of\r their full HP. Do not apply weakness or\r resistance. Do not apply stats.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (3, 'Air Lock', 'Cast &ndash; Hourly', 'Keyword: Sustain\r Effect: The weather is set to normal\r as long as the Pokemon with Air Lock\r wants it to remain that way.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (4, 'Analytic', 'Cast - Hourly', 'Effect: For the next 5 rounds, if the\r user&rsquo;s turn comes immediately after any\r of its target&rsquo;s, in the queue, the user may\r roll 2 extra STAB on damaging Moves\r ignoring the Type of Move used.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (5, 'Anger Point', 'Trigger', 'Effect: When the Pokemon receives a\r Critical Hit, raise their Attack 6 Combat\r Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (6, 'Anticipation', 'Cast &ndash; Hourly', 'Effect: During an encounter you may\r target a Pokemon. Roll 1d20; on roll,\r the target reveals if they have any\r Moves that are Super-Effective against\r the Pokemon with Anticipation; on\r 11 or better, the target reveals up to 3\r moves that are Super-Effective against\r the Pokemon with Anticipation; on\r 16 or better, the target reveals up to 5\r moves that are Super-Effective against\r the Pokemon with Anticipation and all\r of those Moves must roll +1 during\r Accuracy Check to hit the Pokemon\r with Anticipation.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (7, 'Arena Trap', 'Cast &ndash; Daily', 'Effect: A large wall of sand, 10-meters\r high surrounds the encounter. The\r diameter of the Arena Trap must be at\r least 10-meters but cannot be greater\r then 40-meters. There must be sufficient\r ground around to manipulate or the\r Ability cannot be used. The walls are\r constantly shifting making it impossible\r to climb. If a section of the wall is\r destroyed, it immediately restores itself.\r If the caster is felled or returned to a\r Poke Ball, the Arena Trap falls.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (8, 'Bad Dreams', 'Static', 'Effect: Anything sleeping within\r 30-meters of the Pokemon with Bad\r Dreams lose 1/8th of their full HP at the\r beginning of each round.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (9, 'Battle Armor', 'Static', 'Keyword: Immune\r Effect: Critical Hits\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (10, 'Big Pecks', 'Static', 'Keyword: Immune\r Effect: The user cannot have its Defense\r Stat lowered. The user cannot have its\r Defense Combat Stages lowered.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (11, 'Blaze', 'Trigger', 'Keyword: Last Chance\r Effect: Fire\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (12, 'Chlorophyll', 'Trigger - Hourly', 'Effect: While in Sunny Weather, the\r Speed stat of the Pokemon is doubled.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (13, 'Clear Body', 'Static', 'Effect: The Pokemon&rsquo;s Combat Stages\r may not be lowered by the effect of\r Abilities or Moves. Status effects may\r still alter their Combat Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (14, 'Cloud Nine', 'Cast &ndash; Hourly', 'Effect: Return the Weather of the field to\r Normal if the Pokemon with Cloud Nine\r is a higher level then the Pokemon who\r caused the weather effect.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (15, 'Color Change', 'Trigger', 'Effect: Whenever the Pokemon is hit by\r a damage-dealing Move, the Pokemon\r with Color Change will have its Type\r changed to the same Type as that of the\r Move it was damaged by.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (16, 'Compound Eyes', 'Static', 'Effect: The user needs -3 to hit on any\r Accuracy Check.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (17, 'Contrary', 'Static', 'Effect: If something would raise the\r user&rsquo;s Combat Stages, it instead lowers\r the user&rsquo;s Combat Stages by the same\r amount. If something would lower the\r user&rsquo;s Combat Stages, it instead raises\r the user&rsquo;s Combat Stages by the same\r amount.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (18, 'Cursed Body', 'Cast - Daily', 'Effect: When a foe hits the Pokemon\r with Cursed Body with a melee Move,\r that Move becomes Disabled after\r damaged is dealt.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (19, 'Cute Charm', 'Trigger - Daily', 'Effect: When an opposite gendered foe\r attacks the Pokemon with Cute Charm,\r they become Infatuated after damaged is\r dealt.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (20, 'Damp', 'Static', 'Effect: The Moves Selfdestruct and\r Explosion may not be used when\r a Pokemon with Damp is within\r 20-meters of Selfdestruct or Explosion&rsquo;s\r user. The Ability Aftermath may not be\r activated when a Pokemon with Damp\r is within 20-meters of the Pokemon\r attempting to activate Aftermath.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (21, 'Dark Art', 'Trigger', 'Keyword: Last Chance\r Effect: Dark\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (22, 'Defeatist', 'Trigger', 'Effect: When below 50% HP, this\r Pokemon&rsquo;s Attack and Special Attack\r is set at -3 Combat Stages. It cannot\r be raised or lowered unless the user\r recovers HP above 50% HP.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (23, 'Defiant', 'Static', 'Effect: Whenever the user has a Combat\r Stage lowered, by something other than\r its own Moves or Abilities, the user&rsquo;s\r Attack is raised 2 Combat Stages for\r each Combat Stage it was lowered.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (24, 'Download', 'Static', 'Effect: When the Pokemon with\r Download targets with a damage-dealing\r Move, the target must reveal which of its\r defenses are lower. When the Pokemon\r with Download attacks a foe, they are\r treated as if their Attack is raised 1\r Combat Stage if the target&rsquo;s Defense is\r lower then the target&rsquo;s Special Defense.\r When the Pokemon with Download\r attacks a foe, they are treated as if their\r Special Attack is raised 1 Combat Stage\r if the target&rsquo;s Special Defense is lower\r then the target&rsquo;s Defense.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (25, 'Drizzle', 'Cast &ndash; Hourly', 'Keyword: Sustain, Weather\r Effect: As a Free Action, the Pokemon\r uses the Move Rain Dance. The Rain\r does not go away like normal Rain;\r instead to Sustain, the Pokemon must\r remain out of a Poke Ball and must be\r above 0 HP. The Raining effect can\r be replaced by other major Weather\r conditions.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (26, 'Drought', 'Cast &ndash; Hourly', 'Keyword: Sustain, Weather\r Effect: As a Free Action, the Pokemon\r uses the Move Sunny day. The Sun does\r not go away like normal Sun; instead to\r Sustain, the Pokemon must remain out\r of a Poke Ball and must be above 0 HP.\r The Sunny effect can be replaced by\r other major Weather conditions.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (27, 'Dry Skin', 'Static', 'Effect: While in Sunny Weather, the user\r loses 1/8 of its full HP at the beginning\r of each round. While in Rainy Weather,\r the user gains 1/8 of its full HP at the\r beginning of each round. Fire Type\r Moves made towards the Pokemon with\r Dry Skin deal damage as if the offender\r is 1 Combat Stage higher in whichever\r Attack Stat the Move consults. Water\r Type Moves heal the Pokemon with Dry\r Skin by calculating damage as if Dry\r Skin&rsquo;s user is resistant to Water Moves\r then healing that much HP instead of\r dealing damage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (28, 'Early Bird', 'Static', 'Effect: When making Sleep Checks, the\r Sleep Check counter starts at 11.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (29, 'Effect Spore', 'Trigger', 'Effect: When hit by a melee Move, roll\r 1d20; on a result of 15-16, the attacker\r is Poisoned; on a result of 17-18, the\r attacker is Paralyzed; on a result of 19-\r 20, the attacker falls Asleep.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (70, 'Leaf Guard', 'Trigger', 'Effect: While in Sunny Weather, the user\r is healed of Paralysis, Burns, Poison,\r Freezing or Sleep.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (30, 'Filter', 'Static', 'Effect: When the user is hit by a Super-\r Effective attack, the attack deals 1.5x\r damage instead of x2 damage. If the user\r is hit by a Super-Super-Effective attack,\r the attack deals x3 damage instead of x4\r damage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (31, 'Flame Body', 'Trigger - Daily', 'Effect: When a foe hits the Pokemon\r with Flame Body with a melee Move,\r they become Burned after damaged is\r dealt.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (32, 'Flare Boost', 'Static', 'Effect: When Burned, the user&rsquo;s Special\r Attack is raised by 2 Combat Stages. If\r the user is cured of its Burn, its Special\r Attack is lowered by 2 Combat Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (33, 'Flash Fire', 'Static', 'Effect: The user does not take damage\r from Fire Type Moves and may not be\r Frozen. If the user is hit by a Fire Type\r Move, the user adds 1 bonus STAB to\r the next Fire Type Move they use in the\r encounter.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (34, 'Flower Gift', 'Trigger - Hourly', 'Keyword: Burst\r Effect: If it is Sunny, Flower Gift creates\r a 4-meter Burst. The user and all of\r their allies in Sunny Weather have their\r Attack raised 2 Combat Stages and have\r their Special Defense raised 2 Combat\r Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (35, 'Focus', 'Trigger', 'Keyword: Last Chance\r Effect: Fighting\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (36, 'Forecast', 'Trigger', 'Effect: The user&rsquo;s Type changes\r depending on the Weather the Pokemon\r is in. It changes to Fire Type if it is\r Sunny, Ice Type if it is Hailing, Water\r Type if it is Rainy. It returns to Normal\r Type if it is any other condition. If there\r are multiple Weather Effects on the field,\r choose one type for the user to be that\r corresponds with an existing Weather\r Effect.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (37, 'Forewarn', 'Cast - Hourly', 'Effect: The Move with the highest\r Damage Dice Roll known by the\r targeted foe is revealed. If there is a tie,\r all tied Moves are revealed. The Moves\r revealed must roll +2 to hit during\r Accuracy Checks.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (38, 'Freezing Point', 'Trigger', 'Keyword: Last Chance\r Effect: Ice\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (39, 'Friend Guard', 'Cast - Daily', 'Effect: For the rest of the encounter, any\r adjacent allied Pokemon who would be\r hit by any Moves that have a Damage\r Dice Roll of more than one die including\r STAB or extra effects, the enemy does\r not include STAB in their Damage Dice\r Roll.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (40, 'Frisk', 'Cast - Hourly', 'Effect: The adjacent target reveals what\r item they are holding, if any.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (41, 'Gather', 'Cast - Weekly', 'Effect: 1d2 Unown appear. They are not\r immediately hostile.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (42, 'Gluttony', 'Trigger', 'Effect: When given a consumable item,\r the Pokemon immediately eats it.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (43, 'Guts', 'Trigger - Hourly', 'Effect: When Burned, Poisoned,\r Paralyzed, Frozen or put to Sleep, the\r user&rsquo;s Attack is raised 2 Combat Stages.\r When a Pokemon loses the status, their\r Combat Stages are lowered what they\r raised.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (44, 'Harvest', 'Trigger - At-Will', 'Effect: Whenever the user eats a Berry,\r flip a coin. On heads, the user produce\r another berry of the exact same variety\r as a held item available for use next\r turn. On tails nothing happens. When\r in Sunny Weather, Harvest will always\r activate successfully.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (45, 'Haunt', 'Trigger', 'Keyword: Last Chance\r Effect: Ghost\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (46, 'Healer', 'Cast - Hourly', 'Effect: One adjacent target suffering\r from at least one status affliction is\r instantly cured of all status afflictions.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (47, 'Heat Proof', 'Static', 'Effect: The user halves the damage they\r would take from Fire Type Moves after\r they apply weakness and resistance.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (48, 'Heavy Metal', 'Static', 'Effect: When referring to Weight\r Classes, treat the Pokemon as if it is 2\r Weight Classes higher.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (49, 'Honey Gather', 'Cast - Daily', 'Effect: The user finds Honey if they are\r not holding an item.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (50, 'Huge Power', 'Static', 'Effect: The Pokemon&rsquo;s base attack\r stat is doubled. This may double any\r bonuses from Nature or Vitamins, but\r not bonuses from Features.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (51, 'Hustle', 'Static', 'Effect: The user&rsquo;s Attack is raised 1\r Combat Stages. The user must roll +2\r during Accuracy Checks to hit with\r attack that consult the Attack stat.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (52, 'Hydration', 'Trigger', 'Effect: When in Rainy Weather, the user\r is healed of Paralysis, Burns, Poison,\r Freezing or Sleep.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (53, 'Hyper Cutter', 'Static', 'Effect: The user&rsquo;s Attack Combat Stages\r may not be lowered.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (54, 'Ice Body', 'Trigger', 'Effect: While in Hailing Weather, the\r user gains 1/16 of their full HP at the\r beginning of each of their turns.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (55, 'Illuminate', 'Static', 'Effect: Moves that target the user must\r roll +2 to hit during Accuracy Check.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (56, 'Illusion', 'Trigger - At-Will', 'Effect: Whenever you this Pokemon\r is sent out of its Poke Ball, you may\r choose another Pokemon that you have\r with you. The user now looks exactly\r like that Pokemon from your team until\r the user takes Damage as a result of a\r Move. This change is aesthetic and does\r not affect typing or Moves. You may\r dismiss Illusion whenever you want.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (57, 'Immunity', 'Static', 'Keyword: Immune\r Effect: Poisoning\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (58, 'Imposter', 'Cast - Daily', 'Effect: When Ditto is sent out, it may\r use the Move Transform as a free action.\r If the target of Transform has any\r modified Combat Stages, apply these\r Combat Stages to Ditto. One of the\r target&rsquo;s Abilities is randomly assigned to\r Ditto until Ditto uses Transform again.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (59, 'Infiltrator', 'Static', 'Effect: The user ignores Walls and\r Hazards.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (60, 'Inner Focus', 'Static', 'Keyword: Immune\r Effect: Flinching\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (61, 'Insomnia', 'Static', 'Keyword: Immune\r Effect: Sleep\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (62, 'Intimidate', 'Cast - Hourly', 'Effect: Lower one target&rsquo;s Attack 1\r Combat Stage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (63, 'Iron Barbs', 'Static', 'Effect: When hit by a Melee Ranged\r Move, the attacking foe loses 1/8 of\r their full HP. Do not apply weakness or\r resistance. Do not apply stats.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (64, 'Iron Fist', 'Static', 'Effect: Bullet Punch, Comet\r Punch, Dizzy Punch, Drain Punch,\r Dynamicpunch, Fire Punch, Meteor\r Mash, Shadow Punch, Sucker Punch,\r Ice Punch, Mega Punch, Sky Uppercut,\r Thunderpunch, Focus Punch, and\r Hammer Arm deal an additional 1 STAB\r when the Pokemon with Iron Fist uses\r the Move as an attack.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (65, 'Justified', 'Trigger - At-Will', 'Effect: When hit by a damaging Dark\r Type Move, the user may raise its Attack\r 1 Combat Stage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (66, 'Keen Eye', 'Static', 'Effect: The Pokemon cannot have its\r Accuracy Checks negatively affected\r by anything except Defense, Special\r Defense or Speed stats.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (67, 'Klutz', 'Static', 'Effect: The Pokemon with Klutz\r may drop held items, at-will, as a\r Free Action, even if they have Status\r Afflictions. The Pokemon may also hold\r an item, and ignore any effects the item\r has.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (68, 'Landslide', 'Trigger', 'Keyword: Last Chance\r Effect: Ground\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (69, 'Last Chance', 'Trigger', 'Keyword: Last Chance\r Effect: Normal\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (71, 'Levitate', 'Static', 'Effect: The Pokemon is immune to\r Ground Type Moves.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (72, 'Light Metal', 'Static', 'Effect: When referring to Weight\r Classes, treat the Pokemon as if it is 2\r Weight Classes lower.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (73, 'Lightningrod', 'Static', 'Effect: If any other Pokemon within\r 25-meters uses a Ranged Electric\r Type Move, the Move is drawn to the\r Pokemon with Lightning Rod without\r fail, and it cannot miss. This negates\r Lock-On or Mind Reader. This Pokemon\r is immune to damage and effects from\r Electric Moves, and each time they are\r hit by an Electric Move, the Pokemon&rsquo;s\r Special Attack is raised 1 Combat Stage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (74, 'Limber', 'Static', 'Keyword: Immune\r Effect: Paralysis\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (75, 'Liquid Ooze', 'Static', 'Effect: When the Pokemon with Liquid\r Ooze is damaged or looses life as a\r result of Absorb, Drain Punch, Giga\r Drain, Horn Leech, Leech Life, Leech\r Seed or Mega Drain, the Pokemon using\r one of the above Moves lose life instead\r of gaining life as described per Move.\r Do not apply weakness or resistance. Do\r not apply stats.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (76, 'Mach Speed', 'Trigger', 'Keyword: Last Chance\r Effect: Flying\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (77, 'Magic Bounce', 'Trigger - Hourly', 'Effect: When the user is hit by a Melee\r - No Damage or Ranged - No Damage\r Move, it may reflect the Move back to\r the offender. This Ability may be used\r to change the placement of any Hazards\r being set within 10 meters of the user as\r well.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (78, 'Magic Guard', 'Static', 'Effect: Whenever the user would lose\r HP or take damage that isn&rsquo;t a result of a\r Damage Dice Roll the user does not lose\r HP or take Damage. This includes, but\r is not limited to, Weather, Leech Seed,\r Afflictions, Traps, Recoil, etc.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (79, 'Magma Armor', 'Static', 'Keyword: Immune\r Effect: Freezing\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (80, 'Magnet Pull', 'Cast - Hourly', 'Effect: Target Steel Type pokemon\r may not move more then 20-meters\r away from the user, or target Steel Type\r pokemon may not move closer then\r 20-meters to the user.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (81, 'Marvel Scale', 'Static', 'Effect: When Asleep, Paralyzed, Burned,\r Frozen or Poisoned, Marvel Scale raises\r the user&rsquo;s Special Defense 2 Combat\r Stages and raises the user&rsquo;s Defense\r 2 Combat Stages. The Combat Stages\r return to normal if the user is cured of\r their status affliction.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (82, 'Mind Mold', 'Trigger', 'Keyword: Last Chance\r Effect: Psychic\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (83, 'Minus', 'Static', 'Effect: When an ally with the Ability\r Plus is within 10 meters, they are treated\r as if their Special Attack is raised 2\r Combat Stages. The ally with Plus can\r only have one Minus Ability applied to\r its Special Attack.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (84, 'Mold Breaker', 'Cast - Hourly', 'Effect: The target&rsquo;s Ability is disabled,\r it cannot be used until the end of the\r encounter.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (85, 'Moody', 'Cast - Required on first turn of an', 'Encounter.\r Effect: Cast Moody again in 1d4+1\r rounds. Roll 1d6; on 1, re-roll; on 2,\r raise the user&rsquo;s Attack 2 Combat Stages;\r on 3, raise the user&rsquo;s Defense 2 Combat\r Stages; on 4, raise the user&rsquo;s Special\r Attack 2 Combat Stages; on 5, raise the\r user&rsquo;s Special Defense 2 Combat Stages;\r on 6, raise the user&rsquo;s Speed 2 Combat\r Stages. Then roll 1d6; on 1, re-roll; on\r 2, lower the user&rsquo;s Attack 1 Combat\r Stages; on 3, lower the user&rsquo;s Defense\r 1 Combat Stages; on 4, lower the user&rsquo;s\r Special Attack 1 Combat Stages; on\r 5, lower the user&rsquo;s Special Defense 1\r Combat Stages; on 6, lower the user&rsquo;s\r Speed 1 Combat Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (86, 'Motor Drive', 'Static', 'Effect: The pokemon is immune to\r damage and the effects of Electric Type\r Moves. Whenever an Electric Type\r Move hits the pokemon, raise their\r Speed 1 Combat Stage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (87, 'Mountain Peak', 'Trigger', 'Keyword: Last Chance\r Effect: Rock\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (88, 'Moxie', 'Static', 'Effect: Whenever a user&rsquo;s Move causes\r a target to faint, it may raise its Attack\r Combat Stage by 1.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (89, 'Multiscale', 'Static', 'Effect: When at full HP, when taking\r damage from a Move, half the total\r damage before applying weakness\r and resistance, before applying your\r Defenses.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (90, 'Multitype', 'Cast - At Will', 'Effect: Arceus changes its Elemental\r Type to any of the Elemental Types.\r Multitype cannot be copied or disabled.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (91, 'Mummy', 'Static', 'Effect: Whenever the user is a Legal\r Target of a Melee Range Move, the\r offender replaces all of its Abilities with\r Mummy for 1d6+2 rounds.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (92, 'Natural Cure', 'Cast - Hourly', 'Effect: The Pokemon is cured of\r Paralysis, Poisoning, Burns, Freezing\r and Sleep when returned to its Poke\r Ball.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (93, 'No Guard', 'Cast - At Will', 'Effect: Once used, No Guard is in effect\r until the end of the Encounter. All\r Moves you perform cannot miss and all\r Moves that target you cannot miss.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (94, 'Normalize', 'Cast - At Will', 'Effect: Once used, Normalize is in\r\n effect until the end of the Encounter.\r\n All Moves performed by the Pokemon\r\n are considered Typeless instead of\r\n whatever Type they normally are.\r\n');
INSERT INTO pokemondata2.pokemon_abilities VALUES (95, 'Oblivious', 'Static', 'Keyword: Immune\r Effect: Infatuation.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (96, 'Overcharge', 'Trigger', 'Keyword: Last Chance\r Effect: Electric\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (97, 'Overcoat', 'Static', 'Effect: The user does not take damage\r from any Weather that would normally\r cause it to take damage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (98, 'Overgrow', 'Trigger', 'Keyword: Last Chance\r Effect: Grass\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (99, 'Own Tempo', 'Static', 'Keyword: Immune\r Effect: Confusion\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (100, 'Pickpocket', 'Trigger - Daily', 'Effect: When the user hits an opponent\r that has a Held Item with a Melee\r Move, the user takes that item if it is not\r holding any.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (101, 'Pickup', 'Cast - Daily', 'Keyword: Pickup\r Effect: You may use Pickup at the end\r of any encounter. Roll 1d20, consult the\r Pickup keyword to figure out what you\r find.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (102, 'Plus', 'Static', 'Effect: When an ally with the Ability\r Minus is within 10 meters, they are\r treated as if their Special Attack is raised\r 2 Combat Stages. The ally with Minus\r can only have one Plus Ability applied\r to its Special Attack.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (103, 'Poison Heal', 'Static', 'Effect: When Poisoned or Badly\r Poisoned, the pokemon gains 1/8 of its\r full HP each turn instead of losing any\r HP. The pokemon does not have any\r Combat Stages lowered as a result of\r being Poisoned.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (104, 'Poison Point', 'Trigger - Daily', 'Effect: When hit by a melee Move, the\r Pokemon who attacked Poison Point&rsquo;s\r user is Poisoned.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (105, 'Poison Touch', 'Static', 'Effect: The Pokemon&rsquo;s Moves with a\r Damage Dice Roll that use the Attack\r Stat, Poison Legal Targets on 15-20. If\r the Move already Poisons on a different\r Accuracy Check, replace it with 15-20.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (106, 'Prankster', 'Cast - Daily', 'Effect: For the remainder of the\r encounter, any Ranged - No Damage,\r Melee - No Damage, Self - No Damage\r or Field - No Damage Moves the user\r knows gain the keyword Interrupt.\r Prankster may not be used with Moves\r that set a Legal Target&rsquo;s HP to 0.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (107, 'Pressure', 'Cast - Daily', 'Effect: When this Ability is activated,\r all enemies have their Moves set to their\r original frequency if they were able to\r be used more frequently. In addition, At-\r Will moves are now EOT.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (108, 'Pure Blooded', 'Trigger', 'Keyword: Last Chance\r Effect: Dragon\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (109, 'Pure Power', 'Static', 'Effect: The Pokemon&rsquo;s base Attack\r Stat is doubled. This may double any\r bonuses from Nature or Vitamins, but\r not bonuses from Features.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (110, 'Quick Feet', 'Static', 'Effect: When Poisoned, Burned, Frozen\r or put to Sleep, the user&rsquo;s Speed is raised\r 2 Combat Stages. When Paralyzed, the\r user&rsquo;s Speed is raised 4 Combat Stages.\r When a Pokemon loses the status, their\r Combat Stages are lowered what they\r raised.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (111, 'Rain Dish', 'Trigger', 'Effect: While in Rainy Weather, the\r user gains 1/16 of their full HP at the\r beginning of each of their turns.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (112, 'Rattled', 'Trigger', 'Effect: When hit by Bug, Dark, or Ghost\r Type Move, the user may raise its Speed\r 1 Combat Stage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (113, 'Reckless', 'Static', 'Effect: Submission, Double-Edge, Take\r Down, Jump Kick, Hi Jump Kick, Volt\r Tackle, Wood Hammer, Flare Blitz,\r Brave Bird and Head Smash deal an\r additional 2 STAB when the Pokemon\r with Reckless uses the Move as an\r attack.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (114, 'Regenerator', 'Cast - Hourly', 'Effect: The user instantly heals 1/4th of\r its max HP.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (115, 'Rivalry', 'Static', 'Effect: When battling a same gendered\r foe, the user may raise their Attack 2\r Combat stages. Rivalry may only be\r only applied once per Encounter.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (116, 'Rock Head', 'Static', 'Effect: When the Pokemon uses Volt\r Tackle, Wood Hammer, Submission,\r Take Down, Brave Bird, Double-Edge,\r Flare Blitz, Head Smash, Jump Kick or\r Hi Jump Kick they do not lose any HP\r as a result of the Move&rsquo;s effect.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (117, 'Rough Skin', 'Static', 'Effect: When hit by a Melee Ranged\r Move, the attacking foe loses 1/8 of\r their full HP. Do not apply weakness or\r resistance. Do not apply stats.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (118, 'Run Away', 'Cast - Daily', 'Effect: The Pokemon escapes an\r encounter without fail. It can escape\r Traps. If Run Away&rsquo;s user can hold\r another Pokemon or their trainer, they\r are freed from the encounter as well.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (119, 'Sand Force', 'Trigger - Daily', 'Effect: While in Sandstorming Weather,\r the user may activate Sand Force until\r the end of an encounter. While active,\r Sand Force makes the user immune to\r damage from Sandstorms and the user\r deals an additional 2 STAB with Rock,\r Steel and Ground Moves regardless of\r the user&rsquo;s Type.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (120, 'Sand Rush', 'Trigger - Daily', 'Effect: While in Sandstorming Weather,\r the user may activate Sand Rush until\r the end of an encounter. While active,\r Sand Rush makes the user immune to\r damage from Sandstorms and its Speed\r stat is raised 4 Combat Stages. Do not\r add extra evasion to the user rasiing\r Combat Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (121, 'Sand Stream', 'Cast - Daily', 'Keyword: Sustain, Weather\r Effect: As a Free Action, the Pokemon\r uses the Move Sandstorm. The\r Sandstorm does not go away like\r normal Sandstorm; instead to Sustain,\r the Pokemon must remain out of a\r Poke Ball and must be above 0 HP. The\r Sandstorming effect can be replaced by\r other major Weather conditions.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (122, 'Sand Veil', 'Cast - Hourly', 'Keyword: Sustain\r Effect: Sand Veil may only be activated\r while in Sandstorming Weather. The\r Pokemon creates a pocket of Clear\r Weather around itself and any other\r targets it wants to that is less then\r 15-meters away within the Sandstorm.\r These are Sand Bubbles. Any Move that\r tries to target into a Sand Bubble must\r roll +2 to hit during Accuracy Check. To\r Sustain, the Pokemon must remain out\r of a Poke Ball and must be above 0 HP.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (123, 'Sap Sipper', 'Static', 'Effect: The user does not take damage\r from Grass Type Moves. If a Grass Type\r Move hits the user, the user may raise its\r Attack 1 Combat Stage up to once per\r turn.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (124, 'Scrappy', 'Static', 'Effect: Moves the Pokemon uses against\r Ghost Type foes can always hit them.\r Do not apply extra weaknesses or\r resistances. Do not apply Immunities.\r Count Moves those Ghost Type foes\r would usually be Immune to as Neutral\r Damaging Moves.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (125, 'Serene Grace', 'Static', 'Effect: When a Move&rsquo;s effect has\r something that activates during\r Accuracy Check, but only if you roll\r high enough, all of those checks&rsquo;\r requirements to activate are reduced by\r 3. This does not apply to Critical Hits.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (126, 'Shadow Tag', 'Cast - Daily', 'Effect: Once adjacent to the target, they\r are Trapped. They may still Shift, but\r cannot Shift more then 20-meters from\r Shadow Tag&rsquo;s user.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (127, 'Shed Skin', 'Cast - Hourly', 'Effect: The Pokemon is cured of\r Paralysis, Freezing, Burns, Poison, and\r Sleep.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (128, 'Sheer Force', 'Cast - Daily', 'Effect: Once used, Sheer Force is in\r effect until the end of the Encounter.\r Whenever you use a move that has a\r secondary effect, which activates during\r Accuracy Check, that effect is ignored.\r If an effect has been ignored, that attack\r now deals an additional 2 STAB.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (129, 'Shell Armor', 'Static', 'Keyword: Immune\r Effect: Critical Hits\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (130, 'Shield Dust', 'Static', 'Effect: The effects of damage dealing\r Moves that target the Pokemon with\r Shield Dust are disabled.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (131, 'Simple', 'Static', 'Effect: When the Pokemon&rsquo;s Combat\r Stages are altered, double the amount\r of Combat Stages they are raised or\r lowered.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (132, 'Skill Link', 'Static', 'Effect: The Pokemon&rsquo;s Moves with the\r keyword Scatter can be used for their\r maximum amounts of time, even if one\r of the first attempts misses.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (133, 'Slow Start', 'Static', 'Effect: For 3 rounds, the Pokemon&rsquo;s\r Speed and Attack Stats are halved.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (134, 'Sniper', 'Static', 'Effect: When the Pokemon gets a\r Critical Hit, add an additional Damage\r Dice Roll. This includes any base\r damage in the Damage Dice Roll.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (135, 'Snow Cloak', 'Cast - Hourly', 'Keyword: Sustain\r Effect: Snow Cloak may only be\r activated while in Hailing Weather.\r The Pokemon creates a pocket of Clear\r Weather around itself and any other\r targets it wants to that is less then\r 15-meters away within the Hail. These\r are Snow Bubbles. Any Move that tries\r to target into a Snow Bubble must roll\r +2 to hit during Accuracy Check. To\r Sustain, the Pokemon must remain out\r of a Poke Ball and must be above 0 HP.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (136, 'Snow Warning', 'Cast - Hourly', 'Keyword: Sustain, Weather\r Effect: As a Free Action, the Pokemon\r uses the Move Hail.The Hail does not\r go away like normal Hail; instead to\r Sustain, the pokemon must remain out\r of a Poke Ball and must be above 0 HP.\r The Hailing effect can be replaced by\r other major Weather conditions.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (137, 'Solar Power', 'Trigger', 'Effect: While in Sunny Weather, the\r Pokemon loses 1/8 of its full HP on its\r turn. When Sunny, its Special Attack\r Stat is increased by 2 Combat Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (138, 'Solid Rock', 'Static', 'Effect: Super Effective Moves that target\r the Pokemon are only regularly effective\r and Super Super Effective Moves that\r target the Pokemon are only Super\r Effective.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (139, 'Soundproof', 'Static', 'Effect: The Pokemon is immune to\r damage caused by and the effects of\r the Moves Bug Buzz, Chatter, Echoed\r Voice, Grasswhistle, Growl, Heal Bell,\r Hyper Voice, Metal Sound, Perish\r Song, Relic Song, Roar, Roar of Time,\r Screech, Sing, Snore, Supersonic and\r Uproar.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (140, 'Speed Boost', 'Cast - Hourly', 'Effect: The Pokemon&rsquo;s Speed is raised 1\r Combat Stage on each of its turns.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (141, 'Static', 'Trigger - Daily', 'Effect: When a foe hits the Pokemon\r with Static with a melee Move, they\r become Paralyzed after damage is dealt.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (142, 'Stall', 'Static', 'Effect: In a round&rsquo;s queue, a Pokemon\r with Stall is always last. If a Pokemon\r goes to the end of the queue, the\r Pokemon with Stall is still the last to\r move.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (143, 'Steadfast', 'Trigger', 'Effect: When Flinched, the Pokemon&rsquo;s\r Speed is raised 1 Combat Stage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (144, 'Stench', 'Static', 'Effect: The Pokemon&rsquo;s Moves which\r deal damage Flinch Legal Targets on\r 19-20. If a move already has a chance\r of Flinching foes, Stench lowers the\r number needed to roll in order to Flinch\r by -2.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (145, 'Sticky Hold', 'Static', 'Effect: The Pokemon&rsquo;s held items\r cannot be stolen, switched, destroyed or\r dropped.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (146, 'Storm Drain', 'Static', 'Effect: If any other Pokemon within\r 25-meters uses a Ranged Water Type\r Move, the Move is drawn to the\r Pokemon with Storm Drain without fail,\r and it cannot miss. This negates Lock-\r On or Mind Reader. This Pokemon is\r immune to damage and effects from\r Water Moves, and each time they are\r hit by an Water Move, the Pokemon&rsquo;s\r Special Attack is raised 1 Combat Stage.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (147, 'Sturdy', 'Static', 'Effect: The Pokemon is immune to the\r Moves Sheer Cold, Guillotine, Horn\r Drill and Fissure. If any attack would\r lower this Pokemon to 0 HP or less from\r full HP, instead the Pokemon&rsquo;s HP is set\r to 1.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (148, 'Suction Cups', 'Static', 'Effect: The Pokemon is immune to\r the Moves Roar and Whirlwind. The\r Pokemon is immune to Push effects.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (149, 'Super Luck', 'Static', 'Effect: The Pokemon&rsquo;s Moves are\r Critical Hits on 18-20. If a Move already\r has an extended Critical Hit range,\r Super Luck extends that range by -2.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (150, 'Swarm', 'Trigger', 'Keyword: Last Chance\r Effect: Bug\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (151, 'Swift Swim', 'Trigger - Hourly', 'Effect: While in Rainy Weather, the\r Speed stat of the Pokemon is raised 4\r Combat Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (152, 'Synchronize', 'Trigger - Hourly', 'Effect: When a foe Paralyzes, Freezes,\r Burns, Poisons, or puts the pokemon\r with Synchronize to Sleep, the foe\r is given the same Status effect they\r inflicted.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (153, 'Tangled Feet', 'Trigger', 'Effect: While Confused, the Pokemon&rsquo;s\r foes must roll +3 during Accuracy\r Check to hit the pokemon with Tangled\r Feet.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (154, 'Technician', 'Static', 'Effect: Moves with the Damage Dice\r Rolls whose Max Damage are less\r than 30 add an additional 2d10 to their\r Damage Dice Roll. Technician may only\r be applied once when used with a Move\r that has Scatter.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (155, 'Telepathy', 'Static', 'Effect: Whenever the Pokemon is a\r Legal Target, if the offender whose\r Move is hitting the Pokemon does not\r want the Pokemon to be considered a\r Legal Target; it is not.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (156, 'Teravolt', 'Cast - Hourly', 'Effect: The Target&rsquo;s Abilities are\r Disabled. They cannot be used until the\r end of the encounter.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (157, 'Thick Fat', 'Static', 'Effect: The Pokemon is treated as if they\r are Resistant to Fire Type Moves and Ice\r Type Moves.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (158, 'Tinted Lens', 'Static', 'Effect: The user&rsquo;s Resisted Moves\r instead deal Neutral Damage. The user&rsquo;s\r Doubly Resisted Moves are instead\r Resisted.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (159, 'Torrent', 'Trigger', 'Keyword: Last Chance\r Effect: Water\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (160, 'Toxic Boost', 'Static', 'Effect: When Poisoned or Badly\r Poisoned, the user&rsquo;s Attack is raised by 2\r Combat Stages. If the user is cured of its\r Poisoning, its Attack stat is lowered by 2\r Combat Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (161, 'Trace', 'Cast - Hourly', 'Keyword: Sustain\r Effect: The Pokemon gains the Ability\r of a target within 10-meters of the\r Pokemon with Trace. To sustain, the\r Pokemon must remain out of a Poke\r Ball and above 0 HP.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (162, 'Truant', 'Static', 'Effect: Roll 1d20 when a Pokemon with\r Truant tries to Shift and/or use a Move;\r on 1-8, the Pokemon does nothing;\r on 9-20, the Pokemon uses its turn\r normally.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (163, 'Turboblaze', 'Cast - Hourly', 'Effect: The Target&rsquo;s Abilities are\r Disabled. They cannot be used until the\r end of the encounter.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (164, 'Unaware', 'Static', 'Effect: When the pokemon is attacking\r or being attacked, it ignores all Combat\r Stages on the relevant target or attacker\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (165, 'Unbreakable', 'Trigger', 'Keywords: Last Chance\r Effect: Steel\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (166, 'Unburden', 'Trigger', 'Effect: After consuming a held item, the\r Pokemon&rsquo;s Speed is raised 2 Combat\r Stages.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (167, 'Unnerve', 'Static', 'Effect: During battle, as long as you\r have a line of sight to a foe, that foe may\r not eat or drink anything. This includes\r berries, vitamins, or anything else that\r must be eaten to affect the foe.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (168, 'Venom', 'Trigger', 'Keywords: Last Chance\r Effect: Poison\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (169, 'Victory Star', 'Static', 'Effect: Any allied Pokemon in the\r encounter will require -2 to hit during\r any Accuracy Check.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (170, 'Vital Spirit', 'Static', 'Keywords: Immune\r Effect: Sleep\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (171, 'Volt Absorb', 'Trigger', 'Effect: After calculating damage that\r would be dealt from an Electric Type\r Move that hit the Pokemon, heal the\r Pokemon half of what it would have\r been dealt, instead of damaging the\r Pokemon. Do this before applying\r Defense but after applying weakness and\r resistance.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (172, 'Water Absorb', 'Trigger', 'Effect: After calculating damage that\r would be dealt from an Water Type\r Move that hit the Pokemon, heal the\r Pokemon half of what it would have\r been dealt instead of damaging the\r Pokemon. Do this before applying\r Defense but after applying weakness and\r resistance.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (173, 'Water Veil', 'Static', 'Keywords: Immune\r Effect: Burns\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (174, 'Weak Armor', 'Trigger', 'Effect: Whenever the user is hit by an\r attack that consults the user&rsquo;s Defense\r stat, the user may lower its Defense\r Combat Stage one level in order to raise\r its Speed Combat Stage one level.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (175, 'White Smoke', 'Static', 'Effect: The user&rsquo;s Combat Stages may\r not be lowered.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (176, 'Wonder Guard', 'Static', 'Effect: Only damaging Moves that are\r Super-Effective hit the Pokemon with\r Wonder Guard, all other moves always\r deal 0 damage. Wonder Guard does not\r work if the Pokemon who has it has no\r weaknesses. Only Shedinja and Arceus\r may ever have the ability Wonder\r Guard. Wonder Guard loses its effect if\r the user has no weaknesses.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (177, 'Wonder Skin', 'Static', 'Effect: Whenever a Ranged - No\r Damage or Melee - No Damage move\r that causes Paralysis, Poisoning, Bad\r Poisoning, a Burn, Sleep, Confusion,\r Attraction, Disable, or any other major\r or minor status affliction is used against\r this Pokemon and the Move successfully\r hits, flip a coin. On heads, this Pokemon\r ignores the affliction it would have\r received; on tails the Pokemon is hit as\r usual.\r');
INSERT INTO pokemondata2.pokemon_abilities VALUES (178, 'Zen Mode', 'Cast - At-Will', 'Effect: Keep two sets of Base Stats for\r Darmanitan, the first set of Base Stats\r are its normal stats while the second will\r be referred to during Zen Mode. The\r HP Stat for both sets of Base Stats must\r be the same. If Darmanitan has its Base\r Stats altered in any way, both sets of\r Base Stats are affected. As a free action,\r Darmanitan may activate Zen Mode\r if it is at less than 50% of its full HP.\r Darmanitan may change back from Zen\r Mode as a free action. Darmanitan may\r switch from one form to another once\r per encounter.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (256, 'Stance Change', 'Triggered', 'Using King''s Shield causes Aegislash to switch to Shield Forme. Using any ability that deals damage causes Aegislash to switch to Blade Forme. Moves that call other moves will not change Aegislash''s Forme.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (257, 'Bulletproof', 'Trigger', 'The user is immune to: Acid Spray, Aura Sphere, Barrage, Bullet Seed, Egg Bomb, Electro Ball, Energy Ball, Focus Blast, Gyro Ball, Ice Ball, Magnet Bomb, Mist Ball, Mud Bomb, Octazooka, Rock Wrecker, Searing Shot, Seed Bomb, Shadow Ball, Sludge Bomb, Weather Ball, Zap Cannon.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (258, 'Gale Wings', 'Static', 'Your Flying Type moves are treated as if they have Interrupt.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (259, 'Strong Jaw', 'Static', 'Ice Fang, Thunder Fang, Fire Fang, Poison Fang, Bite, Crunch, and Dragonbite do an extra 25% damage, calculated after attack and before defense.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (260, 'Cloak of Darkness', 'Static', 'The user does not take damage from Dark type moves and cannot be infested. If the user is hit by a Dark type move, the user adds +1/2 STAB to the next Dark type move they use in the encounter');
INSERT INTO pokemondata2.pokemon_abilities VALUES (261, 'Gale Wings', 'Static', 'Flying-type moves gain the keyword Interrupt');
INSERT INTO pokemondata2.pokemon_abilities VALUES (262, 'Protean', 'Trigger', 'When the user performs a move, the user''s type becomes the type of that move');
INSERT INTO pokemondata2.pokemon_abilities VALUES (263, 'Aerilate', 'Static', 'Normal moves become flying-type and gain 20% damage, after attack and before defense.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (264, 'Refrigerate', 'Static', 'Normal moves become ice-type and gain 20% damage, after attack and before defense.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (265, 'Pixillate', 'Static', 'Normal moves become fairy-type and gain 20% damage, after attack and before defense.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (266, 'Competitive', 'Trigger', 'When an opponent''s move causes a stat to be lowered, raise the user''s Sp. Attack 2 stages.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (267, 'Magician', 'Trigger', 'When the uses hits with a move, it may steal the foe''s held item. This does not work if the user is already holding an item.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (268, 'Sweet Veil', 'Static', 'Allied pokemon within 10 meters of the user are prevented from falling asleep');
INSERT INTO pokemondata2.pokemon_abilities VALUES (269, 'Symbiosis', 'Cast - Hourly', 'Target allied pokemon within 10 meters of the user is given the user''s held item');
INSERT INTO pokemondata2.pokemon_abilities VALUES (270, 'Tough Claws', 'Static', 'Moves that make direct contact are powered up by 20%, after attack and before defense');
INSERT INTO pokemondata2.pokemon_abilities VALUES (271, 'Gather Flabebe', 'Daily', '1d2 Flabebe appear. They are not immediately hostile.');
INSERT INTO pokemondata2.pokemon_abilities VALUES (273, 'Cheek Pouch', 'Static', 'Restores 1/5 of the Pokemon''s missing HP whenever a berry is eaten.');


--
-- Data for Name: pokemon_capabilities; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.pokemon_capabilities VALUES (1, 'Jump', 'How high a Pokemon can jump in the air.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (2, 'Power', 'How much a Pokemon can carry.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (3, 'Intelligence', 'How smart a Pokemon is.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (4, 'Alluring', 'Pokemon who are Alluring smell very pleasant. They may attract wild Pokemon easily. Attention is commonly turned toward fragrant, Alluring Pokemon by wilds.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (5, 'Amorphous', 'Amorphous Pokemon have an inconsistent shape. They can flatten and reform themselves like water. They can stretch out their body material and condense themselves as well. By doing this, a Pokemon can access places others couldnâ€™t, or bypass a door or tw');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (6, 'Aura', 'Pokemon who can use Aura are blessed with a great power. Pokemon who can use Aura can project their thoughts to Pokemon and Humans. Pokemon with the Aura Capability can also read a personâ€™s Aura, but cannot read a personâ€™s thoughts. Everything has an');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (7, 'Blender', 'A Pokemon with Blender is an advanced Stealth user. While Shifting, unless they purposely want to, Blender Pokemon do not make any noise. Unless a Pokemon with Blender has used a Ranged Move during the current round or the round previous, Ranged Moves may');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (8, 'Bloom', 'When a Pokemon with Bloom, Cherrim, is in Sunny weather it transforms; changing its appearance from the closed bud, purple-petal form into the pink open flower form.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (9, 'Chilled', 'A Pokemon with the Chilled Capability is always cold.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (10, 'Dream Smoke', 'A Pokemon who has the Dream Smoke Capability can produce Dream Smoke. Dream Smoke is harvested for Dream Doctor who can manipulate a pokemonâ€™s mind with the use of Dream Smoke and machinery.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (11, 'Egg Warmer', 'A pokemon with Egg Warmer may heat up an egg once per 24 hours. Roll 1d10; on a result of 1, nothing happens; on a result of 2-10, the eggâ€™s hatch time is reduced, in hours, by the number rolled.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (12, 'Firestarter', 'A Pokemon who has the Firestarter Capability can produce flames. They can control how lightly or powerfully they produce the fire, creates puffs of fire the size of a lighter or a large burst of fire capable on engulfing a tree.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (13, 'Fountain', 'A Pokemon who has the Fountain Capability can produce freshwater. They can control how lightly or powerfully they produce the water, sprinkling water or forcefully shooting water with the strength of a fire hose.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (14, 'Fragile', 'Archen and Archeopsâ€™ default Ability is always Defeatist.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (15, 'Freezer', 'When a Pokemon has the Freezer Capability, they can target an area on the ground and turn it into Icy Terrain in place of their Move during their turn, EOT. A 1d20 roll determines the amount of ground turned into Icy Terrain. On a check below 5, only 1 sq');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (16, 'Gilled', 'A Gilled Pokemon can breath underwater. It never needs to come up for air and can remain underwater for as long as it wants to.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (17, 'Glow', 'A Pokemon with the Glow Capability can emit light from a part of its body. Depending on the variety of wild Pokemon nearby, it might attract Pokemon or ward them away.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (18, 'Groundshaper', 'A Pokemon with the Groundshaper Capability can transform the terrain around them to create Rough Terrain or flatten out Rough Terrain to create Basic Terrain. In place of the Pokemonâ€™s Move during their turn they can change a 1 meter radius around them,');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (19, 'Guster', 'The Guster can create bursts of wind. The power can vary from a light breeze to a powerful burst of air capable of lifting light objects into the air or providing lift for a chute.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (20, 'Heater', 'A Pokemon with the Heater Capability is always warm.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (21, 'Icestep', 'Pokemon with the Icestep Capability treat Icy or Snowy terrain as Basic Terrain.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (22, 'Inflatable', 'A Pokemon with the capability Inflatable can expand its size up to 125% of its normal size. While Inflated, a Pokemon does not change its weight. To hit an Inflated Pokemon, you must roll -3 during Accuracy Check. While Inflated, a Pokemon become Blocking');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (23, 'Invisibility', 'Pokemon who have the Invisibility Capability can turn invisible. Pokemon may not perform Moves while invisible. While invisible, you must roll +4 during Accuracy Checks to hit the Pokemon. When a Pokemon turns invisible, they can only remain invisible for');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (24, 'Juicer', 'When Shuckle is holding a berry, after 24 hours of that Berry going unused, it will be juiced and stored in the Shuckleâ€™s shell. The Berry Juice is a held item that can be taken from the shuckle and given to another pokemon. It will have all of the prop');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (25, 'Magnetic', 'Magnetic Pokemon can lightly manipulate magnetic fields. With this, they can repel iron and/or steel or attract iron and/or steel, holding it too their body or pushing it away. Through this magnetic manipulation, they can also feel magnetic fields and dis');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (26, 'Materializer', 'The Materializer can form rock, normal sedimentary rock, from nothing. It can be anywhere from the size of a pebble to the size of a human sized boulder. For every 2.5 grams, or 5 pounds, of rock formed the Pokemon loses 2 HP. The Rock is formed adjacent');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (27, 'Mind Lock', 'Pokemon who have the Capability Mind Lock cannot have their minds read.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (28, 'Pack Mon', 'A Pokemon with Pack Mon instinctively belong to a rigid pack structure, and are naturally inclined to the top of that structure. Wild Pokemon that are of this pokemonâ€™s unevolved form will instantly be considered â€œHelpfulâ€ to you and your group and');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (29, 'Phasing', 'A Pokemon with Phasing may Shift through Hindering Terrain without their Speed Capabilities being affected. They can turn intangible and move through solid walls or other Pokemon. A Pokemon can remain intangible with Phasing for up to 30 seconds.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (30, 'Reach', 'A Pokemon with Reach may make Melee attacks from up to 5 meters, or 5 spaces, away from the target. Pokemon with reach are either really large or have a stretchy limb with which they can stike foes from a distance.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (31, 'Shrinkable', 'A Pokemon with the capability Shrinkable can shrink its size up to 25% of its normal size. While Shrunken, a Pokemon may not perform any Moves. While Shrunken, a Pokemon does not change its weight. To hit a Shrunken Pokemon, you must roll +3 during Accura');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (32, 'Sinker', 'Sinker means the Pokemon cannot swim, or move in water. For every round of an encounter the Pokemon is in water that is deep enough for them to stand submerged in, or is submerged in they lose 25% of their max HP. If the Pokemon is lowered to -100% HP, ma');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (33, 'Soulless', 'Shedinja is a unique pokemon. Its default Ability will always be Wonder Guard and Shedinjaâ€™s Max HP is always 1. You may not add to a Shedinjaâ€™s HP stat, and Shedinja may not have temporary HP. However, Shedinja never need to make a Death Savingâ€™s T');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (34, 'Sprouter', 'A Pokemon with the Sprouter capability can rapidly influence the growth of plants and flora around them. Over 5 seconds, a Sprouter can grow a plant 1 meter taller or wider than it currently was. Through the use of Sprouter, the Pokemon can also make plan');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (35, 'Stealth', 'A Pokemon with the Stealth Capability are excellent at approaching the enemy for an up close assault. While Shifting, unless they purposely want to, Stealth Pokemon do not make any noise. Unless a Pokemon with Stealth has used a Ranged Move during the cur');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (36, 'Telekinetic', 'Telekinetic Pokemon can move objects with their mind. They can lift things that are lighter then their level multiplied by 5 pounds or 2.5 grams. They can target objects up to X meters away, where X is the pokemonâ€™s level.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (37, 'Telepath', 'A Telepathic Pokemon can read the minds of people and other Pokemon.Telepathic Pokemon can project their thoughts to humans and Pokemon. The Pokemon can only read surface thoughts. The Pokemon cannot read the minds of another Pokemon whose Intelligence is');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (38, 'Threaded', 'If a Pokemon has the Threaded Capability they may replace their turnâ€™s Shift with a Threaded Shift. A Threaded Shift is when a Pokemon targets an object and shoots a strong, thin line of silk, or extends a vine from themselves, and then quickly retracts');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (39, 'Tracker', 'Pokemon with the Capability Tracker have a strong sense of smell that they can use to follow other Pokemon or people. If the Pokemon has smelt whom they want to track in the past day, or one of their personal belongings, they can pursue that prey with a c');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (40, 'Troublesome', 'Slakoth and Slakingâ€™s default Ability is always Truant.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (41, 'Weathershape', 'Castformâ€™s appearance changes with the weather around it. It changes to its orange form in Sunny weather, its blue and grey form in Raining weather and its light blue form when itâ€™s Hailing.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (42, 'Weeble', 'Wobbufett are very limited when it comes to their Move variety. As a result, Wobbufett can use Counter and Mirror Coat as EOT Frequency Moves rather than as Battle Frequency Moves. However, after the first use of Mirror Coat or Counter during an encounter');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (43, 'Wired', 'Wired Pokemon have a special relation to electronic devices. They can enter machines and travel through connected electronics through any cords that connect them instantly. While inside machines, they can read data on the machine on a check of 11, Daily.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (44, 'Zapper', 'Pokemon with the Zapper Capability can produce controlled electricity or send electrical currents through various conductive materials. If an electrical device is capable of being recharged, a Pokemon with Zapper can recharge it to full power on a check o');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (45, 'Overland', 'A Pokemon''s speed while traveling over solid ground.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (46, 'Surface', 'A Pokemon''s speed while traveling on top of water.');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (47, 'Underwater', 'A Pokemon''s speed while traveling through water');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (48, 'Sky', 'A Pokemon''s speed while flying');
INSERT INTO pokemondata2.pokemon_capabilities VALUES (49, 'Burrow', 'A Pokemon''s speed underground.');


--
-- Data for Name: pokemon_held_items; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.pokemon_held_items VALUES (0, 'None', 'This Pokemon isn''t holding anything!');
INSERT INTO pokemondata2.pokemon_held_items VALUES (1, 'Experience Share', 'The Pokemon who holds the Experience Share may have experience given to it at the end of an encounter, regardless of its participation.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (2, 'Damp Rock', 'Increases the duration of Rain Dance by 1d4+1 rounds.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (3, 'Heat Rock', 'Increases the duration of Sunny Day by 1d4+1 rounds.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (4, 'Icy Rock', 'Increases the duration of Hail by 1d4+1 rounds.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (5, 'Smooth Rock', 'Increases the duration of Sandstorm by 1d4+1 rounds.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (6, 'Metronome', 'Every time a move is used consecutively beyond the first use, add 2d6 to its damage dice roll, to a maximum of 10d6.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (7, 'Scope Lense', 'Decreases the minimum roll to Critical Hit by 1.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (8, 'Wide Lense', 'Decreases the AC of all moves by 1. AC cannot go below 2 this way.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (9, 'Choice Band', 'While held, all moves of At-Will or EOT frequency are considered Battle, but may be used regardless of frequency if the same move was used the turn before. The users Attack stat is increased by 50%.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (10, 'Choice Specs', 'While held, all moves of At-Will or EOT frequency are considered Battle, but may be used regardless of frequency if the same move was used the turn before. The users Special Attack stat is increased by 50%.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (11, 'Choice Scarf', 'While held, all moves of At-Will or EOT frequency are considered Battle, but may be used regardless of frequency if the same move was used the turn before. The users Speed stat is increased by 50%.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (12, 'Amulet Coin', 'A shiny coin. Who knows what it does?');
INSERT INTO pokemondata2.pokemon_held_items VALUES (13, 'Kings Rock', 'All moves with damage dice cause the target to Flinch on a 19-20.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (14, 'Rush Token', 'Increase all damage dealt and taken by 20%\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (15, 'Black Belt', 'Whenever the user uses a Fighting type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (16, 'Black Glasses', 'Whenever the user uses a Dark type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (17, 'Charcoal', 'Whenever the user uses a Fire type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (18, 'Dragon Fang', 'Whenever the user uses a Dragon type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (19, 'Hard Stone', 'Whenever the user uses a Rock type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (20, 'Magnet', 'Whenever the user uses an Electric type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (21, 'Metal Coat', 'Whenever the user uses a Steel type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (22, 'Miracle Seed', 'Whenever the user uses a Grass type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (23, 'Mystic Water', 'Whenever the user uses a Water type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (24, 'Never-Melt Ice', 'Whenever the user uses an Ice type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (25, 'Twisted Spoon', 'Whenever the user uses a Psychic type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (26, 'Poison Barb', 'Whenever the user uses a Poison type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (27, 'Sharp Beak', 'Whenever the user uses a Flying type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (28, 'Silk Scarf', 'Whenever the user uses a Normal type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (29, 'Silver Powder', 'Whenever the user uses a Bug type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (30, 'Soft Sand', 'Whenever the user uses a Ground type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (31, 'Spell Tag', 'Whenever the user uses a Ghost type move, it does 10% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (32, 'Draco Plate', 'Whenever the user uses a Dragon type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (33, 'Dread Plate', 'Whenever the user uses a Dark type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (34, 'Earth Plate', 'Whenever the user uses a Ground type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (35, 'Fist Plate', 'Whenever the user uses a Fighting type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (36, 'Flame Plate', 'Whenever the user uses a Fire type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (37, 'Icicle Plate', 'Whenever the user uses an Ice type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (38, 'Insect Plate', 'Whenever the user uses a Bug type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (39, 'Iron Plate', 'Whenever the user uses a Steel type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (40, 'Meadow Plate', 'Whenever the user uses a Grass type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (41, 'Mind Plate', 'Whenever the user uses a Psychic type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (42, 'Pixie Plate', 'Whenever the user uses a Fairy type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (43, 'Sky Plate', 'Whenever the user uses a Flying type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (44, 'Splash Plate', 'Whenever the user uses a Water type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (45, 'Spooky Plate', 'Whenever the user uses a Ghost type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (46, 'Stone Plate', 'Whenever the user uses a Rock type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (47, 'Toxic Plate', 'Whenever the user uses a Poison type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (48, 'Zap Plate', 'Whenever the user uses an Electric type move, it does 20% extra damage (calculated after attack and before defense).');
INSERT INTO pokemondata2.pokemon_held_items VALUES (49, 'Plain Shifter', 'Whenever the user uses a move, it is considered to be Normal type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (50, 'Combust Shifter', 'Whenever the user uses a move, it is considered to be Fire type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (51, 'Chop Shifter', 'Whenever the user uses a move, it is considered to be Fighting type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (52, 'Mist Shifter', 'Whenever the user uses a move, it is considered to be Water type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (53, 'Wing Shifter', 'Whenever the user uses a move, it is considered to be Flying type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (54, 'Leaf Shifter', 'Whenever the user uses a move, it is considered to be Grass type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (55, 'Noxious Shifter', 'Whenever the user uses a move, it is considered to be Poison type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (56, 'Volt Shifter', 'Whenever the user uses a move, it is considered to be Electric type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (57, 'Terra Shifter', 'Whenever the user uses a move, it is considered to be Ground type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (58, 'Cerebral Shifter', 'Whenever the user uses a move, it is considered to be Psychic type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (59, 'Ore Shifter', 'Whenever the user uses a move, it is considered to be Rock type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (60, 'Frost Shifter', 'Whenever the user uses a move, it is considered to be Ice type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (61, 'Insect Shifter', 'Whenever the user uses a move, it is considered to be Bug type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (62, 'Wyvern Shifter', 'Whenever the user uses a move, it is considered to be Dragon type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (63, 'Spectral Shifter', 'Whenever the user uses a move, it is considered to be Ghost type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (64, 'Dusk Shifter', 'Whenever the user uses a move, it is considered to be Dark type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (65, 'Alloy Shifter', 'Whenever the user uses a move, it is considered to be Steel type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (66, 'Fae Shifter', 'Whenever the user uses a move, it is considered to be Fairy type.\r\n');
INSERT INTO pokemondata2.pokemon_held_items VALUES (68, 'Assault Vest', 'Effect: Increases the Special Defense of the holder by 50%. The holder cannot use moves that do not deal damage dice.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (69, 'Blue Scarf', 'Gives the holder one Beauty Contest Die during the Introduction Stage of a Contest.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (70, 'Green Scarf', 'Gives the holder one Smart Contest Die during the Introduction Stage of a Contest.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (71, 'Pink Scarf', 'Gives the holder one Cute Contest Die during the Introduction Stage of a Contest.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (72, 'Red Scarf', 'Gives the holder one Cool Contest Die during the Introduction Stage of a Contest.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (73, 'Yellow Scarf', 'Gives the holder one Tough Contest Die during the Introduction Stage of a Contest.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (74, 'Binding Band', 'When the holder uses a Trapping Move that deals 1d12 per turn while Trapping a target, instead use 1d20 for those rolls.');
INSERT INTO pokemondata2.pokemon_held_items VALUES (75, 'Lax Incense', '+1 to the users Attack, Special Attack and Speed Evasions');
INSERT INTO pokemondata2.pokemon_held_items VALUES (76, 'Shell Bell', 'Moves used by Shell Bell''s holder heal their user for 1/10 of the damage they deal. Shell Bell may only be activated once per day. Once activated, Shell Bell''s effect remains active until the end of the encounter.');


--
-- Data for Name: pokemon_moves; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.pokemon_moves VALUES (214, 'Power Whip', 1, '5d12+18', 'Battle', 5, 0, 'Ranged (10), 1 Target', '*Grants: Threaded', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (1, 'Attack Order', 13, '3d12+14', 'Battle', 2, 0, 'Ranged (10), 1 Target', 'Attack Order is a Critical Hit on 18-20 during Accuracy Check.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (2, 'Bug Bite', 13, '2d10+8', 'EOT', 2, 0, 'Melee, 1 Target', 'If the target has a consumable Held Item, Bug Bite destroys the Item and Bug Bite''s user may use the Item''s effect.', 'Tough', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (3, 'Bug Buzz', 13, '3d12+14', 'Battle', 2, 1, 'Ranged (3), No Target, Burst', 'Bug Buzz creates a 3-meter Burst. Bug Buzz lowers the target''s Special Defense 1 Combat Stage on 19-20 during Accuracy Check.', 'Cute', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (4, 'Defend Order', 13, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Defense 1 Combat Stage and raise the user''s Special Defense 1 Combat Stage.', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (5, 'Fury Cutter', 13, '1d4', 'At-Will', 3, 0, 'Melee, 1 Target', 'If Fury Cutter is used successfully and consecutively on the same target, on the round immediately after the last, use 1d12+6 on the second hit instead, 2d12+12 on the third hit instead, 3d12+18 on the fourth hit instead and 4d12+24 on the fifth hit and any successful hits following the fifth hit instead for Fury Cutter''s Damage Dice Roll.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (6, 'Heal Order', 13, '-', 'Center', 0, 2, 'Self, No Target', 'The user regains HP equal to half of its full HP.', 'Smart', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (7, 'Infestation', 13, '1d12+6', 'Battle', 2, 1, 'Ranged (3)', 'Column 3. All targets hit are infested for 1d4+1 turns (they take 1d12 damage per turn and are trapped).', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (8, 'Leech Life', 13, '1d6+1', 'EOT', 2, 0, 'Melee, 1 Target', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (9, 'Megahorn', 13, '5d12+18', 'Battle', 5, 0, 'Melee, 1 Target, Push', 'The target is Pushed 3-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (10, 'Pin Missile', 13, '1d6+1', 'EOT', 4, 0, 'Ranged (10), 1 Target, Scatter', 'Pin Missile can hit up to 5 times. Once the user misses, they cannot attempt to make another Pin Missile attack on that turn.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (11, 'Quiver Dance', 13, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Special Attack 1 Combat Stage, raise the user''s Special Defense 1 Combat Stage and raise the user''s Speed 1 Combat Stage.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (12, 'Rage Powder', 13, '-', 'Center', 0, 2, 'Ranged (5), No Target, Column, Intercept', 'Rage Powder creates a Column 1 meter wide. All legal targets may only target the user when using a Move until the user is knocked out or switched out. This Effect lasts for one round of combat.', 'Smart', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (13, 'Signal Beam', 13, '3d10+12', 'EOT', 2, 1, 'Ranged (8), 1 Target, Column', 'Signal Beam creates a Column 1 meter wide. Signal Beam confuses the target and any Legal Targets on 19-20 during Accuracy Check.', 'Beauty', 0, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (14, 'Silver Wind', 13, '2d10+8', 'Center', 2, 1, 'Ranged (15), 1 Target, Column, Spirit Surge', 'Silver Wind creates a Column that is 2-meters wide. If you rolled 11-20 during Accuracy Check for Silver Wind, the user has each of its stats raised 1 Combat Stage. If you rolled 16-20 on the Accuracy Roll, all allies in the Column also have each of their stats raised 1 Combat Stage and are not damaged by Silver Wind.', 'Beauty', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (15, 'Spider Web', 13, '-', 'Center', 0, 2, 'Ranged (5), 1 Target, Blast 5, Trap', 'Spider Web creates a 5m meter radius area on the field around the target. Anyone traveling over this area has their Overland capability reduced by 50%. The initial target is Trapped for 1d4+1 turns.', 'Smart', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (16, 'Steamroller', 13, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Pass', 'Steamroller Flinches the target on 15-20 during Accuracy Check. If the target is Small, Steamroller deals an additional 1d10.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (17, 'String Shot', 13, '-', 'At-Will', 3, 2, 'Ranged (6), 1 Target, Column', 'String Shot creates a Column 2-meters wide. All Legal Targets within the Column lower their Speed 1 Combat Stage. If a target is hit by String Shot 5 times within 5 rounds of combat, they are Trapped. If a target''s Speed Combat Stage has already been lowered 6 times, String Shot Traps them. *Grants: Threaded', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (18, 'Struggle Bug', 13, '1d10+4', 'EOT', 2, 1, 'Ranged (3), 1 Target, Column', 'Struggle Bug creates a Column 1 meter wide. Struggle Bug lowers all Legal Targets Special Attack 1 Combat Stage.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (19, 'Tail Glow', 13, '-', 'Battle', 0, 2, 'Self, No Target', 'Raise the user''s Special Attack 3 Combat Stages. *Grants: Glow', 'Beauty', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (20, 'Twineedle', 13, '1d8+3', 'EOT', 3, 0, 'Melee, 1 Target, Scatter', 'Twineedle can hit up to 2 times. If Twineedle misses its first target, you may still use it a second time. If you rolled an 18-20 on either Accuracy Check, the target is Poisoned.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (21, 'U Turn', 13, '3d8+10', 'Battle', 2, 0, 'Melee, 1 Target, Dash', 'If U-Turn successfully hits its target, the user deals damage and then immediately is returned to its Poke Ball in the same turn. A New Pokemon may immediately be sent out.', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (22, 'X Scissor', 13, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target, Dash', '-', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (23, 'Curse (g)', 15, '-', 'Center', 0, 2, 'Ranged (4), 1 Target', 'Only use if the user is a Ghost type. The user loses Â½ of their full HP and the target Pokemon is Cursed. A Cursed Pokemon loses 1/8th of their full HP at the beginning of each of their turns. Do not apply weakness, resistance or stats to the lost HP.', 'Tough', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (24, 'Curse', 15, '-', 'EOT', 0, 2, 'Self, No Target', 'Only use if the user is not a Ghost type. The user''s Speed is lowered 1 Combat Stage. The user''s Attack is raised 1 Combat Stage and the user''s Defense is raised 1 Combat Stage.', 'Tough', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (25, 'Assurance', 16, '2d8+6', 'Battle', 2, 0, 'Melee, 1 Target', 'If Assurance''s target has already been damaged by a Move or Arms Feature on the same round Assurance is being used, use 4d12+16 for Assurance''s Damage Dice Roll.', 'Beauty', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (26, 'Beat Up', 16, '1d12+X', 'Battle', 2, 0, 'Melee, 1 Target, Scatter', 'Beat Up can hit up to X time. X is the amount of pokemon on the user''s roster including the user, up to a maximum of 6. Once the user misses, they cannot attempt to make another Beat Up attack on that turn. You may choose any Pokemon''s Attack stat, from your roster, to calculate damage instead of using the user''s Attack stat.', 'Smart', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (27, 'Bite', 16, '2d10+8', 'At-Will', 2, 0, 'Melee, 1 Target', 'Bite Flinches the target on 15-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (28, 'Crunch', 16, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target', 'Crunch lowers the target''s Defense 1 Combat Stage on 17-20 during Accuracy Check.', 'Tough', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (30, 'Dark Pulse', 16, '3d10+12', 'EOT', 2, 1, 'Ranged (3), No Target, Burst', 'Dark Pulse creates a 3-meter Burst. Dark Pulse Flinches all Legal Targets on 17-20 during Accuracy Check. *Grants: Aura', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (31, 'Dark Void', 16, '-', 'Battle', 4, 2, 'Ranged (10), No Target, Burst', 'Dark Void creates a 10-meter Burst. All Legal Targets fall Asleep.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (32, 'Embargo', 16, '-', 'Battle', 2, 2, 'Ranged (6), 1 Target', 'If the target has a held item, they cannot use it for the remainder of the encounter.', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (33, 'Faint Attack', 16, '1d10+10', 'EOT', 0, 0, 'Melee, 1 Target', 'Faint Attack cannot miss.', 'Smart', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (34, 'Fake Tears', 16, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target', 'Lower the target''s Special Defense 2 Combat Stages.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (35, 'Flatter', 16, '-', 'EOT', 2, 2, 'Ranged (8), 1 Target', 'Flatter Confuses the target and raises the target''s Special Attack 1 Combat Stage.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (36, 'Fling', 16, '2d12+5', 'Battle', 2, 0, 'Ranged (12), 1 Target', 'The user may throw its held item when using Fling, changing its Damage Dice Roll. If a berry is thrown, the target receives the berry''s benefits as if the target, instead of taking any damage, consuming the berry. If an item that causes an effect is thrown, the item''s effect is activated. If any other item is thrown the user deals an additional 2d6 during Damage Dice Roll. All berries or other consumable held items are destroyed when used with Fling. Items that are not destroyed by Fling may be retrieved after an encounter.', 'Tough', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (37, 'Foul Play', 16, '4d12+16', 'Battle', 2, 0, 'Melee, 1 Target', 'The target reveals its Attack stat. When calculating damage, add the target''s Attack stat instead of the user''s Attack stat.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (38, 'Hone Claws', 16, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage. For the remainder of Combat, the user''s Attack - Melee Moves need -1 on Accuracy Checks to hit.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (39, 'Knock Off', 16, '1d6+3', 'EOT', 6, 0, 'Melee, 1 Target', 'If the target has a held item, the target drops it and the item cannot be picked up or held for the remainder of combat.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (40, 'Memento', 16, '-', 'Battle', 0, 2, 'Ranged (15), 1 Target', 'The user''s HP is set to 0. The user does not need a line of sight to the target. Momento cannot be used if the user is at or below 0 HP. Each of the target''s stats are lowered 2 Combat Stages.', 'Tough', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (41, 'Nasty Plot', 16, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Special Attack 2 Combat Stages.', 'Cute', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (42, 'Night Daze', 16, '3d12+14', 'Battle', 2, 0, 'Ranged (10), 1 Target', 'The Target must roll +1 during Accuracy Checks for the remainder of the encounter on 13-20 during Accuracy Check.', 'Tough', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (43, 'Night Slash', 16, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Pass', 'Night Slash is a Critical Hit on 18-20 during Accuracy Check.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (44, 'Payback', 16, '2d8+6', 'Battle', 2, 0, 'Melee, 1 Target', 'If the target damaged Payback''s user on their last turn, during the same round of combat, deal 4d12+16 instead for Damage Dice Roll.', 'Cool', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (45, 'Punishment', 16, '1d10+15', 'Battle', 2, 0, 'Melee, 1 Target', 'Punishment deals an additional 1d10 for each Combat Stage the target has above 0 per raised stat up to an additional 6d10 per stat.', 'Smart', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (46, 'Pursuit', 16, '1d12+6', 'EOT', 2, 0, 'Melee, 1 Target, Interrupt', 'If the foe is fleeing or being switched out, Pursuit may be used as an Interrupt. While being used as an Interrupt, Pursuit may shift the user adjacent to the fleeing foe, up to 25 meters, ignoring Speed Capabilities, and attack them before they escape or are switched out dealing 3d10+12 instead for Damage Dice Roll.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (47, 'Quash', 16, '-', 'Battle', 2, 2, 'Ranged (10), 1 Target, Intercept', 'Quash will not affect a Legal Target if it has already acted that round. Quash causes the target to act as if their Speed is 0, meaning their action is last for that turn.', 'Smart', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (48, 'Snarl', 16, '2d10+8', 'EoT', 3, 1, 'Ranged (5), No Target, Burst', 'Snarl creates a 5-meter Burst. All Legal Targets have their Special Attack lowered 1 Combat Stage.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (49, 'Snatch', 16, '-', 'Battle', 0, 2, 'Ranged (10), 1 Target, Intercept', 'If the target is gaining a Combat Stage, you may use Snatch. The user gains the same Combat Stages the target does. Then, the target loses all Combat Stages they gained that turn. If the target is using a No Damage - Self Move, you may use Snatch. You use the No Damage - Self Move and the target does not.', 'Smart', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (50, 'Sucker Punch', 16, '3d10+12', 'Battle', 2, 0, 'Melee, 1 Target, Interrupt', 'If something is targeting the user with a damaging Attack - Melee Move, you may use Sucker Punch on the offender as an Interrupt.', 'Smart', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (51, 'Switcheroo', 16, '-', 'Battle', 2, 2, 'Melee, 1 Target', 'The user and the target exchange held items.', 'Cool', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (52, 'Taunt', 16, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target', 'Taunt''s target can only use Moves that have Damage Dice Rolls for the next 1d4+1 turns.', 'Smart', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (53, 'Thief', 16, '1d12+6', 'Battle', 2, 0, 'Melee, 1 Target', 'Thief takes the target''s held item and attaches it to Thief''s user, if the user is not holding anything.', 'Tough', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (54, 'Torment', 16, '-', 'Battle', 2, 2, 'Ranged (10), 1 Target', 'For 1d4+2 turns, Torment''s target may not use a Move they have already used in their last 2 turns.', 'Tough', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (55, 'Draco Meteor', 14, '6d12+22', 'Center', 4, 1, 'Ranged (15), Target Area, Blast', 'Draco Meteor creates a 4-meter Blast. Lower the user''s Special Attack 2 Combat Stages after damage.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (56, 'Dragon Claw', 14, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target', '-', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (57, 'Dragon Dance', 14, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage and raise the user''s Speed 1 Combat Stage.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (58, 'Dragon Pulse', 14, '3d12+14', 'Battle', 2, 1, 'Ranged (3), No Target, Burst', 'Dragon Pulse creates a 3-meter Burst. *Grants: Aura', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (59, 'Dragon Rage', 14, '40', 'Battle', 2, 2, 'Ranged (8), 1 Target', 'Dragon Rage always deals 40 points of Damage. Do not apply weakness or resistance. Do not apply stats.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (60, 'Dragon Rush', 14, '4d12+16', 'Battle', 4, 0, 'Melee, 1 Target, Dash, Push', 'The target is Pushed 3-meters and it takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. Dragon Rush Flinches the target on 17-20 during Accuracy Check.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (61, 'Dragon Tail', 14, '2d10+8', 'Battle', 3, 0, 'Melee, 1 Target, Push', 'The target is Pushed 40-meters expelling them from the encounter if the terrain allows. They may still rejoin the encounter if they want to. During a trainer battle, the target''s owner must recall the Pushed target and replace them.', 'Smart', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (62, 'Dragonbreath', 14, '2d10+8', 'EOT', 2, 1, 'Ranged (3), 1 Target, Column', 'Dragonbreath creates a Column 1 meter wide. Dragonbreath Paralyzes all Legal Targets on 15-20 during Accuracy Check.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (63, 'Dual Chop', 14, '2d8+6', 'EOT', 3, 0, 'Melee, 1 Target, Scatter', 'Dual Chop can hit up to 2 times. If Dual Chop misses its first target, you may still use it a second time.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (93, 'Close Combat', 4, '5d12+18', 'Battle', 2, 0, 'Melee, 1 Target, Dash', 'The user''s Defense is lowered 1 Combat Stage and the user''s Special Defense is lowered 1 Combat Stage.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (124, 'Vacuum Wave', 4, '1d12+6', 'At-Will', 2, 1, 'Ranged (6), 1 Target, Interrupt', 'If a foe wants to declare a Move, you may instead use Vacuum Wave on their turn before they can use their Move. *Grants: Aura', 'Smart', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (64, 'Outrage', 14, '5d12+18', 'Center', 3, 0, 'Melee, 1 Target', 'Outrage''s user must make another Melee attack for 1d2 more turns. The attack is identical to Outrage except for Outrage''s effect. After the first target is declared, Outrage targets the nearest Legal Target for its second or third round of use if the original target is unconscious. If potential targets are an equal distance from the user, you may choose the target. After Outrage''s additional use(s) end(s), the user becomes Confused. For Pokemon users, the additional 1d2 are their Trainer''s Command Actions, unless the Trainer is unconscious, in which case the Pokemon acts on its own until finished.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (65, 'Roar of Time', 14, '7d10+28', 'Center', 4, 1, 'Ranged (10), No Target, Burst, Trap, Exhaust', 'Roar of Time creates a 10-meter Burst. All legal targets are Trapped until they roll a 16-20 saving throw. They may attempt to make this save at any time once per round.', 'Cool', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (66, 'Spacial Rend', 14, '4d12+16', 'Center', 3, 1, 'Ranged (20), 1 Target', 'Spacial Rend is a Critical Hit on 11-20 during Accuracy Check.', 'Tough', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (67, 'Twister', 14, '1d12+6', 'At-Will', 2, 1, 'Ranged (10), 1 Target', 'Twister Flinches the target on 18-20 during Accuracy Check. If the target is airborne as a result of Fly or Sky Drop, Twister can hit them, ignoring Range and deals 2d12+16 for its Damage Dice Roll instead.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (68, 'Bolt Strike', 8, '5d12+22', 'Center', 5, 0, 'Ranged (20), 1 Target', 'Bolt Strike Paralyzes the target on 17-20 during Accuracy Check.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (69, 'Charge', 8, '-', 'EOT', 0, 2, 'Self, No Target', 'If the user performs an Electric Move on their next turn that deals damage, add its Damage Dice Roll an extra time to the damage. Raise the user''s Special Defense 1 Combat Stage. *Grants: Zapper', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (70, 'Charge Beam', 8, '2d8+6', 'Battle', 3, 1, 'Ranged (5), 1 Target, Column, Spirit Surge', 'Charge Beam creates a Column 1 meter wide. Charge Beam raises the user''s Special Attack 1 Combat Stage on 11-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (71, 'Discharge', 8, '3d10+12', 'EOT', 2, 1, 'Ranged (3), No Target, Burst', 'Discharge creates a 3-meter Burst. Discharge Paralyzes all legal targets on 15-20 during Accuracy Check. *Grants: Zapper', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (72, 'Electro Ball', 8, 'See Effect', 'Battle', 2, 1, 'Ranged (10), No Target', 'The target reveals their current Speed stat, applying Combat Stages. If the user''s Speed stat, applying Combat Stages is four times that of the target''s, Electro Ball uses 5d10+16 for Damage Dice Roll; if the user three times that of the target''s, Electro Ball uses 3d10+14; if the user is twice that of the target, Electro Ball uses 2d10+12; if the user is not twice as fast as the target, Electro Ball uses 1d10+10.', 'Beauty', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (73, 'Electroweb', 8, '2d10+8', 'EOT', 3, 1, 'Ranged (4), 1 Target, Column', 'Electroweb creates a Column 2-meters wide. All Legal Targets are lowered 1 Speed Combat Stage. *Grants: Threaded', 'Smart', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (74, 'Fusion Bolt', 8, '4d12+16', 'Center', 2, 0, 'Ranged (10), Column', 'Fusion Bolt creates a 4-meter Column. If an opponent in this, or the last, round of the encounter used Fusion Flare, Fusion Bolt deals an additional 8d12 in Damage Dice Roll.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (75, 'Magnet Rise', 8, '-', 'Battle', 0, 2, 'Self, No Target', 'Magnet Rise grants the user the Levitate Ability until the end of the Encounter. This does not replace the user''s normal Ability. If the user already has Levitate, they now have two instances of Levitate. *Grants: Magnetic', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (76, 'Shock Wave', 8, '2d10+8', 'EOT', 0, 1, 'Ranged (2), 1 Target, Column', 'Shock Wave creates a Column 2-meters wide. Shock Wave cannot miss. *Grants: Zapper', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (77, 'Spark', 8, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Dash', 'Spark Paralyzes the target on 15-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (78, 'Thunder', 8, '5d12+18', 'Battle', 6, 1, 'Ranged (15), 1 Target, Blast', 'A 3-meter Blast surrounds the target. Thunder Paralyzes all Legal Targets on 13-20 during Accuracy Check. All Legal Targets within the Blast''s radius are Pushed outward, away from the target, 3-meters. If it is Sunny, Thunder''s Accuracy Check is 11. If it is Rainy, Thunder cannot miss. If the target is airborne as a result of Fly or Sky Drop, Thunder cannot miss them', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (79, 'Thunder Fang', 8, '3d8+10', 'EOT', 3, 0, 'Melee, 1 Target', 'Thunder Fang Paralyzes or Flinches on 18-19 during Accuracy Check; flip a coin to determine whether the foe gets Paralyzed or Flinched. On 20 during Accuracy Check, the foe is Paralyzed and Flinched.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (80, 'Thunder Wave', 8, '-', 'Center', 0, 2, 'Ranged (6), 1 Target', 'Thunder Wave cannot miss. Thunder Wave Paralyzes the target.', 'Cool', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (81, 'Thunderbolt', 8, '4d12+16', 'Battle', 2, 1, 'Ranged (7), 1 Target, Column', 'Thunderbolt creates a Column 1 meter wide. Thunderbolt Paralyzes all Legal Targets on 19-20 during Accuracy Check. *Grants: Zapper', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (82, 'Thunderpunch', 8, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target', 'Thunderpunch Paralyzes the target on 19-20 during Accuracy Check.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (83, 'Thundershock', 8, '1d12+6', 'At-Will', 2, 1, 'Ranged (10), 1 Target', 'Thundershock Paralyzes the target on 17-20 during Accuracy Check. *Grants: Zapper', 'Cool', 2, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (84, 'Volt Switch', 8, '3d8+10', 'Battle', 2, 1, 'Ranged (5), 1 Target', 'If Volt Switch successfully hits its target, the user deals damage and then immediately is returned to its Poke Ball in the same turn. A New Pokemon may immediately be sent out.', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (85, 'Volt Tackle', 8, '5d12+18', 'EOT', 2, 0, 'Melee, 1 Target, Dash, Push, Recoil 1/3', 'The target is pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. Volt Tackle Paralyzes the target on 19-20 during Accuracy Check. After Volt Tackle deals damage, Recoil.', 'Cool', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (86, 'Wild Charge', 8, '3d12+14', 'EOT', 2, 0, 'Melee, 1 Target, Dash, Recoil 1/4', 'After Wild Charge deals damage, Recoil.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (87, 'Zap Cannon', 8, '5d12+18', 'Battle', 12, 1, 'Ranged (10), 1 Target, Blast', 'A 2-meter Blast surrounds the target, Paralyzing all Legal Targets in the Blast.', 'Cool', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (88, 'Arm Thrust', 8, '1d6+1', 'EOT', 4, 0, 'Melee, 1 Target, Scatter', 'Arm Thrust can hit up to 5 times. Once the user misses, they cannot attempt to make another Arm Thrust attack on that turn.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (89, 'Aura Sphere', 4, '3d12+14', 'Battle', 0, 1, 'Ranged (10), 1 Target', 'Aura Sphere cannot miss. *Grants: Aura', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (90, 'Brick Break', 4, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target', 'Brick Break can destroy Walls.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (91, 'Bulk Up', 4, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage and raise the user''s Defense 1 Combat Stage.', 'Beauty', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (92, 'Circle Throw', 4, '2d10+8', 'Center', 4, 0, 'Melee, 1 Target, Push', 'The target is Pushed 40-meters expelling them from the encounter if the terrain allows. They may still rejoin the encounter if they want to. During a trainer battle, the target''s owner must recall the Pushed target and replace them.', 'Tough', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (94, 'Counter', 4, '-', 'Battle', 0, 2, 'Ranged 25, 1 Target, Intercept', 'If the user is being hit by a Move that consults Attack for damage, you may use Counter. If the user survives the hit, the target is dealt damage equal to twice the amount of damage the user received. Do not apply weakness, resistance or immunity. Do not apply stats.', 'Tough', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (95, 'Cross Chop', 4, '4d12+16', 'Battle', 4, 0, 'Melee, 1 Target, Dash, Push', 'Cross Chop is a Critical Hit on 16-20 during Accuracy Check. Cross Chop Pushes the target 1-meter. On Critical Hit, the target is Pushed 5-meters and the target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (96, 'Detect', 4, '-', 'Center', 0, 2, 'Self, No Target, Intercept', 'If the user is hit by a Move, instead you are not hit by the Move. You do not take any damage nor are you affected by any of the Move''s effects. *Grants: Aura', 'Cool', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (215, 'Razor Leaf', 1, '2d10+8', 'At-Will', 4, 0, 'Ranged (10), 1 Target', 'Razor Leaf is a Critical Hit on 18-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (97, 'Double Kick', 4, '1d10+4', 'EOT', 3, 0, 'Melee, 1 Target, Scatter', 'Double Kick can hit up to 2 times. If Double Kick misses its first target, you may still use it a second time.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (98, 'Drain Punch', 4, '3d10+12', 'Battle', 2, 0, 'Melee, 1 Target', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.', 'Beauty', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (99, 'Dynamicpunch', 4, '4d12+16', 'Battle', 12, 0, 'Melee, 1 Target', 'Dynamicpunch Confuses the target.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (100, 'Final Gambit', 4, '-', 'Center', 2, 1, 'Melee, 1 Target', 'Final Gambit lowers the user to 0 HP, and deals 1 point of damage to the target for every point of health lost this way. Final Gambit does not cause items to activate.', 'Tough', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (101, 'Focus Blast', 4, '5d12+18', 'Battle', 6, 1, 'Ranged (10), 1 Target', 'Focus Blast lower the target''s Special Defense 1 Combat Stage on 18-20 during Accuracy Check. *Grants: Aura', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (102, 'Focus Punch', 4, '7d10+28', 'EOT', 2, 0, 'Melee, 1 Target, Push', 'Once you declare the use of Focus Punch the user''s turn ends. If you are not hit by a damaging Move until your next turn you may use Focus Punch''s damage and effects. The target is Pushed 10-meters and it takes an additional 2d12 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d12. If the user is hit by a damaging Move before it''s next turn, it may not use a Move on that turn.', 'Tough', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (103, 'Force Palm', 4, '2d10+8', 'EOT', 2, 0, 'Melee, 1 Target', 'Force Palm Paralyzes the target on 18-20 during Accuracy Check. Cool - 2d4 - Round Ender *Grants: Aura', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (104, 'Hammer Arm', 4, '4d12+16', 'Battle', 3, 0, 'Melee, 1 Target', 'The user lowers their Speed 1 Combat Stage.', 'Cool', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (105, 'Hi Jump Kick', 4, '5d12+22', 'Battle', 3, 0, 'Melee, 1 Target, Pass', 'If Hi Jump Kick misses, roll 4d10 and subtract the result from the user''s HP. Do not apply weakness, resistance or stats.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (106, 'Jump Kick', 4, '2d10+8', 'EOT', 3, 0, 'Melee, 1 Target, Pass', 'If Jump Kick misses, roll 2d10 and subtract the result from the user''s HP. Do not apply weakness, resistance or stats.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (107, 'Karate Chop', 4, '2d8+6', 'At-Will', 2, 0, 'Melee, 1 Target', 'Karate Chop is a Critical Hit on 17-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (108, 'Low Kick', 4, 'See Effect', 'Battle', 2, 0, 'Melee, 1 Target, Weight Class', 'If the target is in Weight Class 1, use 1d10 for Damage Dice Roll. If the target is in Weight Class 2, use 1d10+5. If the target is in Weight Class 3, use 1d10+10. If the target is in Weight Class 4, use 2d10+12. If the target is in Weight Class 5, use 3d10+14. If the target is in Weight Class 6, use 5d10+16 for damage.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (109, 'Low Sweep', 4, '2d10+8', 'EOT', 2, 0, 'Melee, 1 Target', 'Lowers the target''s Speed 1 Combat Stage.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (110, 'Mach Punch', 4, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target, Interrupt', 'If a foe wants to declare a Move, you may instead use Mach Punch on their turn before they can use their Move.', 'Cool', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (111, 'Quick Guard', 4, '-', 'Center', 0, 2, 'Self, 1 Target, Intercept', 'Quick Guard prevents the user and allies from being targeted by Moves used as an Interrupt or Intercept for one round. For that round Interrupt or Intercept attacks can only target you, or other allies using Quick Guard.', 'Cool', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (112, 'Revenge', 4, '2d10+8', 'Battle', 2, 0, 'Melee, 1 Target', 'If the target damaged Revenge''s user on their last turn, during the same round of combat, deal 4d12+16 instead for Damage Dice Roll.', 'Tough', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (113, 'Reversal', 4, 'See Effect', 'EOT', 2, 0, 'Melee, 1 Target', 'If the user has more than 70% of its total HP, use 1d10+5 for Damage Dice Roll. If the user has more than 36% of its total HP, use 2d10+10. If the user has more than 21% of its total HP, use 3d10+10. If the user has more than 6% of its total HP, use 4d10+10. If the user has 1-5% of its total HP, use 5d10+20.', 'Cool', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (114, 'Rock Smash', 4, '1d12+6', 'EOT', 2, 0, 'Melee, 1 Target', 'Rock Smash lowers the target''s Defense 1 Combat Stage on 17-20 during Accuracy Check.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (115, 'Rolling Kick', 4, '2d10+8', 'EOT', 4, 0, 'Melee, 1 Target, Dash', 'Rolling Kick Flinches the target on 15-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (116, 'Sacred Sword', 4, '3d12+14', 'Battle', 2, 0, 'Melee, 1 Target, Pass', 'Sacred Sword''s Accuracy Check may not be modified.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (117, 'Secret Sword2', 4, '3d12+14', 'Battle', 2, 1, 'Ranged (15), 1 Target', 'When calculating damage, the target must use their Defense against Secret Sword.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (118, 'Seismic Toss', 4, '-', 'Center', 2, 0, 'Melee, 1 Target', 'The target loses HP equal to the level of Seismic Toss'' user. Do not apply weakness or resistance. Do not apply stats.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (119, 'Sky Uppercut', 4, '3d12+14', 'EOT', 3, 0, 'Melee, 1 Target, Push', 'The target is Pushed 2-meters. If the target is airborne, Sky Uppercut deals an additional 2d10. If the target is airborne as a result of Fly or Sky Drop, Sky Uppercut cannot miss as long as you are in a space adjacent to the airborne target.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (120, 'Storm Throw', 4, '20', 'Battle', 2, 0, 'Melee, 1 Target', 'Storm Throw is a Critical Hit.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (121, 'Submission', 4, '3d10+12', 'At-Will', 6, 0, 'Melee, 1 Target, Recoil 1/4', 'After Submission deals damage, Recoil.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (122, 'Superpower', 4, '5d12+18', 'Battle', 2, 0, 'Melee, 1 Target, Dash, Push', 'Superpower lowers the user''s Attack and Defense by 1 Combat Stage each. The target is Pushed 6-meters and it takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (123, 'Triple Kick', 4, '1d6+1', 'Battle', 3, 0, 'Melee, 1 Target, Scatter', 'Triple Kick can hit up to 3 times. If Triple Kick misses its first or second target, you may still use it a second and third time. For the third use of Triple Kick, if you successfully hit the same target for the first two uses of Triple Kick use 3d10+12 for Triple Kick''s Damage Dice Roll.', 'Cool', 3, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (155, 'Will O Wisp', 3, '-', 'Battle', 4, 2, 'Ranged (10), 1 Target', 'The target is Burned.', 'Beauty', 0, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (125, 'Vital Throw', 4, '3d8+10', 'Battle', 0, 0, 'Melee, 1 Target, Push', 'Vital Throw may only be used if the user was targeted by a Move on a foe''s last turn while the foe was adjacent. Vital Throw can only target that foe. Vital Throw cannot miss. The target is Pushed 5-meters and it takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6.', 'Cool', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (126, 'Wake Up Slap', 4, '2d8+6', 'Battle', 2, 0, 'Melee, 1 Target', 'If the target is Asleep, Wake-Up Slap does 4d12+16 instead for Damage Dice Roll and cures the target of Sleep.', 'Smart', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (127, 'Blast Burn', 3, '7d10+28', 'Center', 4, 1, 'Ranged (15), Target Area, Blast, Exhaust', 'Blast Burn creates a 3-meter Blast. On Miss, Blast Burn deals the user''s Special Attack instead to all possible targets.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (216, 'Seed Bomb', 1, '3d10+12', 'EOT', 2, 0, 'Ranged (8), 1 Target, Blast', 'Seed Bomb creates a 2-meter Blast.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (128, 'Blaze Kick', 3, '3d12+14', 'Battle', 4, 0, 'Melee, 1 Target, Push', 'Blaze Kick Pushes the target 2-meters. Blaze Kick Burns the target on 19-20 during Accuracy Check. Blaze Kick is a Critical Hit on 16-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (129, 'Blue Flare', 3, '5d12+22', 'Center', 5, 1, 'Ranged (10), 1 Target', 'Blue Flare Burns the target on 17-20 during Accuracy Check.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (130, 'Ember', 3, '1d12+6', 'At-Will', 2, 1, 'Ranged (8), 1 Target', 'Ember Burns the target on 18-20 during Accuracy Check. *Grants: Firestarter', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (131, 'Eruption', 3, '7d10+28', 'Center', 4, 1, 'Ranged (10), No Target, Burst', 'Eruption creates a 10-meter Burst. Eruption may not be performed unless the user has at least 90% of its HP.', 'Beauty', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (132, 'Fiery Dance', 3, '3d10+12', 'Battle', 2, 1, 'Ranged (4), 1 Target, Spirit Surge', 'Fiery Dance raises the user''s Special Attack by 1 Combat Stage on 11-20 on Accuracy Check.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (133, 'Fire Blast', 3, '5d12+18', 'Battle', 6, 1, 'Ranged (10), 1 Target, Blast', 'Fire Blast creates a 2-meter Blast. Fire Blast burns all Legal Targets on 19-20 during Accuracy Check. *Grants: Firestarter', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (134, 'Fire Fang', 3, '3d8+10', 'EOT', 3, 0, 'Melee , 1 Target', 'Fire Fang Burns or Flinches on 18-19 during Accuracy Check; flip a coin to determine whether the foe gets Burned or Flinches. On 20 during Accuracy Check, the foe is Burned and Flinches.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (135, 'Fire Pledge', 3, '2d8+6', 'EOT', 2, 1, 'Ranged (6), 1 Target, Pledge', 'If used on the same turn as Water Pledge, all secondary effects of Moves are activated at a -3 during the Accuracy Check for 1d4+1 turns. If used on the same turn as Grass Pledge, all foes within 20 meters of the user lose 1/8th of their max HP at the end of each round of combat for 1d4+1 turns.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (136, 'Fire Punch', 3, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target', 'Fire Punch Burns the target on 19-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (137, 'Fire Spin', 3, '1d12+6', 'EOT', 4, 1, 'Ranged (10), 1 Target, Trap', 'Fire Spin Traps the target for 1d4+1 turns. At the beginning of the target''s turn, if the target is Trapped, roll 1d12 and the target loses that much HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Fire Spin may not trap more then one target at a time. *Grants: Firestarter', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (138, 'Flame Burst', 3, '3d8+10', 'EOT', 2, 1, 'Ranged (6), No Target, Blast', 'Flame Burst creates a 4-meter Blast. All Legal Targets, not including the central target, hit in the Blast lose 1/16th of their max HP instead of taking the Damage Dice Roll for damage. *Grants: Firestarter', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (139, 'Flame Charge', 3, '2d8+6', 'EOT', 2, 0, 'Melee, 1 Target', 'Raise the user''s Speed 1 Combat Stage.', 'Tough', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (140, 'Flame Wheel', 3, '2d10+8', 'At-Will', 2, 0, 'Melee, 1 Target, Dash', 'Flame Wheel Burns the target on 19-20 during Accuracy Check.', 'Beauty', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (141, 'Flamethrower', 3, '4d12+16', 'Battle', 2, 1, 'Ranged (4), 1 Target, Column', 'Flamethrower creates a Column 1 meter wide. Flamethrower Burns the target on 19-20 during Accuracy Check. *Grants: Firestarter', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (142, 'Flare Blitz', 3, '5d12+18', 'EOT', 2, 0, 'Melee, 1 Target, Dash, Push, Recoil 1/3', 'The target is pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. Flare Blitz Burns the target on 19-20 during Accuracy Check. After Flare Blitz deals damage, Recoil.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (143, 'Fusion Flare', 3, '4d12+16', 'Center', 2, 1, 'Ranged (10), 1 Target, Column', 'Fusion Flare creates a 4-meter Column. If an opponent in this, or the last, round of the encounter used Fusion Bolt, Fusion Flare deals an additional 8d12 in Damage Dice Roll.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (144, 'Heat Crash', 3, 'See Effect', 'Battle', 2, 0, 'Melee, 1 Target, Dash, Weight Class', 'If the user is in the same Weight Class as the target, use 1d10 for Damage Dice Roll; if the user is one Weight Class higher than the target, use 1d10+10; if the user is two Weight Classes higher than the target, use 2d12+12; if three classes, 3d10+14; if four classes, 5d10+16.', 'Tough', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (145, 'Heat Wave', 3, '4d12+16', 'Battle', 4, 1, 'Ranged (3), No Target, Burst', 'Heat Wave creates a 3-meter burst. Heat Wave Burns all Legal Targets on 18-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (146, 'Incinerate', 3, '1d10+4', 'EOT', 2, 1, 'Ranged (6), 1 Target', 'If the target is holding a Berry, the Berry is destroyed, without its ability activating.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (147, 'Inferno', 3, '4d12+16', 'Center', 11, 1, 'Ranged (2), No Target, Blast', 'Inferno creates a 2-meter Blast. Inferno Burns all Legal Targets.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (148, 'Lava Plume', 3, '3d10+12', 'EOT', 2, 1, 'Ranged (6), 1 Target', 'Lava Plume Burns the target on 16-20 during Accuracy Check.', 'Tough', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (149, 'Magma Storm', 3, '5d12+18', 'Center', 7, 1, 'Ranged (8), 1 Target, Trap', 'Magma Storm Traps the target for 1d4+1 turns. At the beginning of the target''s turn, if the target is Trapped, roll 2d20 and the target loses that much HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Magma Storm may not trap more then one target at a time.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (150, 'Overheat', 3, '6d12+22', 'Center', 4, 1, 'Ranged (2), No Target, Burst', 'Overheat creates a 2-meter Burst. Lower the user''s Special Attack 2 Combat Stages after damage.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (151, 'Sacred Fire', 3, '4d12+16', 'Center', 3, 0, 'Ranged (7), 1 Target, Burst', 'Sacred Fire creates a 7-meter Burst. Sacred Fire Burns all Legal Targets in the Burst on 11-20 during Accuracy Check.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (152, 'Searing Shot', 3, '4d12+16', 'Center', 2, 1, 'Ranged (10), 1 Target', 'Searing Shot Burns the Target on 15-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (153, 'Sunny Day', 3, '-', 'Battle', 0, 2, 'No Damage, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Sunny. While Sunny, Fire-Type attacks deal 1.5x damage. Water-Type attacks deal Â½ the damage they normally would.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (154, 'V Create', 3, '8d10+36', 'Center', 5, 0, 'Melee, No Target, Burst', 'V-Create creates a 10-meter Burst. Lower the user''s Defense 1 Combat Stage, lower the user'' Special Defense 1 Combat Stage and lower the user''s Speed 1 Combat Stage.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (156, 'Acrobatics', 6, '2d10+8', 'Battle', 2, 0, 'Melee, 1 Target', 'If the user is not holding an item, Acrobatics deals 4d12+16 instead for Damage Dice Roll.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (157, 'Aerial Ace', 6, '2d10+8', 'EOT', 0, 0, 'Melee, 1 Target, Pass', 'Aerial Ace cannot miss.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (158, 'Aeroblast', 6, '4d12+16', 'Center', 3, 1, 'Ranged (20), 1 Target, Column', 'Aeroblast creates a Column 2-meters wide. Aeroblast is a Critical Hit on 11-20 during Accuracy Check.', 'Cool', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (159, 'Air Cutter', 6, '2d10+8', 'At-Will', 2, 1, 'Ranged (8), 1 Target', 'Air Cutter is a Critical Hit on 18-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (160, 'Air Slash', 6, '3d10+12', 'EOT', 3, 1, 'Ranged (8), 1 Target', 'Air Slash Flinches the target on 15-20 during Accuracy Check.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (161, 'Bounce', 6, '3d12+14', 'Battle', 4, 0, 'Melee, 1 Target, Burst', 'Once you declare the use of Bounce, the user is moved up to 10-meters into the air and then the user''s turn ends. On your next turn, shift while in the air, lower your height back to the ground, and then use Bounce''s damage and the rest of its Effect. Bounce creates a Burst equal half the user''s Weight Class. Bounce Paralyzes all Legal Targets on 17-20 during Accuracy Check. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Bounce. *Grants: Jump +1', 'Cute', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (162, 'Brave Bird', 6, '5d12+18', 'EOT', 2, 0, 'Melee, 1 Target, Dash, Push, Recoil 1/3', 'The target is pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. After Brave Bird deals damage, Recoil.', 'Cute', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (163, 'Chatter', 6, '2d10+8', 'EOT', 2, 1, 'Ranged (4), 1 Target, Column', 'Chatter creates a Column 1 meter wide. Chatter Confuses all Legal Targets.', 'Smart', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (164, 'Defog', 6, '-', 'EOT', 0, 2, 'No Damage, Target Area, Weather', 'For 1 minute (6 rounds), the area is considered Clear. While Clear, all hindering terrain is no longer hindering terrain and all bonuses or penalties to Accuracy Checks are ignored. All Walls, Coats and Hazards are destroyed.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (165, 'Drill Peck', 6, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target, Dash', '-', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (166, 'Featherdance', 6, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target, Blast', 'Feather Dance creates a 1-meter Blast. All Legal Targets in the Blast have their Attack lowered 2 Combat Stages.', 'Beauty', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (167, 'Fly', 6, '3d12+14', 'EOT', 3, 0, 'Melee, 1 Target, Dash', 'Once you declare the use of Fly, the user is shifted 25-meters into the air and then the user''s turn ends. On your next turn, shift while in the air, lower the user back to the target''s level on the battlefield, then use Fly''s damage. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Fly. *Grants: Sky +3', 'Smart', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (168, 'Gust', 6, '1d12+6', 'At-Will', 2, 1, 'Ranged (10), 1 Target', 'If the target is airborne as a result of Fly or Sky Drop, Gust can hit them, ignoring Range and deals 2d12+16 for its Damage Dice Roll instead. *Grants: Guster', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (169, 'Hurricane', 6, '5d12+18', 'Battle', 6, 1, 'Ranged (8), 1 Target, Blast', 'Hurricane creates a 4-meter Blast. Hurricane Confuses all Legal Targets on 13-20 during Accuracy Check. All Legal Targets within the Blast''s radius are Pushed outward, away from the target, 3-meters. If it is Sunny, Hurricane''s Accuracy Check is 11. If it is Rainy, Hurricane cannot miss. If the target is airborne as a result of Fly or Sky Drop, Hurricane cannot miss them.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (170, 'Mirror Move', 6, 'See Effect', 'Center', 0, 2, 'Ranged (15), 1 Target', 'Use the Move the target has used on their last turn. You may choose new targets for the Move. Mirror Move cannot miss.', 'Smart', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (171, 'Peck', 6, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target', '-', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (172, 'Pluck', 6, '2d10+8', 'EOT', 2, 0, 'Melee, 1 Target', 'If the target is holding a Berry, Pluck deals an additional 2d10 during Damage Dice Roll and Pluck destroys the Berry then Pluck''s user uses the Berry''s effect.', 'Cute', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (173, 'Roost', 6, '-', 'Center', 0, 2, 'Self, No Target', 'The user regains HP equal to half of its full HP. The user looses any resistances or immunities to Ground-type Moves until the end of their next turn.', 'Cool', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (174, 'Sky Attack', 6, '6d12+22', 'Battle', 4, 0, 'Melee, 1 Target, Pass', 'Once you declare the use of Sky Attack, the user is moved 10-meters into the air and then the user''s turn ends. On your next turn, shift while in the air, lower your height back to the target and then use Sky Attack''s damage. Sky Attack Flinches the target on 17-20 during Accuracy Check. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Sky Attack.', 'Cool', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (175, 'Sky Drop', 6, '2d10+8', 'Center', 3, 0, 'Melee, 1 Target', 'Sky Drop can''t target a Pokemon who is more then 2 Weight Classes higher then the user. Once you declare the use of Sky Drop, the user and target are moved 25-meters into the air, the Target is Trapped and then the user''s turn ends. On your next turn, shift while in the air, lower both the user and the target''s heights back to the ground, then use Sky Drop''s damage and the target is no longer Trapped. This move does not damage Flying type pokemon. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Sky Drop.', 'Smart', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (176, 'Tailwind', 6, '-', 'At-Will', 0, 2, 'No Damage, Target Area, Column', 'Tailwind creates a Column 5-meters wide. For 1d6+1 turns, Tailwind''s user and all of the user''s allies in the Column have their Speed raised 1 Combat Stage. When the user or the user''s allies leave the Column or when the Column dissapears, their Speed is lowered 1 Combat Stage. Whenever you make a new Tailwind Cloumn, the last one the user made disappears. *Grants: Guster', 'Smart', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (177, 'Wing Attack', 6, '2d10+8', 'At-Will', 2, 0, 'Melee, 1 Target, Pass', '-', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (178, 'Astonish', 15, '1d10+4', 'EOT', 2, 0, 'Melee, 1 Target', 'Astonish Flinches the target on 18-20 during Accuracy Check.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (179, 'Confuse Ray', 15, '-', 'Center', 0, 2, 'Ranged (10), 1 Target, Column', 'Confuse Ray creates a Column 1 meter wide. Confuse Ray cannot miss. All targets are Confused.', 'Smart', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (180, 'Destiny Bond', 15, '-', 'Center', 0, 2, 'Ranged (20), 1 Target, Intercept', 'When the user faints after taking damage from a Move, you may use Destiny Bond as an Intercept to target the Pokemon who lowered the user to 0 HP or less. Roll 1d20, on a roll of 6 or better the target is set to 0 HP.', 'Smart', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (181, 'Grudge', 15, '-', 'Center', 0, 2, 'Ranged (20), 1 Target, Intercept', 'When the user faints, you may use Grudge as an Intercept. The Move that caused the user to drop to 0 HP or less has its Frequency changed to Center for 1 hour.', 'Tough', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (182, 'Hex', 15, '2d8+6', 'Battle', 2, 1, 'Ranged (8), 1 Target', 'If the target has a status affliction, Hex deals 4d12+16 instead for Damage Dice Roll.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (183, 'Lick', 15, '1d6+3', 'At-Will', 2, 0, 'Melee, 1 Target', 'Lick Paralyzes the target on 15-20 during Accuracy Check.', 'Tough', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (184, 'Night Shade', 15, '-', 'Center', 2, 1, 'Ranged (8), 1 Target', 'The target loses HP equal to the level of Night Shade''s user. Do not apply weakness or resistance. Do not apply stats.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (185, 'Nightmare', 15, '-', 'EOT', 2, 2, 'Melee, 1 Target', 'Nightmare can only hit Legal Targets that are Asleep. Nightmare gives a special affliction, Bad Sleep. Bad Sleep makes a target lose Â¼ of its full HP per turn while it is Badly Sleeping. When the target wakes up, they are cured of Bad Sleep.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (432, 'Clear Smog', 7, '2d8+6', 'Battle', 0, 1, 'Ranged (10), 1 Target', 'The target''s Combat Stages are reset to 0.', 'Smart', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (186, 'Ominous Wind', 15, '2d10+8', 'Center', 2, 1, 'Ranged (10), 1 Target, Column, Spirit Surge', 'Ominous Wind creates a Column that is 2-meters wide. If you rolled 11-20 during Accuracy Check for Ominous Wind, the user has each of its stats raised 1 Combat Stage. If you rolled 16-20 on the Accuracy Roll, all allies in the Column also have each of their stats raised 1 Combat Stage and are not damaged by Ominous Wind.', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (187, 'Shadow Ball', 15, '3d10+12', 'EOT', 2, 1, 'Ranged (10), 1 Target', 'Shadow Ball lowers the foe''s Special Defense 1 Combat Stage on 17-20 during Accuracy Check.', 'Smart', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (188, 'Shadow Claw', 15, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Pass', 'Shadow Claw is a Critical Hit on 18-20 during Accuracy Check.', 'Cute', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (189, 'Shadow Force', 15, '5d12+18', 'Center', 2, 0, 'Melee, 1 Target', 'Once you declare the use of Shadow Force, the user is removed from the field and the user''s turn ends. On the next turn, Shadow Force''s user appears adjacent to any target, ignoring Speed Capabilities, and then uses Shadow Force''s damage. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Shadow Force.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (190, 'Shadow Punch', 15, '2d10+8', 'EOT', 0, 0, 'Ranged (6), 1 Target', 'Shadow Punch cannot miss.', 'Smart', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (191, 'Shadow Sneak', 15, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target, Pass, Interrupt', 'If a foe wants to declare a Move, you may instead use Shadow Sneak on their turn before they can use their Move.', 'Smart', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (192, 'Spite', 15, '-', 'Battle', 2, 2, 'Ranged (15), 1 Target', 'Spite lowers the target''s last move''s Frequency for the remainder of the encounter. EOT Frequency Moves are changed into Battle Frequency. At-Will Frequency Moves are changed into EOT Frequency. Spite may not target the same target''s Move more then once per encounter.', 'Tough', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (193, 'Absorb', 1, '1d6+3', 'At-Will', 2, 1, 'Melee, 1 Target', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (194, 'Aromatherapy', 1, '-', 'Battle', 2, 2, 'Ranged (10), 1 Target', 'The target has 1 status effect of their choice removed. Aromatherapy cannot miss.', 'Smart', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (195, 'Bullet Seed', 1, '1d10+4', 'At-Will', 4, 0, 'Ranged (8), 1 Target, Scatter', 'Bullet Seed can hit up to 5 times. Once the user misses, they cannot attempt to make another Bullet Seed attack on that turn.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (196, 'Cotton Guard', 1, '-', 'Battle', 0, 2, 'Self, No Target', 'Raise the user''s Defense 3 Combat Stages.', 'Cute', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (197, 'Cotton Spore', 1, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target, Blast', 'Cotton Spore creates a 2-meter Blast. All Legal Targets have their Speed lowered 2 Combat Stages.', 'Beauty', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (198, 'Energy Ball', 1, '3d10+12', 'EOT', 2, 1, 'Ranged (8), 1 Target', 'Energy Ball lowers the foe''s Special Defense 1 Combat Stage on 17-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (199, 'Frenzy Plant', 1, '7d10+28', 'Center', 4, 1, 'Ranged (15), Target Area, Blast, Exhaust', 'Frenzy Plant creates a 3-meter Blast. On Miss, Frenzy Plant deals the user''s Special Attack instead to all possible targets.', 'Cool', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (200, 'Giga Drain', 1, '3d10+12', 'Battle', 2, 1, 'Ranged (4), 1 Target', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (201, 'Grass Knot', 1, 'See Effect', 'Battle', 2, 1, 'Ranged (5), 1 Target, Weight Class', 'If the target is in Weight Class 1, use 1d10 for Damage Dice Roll. If the target is in Weight Class 2, use 1d10+5. If the target is in Weight Class 3, use 1d10+10. If the target is in Weight Class 4, use 2d10+12. If the target is in Weight Class 5, use 3d10+14. If the target is in Weight Class 6, use 5d10+16 for damage.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (202, 'Grass Pledge', 1, '2d8+6', 'EOT', 2, 1, 'Ranged (6), 1 Target, Pledge', 'If used on the same turn as Water Pledge, all foes are treated as if at -2 Speed Combat Stages for 1d4+1 turns, if any foe has additional Speed Combat Stages, apply them as usual. If used on the same turn as Fire Pledge, all foes within 20 meters of the user lose 1/8th of their max HP at the end of each round of combat for 1d4+1 turns.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (203, 'Grasswhistle', 1, '-', 'EOT', 11, 2, 'Ranged (6), No Target, Burst', 'Grasswhistle creates a 5-meter Burst. All Legal Targets fall Asleep.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (204, 'Horn Leech', 1, '3d10+12', 'Battle', 2, 0, 'Melee, 1 Target', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (205, 'Ingrain', 1, '-', 'Battle', 0, 2, 'Self, No Target, Coat', 'Ingrain is a Coat with the following abilities: The user cannot be forced to switch out or flee but they can still be willingly switched out. At the beginning of each of the user''s turns, the user gains 1/16th of its full HP. *Grants: Sprouter', 'Smart', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (206, 'Leaf Blade', 1, '3d12+14', 'Battle', 2, 0, 'Melee, 1 Target, Pass', 'Leaf Blade is a Critical Hit on 18-20 during Accuracy Check.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (207, 'Leaf Storm', 1, '6d12+22', 'Center', 4, 1, 'Ranged (3), Target Area, Column', 'Leaf Storm creates a 2-meter Column. Lower the user''s Special Attack 2 Combat Stages after damage.', 'Cute', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (208, 'Leaf Tornado', 1, '3d8+10', 'Battle', 4, 1, 'Ranged (6), No Target, Burst', 'Leaf Tornado creates a 2-meter Burst. On 15-20 during Accuracy Check, all Legal Targets must roll 1 higher on Accuracy Checks for the remainder of the combat.', 'Beauty', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (209, 'Leech Seed', 1, '-', 'Center', 4, 2, 'Ranged (6), 1 Target', 'At the beginning of each of the target''s turns, Leech Seed''s target loses 1/8th of their full HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Leech Seed''s user then gains HP equal to the amount the target lost. Leech Seed lasts until the target faints or is returned to a Poke Ball. Leech Seed cannot hit a Grass type Pokemon.', 'Smart', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (210, 'Magical Leaf', 1, '2d10+8', 'EOT', 0, 1, 'Ranged (10), 1 Target', 'Magical Leaf cannot miss.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (211, 'Mega Drain', 1, '1d12+6', 'EOT', 2, 1, 'Melee, 1 Target', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (212, 'Needle Arm', 1, '2d10+8', 'EOT', 2, 0, 'Melee, 1 Target', 'Needle Arm Flinches the target on 15-20 during Accuracy Check.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (355, 'Pound', 2, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target', '-', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (213, 'Petal Dance', 1, '5d12+18', 'Center', 3, 1, 'Ranged (3), No Target, Burst', 'Petal Dance''s user must make another Ranged attack for 1d2 more turns. The attack is identical to Petal Dance except for Petal Dance''s effect. Petal Dance creates a 3-meter Burst, but only on the first round of its use. After the first use is declared, Petal Dance targets the nearest Legal Target for its second or third round of use if the original target is unconscious. If potential targets are an equal distance from the user, you may choose the target. After Petal Dance''s additional use(s) end(s), the user becomes Confused. For Pokemon users, the additional 1d2 are their Trainer''s Command Actions, unless the Trainer is unconscious, in which case the Pokemon acts on its own until finished.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (217, 'Seed Flare', 1, '5d12+18', 'Center', 5, 1, 'Ranged (15), 1 Target, Blast', 'Seed Flare creates a 3-meter Blast. All Legal Targets have their Special Defense lowered 1 Combat Stage.', 'Cool', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (218, 'Sleep Powder', 1, '-', 'Center', 6, 2, 'Ranged (6), 1 Target, Blast', 'Sleep Powder creates a 1-meter Blast. All Legal Targets fall Asleep.', 'Smart', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (219, 'Solarbeam', 1, '5d12+18', 'Battle', 2, 1, 'Ranged (10), 1 Target, Column', 'Once you declare the use of Solarbeam, the user''s turn ends. On its next turn, the user may shift and use Solarbeam''s damage. If it is Sunny, Solarbeam uses its damage on the turn you declare its use. If it is Rainy or Sand Storming Solarbeam''s user must end their turn immediately at the start of their second turn after declaring Solarbeam''s use, only getting to use Solarbeam''s damage on the third turn. If it is Hailing, Solarbeam''s damage is 3d10. Solarbeam creates a Column 1 meter wide. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Solarbeam.', 'Cool', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (220, 'Spore', 1, '-', 'Center', 0, 2, 'Ranged (6), 1 Target', 'The target falls Asleep.', 'Beauty', 2, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (221, 'Stun Spore', 1, '-', 'At-Will', 11, 2, 'Ranged (6), 1 Target, Blast', 'Stun Spore creates a 1-meter Blast. Stun Spore paralyzes al Legal Targets.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (222, 'Synthesis', 1, '-', 'Center', 0, 2, 'Self, No Target', 'The user regains HP equal to half of its full HP. If it is Sunny, the user gains 2/3 of its full HP. If it is Rainy, Sand Storming or Hailing the user gains Â¼ of their full HP. *Grants: Sprouter', 'Smart', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (223, 'Vine Whip', 1, '1d12+6', 'At-Will', 2, 0, 'Ranged (10), 1 Target', '*Grants: Threaded', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (224, 'Wood Hammer', 1, '5d12+18', 'EOT', 2, 0, 'Melee, 1 Target, Dash, Push, Recoil 1/3', 'The target is pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. After Wood Hammer deals damage, Recoil.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (225, 'Worry Seed', 1, '-', 'Battle', 2, 2, 'Ranged (8), 1 Target', 'The target''s Ability is replaced with Insomnia. If the target has multiple Abilities, Worry Seed only replaces one.', 'Beauty', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (226, 'Bone Club', 9, '3d8+10', 'EOT', 5, 0, 'Melee, 1 Target', 'Bone Club Flinches the target on 18-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (227, 'Bone Rush', 9, '1d10+4', 'EOT', 4, 0, 'Melee, 1 Target, Scatter', 'Bone Rush can hit up to 5 times. Once the user misses, they cannot attempt to make another Bone Rush attack on that turn.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (228, 'Bonemerang', 9, '2d12+8', 'EOT', 3, 0, 'Ranged (8), 1 Target, Scatter', 'Bonemerang can hit up to 2 times. If Bonemerang misses its first target, you may still use it a second time.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (229, 'Bulldoze', 9, '2d10+8', 'EOT', 2, 0, 'Ranged (3), No Target, Burst', 'Bulldoze creates a 3-meter Burst. All Legal Targets are lowered 1 Speed Combat Stage.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (230, 'Dig', 9, '3d10+12', 'Battle', 2, 0, 'Melee, 1 Target, Dash', 'Once you declare the use of Dig, the user is moved underground and their turn ends. On the next turn, Dig''s user may shift, using their Overland or Burrow Speed then uses Dig''s damage. While underground, Dig''s user may not be the target of Moves. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Dig. *Grants: Burrow +3', 'Smart', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (231, 'Drill Run', 9, '3d10+12', 'EOT', 3, 0, 'Melee, 1 Target', 'Drill Run is a Critical Hit on 18-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (232, 'Earth Power', 9, '3d12+14', 'Battle', 2, 1, 'Ranged (6), 1 Target, Blast', 'Earth Power creates a 3-meter Blast. Earth Power lowers the Special Defense of all Legal Targets 1 Combat Stage on 16-20 during Accuracy Check.', 'Smart', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (233, 'Earthquake', 9, '4d12+16', 'Battle', 2, 0, 'Ranged (5), No Target, Burst', 'Earthquake creates a 5-meter Burst. Earthquake can hit targets using the Move Dig. *Grants: Groundshaper', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (234, 'Fissure', 9, '-', 'Center', 15, 2, 'Ranged (5), 1 Target, Column', 'Fissure creates a Column that is 3-meters wide. All Legal Targets have their HP set to 0. Fissure can hit targets using the Move Dig.', 'Tough', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (235, 'Magnitude', 9, 'See Effect', 'EOT', 2, 0, 'Ranged (2), No Target, Burst', 'Magnitude creates a 2-meter Burst. Roll 1d6. On a result of 1, use 1d4 for damage. On a result of 2, use 1d8 for damage. On a result of 3, use 2d8 for damage. On a result of 4, use 2d10 for damage. On a result of 5, use 3d10 for damage. On a result of 6, use 4d10 for damage. Magnitude can hit targets using the Move Dig. *Grants: Groundshaper', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (236, 'Mud Bomb', 9, '3d8+10', 'EOT', 4, 1, 'Ranged (6), 1 Target, Blast', 'Mud Bomb creates a 1-meter Blast. All Legal Targets must roll +1 during Accuracy Checks for the remainder of the encounter on 17-20 during Accuracy Check.', 'Smart', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (237, 'Mud Shot', 9, '2d10+8', 'EOT', 3, 1, 'Ranged (3), 1 Target, Column', 'Mud Shot creates a Column 1 meter wide. All Legal Targets have their Speed lowered 1 Combat Stage.', 'Tough', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (238, 'Mud Sport', 9, '-', 'EOT', 0, 2, 'Ranged (8), 1 Target, Coat', 'Mud Sport makes a Coat that resists Electric Moves. Mud Sport can Target Self.', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (239, 'Mud Slap', 9, '1d6+3', 'EOT', 2, 1, 'Ranged (2), 1 Target, Column', 'Mud-Slap creates a Column 1-meter wide. All Legal Targets must roll +1 during Accuracy Checks for the remainder of the encounter.', 'Cute', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (240, 'Sand Tomb', 9, '1d12+6', 'EOT', 4, 0, 'Ranged (6), 1 Target, Trap', 'Sand Tomb Traps the target for 1d4+1 turns. At the beginning of the target''s turn, if the target is Trapped, roll 1d12 and the target loses that much HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Sand Tomb may not trap more then one target at a time.', 'Smart', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (241, 'Sand Attack', 9, '-', 'EOT', 2, 2, 'Ranged (2), 1 Target, Column', 'Sand-Attack creates a Column 1 meter wide. All Legal Targets must roll +1 during Accuracy Checks for the remainder of the encounter.', 'Cute', 1, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (242, 'Spikes', 9, '-', 'At-Will', 0, 2, 'Ranged (6), No Target, Hazard', 'Set 10 square meters of Spikes, all 10 meters must be adjacent with at least one other space of Spikes next to each other. Spikes cause all foes to lose 1/8th of their full HP when joining the encounter or getting sent out. If there are 2 Layers of Spikes, the foes lose 1/6th of their full HP. If there are 3 Layers of Spikes, the foes lose 1/4th of their full HP.', 'Smart', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (243, 'Aurora Beam', 12, '3d8+10', 'EOT', 2, 1, 'Ranged (6), 1 Target, Column', 'Aurora Beam creates a Column 1 meter wide. Aurora Beam lowers the target''s Attack 1 Combat Stage on 18-20 during Accuracy Check. *Grants: Freezer', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (244, 'Avalanche', 12, '2d10+8', 'Battle', 2, 0, 'Ranged (5), 1 Target, Column', 'Avalanche creates a Column 2-meters wide. If a target damaged Avalanche''s user on their last turn during the same round of combat, deal 5d12+18 instead for Damage Dice Roll.', 'Cool', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (245, 'Blizzard', 12, '5d12+18', 'Battle', 7, 1, 'Ranged (6), 1 Target, Column', 'Blizzard creates a Column that is 3-meters wide. Blizzard Freezes all legal targets on 16-20 during accuracy Check. If it is Hailing, Blizzard cannot miss. *Grants: Freezer', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (246, 'Freeze Shock', 12, '6d12+22', 'Center', 4, 0, 'Ranged (10), 1 Target, Column, Push', 'Freeze Shock creates a Column 2-meters wide. All Legal Targets are pushed 10-meters and take an additional 1d6 if Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. Freeze Shock paralyzes all Legal Targets on 15-20 on Accuracy Check.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (247, 'Frost Breath', 12, '20', 'Battle', 4, 1, 'Ranged (2), 1 Target', 'Frost Breath is a Critical Hit.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (248, 'Glaciate', 12, '3d8+10', 'Battle', 3, 1, 'Ranged (5), 1 Target', 'Glaciate creates a 5-meter Burst. All Legal Targets have their Speed lowered 1 Combat Stage. On a roll of 11-20 during Accuracy Check, all Legal Targets on the ground are Trapped and cannot shift for 2 rounds.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (249, 'Hail', 12, '-', 'Battle', 0, 2, 'Field, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Hailing. At the beginning of each round, all non-Ice Type Pokemon lose 1/16th of their full HP. Ice Type Pokemon are treated as if their Defense is raised 2 Combat Stages while Hailing.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (250, 'Haze', 12, '-', 'At-Will', 0, 2, 'Field, Target Area, Weather', 'For 30 seconds, the area is considered Hazy. Hazy does not replace other Weather Statuses. In Hazy Weather, all Combat Stages get set to 0.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (251, 'Ice Ball', 12, '1d10+4', 'EOT', 4, 0, 'Melee, 1 Target, Pass', 'The user must use Ice Ball until it misses, or fails to be able to shift enough to hit a target for their next 4 turns. On the second turn, Ice Ball uses 2d10+8 for its Damage Dice Roll. On the third turn, Ice Ball uses 2d10+12. On the fourth turn, Ice Ball uses 3d10+16. On the fifth and final turn, Ice Ball uses 4d10+20.', 'Beauty', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (252, 'Ice Beam', 12, '4d12+16', 'Battle', 2, 1, 'Ranged (8), 1 Target, Column', 'Ice Beam creates a Column 1 meter wide. Ice Beam Freezes all Legal Targets on 19-20 during Accuracy Check. *Grants: Freezer', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (253, 'Ice Burn', 12, '6d12+22', 'Center', 4, 1, 'Ranged (10), 1 Target, Column', 'Ice Burn creates a Column 2-meters wide. All Legal Targets are pushed 10-meters and take an additional 1d6 if Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. Ice Burn Burns all Legal Targets on 15-20 on Accuracy Check.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (254, 'Ice Fang', 12, '3d8+10', 'EOT', 3, 0, 'Melee, 1 Target', 'Ice Fang Freezes or Flinches on 18-19 during Accuracy Check; flip a coin to determine whether the foe gets Frozen or Flinches. On 20 during Accuracy Check, the foe is Frozen and Flinches.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (255, 'Ice Punch', 12, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target', 'Ice Punch Freezes the target on 19-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (256, 'Ice Shard', 12, '1d12+6', 'At-Will', 2, 0, 'Ranged (10), 1 Target, Interrupt', 'If a foe wants to declare a Move, you may instead use Ice Shard on their turn before they can use their Move.', 'Beauty', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (257, 'Icicle Crash', 12, '3d12+14', 'Battle', 4, 0, 'Ranged (6), 1 Target', 'Icicle Crash Flinches the target on 15-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (258, 'Icicle Spear', 12, '1d10+4', 'EOT', 4, 0, 'Ranged (6), 1 Target, Scatter', 'Icicle Spear can hit up to 5 times. Once the user misses, they cannot attempt to make another Icicle Spear attack on that turn.', 'Beauty', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (259, 'Icy Wind', 12, '2d10+8', 'EOT', 3, 1, 'Ranged (6), 1 Target, Column', 'Icy Wind creates a Column 1-meter wide. All Legal Targets have their Speed lowered 1 Combat Stage.', 'Beauty', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (260, 'Mist', 12, '-', 'At-Will', 0, 2, 'Ranged (5), 1 Target, Coat', 'The target with Mist''s Coat may not have their Combat Stages lowered. Mist users can Target Self.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (261, 'Powder Snow', 12, '1d12+6', 'At-Will', 2, 1, 'Ranged (3), 1 Target, Column', 'Powder Snow creates a 1-meter wide. Powder Snow Freezes all Legal Targets on 19-20 during Accuracy Check. *Grants: Freezer', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (262, 'Sheer Cold', 12, '-', 'Center', 16, 2, 'Ranged (4), 1 Target, Blast', 'Sheer Cold creates 3-meter Blast. All Legal Targets have their HP set to 0. *Grants: Freezer', 'Beauty', 2, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (263, 'Acupressure', 2, '-', 'EOT', 2, 2, 'Melee, 1 Target or Target Self', 'Roll 1d6. On a result of 1, raise the target''s Attack 2 Combat Stages. On a result of 2, raise the target''s Defense 2 Combat Stages. On a result of 3, raise the target''s Special Attack 2 Combat Stages. On a result of 4, raise the target''s Special Defense 2 Combat Stages. On a result of 5, raise the target''s Speed 2 Combat Stages. On a result of 6, the target needs -2 to hit during Accuracy Checks.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (264, 'After You', 2, '-', 'Center', 0, 2, 'Self , 1 Target', 'The target goes first during the next round of combat, ignoring Speed stats. They may not be Interrupted by any Moves that round.', 'Smart', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (265, 'Assist', 2, '-', 'Battle', 0, 2, 'Self, No Target', 'Randomly select another pokemon on the user''s roster and then randomly select a Move that Pokemon knows. Assist''s user uses that Move immediatley.', 'Cute', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (266, 'Attract', 2, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target', 'Attract Infatuates the target. Attract may not affect something that is the same gender as the user or something that is genderless.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (267, 'Barrage', 2, '1d6+3', 'EOT', 4, 0, 'Ranged (8), 1 Target, Scatter', 'Barrage can hit up to 5 times. Once the user misses, they cannot attempt to make another Barrage attack on that turn.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (268, 'Baton Pass', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'The user is replaced with another pokemon from their trainer''s roster. All Combat Stages and Coats on Baton Pass'' user are transferred to the replacement. Baton Pass can ignore Traps, but the replacement is then Trapped.', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (269, 'Belly Drum', 2, '-', 'Battle', 0, 2, 'Self, 1 Target', 'Belly Drum''s user loses HP equal to half of its full HP. Do not appliy the user''s stats to the HP lost. Belly Drum sets the user''s Attack to +6 Combat Stages.', 'Cute', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (270, 'Bestow', 2, '-', 'Battle', 2, 2, 'Ranged (4), 1 Target', 'The user gives its held item to the target, unless the target is already holding an item.', 'Cute', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (271, 'Bide', 2, '-', 'Battle', 0, 2, 'Ranged (15), 1 Target, Intercept', 'You may use Bide as an Intercept upon being targeted by a Move. After declaring the use of Bide, the user ends their turn. At the start of their next turn, end their turn. On the turn after that, add up all of the damage the user has taken in the past 2 turns, call that total X. Bide''s Target loses HP equal to twice the value of X. Do not apply weakness or resistance to the HP lost as a result of Bide. Do not apply stats to the HP lost as a result of Bide. Bide cannot miss.', 'Tough', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (300, 'Entrainment', 2, '-', 'Battle', 2, 2, 'Ranged (10), 1 Target', 'Entrainment changes one of the target''s abilities into one Ability that the user has for 1d4+1 turns.', 'Cute', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (272, 'Bind', 2, '1d6+3', 'EOT', 4, 0, 'Melee, 1 Target, Trap', 'Bind Traps the target and the user for 1d4+1 turns. At the beginning of the target''s turn, if the target is Trapped, roll 1d12 and the target loses that much HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Bind may not trap more then one target at a time unless the User is Huge or Gigantic.', 'Tough', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (273, 'Block', 2, '-', 'Battle', 2, 2, 'Melee, 1 Target, Trap', 'Both the user and the target are Trapped.', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (274, 'Body Slam', 2, '3d12+14', 'EOT', 2, 0, 'Melee, 1 Target', 'Body Slam Paralyzes the target on 15-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (275, 'Camouflage', 2, '-', 'EOT', 0, 2, 'Self, 1 Target', 'The user changes their Type to match the field. Forests and grassy areas change the user into Grass-Type. Watery areas change the user into Water-Type. Caves and Mountains could change the user into Rock-Type or Ground-Type. An icy terrain would turn the user into Ice- Type. A building may change the user into Steel-Type or Normal-Type. Weather affects what Type the user becomes. Use common sense, if you are having difficult determining what type the user should become, consult the GM. *Grants: Blender', 'Smart', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (276, 'Captivate', 2, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target', 'Captivate lowers the target''s Special Attack 2 Combat Stages. Captivate may not affect something that is the same gender as the user or something that is genderless.', 'Beauty', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (277, 'Charm', 2, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target', 'Charm lowers the target''s Attack 2 Combat Stages.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (278, 'Chip Away', 2, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target', 'Ignore any changes in the target''s Defense or Special Defense when calculating damage.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (279, 'Comet Punch', 2, '1d6+3', 'EOT', 4, 0, 'Melee, 1 Target, Scatter', 'Comet Punch can hit up to 5 times. Once the user misses, they cannot attempt to make another Comet Punch attack on that turn.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (280, 'Constrict', 2, '1d6+1', 'At-Will', 2, 0, 'Melee, 1 Target', 'Constrict lowers the target''s Speed 1 Combat Stage.', 'Tough', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (281, 'Conversion', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'The user becomes the elemental Type of their choice as long as they have a Move that is the same elemental Type until the end of the encounter. Replace all other Types.', 'Beauty', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (282, 'Conversion2', 2, '-', 'At-Will', 0, 2, 'Self, 1 Target', 'The user becomes the elemental Type of their choice as long as the Type resists the elemental Type of the Move it last took damage from until the end of the encounter. Replace all other Types.', 'Beauty', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (283, 'Copycat', 2, '-', 'Center', 0, 2, 'Ranged (15), 1 Target', 'Use the Move the target has used on their last turn. You may choose new targets for the Move. Copycat cannot miss.', 'Cool', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (284, 'Covet', 2, '2d10+8', 'Battle', 2, 0, 'Melee, 1 Target', 'Covet takes the target''s held item and attaches it to Covet''s user, if the user is not holding anything.', 'Cute', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (285, 'Crush Claw', 2, '3d10+12', 'EOT', 3, 0, 'Melee, 1 Target, Dash', 'Crush Claw lowers the target''s Defense 1 Combat Stage on 11-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (286, 'Crush Grip', 2, '5d12+18', 'Battle', 2, 0, 'Melee, 1 Target', 'For every 10% the target is below their full HP, Crush Grip''s Damage Dice Roll is reduced by 1d12 to a minimum of 18.', 'Tough', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (287, 'Cut', 2, '2d8+6', 'At-Will', 3, 0, 'Melee, 1 Target', '-', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (288, 'Defense Curl', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'Defense Curl raises the user''s Defense 1 Combat Stage. If the user uses the Move Ice Ball or Rollout later in the encounter without having been switched out, each hit deals an additional 1d12+4 during Damage Dice Roll. The extra damage bonus for Ice Ball or Rollout does not stack.', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (289, 'Disable', 2, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target', 'Name a Move. For the remainder of the encounter, the target may not use that Move; the Move is considered Disabled. A target may not have more then 1 Move Disabled, if a new move is Disabled, the last Disabled Move is no longer Disabled.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (290, 'Dizzy Punch', 2, '3d8+10', 'Battle', 2, 0, 'Melee, 1 Target, Push', 'The target is Pushed 2-meters. Dizzy Punch Confuses the target on 17-20 during Accuracy Check.', 'Cool', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (291, 'Double Hit', 2, '1d12+6', 'EOT', 3, 0, 'Melee, 1 Target, Scatter', 'Double Hit can hit up to 2 times. If Double Hit misses its first target, you may still use it a second time.', 'Smart', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (292, 'Double Team', 2, '-', 'Center', 0, 2, 'Self, No Target', 'The user makes three copies of themselves and places them into the encounter adjacent to the user. The user must place some sign under the token of the original copy to mark it as the original. If a copy is hit by a damaging Move, it is destroyed. If the original is hit by a damaging Move, all copies are destroyed. Any copy can perform a Move but the user is still only allowed one Move per turn. All copies may shift each turn. When the user and its copies are targeted by a Move, foes must roll +2 during Accuracy Check to hit for the remainder of the encounter. When a copy disappears, the user loses 1d6 HP. Do not apply weakness or resistance to HP lost. Do not apply stats to HP lost.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (293, 'Double Edge', 2, '5d12+18', 'EOT', 2, 0, 'Melee, 1 Target, Dash, Push, Recoil 1/3', 'The target is pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. After Double-Edge deals damage, Recoil.', 'Tough', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (294, 'Doubleslap', 2, '1d6+1', 'EOT', 4, 0, 'Melee, 1 Target, Scatter', 'Doubleslap can hit up to 5 times. Once the user misses, they cannot attempt to make another Doubleslap attack on that turn.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (295, 'Echoed Voice', 2, '1d12+6', 'At-Will', 2, 1, 'Ranged (10), 1 Target', 'For every consecutive use of Echoed Voice, add 1d12 to its Damage Dice Roll to a maximum of 6d12+6. Consecutive uses of Echoed Voice can be used across different Pokemon. If Echoed Voice is not used at least once every turn, the â€œconsecutive usesâ€ of Echoed Voice are reset.', 'Smart', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (296, 'Egg Bomb', 2, '4d12+16', 'Battle', 6, 0, 'Ranged (8), 1 Target, Blast', 'Egg Bomb creates a 2-meter Blast.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (297, 'Encore', 2, '-', 'Center', 2, 2, 'Ranged (10), 1 Target', 'The target must use the same Move that it most recently used for the next 1d2+1 turns. If the Frequency of the move doesn''t allow the Move to be used so often, the target instead cannot use a Move.', 'Cute', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (298, 'Endeavor', 2, '-', 'Center', 2, 2, 'Melee, 1 Target, Dash', 'The target''s HP is set to equal the user''s HP if the user''s current HP is less then the target''s current HP. If the user''s HP is equal to or greater than the target''s HP nothing happens.', 'Tough', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (299, 'Endure', 2, '-', 'Center', 0, 2, 'Self, No Target, Intercept', 'If the user is being hit by a damaging Move, you may use Endure. If the Move would bring Endure''s user down to 0 HP or less, Endure''s user instead is set to 1 HP.', 'Tough', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (301, 'Explosion', 2, '6d20+55', 'Center', 2, 0, 'Ranged (7), No Target, Burst', 'Explosion creates a 7-meter Burst. The user''s HP is set to -50% of their full HP. If the user is above Loyalty 1, their Loyalty is lowered at least 1 stage.', 'Beauty', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (302, 'Extremespeed', 2, '3d10+12', 'Battle', 2, 0, 'Melee, 1 Target, Dash, Interrupt', 'If a foe wants to declare a Move, you may instead use Extremespeed on their turn before they can use their Move. Extremespeed may not be Interrupted. After the user finishes the damage step of their turn, they may shift again.', 'Cool', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (303, 'Facade', 2, '3d8+10', 'EOT', 2, 0, 'Melee , 1 Target', 'If the user is afflicted with a Status effect, use 5d12+22 instead for Damage Dice Roll. If the user is afflicted with a Status effect, FaÃ§ade''s Frequency drops (EOT to Battle or At-Will to EOT).', 'Cute', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (304, 'Fake Out', 2, '1d12+6', 'Battle', 2, 0, 'Melee, 1 Target, Interrupt', 'You may only use Fake Out at the beginning of an encounter, as an Interrupt. Fake Out Flinches the target.', 'Cute', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (305, 'False Swipe', 2, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target, Pass', 'If False Swipe would lower the target to 0 HP or less, the target is instead set to 1 HP unless the target was already below 0 HP.', 'Cool', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (306, 'Feint', 2, '1d10+4', 'Center', 2, 0, 'Melee, 1 Target, Interrupt', 'Feint may only Interrupt Intercepts. If used as an Interrupt, the target flips a coin, if they win the flip, they may retain the use of their Intercept for the encounter as if they did not use it during the encounter. If the target loses the flip, they use up their Intercept. Feint ignores all Intercept effects, dealing damage as if the Intercept was not used.', 'Beauty', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (307, 'Flail', 2, 'See Effect', 'EOT', 2, 0, 'Melee, 1 Target', 'If the user has more than 70% of its total HP, use 1d10+5 for Damage Dice Roll. If the user has more than 36% of its total HP, use 2d10+10. If the user has more than 21% of its total HP, use 3d10+10. If the user has more than 6% of its total HP, use 4d10+10. If the user has 1-5% of its total HP, use 5d10+20', 'Cute', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (308, 'Flash', 2, '-', 'EOT', 2, 2, 'Ranged (4), No Target, Burst', 'Flash creates a 4-meter Burst. Flash makes all Legal Targets need +1 to hit during Accuracy Checks. *Grants: Glow', 'Beauty', 1, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (309, 'Focus Energy', 2, '-', 'At-Will', 0, 2, 'Self, No Target, Coat', 'The user''s Moves are Critical Hits on 17-20. If a Move already has an extended Critical Hit range, Focus energy extends that range by -3. Focus Energy''s effect cannot be used more then once per encounter unless the user somehow loses the benefit of Focus Energy.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (310, 'Follow Me', 2, '-', 'Center', 0, 2, 'Self, No Target, Intercept', 'All Foes may only target the user when using a Move until the user is knocked out or switched out. This Effect lasts for one round of combat.', 'Cute', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (311, 'Foresight', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'The user''s Normal-Type and Fighting-Type Moves can now hit and affect Ghost-Type targets. Foresight''s user is unaffected by the effects of Moves which make them have to roll higher during Accuracy Checks to hit. Targets may not use their Speed stat to modify Accuracy Checks. Foresight''s user can identify the real target using Double Team.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (312, 'Frustration', 2, '4d12+16', 'Battle', 2, 0, 'Melee, 1 Target', 'The user may only use Frustration if its Loyalty is level 0 or 1.', 'Cute', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (313, 'Fury Attack', 2, '1d6+3', 'EOT', 4, 0, 'Melee, 1 Target, Scatter', 'Fury Attack can hit up to 5 times. Once the user misses, they cannot attempt to make another Fury Attack attack on that turn.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (314, 'Fury Swipes', 2, '1d6+3', 'EOT', 4, 0, 'Melee, 1 Target, Scatter', 'Fury Swipes can hit up to 5 times. Once the user misses, they cannot attempt to make another Fury Swipes attack on that turn.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (315, 'Giga Impact', 2, '7d10+28', 'Center', 4, 0, 'Melee, 1 Target, Dash, Burst, Exhaust', 'Giga Impact creates a 3-meter Burst around the target. On Miss, Giga Impact deals the user''s Attack instead to all possible targets.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (316, 'Glare', 2, '-', 'At-Will', 3, 2, 'Ranged (5), 1 Target', 'Glare Paralyzes the target. Glare''s user may not successfully use Glare more then three times per encounter.', 'Tough', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (317, 'Growl', 2, '-', 'At-Will', 2, 2, 'Ranged (5), No Target, Burst', 'Growl creates a 5-meter Burst. Growl lowers all Legal Targets Attack 1 Combat Stage.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (318, 'Growth', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage and raise the user''s Special Attack 1 Combat Stage. If it is Sunny, double the amount of Combat Stages gained. *Grants: Inflatable', 'Beauty', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (319, 'Guillotine', 2, '-', 'Center', 15, 2, 'Melee, 1 Target', 'The target is set to 0 HP.', 'Cool', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (320, 'Harden', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'Raise the user''s Defense 1 Combat Stage.', 'Tough', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (321, 'Headbutt', 2, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Dash', 'Headbutt Flinches the target on 15-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (322, 'Head Charge', 2, '5d12+18', 'EOT', 2, 0, 'Melee, 1 Target, Dash, Push, Recoil 1/4', 'The target is Pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. After Head Charge deals damage, Recoil.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (323, 'Heal Bell', 2, '-', 'Center', 0, 2, 'Ranged (3), No Target, Burst', 'Heal Bell creates a 3-meter Burst. All targets are cured of any Status ailments. Heal Bell cannot miss.', 'Beauty', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (324, 'Helping Hand', 2, '-', 'EOT', 0, 2, 'Melee, 1 Target', 'The ally targeted with Helping Hand will have their next Move deal an additional 1d20 if the Move has a Damage Dice Roll. Helping Hand cannot miss.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (354, 'Perish Song', 2, '-', 'Center', 0, 2, 'Ranged (15), No Target, Burst', 'Perish Song creates a 15-meter Burst. Perish Song cannot miss. Perish Song can affect only pokemon. All targets, including the user, receive a Perish Count of 3. At the beginning of each of the target''s turns, their Perish count is lowered by 1. Once a Perish Count reaches 0, set the pokemon''s HP to 0. A Perish Count disspears if a Pokemon returns to their Poke Ball or is knocked out.', 'Beauty', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (325, 'Hidden Power', 2, 'See Effect', 'EOT', 2, 1, 'Ranged (3), No Target, Burst', 'Hidden Power makes a 3-meter Burst. When a pokemon first obtains the Move Hidden Power, roll 1d4 and 1d20. For the 1d4 roll, a result of 1 makes Hidden Power''s Damage Dice Roll 1d12+6; a result of 2 makes the Damage Dice Roll 2d8+6; a result of 3 makes the Damage Dice Roll 2d10+8; a result of 4 makes the Damage Dice Roll 3d8+10. For the 1d20 roll, Hidden Power''s Elemental Type will be changed from Normal to Bug on a result of 1; Dark on 2; Dragon on 3; Electric on 4; Fighting on 5; Fire on 6; Flying on 7; Ghost on 8; Grass on 9; Ground on 10; Ice on 11; Normal on 12; Poison on 13; Psychic on 14; Rock on 15; Steel on 16; Water on 17; and on a result of 18-20, reroll the d20. Those become the Hidden Power''s permanent stats for that user.', 'Smart', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (326, 'Horn Attack', 2, '3d8+10', 'At-Will', 2, 0, 'Melee, 1 Target, Dash', '-', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (327, 'Horn Drill', 2, '-', 'Center', 15, 2, 'Melee, 1 Target', 'The target is set to 0 HP.', 'Cool', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (328, 'Howl', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat stage.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (329, 'Hyper Beam', 2, '7d10+28', 'Center', 4, 1, 'Ranged (15), 1 Target, Column, Exhaust', 'Hyper Beam creates a Column 1 meter wide. On Miss, Hyper Beam deals the user''s Special Attack instead to all possible targets.', 'Cool', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (330, 'Hyper Fang', 2, '3d10+12', 'EOT', 4, 0, 'Melee, 1 Target', 'Hyper Fang Flinches the target on 19-20 during Accuracy Check.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (331, 'Hyper Voice', 2, '3d12+14', 'Battle', 2, 1, 'Ranged (4), 1 Target, Column, Push', 'Hyper Voice creates a Column 4-meters wide. All Legal Targets are Pushed back 3-meters.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (332, 'Judgement', 2, '4d12+16', 'Center', 2, 1, 'Ranged (25), 1 Target, Blast', 'Judgement makes a 5-meter Blast. Judgment''s Type can be whatever Elemental Type the user wants it to be.', 'Smart', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (333, 'Last Resort', 2, '6d12+22', 'Battle', 2, 0, 'Melee, 1 Target, Dash', 'Last Resort can only be used after the user has performed 6 other different Moves during the same encounter.', 'Cute', 2, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (334, 'Leer', 2, '-', 'At-Will', 2, 2, 'Ranged (5), 1 Target', 'The target''s Defense is lowered 1 Combat Stage.', 'Cool', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (335, 'Lock On', 2, '-', 'Center', 0, 2, 'Ranged (25), 1 Target', 'The target is Locked-On. The next Move that the User uses against the Target that requires an Accuracy Check cannot miss. Lock-On''s effect, on both the User and Target, can be affected by Baton Pass.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (336, 'Lovely Kiss', 2, '-', 'Battle', 2, 2, 'Melee, 1 Target', 'The target falls Asleep.', 'Beauty', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (337, 'Lucky Chant', 2, '-', 'At-Will', 0, 2, 'Ranged (4), No Target, Burst', 'Lucky Chant creates a 4-meter Burst. All allies in the Burst, including the user, take damage from Critical Hits as if they are not Critical Hits for 1d4+1 turns.', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (338, 'Me First', 2, '-', 'Center', 0, 2, 'Self, 1 Target, Interrupt', 'If the target declares a Move that has a Damage Dice Roll and Me First''s user has a higher Speed stat then the target, you may Interrupt with Me First. Me First will use the same Move the target was about to use on that target.', 'Cute', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (339, 'Mean Look', 2, '-', 'Battle', 0, 2, 'Ranged (6), 1 Target', 'The target may not flee or be switched until it is knocked out, for the remainder of the encounter.', 'Beauty', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (340, 'Mega Kick', 2, '5d12+18', 'Center', 6, 0, 'Melee, 1 Target, Dash, Push', 'The target is Pushed 6-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (341, 'Mega Punch', 2, '3d10+12', 'EOT', 4, 0, 'Melee, 1 Target', '-', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (342, 'Metronome', 2, '-', 'Battle', 0, 2, 'Self, No Target', 'Metronome randomly uses any other Move except for After You, Assist, Bestow, Copycat, Counter, Covet, Destiny Bond, Detect, Endure, Feint, Focus Punch, Follow Me, Helping Hand, Metronome, Me First, Mimic, Mirror Coat, Mirror Move, Protect, Quash, Quick Guard, Rage Powder, Sketch, Sleep Talk, Snatch, Snore, Switcheroo, Thief, Transform, Trick, Wide Guard. The GM helps to pick the random Move.', 'Cute', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (343, 'Milk Drink', 2, '-', 'Center', 0, 2, 'Melee, 1 Target', 'The target regains HP equal to half of its full HP. The user may target themselves with Milk Drink.', 'Cute', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (344, 'Mimic', 2, '-', 'Battle', 0, 2, 'Ranged (15), 1 Target', 'Choose a Move that the target has used during the encounter. For the remainder of the encounter, that Move replaces Mimic on the user''s Move List. Mimic cannot miss.', 'Cute', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (345, 'Mind Reader', 2, '-', 'Center', 0, 2, 'Ranged (10), 1 Target', 'The target is Locked-On. The next Move that the User uses against the Target that requires an Accuracy Check cannot miss. Mind Reader''s effect, on both the User and Target, can be affected by Baton Pass.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (346, 'Minimize', 2, '-', 'Center', 0, 2, 'Self, No Target', 'Foes need an additional +4 during Accuracy Check to hit Minimize''s user and the user''s size is Small for the remainder of the encounter. *Grants: Shrinkable', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (347, 'Moonlight', 2, '-', 'Center', 0, 2, 'Self, No Target', 'The user regains HP equal to half of its full HP. If it is Sunny, the user gains 2/3 of its full HP. If it is Rainy, Sand Storming or Hailing the user gains Â¼ of their full HP.', 'Beauty', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (348, 'Morning Sun', 2, '-', 'Center', 0, 2, 'Self, No Target', 'The user regains HP equal to half of its full HP. If it is Sunny, the user gains 2/3 of its full HP. If it is Rainy, Sand Storming or Hailing the user gains Â¼ of their full HP.', 'Beauty', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (349, 'Natural Gift', 2, 'See Effect', 'Battle', 2, 1, 'Ranged (10), 1 Target, Berry', 'Refer to the Move Keywords Berry list. Natural Gift deals damage according to the Berry list and Natural Gift''s Type is also defined there. The user''s Berry is destroyed and is not consumed. *Grants: Sprouter', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (351, 'Odor Sleuth', 2, '-', 'At-Will', 0, 2, 'Ranged, 1 Target', 'The user''s Normal-Type and Fighting-Type Moves can now hit and affect Ghost-Type targets. Odor Sleuth''s user is unaffected by the effects of Moves which make them have to roll higher during Accuracy Checks to hit. Targets may not use their Speed stat to modify Accuracy Checks. Odor Sleuth''s user can identify the real target using Double Team. *Grants: Tracker', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (352, 'Pain Split', 2, '-', 'Battle', 0, 2, 'Ranged (4), 1 Target', 'Add the user''s and the target''s current HP together and divide the value by 2, calling the result X. The user and target''s HP are set to X. If X exceeds a target''s or user''s full HP, the excess is ignored and they are set to full HP.', 'Smart', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (353, 'Pay Day', 2, '1d12+6', 'Center', 2, 0, 'Ranged (8), 1 Target', 'Pay Day scatters metal coins equal in value to 1d8 times the user''s level. If it is a trainer battle, the winner of the battle gets to pick up the coins.', 'Smart', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (356, 'Present', 2, 'See Effect', 'EOT', 3, 0, 'Ranged (8), 1 Target', 'Roll 1d4. On a result of 1, use 1d10+10 for Present''s Damage Dice Roll; on a result of 2, use 2d10+10; on a result of 3, use 3d10+10; on a result of 4 the target is healed 65 HP.', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (357, 'Protect', 2, '-', 'Center', 0, 2, 'Self, No Target, Intercept', 'If the user is hit by a Move, instead you are not hit by the Move. You do not take any damage nor are you affected by any of the Move''s effects.', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (358, 'Psych Up', 2, '-', 'Battle', 0, 2, 'Ranged (10), 1 Target', 'The user''s Combat Stages are changed to match the target''s Combat Stages. Psych Up cannot miss.', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (359, 'Quick Attack', 2, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target, Interrupt', 'If a foe wants to declare a Move, you may instead use Quick Attack on their turn before they can use their Move.', 'Cool', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (360, 'Rage', 2, '1d6+3', 'At-Will', 2, 0, 'Melee, 1 Target, Spirit Surge', 'The user''s Attack is raised 1 Combat Stage as long as they used Rage on their previous turn. If the user is damaged by an attack before it''s next turn, its Attack is raised 1 Combat Stage.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (361, 'Rapid Spin', 2, '1d6+3', 'At-Will', 2, 0, 'Melee, 1 Target', 'On hit, Rapid Spin destroys Hazards within 5 meters, removes Leech Seeds, and removes the user''s Trapped status.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (362, 'Razor Wind', 2, '3d10+12', 'Battle', 2, 1, 'Ranged (15), 1 Target', 'Once you declare the use of Razor Wind, the user''s turn ends. On its next turn, the user may shift and use Razor Wind''s damage. Razor Wind is a Critical Hit on 18-20 during Accuracy Check.', 'Cool', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (363, 'Recover', 2, '-', 'Center', 0, 2, 'Self, No Target', 'The user regains HP equal to half of its full HP.', 'Smart', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (364, 'Recycle', 2, '-', 'Center', 0, 2, 'Self, No Target', 'The effect of a consumable item used earlier in the encounter is used again as if it had not been destroyed. The item is still gone.', 'Smart', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (365, 'Reflect Type', 2, '-', 'Battle', 2, 2, 'Ranged (10), 1 Target', 'Reflect Type changes one of the user''s Types into one Type of your choice that the target has for 1d4+1 turns.', 'Beauty', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (366, 'Refresh', 2, '-', 'Battle', 0, 2, 'Self, No Target', 'The user is cured of all Status ailments.', 'Cute', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (367, 'Relic Song', 2, '3d10+12', 'Battle', 2, 1, 'Ranged (4), No Target, Burst', 'Relic Song creates a 4-meter Burst. All Legal Targets fall Asleep on 16-20 during Accuracy Check.', 'Beauty', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (368, 'Retaliate', 2, '3d8+10', 'Center', 2, 0, 'Melee, 1 Target', 'Retaliate deals 6d12+22 instead for Damage Dice Roll if an ally has been lowered to 0 HP or less by the target''s Moves (or Features) during the current round of combat or during the last round of combat.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (369, 'Return', 2, '4d12+16', 'EOT', 2, 0, 'Melee, 1 Target', 'The user may only use Return if its Loyalty is 3 or 4.', 'Cute', 1, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (370, 'Roar', 2, '-', 'Battle', 11, 2, 'Ranged (6), 1 Target', 'The target flees away from the user 15 meters, ignoring Speed Capabilities, if terrain allows. The target may not use Moves for 4 rounds. During a trainer battle, the target''s owner must recall the fleeing target and replace them.', 'Cool', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (371, 'Rock Climb', 2, '3d12+14', 'Battle', 5, 0, 'Melee, 1 Target, Dash', 'Rock Climb Confuses the target on 17-20 during Accuracy Checks.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (372, 'Round', 2, '2d10+8', 'EOT', 2, 1, 'Ranged (3), No Target, Burst', 'Round creates a 3-meter Burst. The next Pokemon who uses Round during this round of Combat uses 3d10+16 for Round''s Damage Dice Roll. The third or any use after the third use of Round during this round of Combat uses 4d10+24 for Round''s Damage Dice Roll.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (373, 'Safeguard', 2, '-', 'At-Will', 0, 2, 'Ranged (2), No Target, Wall', 'Place 10-meters of Wall that can be passed through and attacked through. If the effect of a Move that targets through any Walls of Safeguard cause a Status Affliction, they cannot cause a Status Affliction. The Walls sustain for 5 rounds.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (374, 'Scary Face', 2, '-', 'EOT', 2, 2, 'Ranged (6), 1 Target', 'The target''s Speed is lowered 2 Combat Stages.', 'Tough', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (375, 'Scratch', 2, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target, Pass', '-', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (376, 'Screech', 2, '-', 'EOT', 4, 2, 'Ranged (4), No Target, Burst', 'Screech creates a 4-meter Burst. All Legal Targets have their Defense lowered 2 Combat Stages.', 'Smart', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (377, 'Secret Power', 2, '3d8+10', 'EOT', 2, 1, 'Ranged (8), 1 Target, Environ', 'Secret Power''s effect depends on Environ. Secret Power''s effect activates on 17-20 during Accuracy Check. *Grants: Sprouter', 'Smart', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (378, 'Selfdestruct', 2, '10d10+46', 'Center', 2, 0, 'Ranged (4), No Target, Burst', 'Selfdestruct creates a 4-meter Burst. The user''s HP is set to -50% of their full HP. If the user is above Loyalty 1, their Loyalty is lowered at least 1 stage.', 'Beauty', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (379, 'Sharpen', 2, '-', 'At-Will', 0, 2, 'Self, 1 Target', 'Raise the user''s Attack 1 Combat Stage.', 'Cute', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (380, 'Shell Smash', 2, '-', 'Center', 0, 2, 'Self, No Target', 'Raise the user''s Attack 2 Combat Stages, raise the user''s Special Attack 2 Combat Stages and raise the user''s Speed 2 Combat Stages Lower the user''s Defense 1 Combat Stage and lower the user''s Special Defense 1 Combat Stage.', 'Tough', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (381, 'Simple Beam', 2, '-', 'Battle', 2, 2, 'Ranged (7), 1 Target', 'Simple Beam changes one of the target''s abilities to Simple for the remainder of the encounter.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (382, 'Sing', 2, '-', 'Battle', 11, 2, 'Ranged (4), No Target, Burst', 'Sing creates a 4-meter Burst. All Legal Targets fall Asleep.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (383, 'Sketch', 2, '-', 'Center', 0, 2, 'Ranged (25), 1 Target', 'Sketch cannot miss. Once Sketch has been used, remove Sketch from the user''s Move list. The last Move that the target used is added to the user''s Move list permanently. Sketch may not be Interrupted or Intercepted.', 'Smart', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (384, 'Skull Bash', 2, '4d12+16', 'Battle', 2, 0, 'Melee, 1 Target, Dash, Push', 'Once you declare the use of Skull Bash, the user''s turn ends. On its next turn, the user may shift and use Skull Bash''s damage and effect. The target is Pushed 4-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6.', 'Tough', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (385, 'Slack Off', 2, '-', 'Center', 0, 2, 'Self, No Target', 'The user regains HP equal to half of its full HP.', 'Cute', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (386, 'Slam', 2, '3d10+12', 'EOT', 6, 0, 'Melee, 1 Target, Dash', '-', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (387, 'Slash', 2, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Pass', 'Slash is a Critical Hit on 18-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (388, 'Sleep Talk', 2, '-', 'Battle', 0, 2, 'Self, No Target', 'The user randomly uses one of their other Moves, ignoring Frequencies. Sleep Talk can only be used while the user is Asleep.', 'Cute', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (389, 'SmellingSalt', 2, '2d10+8', 'Battle', 2, 0, 'Melee, 1 Target', 'If the target is Paralyzed, SmellingSalt does 4d12+16 instead for Damage Dice Roll and cures the target of Paralysis.', 'Smart', 0, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (390, 'Smokescreen', 2, '-', 'EOT', 0, 2, 'Ranged (3), No Target, Wall', 'Place 5-meters of Wall that can be passed through and attacked through. Smokescreen''s Walls must be placed within 3-meters of the user. If anyone''s Move tries to target through a Smokescreen wall, they must roll +3 during Accuracy Check to hit. The walls remain for 10 rounds. Brick Break cannot break Smokescreen''s Walls.', 'Smart', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (391, 'Snore', 2, '1d12+6', 'EOT', 2, 1, 'Ranged (5), No Target, Burst', 'Snore creates a 5-meter Burst. Snore Flinches all legal targets on 15-20 during Accuracy Check. Snore can only be used by a Sleeping pokemon.', 'Cute', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (392, 'Softboiled', 2, '-', 'Center', 0, 2, 'Melee, 1 Target', 'The target regains HP equal to half of its full HP. The user may target themselves with Softboiled.', 'Beauty', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (393, 'Sonicboom', 2, '15', 'EOT', 6, 2, 'Ranged (4), 1 Target, Column', 'Sonicboom creates a Column 1 meter wide. Sonicboom always deals 15 points of Damage. Do not apply weakness or resistance. Do not apply stats.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (394, 'Spike Cannon', 2, '1d6+3', 'EOT', 4, 0, 'Ranged (6), 1 Target, Scatter', 'Spike Cannon can hit up to 5 times. Once the user misses, they cannot attempt to make another Spike Cannon attack on that turn.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (395, 'Spit Up', 2, 'See Effect', 'Battle', 2, 1, 'Ranged (8), 1 Target', 'If the user is Stockpiled 1, use 3d10+12 for Spit Up''s Damage Dice Roll; if the user is Stockpiled 2, use 4d12+16; if the user is Stockpiled 3, use 5d12+18. After using Spit Up, the user''s Stockpiled count is set to 0. If the user has no Stockpiled count, Spit Up does nothing.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (396, 'Splash', 2, '-', 'At-Will', 0, 2, 'Self, No Target', '-', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (397, 'Stockpile', 2, '-', 'At-Will', 0, 2, 'Self, No Target', 'The user adds 1 to their Stockpiled count to a maximum of 3. For each number a Stockpiled count is above 0, raise the user''s Defense 1 Combat Stage and raise the user''s Special Defense 1 Combat Stage. If a Stockpiled count is set to 0, the Combat Stages gained from the Stockpiled count are removed. Stockpile may not be used unless the user knows Spit Up or Swallow. *Grants: Inflatable', 'Tough', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (398, 'Stomp', 2, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Dash', 'Stomp Flinches the target on 15-20 during Accuracy Check. If the target is Small, Stomp deals an additional 1d10.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (399, 'Strength', 2, '3d10+12', 'EOT', 4, 0, 'Melee, 1 Target, Push', 'The target is Pushed 8-meters. *Grants: +1 Power', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (400, 'Substitute', 2, '-', 'Battle', 0, 2, 'Self, No Target, Coat', 'The user loses Â¼ of their full HP. A Coat is made which has HP equal to the HP lost when using this Move +1. If the user would be hit by a Move, instead the Coat gets hit. Apply weakness, resistance and stats to the Coat. The Coat is immune to Status Afflictions. Substitute cannot be used if the user has less then Â¼ of their full HP.', 'Smart', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (401, 'Super Fang', 2, '-', 'Battle', 4, 2, 'Melee, 1 Target', 'The target''s HP is halved. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. When halving the target''s HP with Super Fang, round up.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (402, 'Supersonic', 2, '-', 'EOT', 11, 2, 'Ranged (6), 1 Target, Column', 'Supersonic creates a Column 1 meter wide. Supersonic Confuses all Legal Targets.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (403, 'Swagger', 2, '-', 'EOT', 4, 2, 'Ranged (8), 1 Target', 'The target''s Attack is raised 2 Combat Stages. Swagger Confuses the target.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (404, 'Swallow', 2, '-', 'Center', 0, 2, 'Self, No Target', 'If the user is Stockpiled 1, they are healed 25% of their full HP; if the user is Stockpiled 2, they are healed half of their full HP; if the user is Stockpiled 3, they are healed back to full HP. After using Swallow, the user''s Stockpiled count is set to 0. If the user has no Stockpiled count, Swallow does nothing.', 'Tough', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (405, 'Sweet Kiss', 2, '-', 'Battle', 6, 2, 'Ranged (8), 1 Target', 'Sweet Kiss Confuses the target.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (406, 'Sweet Scent', 2, '-', 'Battle', 2, 2, 'Ranged (5), No Target, Burst', 'Sweet Scent creates a 5-meter Burst. For the remainder of the encounter, when targeting any Legal Targets that were hit by Sweet Scent, you need -2 to hit that target during Accuracy Check. *Grants: Alluring', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (407, 'Swift', 2, '2d10+8', 'EOT', 0, 1, 'Ranged (10), 1 Target', 'Swift cannot Miss.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (408, 'Swords Dance', 2, '-', 'EOT', 0, 2, 'Self, No Target', 'The user''s Attack is raised 2 Combat Stages.', 'Beauty', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (409, 'Tackle', 2, '2d8+6', 'At-Will', 3, 0, 'Melee, 1 Target, Dash', '-', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (410, 'Tail Slap', 2, '1d10+4', 'EOT', 4, 0, 'Melee, 1 Target, Scatter', 'Tail Slap can hit up to 5 times. Once the user misses, they cannot attempt to make another Tail Slap attack on that turn.', 'Cute', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (411, 'Tail Whip', 2, '-', 'At-Will', 2, 2, 'Ranged (4), 1 Target', 'The target''s Defense is lowered 1 Combat Stage.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (412, 'Take Down', 2, '3d12+14', 'EOT', 5, 0, 'Melee, 1 Target, Dash, Recoil 1/4', 'After Take Down deals damage, Recoil.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (413, 'Techno Blast', 2, '3d12+18', 'Center', 2, 1, 'Ranged (10), 1 Target', 'Techno Blast''s Type can be any Type while holding the appropriate Drive item or Plate item.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (414, 'Teeter Dance', 2, '-', 'Battle', 2, 2, 'Ranged (7), No target, Burst', 'Teeter Dance creates a 7-meter Burst. Teeter Dance Confuses all Legal Targets.', 'Cute', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (415, 'Thrash', 2, '5d12+18', 'Center', 3, 0, 'Melee, 1 target', 'Thrash''s user must make another Melee attack for 1d2 more turns. The attack is identical to Thrash except for Thrash''s effect. After the first target is declared, Thrash targets the nearest Legal Target for its second or third round of use if the original target is unconscious. If potential targets are an equal distance from the user, you may choose the target. After Thrash''s additional use(s) end(s), the user becomes Confused. For Pokemon users, the additional 1d2 are their Trainer''s Command Actions, unless the Trainer is unconscious, in which case the Pokemon acts on its own until finished.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (416, 'Tickle', 2, '-', 'EOT', 2, 2, 'Melee, 1 Target', 'Lower the target''s Attack 1 Combat Stage and lower the target''s Defense 1 Combat Stage.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (417, 'Transform', 2, '-', 'Battle', 0, 2, 'Ranged (25), No Target', 'The user assumes the form of the Pokemon-target and learns all of that specific target''s Moves, gains its Abilitys, copies its weight and height and Capabilties for the remainder of the encounter, or until the user chooses to revert to its original form, or until the user uses Transform to change into something else. The user''s Stats do not change. Transform cannot miss.', 'Smart', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (418, 'Tri Attack', 2, '3d10+12', 'Battle', 2, 1, 'Ranged (8), 1 target', 'Tri Attack gives the target a Status ailment on 17-20 during Accuracy Check. If you rolled 17-20, roll 1d4; on 2 the target is Paralyzed; on 3 the target is Burned; on 4 the target is Frozen; on 1 reroll the die.', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (534, 'Shift Gear', 17, '-', 'Battle', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage and raise the user''s Speed 2 Combat Stages.', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (419, 'Trump Card', 2, 'See Effect', 'EOT', 2, 1, 'Ranged (10), 1 Target', 'If the user has only used Trump Card once this encounter, use 1d10+4 for Trump Card''s Damage Dice Roll. If it is the second time the user is using Trump Card, use 1d10+4. If it is the third or fourth time the user is using Trump Card, use 1d12+6. If it is the fifth time the user is using Trump Card, use 2d10+8. If it is the sixth time the user is using Trump Card, use 7d10+28 and Trump Card''s Frequency changes to Center for the rest of the encounter.', 'Cool', 0, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (420, 'Uproar', 2, '3d12+14', 'Battle', 2, 1, 'Ranged (5), No Target, Burst', 'Uproar creates a 5-meter Burst that continues for 1d4+1 turns. At the beginning of the user''s turn where Uproar is continuing, they may shift then must immediately use Uproar again. If the user does not continue using Uproar during the next round of combat, Uproar ends. Anyone in Uproar''s Burst on any turn Uproar is continuing is cured of Sleep.', 'Cute', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (421, 'Vicegrip', 2, '2d10+8', 'At-Will', 2, 0, 'Melee, 1 Target', '-', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (422, 'Weather Ball', 2, '2d8+6', 'Battle', 2, 1, 'Ranged (10), 1 Target', 'If it is Sunny, Weather Ball is Fire-Type. If it is Rainy, Weather Ball is Water-Type. If it is Hailing, Weather Ball is Ice-Type. If it is Sandstorming, Weather Ball is Rock-Type. When a weather effect is on the field, Weather Ball''s Damage Dice Roll is 4d12+16. If there are multiple Weather Effects on the field, choose one type for Weather Ball to be that corresponds with an existing Weather Effect.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (423, 'Whirlwind', 2, '-', 'Center', 2, 2, 'Ranged (6), 1 Target, Push', 'The target is Pushed 40-meters expelling them from the encounter if the terrain allows. They may still rejoin the encounter if they want to. During a trainer battle, the target''s owner must recall the Pushed target and replace them.', 'Smart', 0, 2);
INSERT INTO pokemondata2.pokemon_moves VALUES (424, 'Wish', 2, '-', 'Center', 0, 2, 'Ranged (15), 1 Target', 'At the end of the target''s next turn, the target regains HP equal to half of its full HP. If the user targets themselves and are replaced in battle, the replacement is healed.', 'Cute', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (425, 'Work Up', 2, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage and raise the user''s Special Attack 1 Combat Stage.', 'Tough', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (426, 'Wrap', 2, '1d6+3', 'EOT', 4, 0, 'Melee, 1 Target, Trap', 'Wrap Traps the target and the user for 1d4+1 turns. At the beginning of the target''s turn, if the target is Trapped, roll 1d12 and the target loses that much HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Wrap may not trap more then one target at a time unless the user is Huge or Gigantic.', 'Tough', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (427, 'Wring Out', 2, '5d12+18', 'Battle', 2, 0, 'Melee, 1 Target', 'For every 10% the target is below their full HP, Wring Out''s Damage Dice Roll is reduced by 1d12 to a minimum of 18.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (428, 'Yawn', 2, '-', 'Battle', 0, 2, 'Ranged (4), No Target, Burst', 'Yawn creates a 4-meter Burst. All targets fall Asleep at the end of their next turn. Yawn cannot miss.', 'Cute', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (429, 'Acid', 7, '1d12+6', 'At-Will', 2, 1, 'Ranged (6), 1 Target', 'Acid lowers the target''s Defense 1 Combat Stage on 18-20 during Accuracy Check.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (430, 'Acid Armor', 7, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Defense 2 Combat Stages.', 'Tough', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (431, 'Acid Spray', 7, '1d12+6', 'EOT', 2, 1, 'Ranged (3), 1 Target, Column', 'Acid Spray creates a Column 1 meter wide. Acid Spray lowers all Legal Targets'' Special Defense 2 Combat Stages.', 'Smart', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (433, 'Coil', 7, '-', 'Battle', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage and raise the user''s Defense 1 Combat Stage. For the remainder of Combat, the user needs -1 on Accuracy Checks to hit.', 'Cute', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (434, 'Cross Poison', 7, '3d8+10', 'EOT', 2, 0, 'Melee, 1 Target, Pass', 'Cross Poison is a Critical Hit on 18-20 during Accuracy Check. Cross Poison Poisons the target on a Critical Hit during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (435, 'Gastro Acid', 7, '-', 'Battle', 2, 2, 'Ranged (8), 1 Target', 'The target''s ability is disabled until the end of the encounter. If the target has more then one ability, Gastro Acid disables one of them.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (436, 'Gunk Shot', 7, '5d12+18', 'Center', 7, 0, 'Ranged (8), Target Area, Blast', 'Gunk Shot creates a 3-meter Blast. Gunk Shot Poisons all Legal Targets on 11-20 during Accuracy Check. On Miss, Gunk Shot deals the user''s Attack to potential targets but cannot Poison.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (437, 'Poison Fang', 7, '2d8+6', 'EOT', 2, 0, 'Melee, 1 Target', 'Poison Fang Badly Poisons the target on 17-20 during Accuracy Check.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (438, 'Poison Gas', 7, '-', 'EOT', 6, 2, 'Ranged (4), No Target, Burst', 'Poison Gas makes a 4-meter Burst. Poison Gas Poisons all Legal Targets.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (439, 'Poison Jab', 7, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target', 'Poison Jab Poisons the target on 15-20 during Accuracy Check.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (440, 'Poison Sting', 7, '1d6+3', 'At-Will', 2, 0, 'Ranged (6), 1 Target', 'Poison Sting Poisons the target on 17-20 during Accuracy Check.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (441, 'Poison Tail', 7, '2d8+6', 'At-Will', 2, 0, 'Melee, 1 Target, Pass', 'Poison Tail is a Critical Hit on 18-20 during Accuracy Check. Poison Tail Poisons the target on 19-20 during Accuracy Check.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (442, 'Poisonpowder', 7, '-', 'EOT', 6, 2, 'Ranged (4), 1 Target, Blast', 'Poisonpowder creates a 1-meter Blast. Poisonpowder Poisons all Legal Targets.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (443, 'Sludge', 7, '3d8+10', 'EOT', 2, 1, 'Ranged (8), 1 Target, Column', 'Sludge creates a Column 2-meters wide. Sludge poisons all Legal Targets on 15-20 during Accuracy Check.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (444, 'Sludge Bomb', 7, '3d12+14', 'Battle', 2, 1, 'Ranged (8), 1 Target, Blast', 'Sludge Bomb creates a 3-meter Blast. Sludge Bomb poisons all Legal Targets on 15-20 during Accuracy Check.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (445, 'Sludge Wave', 7, '4d12+16', 'Battle', 2, 1, 'Ranged (4), 1 Target', 'Sludge Wave makes a Column 4-meters wide. Slime Wave Poisons all legal targets on 19-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (446, 'Smog', 7, '1d6+3', 'EOT', 5, 1, 'Ranged (3), 1 Target, Blast', 'Smog creates a 3-meter Blast. Smog Poisons all Legal Targets on 13-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (447, 'Toxic', 7, '-', 'Battle', 4, 2, 'Ranged (4), 1 Target', 'The target is Badly Poisoned.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (448, 'Toxic Spikes', 7, '-', 'EOT', 0, 2, 'Field, Target Area, Hazard', 'Set 10 square meters of Toxic Spikes, all 10 meters must be adjacent with at least one other space of Toxic Spikes next to each other. Toxic Spikes Poisons a foe when joining the encounter or getting sent out. If there are 2 Layers of Toxic Spikes, it Deadly Poisons the foes instead.', 'Smart', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (449, 'Venoshock', 7, '3d8+10', 'Battle', 2, 1, 'Ranged (4), 1 Target', 'If the target is Poisoned, Venoshock has a Damage Dice Roll of 5d12+22 instead.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (450, 'Agility', 10, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Speed 2 Combat Stages.', 'Cool', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (451, 'Ally Switch', 10, '-', 'Battle', 0, 2, 'Self, 1 Target, Intercept', 'Choose one willing ally, shift the user''s position to the ally''s position and shift the ally''s position to the user''s position, trading places. If the ally was a target of a Move, the user is now the target. If the user was a target of a Move, the ally is now the target.', 'Cool', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (452, 'Amnesia', 10, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Special Defense 2 Combat Stages.', 'Cute', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (453, 'Barrier', 10, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Defense 2 Combat Stages.', 'Cool', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (454, 'Calm Mind', 10, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Special Attack 1 Combat Stage and raise the user''s Special Defense 1 Combat Stage.', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (455, 'Confusion', 10, '2d8+6', 'At-Will', 2, 1, 'Ranged (10), 1 Target', 'Confusion Confuses the target on 19-20 during Accuracy Check.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (456, 'Cosmic Power', 10, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Defense 1 Combat Stage and raise the user''s Special Defense 1 Combat Stage.', 'Cool', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (457, 'Dream Eater', 10, '4d12+16', 'EOT', 2, 1, 'Melee, 1 Target', 'Dream Eater can only target a Pokemon who is Asleep. After the target takes damage, the user gains HP equal to half of the damage they dealt to the target. *Grants: Dream Smoke', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (458, 'Extrasensory', 10, '3d10+12', 'EOT', 2, 1, 'Ranged (5), 1 Target', 'Extrasensory Flinches the target on 19-20 during Accuracy Check.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (459, 'Future Sight', 10, '4d12+16', 'Center', 2, 1, 'Ranged (10), 1 Target, Column', 'Future Sight does nothing on the turn it is used. At the end of the second turn after Future Sight''s use, use Future Sight''s damage and effect. Future Sight creates a Column 1 meter wide, which starts from anywhere on the field.', 'Smart', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (460, 'Gravity', 10, '-', 'Battle', 0, 2, 'Field, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Warped. While Warped, Moves that involve the user being airborne may not be used. Flying-Types and Pokemon with the Ability Levitate are no longer immune to Ground-Type Moves. All Accuracy Checks are lowered by -2. Warped does not replace other Weather effects.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (461, 'Guard Split', 10, '-', 'Battle', 0, 2, 'Melee, 1 Target', 'Choose between Defense and Special Defense. The target reveals the value of whichever stat you chose, and then adds it to the user''s stat of the same choice. Divide the total by two and call the result X. For the remainder of the encounter, the target and the user''s stat that you chose is X.', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (462, 'Guard Swap', 10, '-', 'Battle', 0, 2, 'Melee, 1 Target', 'The user trades the stat value of their Defense and Special Defense, for the target''s Defense and Special Defense for the rest of the encounter. Combat Stages are not traded. Guard Swap cannot miss.', 'Cute', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (463, 'Heal Block', 10, '-', 'EOT', 2, 2, 'Ranged (10), 1 Target', 'For 1d4+1 turns, the target may not gain HP by itself or be healed.', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (464, 'Healing Wish', 10, '-', 'Center', 0, 2, 'Ranged (10), 1 Target, Intercept', 'If the user''s HP is lowered to 0 or less, you may use Healing Wish as an Intercept. The target is treated as if it had been healed at a Pokemon Center. Healing Wish may target a pokemon in a Poke Ball as long as they immediately join the encounter or are sent out. If the target knows Healing Wish, the user''s Healing Wish does not restore its Center Frequency.', 'Cute', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (465, 'Heal Pulse', 10, '-', 'Center', 0, 2, 'Self (2), No Target, Burst', 'Heal Pulse creates a 2-meter Burst. Restores 50% of all Legal Targets max HP. Heal Pulse does not target the user. *Grants: Aura', 'Beauty', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (466, 'Heart Stamp', 10, '2d10+8', 'EOT', 2, 0, 'Melee, 1 Target', 'Heart Stamp Flinches the target on 15-20 during Accuracy Check.', 'Cute', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (467, 'Heart Swap', 10, '-', 'Center', 0, 2, 'Ranged (25), 2 Targets', 'The targets trade their Combat Stages, both positive and negative.', 'Cool', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (468, 'Hypnosis', 10, '-', 'Battle', 6, 2, 'Ranged (4), 1 Target', 'The target falls Asleep.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (469, 'Imprison', 10, '-', 'Battle', 0, 2, 'Ranged (10), 1 Target', 'The target is Locked. A Locked target may not use any Moves the user knows. Each user may only make 1 target Locked at a time. Using Imprison on a new target transfers Locked to the new target. Imprison cannot miss.', 'Smart', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (470, 'Kinesis', 10, '-', 'EOT', 0, 2, 'Ranged (3), No Target, Wall', 'Place 5-meters of Wall that can be passed through and attacked through. If anyone''s Move tries to target through a Kinesis Wall, they must roll +3 during Accuracy Check to hit. The walls remain for 10 rounds. Brick Break cannot break Kinesis'' Walls.', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (471, 'Light Screen', 10, '-', 'EOT', 0, 2, 'Melee, No Target, Wall', 'The user may shift while placing Light Screen Walls if their Speed allows for the extra movement. Place 5-meters of Wall that cannot be passed through but may be attacked through. If a Move tries to attack through Light Screen Walls, treat the target as if their Special Defense is raised 2 Combat Stages. This bonus cannot be awarded more then once. The walls sustain for 1d4+1 turns.', 'Beauty', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (472, 'Lunar Dance', 10, '-', 'Center', 0, 2, 'Ranged (25), 1 Target', 'Set the user''s HP to 0. The target is treated as if it had been healed at a Pokemon Center. Lunar Dance may target a pokemon in a poke ball as long as they immediately join the encounter or are sent out.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (473, 'Luster Purge', 10, '3d8+10', 'Center', 2, 1, 'Ranged (15), 1 Target, Column, Blast', 'Luster Purge creates a Column 1 meter wide; Luster Purge creates a 5-meter Blast. Luster Purge lowers all Legal Targets Special Defense 1 Combat Stage on 11-20 during Accuracy Check.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (474, 'Magic Coat', 10, '-', 'Center', 0, 2, 'Ranged (4), 1 Target, Intercept', 'If the user is about to get a hit by a Move that does not have a Damage Dice Roll, they may use Magic Coat as an Intercept. The Intercepted Move''s user is treated as if they were the target of their own Move.', 'Beauty', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (475, 'Magic Room', 10, '-', 'Center', 0, 2, 'Field, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Useless. While Useless, Pokemon may not use the effects of any Held items or activate any Held items. Useless does not replace other Weather effects.', 'Cute', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (476, 'Meditate', 10, '-', 'At-Will', 0, 2, 'Self, No Target', 'Raise the user''s Attack 1 Combat Stage.', 'Beauty', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (477, 'Miracle Eye', 10, '-', 'At-Will', 0, 2, 'Self, No Target', 'The user''s Psychic-Type Moves can now hit and affect Dark-Type targets. Miracle Eye''s user is unaffected by the effects of Moves which make them have to roll higher during Accuracy Checks to hit. Targets may not use their Speed stat to modify Accuracy Checks. Miracle Eye''s user can identify the real target using Double Team.', 'Cute', 1, 9);
INSERT INTO pokemondata2.pokemon_moves VALUES (478, 'Mirror Coat', 10, '-', 'Battle', 0, 2, 'Ranged (20), 1 Target, Intercept', 'If the user is being hit by a Move that consults Special Attack for damage, you may use Mirror Coat. If the user survives the hit, the target is dealt damage equal to twice the amount of damage the user received. Do not apply weakness, resistance or immunity. Do not apply stats.', 'Beauty', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (479, 'Mist Ball', 10, '3d8+10', 'Center', 2, 1, 'Ranged (10), 1 Target, Column, Blast', 'Mist Ball creates a Column 1 meter wide and creates a 5-meter Blast. Mist Ball lowers all Legal Targets Special Attack 1 Combat Stage on 6-20 during Accuracy Check.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (480, 'Power Split', 10, '-', 'Battle', 0, 2, 'Melee, 1 Target', 'Choose between Attack and Special Attack. The target reveals the value of whichever stat you chose, and then adds it to the user''s stat of the same choice. Divide the total by two and call the result X. For the remainder of the encounter, the target and the user''s stat that you chose is X.', 'Beauty', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (481, 'Power Swap', 10, '-', 'Battle', 0, 2, 'Melee, 1 Target', 'The user trades the stat value of their Attack and Special Attack, for the target''s Attack and Special Attack for the rest of the encounter. Combat Stages are not traded. Power Swap cannot miss.', 'Beauty', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (482, 'Power Trick', 10, '-', 'Battle', 0, 2, 'Self, No Target', 'The user''s Attack stat and Defense stat are switched for 1+1d8 rounds.', 'Cool', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (483, 'Psybeam', 10, '3d8+10', 'EOT', 2, 1, 'Ranged (7), 1 Target, Column', 'Psybeam creates a Column 1 meter wide. Psybeam Confuses all Legal Targets on 19-20 during Accuracy Check.', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (484, 'Psychic', 10, '3d12+14', 'Battle', 2, 1, 'Ranged (10), 1 Target, Push', 'The target is Pushed 5-meters in any direction. Psychic lowers the target''s Special Defense 1 Combat Stage on 17-20 during Accuracy Check. *Grants: Telekinetic', 'Smart', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (485, 'Psycho Boost', 10, '6d12+22', 'Center', 4, 1, 'Ranged (10), Target Area, Blast', 'Psycho Boost creates a 4-meter Blast. Lower the user''s Special Attack 2 Combat Stages after damage.', 'Smart', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (486, 'Psycho Cut', 10, '3d8+10', 'EOT', 2, 0, 'Ranged (6), 1 Target', 'Psycho Cut is a Critical Hit on 18-20 during Accuracy Check.', 'Cool', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (487, 'Psycho Shift', 10, '-', 'Center', 0, 2, 'Melee, 1 Target', 'The user is cured of a Status ailment and the target is given that Status ailment. Psycho Shift cannot miss. Psycho Shift can only be used if the user has a Status ailment and the target does not have the status ailment that is being transferred.', 'Cool', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (488, 'Psyshock', 10, '3d10+12', 'EOT', 2, 1, 'Ranged (4), 1 Target', 'When calculating damage, the target must use their Defense against Psyshock.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (489, 'Psystrike', 10, '4d12+16', 'Center', 2, 1, 'Ranged (4), 1 Target', 'When calculating damage, the target must use their Defense against Psystrike.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (490, 'Psywave', 10, '-', 'Battle', 5, 2, 'Ranged (4), 1 Target, Column', 'Psywave creates a Column 2-meters wide. Roll 1d4; on 1 and 2 all Legal Targets lose HP equal to half the user''s level; on 3, all Legal Targets lose HP equal to the user''s level; on 4 all Legal Targets lose HP equal to 1.5x the user''s level. Do not apply weakness, resistance or immunity. Do not apply stats.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (491, 'Reflect', 10, '-', 'EOT', 0, 2, 'Melee, No Target, Wall', 'The user may shift while placing Reflect Walls if their Speed allows for the extra movement. Place 5-meters of Wall that cannot be passed through but may be attacked through. If a Move tries to attack through Reflect Walls, treat the target as if their Defense is raised 2 Combat Stages. This bonus cannot be awarded more then once. The walls remain for 1d4+1 turns.', 'Smart', 2, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (492, 'Rest', 10, '-', 'Center', 0, 2, 'Self, No Target', 'The user''s HP is set to their full HP. The user is cured of any Status ailments. Then, the user falls Asleep. The user cannot make Sleep Checks at the beginning of their turn. They are cured of the Sleep at the end of their turn, in 2 rounds.', 'Cute', 0, 16);
INSERT INTO pokemondata2.pokemon_moves VALUES (493, 'Role Play', 10, '-', 'Battle', 0, 2, 'Ranged (10), 1 Target', 'Add on of the target''s Ability to the user''s Abilities for 1+1d8 rounds. Role Play cannot miss.', 'Cute', 1, 3);
INSERT INTO pokemondata2.pokemon_moves VALUES (494, 'Skill Swap', 10, '-', 'Battle', 0, 2, 'Melee, 1 Target', 'The user loses their Abilities and gains the target''s Abilities for the remainder of encounter. The target loses their Abilities and gains the user''s Abilities for the remainder of the encounter.', 'Smart', 0, 6);
INSERT INTO pokemondata2.pokemon_moves VALUES (495, 'Stored Power', 10, '1d6+3', 'Battle', 2, 1, 'Ranged (10), 1 Target', 'For every Combat Stage the user is above 0, in each stat, add 1d10 to Stored Power''s Damage Dice Roll.', 'Tough', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (496, 'Synchronoise', 10, '3d8+10', 'Battle', 2, 1, 'Ranged (6), No Target, Burst', 'Synchronoise creates a 6-meter Burst. Synchronoise can only hit legal targets that share a type with Synchronoise''s user.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (497, 'Telekinesis', 10, '-', 'Battle', 0, 2, 'Ranged (10), 1 Target', 'For 1d4+1 turns, the target is immune to Ground-type Moves and whenever the target is targeted by a Move, the Move''s user needs -5 to hit. Telekinesis'' effect cannot stack, if a target is already under the effect of Telekinesis, the newest successful instance of Telekinesis replaces the old one. *Grants: Telekinetic', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (498, 'Teleport', 10, '-', 'Battle', 0, 2, 'Self, No Target, Intercept', 'Teleport can be used as an Intercept at any time. If used as an Intercept, roll 1d20 and if you don''t roll 7 or higher, Teleport fails to activate. The user can shift 1d10+10 meters. They can move through blocking terrain and hindering terrain as if it is regular terrain. Moves that targeted Teleport''s user continues through the desired target''s space if the Move allows for it. If Teleport fails when used as an Intercept, treat it as if you did not use it for purposes of Frequency.', 'Cool', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (499, 'Trick', 10, '-', 'Battle', 2, 2, 'Ranged (5), 2 Targets', 'Both targets must be hit for Trick to succeed. If Trick targets the user, you do not need to roll an Accuracy Check for the user. Both targets lose their Held Item, and gain the other target''s Held Item. If a target has no Held Item, the still can gain the other target''s Held Item.', 'Smart', 0, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (500, 'Trick Room', 10, '-', 'Center', 0, 2, 'Field, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Rewinding. While Rewinding, the order in which combatants go during a round of Combat isn''t ordered from highest Speed to lowest Speed; instead it is order from lowest Speed to Highest Speed. Rewinding does not replace other Weather effects.', 'Cute', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (501, 'Wonder Room', 10, '-', 'Center', 0, 2, 'Field, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Wondered. While Wondered, each individual Pokemon''s Defense and Special Defense are switched. Wondered does not replace other Weather effects.', 'Cute', 2, 20);
INSERT INTO pokemondata2.pokemon_moves VALUES (502, 'Zen Headbutt', 10, '3d10+12', 'EOT', 4, 0, 'Melee, 1 Target, Dash', 'Zen Headbutt Flinches the target on 15-20 during Accuracy Check.', 'Beauty', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (503, 'Ancientpower', 10, '2d10+8', 'Center', 2, 1, 'Ranged (8), 1 Target, Column, Spirit Surge', 'Ancientpower creates a Column that is 2-meters wide. If you rolled 11-20 during Accuracy Check for Ancientpower, the user has each of its stats raised 1 Combat Stage. If you rolled 16-20 on the Accuracy Roll, all allies in the Column also have each of their stats raised 1 Combat Stage and are not damaged by Ancientpower.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (535, 'Steel Wing', 17, '3d8+10', 'At-Will', 3, 0, 'Melee, 1 Target, Pass, Spirit Surge', 'Raise the user''s Defense 1 Combat Stage on 15-20 during Accuracy Check', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (504, 'Head Smash', 11, '7d10+28', 'Battle', 5, 0, 'Melee, 1 Target, Dash, Push, Recoil 1/2', 'The target is pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. After Head Smash deals damage, Recoil.', 'Tough', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (505, 'Power Gem', 11, '3d8+10', 'EOT', 2, 1, 'Ranged (8), 1 Target', '-', 'Beauty', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (506, 'Rock Blast', 11, '1d10+4', 'EOT', 5, 0, 'Ranged (6), 1 Target, Scatter', 'Rock Blast can hit up to 5 times. Once the user misses, they cannot attempt to make another Rock Blast attack on that turn. *Grants: Materializer', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (507, 'Rock Polish', 11, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Speed 2 Combat Stages.', 'Tough', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (508, 'Rock Slide', 11, '3d10+12', 'Battle', 4, 0, 'Ranged (4), 1 Target, Column', 'Rock Slide creates a Column 4-meters wide. Rock Slide Flinches all Legal Targets on 17-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (509, 'Rock Throw', 11, '2d8+6', 'EOT', 4, 0, 'Ranged (8), 1 Target', '-', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (510, 'Rock Tomb', 11, '2d8+6', 'Battle', 5, 0, 'Ranged (6), 1 Target, Blast', 'Rock Tomb creates a 3-meter Blast. Rock Tomb lowers all Legal Targets Speed 1 Combat Stage. *Grants: Materializer', 'Smart', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (511, 'Rock Wrecker', 11, '7d10+28', 'Center', 4, 0, 'Melee, 1 Target, Pass, Exhaust', 'On Miss, Rock Wrecker deals the user''s Attack instead to all possible targets. *Grants: Materializer', 'Tough', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (512, 'Rollout', 11, '1d10+4', 'EOT', 4, 0, 'Melee, 1 Target, Pass', 'The user must use Rollout until it misses, or fails to be able to shift enough to hit a target for their next 4 turns. On the second turn, Rollout uses 2d10+8 for its Damage Dice Roll. On the third turn, Rollout uses 2d10+12. On the fourth turn, Rollout uses 3d10+16. On the fifth and final turn, Rollout uses 4d10+20.', 'Tough', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (513, 'Sandstorm', 11, '-', 'Battle', 0, 2, 'Field, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Sandstorming. At the beginning of each round, all non-Ground, Rock, or Steel Type Pokemon lose 1/16th of their full HP. Rock Type Pokemon are treated as if their Special Defense is raised 2 Combat Stages while Sandstorming.', 'Tough', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (514, 'Smack Down', 11, '2d8+6', 'Battle', 2, 0, 'Ranged (8), 1 Target', 'If the target is Flying-type or is floating because of Magnet Rise, Telekenisis, or Levitate, then the target is no longer immune to Ground-type Moves for 1d4+1 turns.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (515, 'Stealth Rock', 11, '-', 'Battle', 0, 2, 'Field, No Target, Hazard', 'Set 5 square meters of Stealth Rock, "Rocks." All 5 Rocks must be adjacent with at least one other space of Rocks next to each other. If a foe moves within 10 meters of a space occupied by Rocks, move at most one Rock to the offender, then destory the Rock. When that happens, Stealth Rock causes a foe to lose 1/8th of their full HP. Stealth Rock is considered to be dealing damage. Apply Weakness and Resistance. Do not apply stats. A Pokemon who has been hit by a Stealth Rock Hazard cannot get hit by another in the same encounter until it is returned to a Poke Ball and then sent back out. *Grants: Materializer', 'Cool', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (516, 'Stone Edge', 11, '4d12+16', 'Battle', 5, 0, 'Ranged (8), 1 Target', 'Stone Edge is a Critical Hit on 17-20 during Accuracy Check.', 'Tough', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (517, 'Wide Guard', 11, '-', 'Center', 0, 2, 'Self, No Target, Intercept', 'If a foe uses Move that hits multiple targets and Wide Guard''s user is one of the targets you may use Wide Guard as an Interrupt. If a Move would hit the user and one of the user''s allies, the Move only hits Wide Guard''s user. If the user is hit by a Move this way, the user does not take any damage and is not affected by any other effects the Move has. This Effect lasts for one turn.', 'Tough', 0, 14);
INSERT INTO pokemondata2.pokemon_moves VALUES (518, 'Autotomize', 17, '-', 'Battle', 0, 2, 'Self, No Target', 'For the remainder of the Encounter, the user''s Weight Class is one value lower, to a minimum of 1. Raise the user''s Speed 2 Combat Stages.', 'Smart', 0, 8);
INSERT INTO pokemondata2.pokemon_moves VALUES (519, 'Bullet Punch', 17, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target, Interrupt', 'AIf a foe wants to declare a Move, you may instead use Bullet Punch on their turn before they can use their Move.', 'Smart', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (520, 'Doom Desire', 17, '6d12+22', 'Center', 2, 1, 'Ranged (15), 1 Target, Column', 'Doom Desire does nothing on the turn it is used. At the end of the second turn after Doom Desire''s use, use Doom Desire''s damage and effect. Doom Desire creates a Column 1 meter wide, which starts from anywhere on the field.', 'Cool', 2, 13);
INSERT INTO pokemondata2.pokemon_moves VALUES (521, 'Flash Cannon', 17, '3d10+12', 'EOT', 2, 1, 'Ranged (10), 1 Target', 'Flash Cannon lowers the target''s Special Defense 1 Combat Stage on 17-20 during Accuracy Check.', 'Smart', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (522, 'Gear Grind', 17, '2d8+6', 'EOT', 3, 0, 'Melee, 1 Target, Scatter', 'Gear Grind can hit up to 2 times. If Gear Grind misses its first target, you may still use it a second time.', 'Cool', 2, 17);
INSERT INTO pokemondata2.pokemon_moves VALUES (523, 'Gyro Ball', 17, '1d12+6', 'Center', 0, 0, 'Ranged (6), 1 Target', 'For every 10 Speed the target is above the user, add 1d12 to the Damage dice Roll. Gyro Ball cannot miss.', 'Beauty', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (524, 'Heavy Slam', 17, 'See Effect', 'Battle', 2, 0, 'Melee, 1 Target', 'If the user is in the same Weight Class as the target, use 1d12+6 for Damage Dice Roll; if the user is one Weight Class higher than the target, use 2d10+8; if the user is two Weight Classes higher than the target, use 3d10+12; if three classes, 4d12+16; if four classes, 5d12+18.', 'Tough', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (525, 'Iron Defense', 17, '-', 'EOT', 0, 2, 'Self, No Target', 'Raise the user''s Defense 2 Combat Stages.', 'Tough', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (526, 'Iron Head', 17, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target, Dash', 'Iron Head Flinches the target on 15-20 during Accuracy Check.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (527, 'Iron Tail', 17, '4d12+16', 'Battle', 6, 0, 'Melee, 1 Target, Pass', 'Iron Tail lowers the target''s Defense 1 Combat Stage on 19-20 during Accuracy Check.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (528, 'Magnet Bomb', 17, '2d10+8', 'EOT', 0, 0, 'Ranged (8), 1 Target', 'Magnet Bomb cannot miss. *Grants: Magnetic', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (529, 'Metal Burst', 17, 'See Effect', 'Battle', 2, 0, 'Ranged (3), No Target, Burst', 'Metal Burst may only be used if the user didn''t move first in the round and the user has taken damage from a Move this round. The Target is dealt damage equal to 1.5x the amount of damage the user received during the last Move that hit it. Do not apply weakness, resistance or immunity. Do not apply stats.', 'Beauty', 2, 7);
INSERT INTO pokemondata2.pokemon_moves VALUES (530, 'Metal Claw', 17, '2d8+6', 'At-Will', 3, 0, 'Melee, 1 Target, Pass, Spirit Surge', 'Raise the user''s Attack 1 Combat Stage on 18-20 during Accuracy Check.', 'Cool', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (531, 'Metal Sound', 17, '-', 'EOT', 4, 2, 'Ranged (4), No Target, Burst', 'Metal Sound creates a 4-meter Burst. All Legal Targets have their Special Defense lowered 2 Combat Stages.', 'Smart', 2, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (532, 'Meteor Mash', 17, '4d12+16', 'Battle', 4, 0, 'Melee, 1 Target, Dash, Spirit Surge', 'Raise the user''s Attack 1 Combat Stage on 15-20 during Accuracy Check.', 'Cool', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (533, 'Mirror Shot', 17, '3d8+10', 'EOT', 5, 1, 'Ranged (7), 1 Target, Column', 'Mirror Shot creates a Column 1 meter wide. All Legal Targets must roll +2 during Accuracy Checks to hit on 16-20 during Accuracy Check.', 'Cute', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (536, 'Aqua Jet', 5, '1d12+6', 'At-Will', 2, 0, 'Melee, 1 Target, Interrupt', 'If a foe wants to declare a Move, you may instead use Aqua Jet on their turn before they can use their Move.', 'Beauty', 2, 15);
INSERT INTO pokemondata2.pokemon_moves VALUES (537, 'Aqua Ring', 5, '-', 'Center', 0, 2, 'Self, No Target, Coat', 'Aqua Ring covers the user in a Coat that heals the user at the beginning of each of their turns. The user is healed 1/16th of their full HP each turn.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (538, 'Aqua Tail', 5, '3d12+14', 'Battle', 4, 0, 'Melee, 1 Target, Pass', '-', 'Cute', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (539, 'Brine', 5, '3d8+10', 'Battle', 2, 1, 'Ranged (6), 1 Target', 'If the target is below 50% HP, Brine deals 5d12+22 instead for Damage Dice Roll.', 'Smart', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (540, 'Bubble', 5, '1d6+3', 'At-Will', 2, 1, 'Ranged (8), 1 Target', 'Bubble lowers the target''s Speed on 16-20 during Accuracy Check.', 'Cute', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (541, 'Bubblebeam', 5, '3d8+10', 'EOT', 2, 1, 'Ranged (8), 1 Target, Column', 'Bubblebeam creates a Column 1 meter wide. Bubblebeam lowers the target''s Speed on 18-20 during Accuracy Check.', 'Beauty', 2, 22);
INSERT INTO pokemondata2.pokemon_moves VALUES (542, 'Clamp', 5, '1d12+6', 'EOT', 4, 0, 'Melee, 1 Target, Trap', 'Clamp Traps the target and the user for 1d4+1 turns. At the beginning of the target''s turn, if the target is Trapped, roll 1d12 and the target loses that much HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Clamp may not trap more then one target at a time unless the user is Huge or Gigantic.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (543, 'Crabhammer', 5, '3d12+14', 'Battle', 3, 0, 'Melee, 1 Target, Push', 'Crabhammer Pushes the target 2-meters. Crabhammer is a Critical Hit on 18-20 during Accuracy Check.', 'Tough', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (544, 'Dive', 5, '3d10+12', 'Battle', 2, 0, 'Melee, 1 Target, Dash', 'Once you declare the use of Dive, the user is moved underwater and their turn ends. On the next turn, Dive''s user may shift then use Dive''s damage. While underwater, Dive''s user may not be the target of Moves. There must be a body of water around the battlefield to use Dive. For Pokemon users, the second turn is their Trainer''s Command Action, unless the Trainer is unconscious, in which case the Pokemon acts on its own, finishing Dive. *Grants: Underwater +3; Eliminates: Sinker', 'Beauty', 1, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (545, 'Hydro Cannon', 5, '7d10+28', 'Center', 4, 1, 'Ranged (15), Target Area, Blast, Exhaust', 'Hydro Cannon creates a 3-meter Blast. On Miss, Hydro Cannon deals the user''s Special Attack instead to all possible targets.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (546, 'Hydro Pump', 5, '5d12+18', 'Battle', 4, 1, 'Ranged (9), 1 Target, Column', 'Hydro Pump creates a Column 1 meter wide. *Grants: Fountain', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (547, 'Muddy Water', 5, '4d12+16', 'Battle', 5, 1, 'Ranged (4), 1 Target, Column', 'Muddy Water makes a Column 4-meters wide. All Legal Targets must roll +2 during Accuracy Checks to hit on 16-20 during Accuracy Check.', 'Tough', 2, 18);
INSERT INTO pokemondata2.pokemon_moves VALUES (548, 'Octazooka', 5, '3d8+10', 'Battle', 4, 1, 'Ranged (8), 1 Target', 'All Legal Targets must roll +1 during Accuracy Checks to hit on 11-20 during Accuracy Check.', 'Tough', 2, 12);
INSERT INTO pokemondata2.pokemon_moves VALUES (549, 'Rain Dance', 5, '-', 'Battle', 0, 2, 'Field, Target Area, Weather', 'For 1d4+1 rounds, the area is considered Rainy. While Rainy, Water-Type attacks deal 1.5x damage. Fire-Type attacks deal Â½ the damage they normally would.', 'Tough', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (550, 'Razor Shell', 5, '3d10+12', 'EOT', 3, 0, 'Melee, 1 Target, Pass', 'Razor Shell lowers the Target''s Defense 1 Combat Stage on 11-20 during Accuracy Check.', 'Cool', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (551, 'Scald', 5, '3d10+12', 'EOT', 2, 1, 'Ranged (5), 1 Target', 'Scald Burns the target on 15-20 during Accuracy Check.', 'Smart', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (552, 'Soak', 5, '-', 'Battle', 2, 2, 'Ranged (5), 1 Target', 'For 1d4+1 turns, the target''s Elemental Type(s), become(s) Water Type.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (553, 'Surf', 5, '4d12+16', 'Battle', 2, 1, 'Ranged (4), 1 Target, Column', 'Surf makes a Column 4-meters wide. *Grants: Surface +3; Eliminates: Sinker', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (554, 'Water Gun', 5, '1d12+6', 'At-Will', 2, 1, 'Ranged (10), 1 Target', '*Grants: Fountain', 'Cute', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (555, 'Water Pledge', 5, '2d8+6', 'EOT', 2, 1, 'Ranged (6), 1 Target, Pledge', 'If used on the same turn as Fire Pledge, all secondary effects of Moves are activated at a -3 during the Accuracy Check for 1d4+1 turns. If used on the same turn as Grass Pledge, all foes are treated as if at -2 Speed Combat Stages for 1d4+1 turns, if any foe has additional Speed Combat Stages, apply them as usual.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (556, 'Water Pulse', 5, '2d8+8', 'EOT', 2, 1, 'Ranged (3), No Target, Burst', 'Water Pulse creates a 3-meter Burst. Water Pulse Confuses all Legal Targets on 17-20 during Accuracy Check. *Grants: Fountain', 'Beauty', 2, 19);
INSERT INTO pokemondata2.pokemon_moves VALUES (557, 'Water Sport', 5, '-', 'EOT', 0, 2, 'Ranged (4), 1 Target, Coat', 'Water Sport makes a Coat that resists Fire Moves. Water Sport can Target Self. *Grants: Fountain', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (558, 'Water Spout', 5, '7d10+28', 'Center', 4, 1, 'Ranged(10), No Target, Burst', 'Water Spout creates a 10-meter Burst. Water Spout may not be performed unless the user has at least 90% of its HP.', 'Beauty', 2, 21);
INSERT INTO pokemondata2.pokemon_moves VALUES (559, 'Waterfall', 5, '3d10+12', 'EOT', 2, 0, 'Melee, 1 Target, Push', 'The target is Pushed 2-meters. If the target is airborne, Waterfall deals an additional 1d12 during Damage Dice Roll. Waterfall Flinches the target on 17-20 during Accuracy Check.', 'Tough', 3, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (560, 'Whirlpool', 5, '1d12+6', 'EOT', 4, 1, 'Ranged(5), 1 Target, Trap', 'Whirlpool Traps the target for 1d4+1 turns. At the beginning of the target''s turn, if the target is Trapped, roll 1d12 and the target loses that much HP. Do not apply weakness or resistance to the HP lost. Do not apply stats to the HP lost. Whirlpool may not trap more then one target at a time.', 'Beauty', 1, 25);
INSERT INTO pokemondata2.pokemon_moves VALUES (561, 'Withdraw', 5, '-', 'At-Will', 0, 2, 'Self, No Target', 'Raise the user''s Defense 1 Combat Stage.', 'Cute', 2, 10);
INSERT INTO pokemondata2.pokemon_moves VALUES (562, 'Dazzling Gleam', 18, '3d10+12', 'EOT', 2, 1, 'Ranged(8)', '-', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (564, 'Kings Shield', 17, '0', 'At-Will', 0, 0, 'Self, 1 Target, Interrupt', 'Blocks half of the damage a move would deal this turn. If the move causes the target to make physical contact with the user, reduce their Attack and Special Attack combat stages by 1.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (566, 'Infestation', 13, '1d12+6', 'Battle', 2, 1, 'Ranged (3), 1 Target, Column', 'Infestation creates a column 3-meters wide. All targets hit are infested for 1d4+1 turns (they take 1d12 damage per turn and are trapped).', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (567, 'Darkness', 16, '-', 'Battle', 0, 0, 'Effect - Field', 'For 1d4+1 turns, the field is considered Darkened. While Darkened, Dark-type moves do 1.5x damage (calculated after attack and before defense) and Fairy-type moves do 0.5x damage.  Moonlight heals 2/3, Morning Sun heals ¼. Other weather-based moves are weakened.\r\n', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (568, 'Dragonbite', 14, '3d8+10', 'EOT', 3, 0, 'Melee, 1 Target', 'Dragonbite is a critical hit on 17-20. On 20, Dragonbite is a critical hit and flinches the target.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (569, 'Fae Wild', 18, '-', 'Battle', 0, 0, 'Effect - Field', 'For 1d4+1 turns, the field is considered Fae-touched. While Fae-touched, Fairy-type moves do 1.5x damage (calculated after attack and before defense) and Dark-type moves do 0.5x damage.  Moonlight heals ¼, Morning Sun heals 2/3. Solarbeam takes a turn to charge but is considered Fairy-type and receives the 50% boost (this occurs so long as the field is Fae-touched when it is charging).  Other weather-based moves are weakened.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (570, 'Draining Kiss', 18, '2d12+8', 'EOT', 2, 1, 'Melee, 1 Target', 'After the target takes damage, the user gains HP equal to half of the damage dealt to the target.', 'Cute', 3, 26);
INSERT INTO pokemondata2.pokemon_moves VALUES (571, 'Moonblast', 18, '4d12+16', 'Center', 2, 1, 'Ranged (10), 1 Target', 'Moonblast creates a column 3-meters wide. Lower the special defense of all pokemon hit by 1 combat stage on 15-20.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (572, 'Geomancy', 18, '-', 'Center', 0, 0, 'Self', 'At the end of the user’s next turn, raise the user’s Special Attack, Special Defense, and Speed 2 combat stages.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (573, 'Play Rough', 18, '3d10+12', 'Battle', 4, 0, 'Melee, 1 Target', 'Lower the target''s Attack 1 stage on 15-20', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (574, 'Disarming Voice', 18, '2d12+8', 'EOT', 0, 1, 'No Target, Burst', 'Disarming Voice creates a 5-meter burst. Disarming Voice cannot miss.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (577, 'Mercurial Blitz', 0, '2d10+9', 'Center', 0, 1, 'Melee, 1 Target', 'Interrupt, May not be interrupted or intercepted. If used to interrupt a move targeted at the user’s owner, the target is flinched.', 'Cool', 2, 23);
INSERT INTO pokemondata2.pokemon_moves VALUES (578, 'Fairy Lock', 18, '-', 'Battle', 0, 0, 'Field - Effect', 'All trainers and pokemon in the encounter are trapped until the end of your next turn.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (579, 'Light of Ruin', 18, '7d10+28', 'Center', 5, 0, 'Ranged (10), 1 Target, Column, Recoil 1/2', 'Light of Ruin creates a Column 1 meter wide. After Light of Ruin deals damage, the user takes damage equal to half the total damage inflicted.', '0', 0, 0);
INSERT INTO pokemondata2.pokemon_moves VALUES (580, 'Nuzzle', 8, '1d6 + 8', 'Battle', 2, 0, 'Melee, 1 Target', 'Nuzzle Paralyzes its target.', 'Cute', 2, 1);
INSERT INTO pokemondata2.pokemon_moves VALUES (581, 'Parabolic Charge', 8, '1d12 + 10', 'EOT', 2, 1, 'Melee, 1 Target', 'Parabolic Charge heals the user for 1/2 of the damage dealt.', 'Cool', 3, 14);


--
-- Data for Name: pokemon_natures; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.pokemon_natures VALUES (1, 'Hardy', 1, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (2, 'Docile', 1, 2);
INSERT INTO pokemondata2.pokemon_natures VALUES (3, 'Proud', 1, 3);
INSERT INTO pokemondata2.pokemon_natures VALUES (4, 'Quirky', 1, 4);
INSERT INTO pokemondata2.pokemon_natures VALUES (5, 'Lazy', 1, 5);
INSERT INTO pokemondata2.pokemon_natures VALUES (6, 'Desperate', 1, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (7, 'Lonely', 1, 2);
INSERT INTO pokemondata2.pokemon_natures VALUES (8, 'Adamant', 1, 3);
INSERT INTO pokemondata2.pokemon_natures VALUES (9, 'Naughty', 1, 4);
INSERT INTO pokemondata2.pokemon_natures VALUES (10, 'Brave', 1, 5);
INSERT INTO pokemondata2.pokemon_natures VALUES (11, 'Stark', 2, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (12, 'Bold', 2, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (13, 'Impish', 2, 3);
INSERT INTO pokemondata2.pokemon_natures VALUES (14, 'Lax', 2, 4);
INSERT INTO pokemondata2.pokemon_natures VALUES (15, 'Relaxed', 2, 5);
INSERT INTO pokemondata2.pokemon_natures VALUES (16, 'Bashful', 3, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (17, 'Modest', 3, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (18, 'Mild', 3, 2);
INSERT INTO pokemondata2.pokemon_natures VALUES (19, 'Rash', 3, 4);
INSERT INTO pokemondata2.pokemon_natures VALUES (20, 'Quiet', 3, 5);
INSERT INTO pokemondata2.pokemon_natures VALUES (21, 'Sickly', 4, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (22, 'Calm', 4, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (23, 'Gentle', 4, 2);
INSERT INTO pokemondata2.pokemon_natures VALUES (24, 'Careful', 4, 3);
INSERT INTO pokemondata2.pokemon_natures VALUES (25, 'Sassy', 4, 5);
INSERT INTO pokemondata2.pokemon_natures VALUES (26, 'Serious', 5, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (27, 'Timid', 5, 1);
INSERT INTO pokemondata2.pokemon_natures VALUES (28, 'Hasty', 5, 2);
INSERT INTO pokemondata2.pokemon_natures VALUES (29, 'Jolly', 5, 3);
INSERT INTO pokemondata2.pokemon_natures VALUES (30, 'Naive', 5, 4);
INSERT INTO pokemondata2.pokemon_natures VALUES (31, 'Composed', 0, 0);
INSERT INTO pokemondata2.pokemon_natures VALUES (32, 'Dull', 0, 0);
INSERT INTO pokemondata2.pokemon_natures VALUES (33, 'Patient', 0, 0);
INSERT INTO pokemondata2.pokemon_natures VALUES (34, 'Poised', 0, 0);
INSERT INTO pokemondata2.pokemon_natures VALUES (35, 'Stoic', 0, 0);


--
-- Data for Name: pokemon_reference; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.pokemon_reference VALUES (1, 'Bulbasaur');
INSERT INTO pokemondata2.pokemon_reference VALUES (2, 'Ivysaur');
INSERT INTO pokemondata2.pokemon_reference VALUES (3, 'Venusaur');
INSERT INTO pokemondata2.pokemon_reference VALUES (4, 'Charmander');
INSERT INTO pokemondata2.pokemon_reference VALUES (5, 'Charmeleon');
INSERT INTO pokemondata2.pokemon_reference VALUES (6, 'Charizard');
INSERT INTO pokemondata2.pokemon_reference VALUES (7, 'Squirtle');
INSERT INTO pokemondata2.pokemon_reference VALUES (8, 'Wartortle');
INSERT INTO pokemondata2.pokemon_reference VALUES (9, 'Blastoise');
INSERT INTO pokemondata2.pokemon_reference VALUES (10, 'Caterpie');
INSERT INTO pokemondata2.pokemon_reference VALUES (11, 'Metapod');
INSERT INTO pokemondata2.pokemon_reference VALUES (12, 'Butterfree');
INSERT INTO pokemondata2.pokemon_reference VALUES (13, 'Weedle');
INSERT INTO pokemondata2.pokemon_reference VALUES (14, 'Kakuna');
INSERT INTO pokemondata2.pokemon_reference VALUES (15, 'Beedrill');
INSERT INTO pokemondata2.pokemon_reference VALUES (16, 'Pidgey');
INSERT INTO pokemondata2.pokemon_reference VALUES (17, 'Pidgeotto');
INSERT INTO pokemondata2.pokemon_reference VALUES (18, 'Pidgeot');
INSERT INTO pokemondata2.pokemon_reference VALUES (19, 'Rattata');
INSERT INTO pokemondata2.pokemon_reference VALUES (20, 'Raticate');
INSERT INTO pokemondata2.pokemon_reference VALUES (21, 'Spearow');
INSERT INTO pokemondata2.pokemon_reference VALUES (22, 'Fearow');
INSERT INTO pokemondata2.pokemon_reference VALUES (23, 'Ekans');
INSERT INTO pokemondata2.pokemon_reference VALUES (24, 'Arbok');
INSERT INTO pokemondata2.pokemon_reference VALUES (25, 'Pikachu');
INSERT INTO pokemondata2.pokemon_reference VALUES (26, 'Raichu');
INSERT INTO pokemondata2.pokemon_reference VALUES (27, 'Sandshrew');
INSERT INTO pokemondata2.pokemon_reference VALUES (28, 'Sandslash');
INSERT INTO pokemondata2.pokemon_reference VALUES (29, 'Nidoran ?');
INSERT INTO pokemondata2.pokemon_reference VALUES (30, 'Nidorina');
INSERT INTO pokemondata2.pokemon_reference VALUES (31, 'Nidoqueen');
INSERT INTO pokemondata2.pokemon_reference VALUES (32, 'Nidoran ?');
INSERT INTO pokemondata2.pokemon_reference VALUES (33, 'Nidorino');
INSERT INTO pokemondata2.pokemon_reference VALUES (34, 'Nidoking');
INSERT INTO pokemondata2.pokemon_reference VALUES (35, 'Clefairy');
INSERT INTO pokemondata2.pokemon_reference VALUES (36, 'Clefable');
INSERT INTO pokemondata2.pokemon_reference VALUES (37, 'Vulpix');
INSERT INTO pokemondata2.pokemon_reference VALUES (38, 'Ninetales');
INSERT INTO pokemondata2.pokemon_reference VALUES (39, 'Jigglypuff');
INSERT INTO pokemondata2.pokemon_reference VALUES (40, 'Wigglytuff');
INSERT INTO pokemondata2.pokemon_reference VALUES (41, 'Zubat');
INSERT INTO pokemondata2.pokemon_reference VALUES (42, 'Golbat');
INSERT INTO pokemondata2.pokemon_reference VALUES (43, 'Oddish');
INSERT INTO pokemondata2.pokemon_reference VALUES (44, 'Gloom');
INSERT INTO pokemondata2.pokemon_reference VALUES (45, 'Vileplume');
INSERT INTO pokemondata2.pokemon_reference VALUES (46, 'Paras');
INSERT INTO pokemondata2.pokemon_reference VALUES (47, 'Parasect');
INSERT INTO pokemondata2.pokemon_reference VALUES (48, 'Venonat');
INSERT INTO pokemondata2.pokemon_reference VALUES (49, 'Venomoth');
INSERT INTO pokemondata2.pokemon_reference VALUES (50, 'Diglett');
INSERT INTO pokemondata2.pokemon_reference VALUES (51, 'Dugtrio');
INSERT INTO pokemondata2.pokemon_reference VALUES (52, 'Meowth');
INSERT INTO pokemondata2.pokemon_reference VALUES (53, 'Persian');
INSERT INTO pokemondata2.pokemon_reference VALUES (54, 'Psyduck');
INSERT INTO pokemondata2.pokemon_reference VALUES (55, 'Golduck');
INSERT INTO pokemondata2.pokemon_reference VALUES (56, 'Mankey');
INSERT INTO pokemondata2.pokemon_reference VALUES (57, 'Primeape');
INSERT INTO pokemondata2.pokemon_reference VALUES (58, 'Growlithe');
INSERT INTO pokemondata2.pokemon_reference VALUES (59, 'Arcanine');
INSERT INTO pokemondata2.pokemon_reference VALUES (60, 'Poliwag');
INSERT INTO pokemondata2.pokemon_reference VALUES (61, 'Poliwhirl');
INSERT INTO pokemondata2.pokemon_reference VALUES (62, 'Poliwrath');
INSERT INTO pokemondata2.pokemon_reference VALUES (63, 'Abra');
INSERT INTO pokemondata2.pokemon_reference VALUES (64, 'Kadabra');
INSERT INTO pokemondata2.pokemon_reference VALUES (65, 'Alakazam');
INSERT INTO pokemondata2.pokemon_reference VALUES (66, 'Machop');
INSERT INTO pokemondata2.pokemon_reference VALUES (67, 'Machoke');
INSERT INTO pokemondata2.pokemon_reference VALUES (68, 'Machamp');
INSERT INTO pokemondata2.pokemon_reference VALUES (69, 'Bellsprout');
INSERT INTO pokemondata2.pokemon_reference VALUES (70, 'Weepinbell');
INSERT INTO pokemondata2.pokemon_reference VALUES (71, 'Victreebel');
INSERT INTO pokemondata2.pokemon_reference VALUES (72, 'Tentacool');
INSERT INTO pokemondata2.pokemon_reference VALUES (73, 'Tentacruel');
INSERT INTO pokemondata2.pokemon_reference VALUES (74, 'Geodude');
INSERT INTO pokemondata2.pokemon_reference VALUES (75, 'Graveler');
INSERT INTO pokemondata2.pokemon_reference VALUES (76, 'Golem');
INSERT INTO pokemondata2.pokemon_reference VALUES (77, 'Ponyta');
INSERT INTO pokemondata2.pokemon_reference VALUES (78, 'Rapidash');
INSERT INTO pokemondata2.pokemon_reference VALUES (79, 'Slowpoke');
INSERT INTO pokemondata2.pokemon_reference VALUES (80, 'Slowbro');
INSERT INTO pokemondata2.pokemon_reference VALUES (81, 'Magnemite');
INSERT INTO pokemondata2.pokemon_reference VALUES (82, 'Magneton');
INSERT INTO pokemondata2.pokemon_reference VALUES (83, 'Farfetch''d');
INSERT INTO pokemondata2.pokemon_reference VALUES (84, 'Doduo');
INSERT INTO pokemondata2.pokemon_reference VALUES (85, 'Dodrio');
INSERT INTO pokemondata2.pokemon_reference VALUES (86, 'Seel');
INSERT INTO pokemondata2.pokemon_reference VALUES (87, 'Dewgong');
INSERT INTO pokemondata2.pokemon_reference VALUES (88, 'Grimer');
INSERT INTO pokemondata2.pokemon_reference VALUES (89, 'Muk');
INSERT INTO pokemondata2.pokemon_reference VALUES (90, 'Shellder');
INSERT INTO pokemondata2.pokemon_reference VALUES (91, 'Cloyster');
INSERT INTO pokemondata2.pokemon_reference VALUES (92, 'Gastly');
INSERT INTO pokemondata2.pokemon_reference VALUES (93, 'Haunter');
INSERT INTO pokemondata2.pokemon_reference VALUES (94, 'Gengar');
INSERT INTO pokemondata2.pokemon_reference VALUES (95, 'Onix');
INSERT INTO pokemondata2.pokemon_reference VALUES (96, 'Drowzee');
INSERT INTO pokemondata2.pokemon_reference VALUES (97, 'Hypno');
INSERT INTO pokemondata2.pokemon_reference VALUES (98, 'Krabby');
INSERT INTO pokemondata2.pokemon_reference VALUES (99, 'Kingler');
INSERT INTO pokemondata2.pokemon_reference VALUES (100, 'Voltorb');
INSERT INTO pokemondata2.pokemon_reference VALUES (101, 'Electrode');
INSERT INTO pokemondata2.pokemon_reference VALUES (102, 'Exeggcute');
INSERT INTO pokemondata2.pokemon_reference VALUES (103, 'Exeggutor');
INSERT INTO pokemondata2.pokemon_reference VALUES (104, 'Cubone');
INSERT INTO pokemondata2.pokemon_reference VALUES (105, 'Marowak');
INSERT INTO pokemondata2.pokemon_reference VALUES (106, 'Hitmonlee');
INSERT INTO pokemondata2.pokemon_reference VALUES (107, 'Hitmonchan');
INSERT INTO pokemondata2.pokemon_reference VALUES (108, 'Lickitung');
INSERT INTO pokemondata2.pokemon_reference VALUES (109, 'Koffing');
INSERT INTO pokemondata2.pokemon_reference VALUES (110, 'Weezing');
INSERT INTO pokemondata2.pokemon_reference VALUES (111, 'Rhyhorn');
INSERT INTO pokemondata2.pokemon_reference VALUES (112, 'Rhydon');
INSERT INTO pokemondata2.pokemon_reference VALUES (113, 'Chansey');
INSERT INTO pokemondata2.pokemon_reference VALUES (114, 'Tangela');
INSERT INTO pokemondata2.pokemon_reference VALUES (115, 'Kangaskhan');
INSERT INTO pokemondata2.pokemon_reference VALUES (116, 'Horsea');
INSERT INTO pokemondata2.pokemon_reference VALUES (117, 'Seadra');
INSERT INTO pokemondata2.pokemon_reference VALUES (118, 'Goldeen');
INSERT INTO pokemondata2.pokemon_reference VALUES (119, 'Seaking');
INSERT INTO pokemondata2.pokemon_reference VALUES (120, 'Staryu');
INSERT INTO pokemondata2.pokemon_reference VALUES (121, 'Starmie');
INSERT INTO pokemondata2.pokemon_reference VALUES (122, 'Mr. Mime');
INSERT INTO pokemondata2.pokemon_reference VALUES (123, 'Scyther');
INSERT INTO pokemondata2.pokemon_reference VALUES (124, 'Jynx');
INSERT INTO pokemondata2.pokemon_reference VALUES (125, 'Electabuzz');
INSERT INTO pokemondata2.pokemon_reference VALUES (126, 'Magmar');
INSERT INTO pokemondata2.pokemon_reference VALUES (127, 'Pinsir');
INSERT INTO pokemondata2.pokemon_reference VALUES (128, 'Tauros');
INSERT INTO pokemondata2.pokemon_reference VALUES (129, 'Magikarp');
INSERT INTO pokemondata2.pokemon_reference VALUES (130, 'Gyarados');
INSERT INTO pokemondata2.pokemon_reference VALUES (131, 'Lapras');
INSERT INTO pokemondata2.pokemon_reference VALUES (132, 'Ditto');
INSERT INTO pokemondata2.pokemon_reference VALUES (133, 'Eevee');
INSERT INTO pokemondata2.pokemon_reference VALUES (134, 'Vaporeon');
INSERT INTO pokemondata2.pokemon_reference VALUES (135, 'Jolteon');
INSERT INTO pokemondata2.pokemon_reference VALUES (136, 'Flareon');
INSERT INTO pokemondata2.pokemon_reference VALUES (137, 'Porygon');
INSERT INTO pokemondata2.pokemon_reference VALUES (138, 'Omanyte');
INSERT INTO pokemondata2.pokemon_reference VALUES (139, 'Omastar');
INSERT INTO pokemondata2.pokemon_reference VALUES (140, 'Kabuto');
INSERT INTO pokemondata2.pokemon_reference VALUES (141, 'Kabutops');
INSERT INTO pokemondata2.pokemon_reference VALUES (142, 'Aerodactyl');
INSERT INTO pokemondata2.pokemon_reference VALUES (143, 'Snorlax');
INSERT INTO pokemondata2.pokemon_reference VALUES (144, 'Articuno');
INSERT INTO pokemondata2.pokemon_reference VALUES (145, 'Zapdos');
INSERT INTO pokemondata2.pokemon_reference VALUES (146, 'Moltres');
INSERT INTO pokemondata2.pokemon_reference VALUES (147, 'Dratini');
INSERT INTO pokemondata2.pokemon_reference VALUES (148, 'Dragonair');
INSERT INTO pokemondata2.pokemon_reference VALUES (149, 'Dragonite');
INSERT INTO pokemondata2.pokemon_reference VALUES (150, 'Mewtwo');
INSERT INTO pokemondata2.pokemon_reference VALUES (151, 'Mew');
INSERT INTO pokemondata2.pokemon_reference VALUES (152, 'Chikorita');
INSERT INTO pokemondata2.pokemon_reference VALUES (153, 'Bayleef');
INSERT INTO pokemondata2.pokemon_reference VALUES (154, 'Meganium');
INSERT INTO pokemondata2.pokemon_reference VALUES (155, 'Cyndaquil');
INSERT INTO pokemondata2.pokemon_reference VALUES (156, 'Quilava');
INSERT INTO pokemondata2.pokemon_reference VALUES (157, 'Typhlosion');
INSERT INTO pokemondata2.pokemon_reference VALUES (158, 'Totodile');
INSERT INTO pokemondata2.pokemon_reference VALUES (159, 'Croconaw');
INSERT INTO pokemondata2.pokemon_reference VALUES (160, 'Feraligatr');
INSERT INTO pokemondata2.pokemon_reference VALUES (161, 'Sentret');
INSERT INTO pokemondata2.pokemon_reference VALUES (162, 'Furret');
INSERT INTO pokemondata2.pokemon_reference VALUES (163, 'Hoothoot');
INSERT INTO pokemondata2.pokemon_reference VALUES (164, 'Noctowl');
INSERT INTO pokemondata2.pokemon_reference VALUES (165, 'Ledyba');
INSERT INTO pokemondata2.pokemon_reference VALUES (166, 'Ledian');
INSERT INTO pokemondata2.pokemon_reference VALUES (167, 'Spinarak');
INSERT INTO pokemondata2.pokemon_reference VALUES (168, 'Ariados');
INSERT INTO pokemondata2.pokemon_reference VALUES (169, 'Crobat');
INSERT INTO pokemondata2.pokemon_reference VALUES (170, 'Chinchou');
INSERT INTO pokemondata2.pokemon_reference VALUES (171, 'Lanturn');
INSERT INTO pokemondata2.pokemon_reference VALUES (172, 'Pichu');
INSERT INTO pokemondata2.pokemon_reference VALUES (173, 'Cleffa');
INSERT INTO pokemondata2.pokemon_reference VALUES (174, 'Igglybuff');
INSERT INTO pokemondata2.pokemon_reference VALUES (175, 'Togepi');
INSERT INTO pokemondata2.pokemon_reference VALUES (176, 'Togetic');
INSERT INTO pokemondata2.pokemon_reference VALUES (177, 'Natu');
INSERT INTO pokemondata2.pokemon_reference VALUES (178, 'Xatu');
INSERT INTO pokemondata2.pokemon_reference VALUES (179, 'Mareep');
INSERT INTO pokemondata2.pokemon_reference VALUES (180, 'Flaaffy');
INSERT INTO pokemondata2.pokemon_reference VALUES (181, 'Ampharos');
INSERT INTO pokemondata2.pokemon_reference VALUES (182, 'Bellossom');
INSERT INTO pokemondata2.pokemon_reference VALUES (183, 'Marill');
INSERT INTO pokemondata2.pokemon_reference VALUES (184, 'Azumarill');
INSERT INTO pokemondata2.pokemon_reference VALUES (185, 'Sudowoodo');
INSERT INTO pokemondata2.pokemon_reference VALUES (186, 'Politoed');
INSERT INTO pokemondata2.pokemon_reference VALUES (187, 'Hoppip');
INSERT INTO pokemondata2.pokemon_reference VALUES (188, 'Skiploom');
INSERT INTO pokemondata2.pokemon_reference VALUES (189, 'Jumpluff');
INSERT INTO pokemondata2.pokemon_reference VALUES (190, 'Aipom');
INSERT INTO pokemondata2.pokemon_reference VALUES (191, 'Sunkern');
INSERT INTO pokemondata2.pokemon_reference VALUES (192, 'Sunflora');
INSERT INTO pokemondata2.pokemon_reference VALUES (193, 'Yanma');
INSERT INTO pokemondata2.pokemon_reference VALUES (194, 'Wooper');
INSERT INTO pokemondata2.pokemon_reference VALUES (195, 'Quagsire');
INSERT INTO pokemondata2.pokemon_reference VALUES (196, 'Espeon');
INSERT INTO pokemondata2.pokemon_reference VALUES (197, 'Umbreon');
INSERT INTO pokemondata2.pokemon_reference VALUES (198, 'Murkrow');
INSERT INTO pokemondata2.pokemon_reference VALUES (199, 'Slowking');
INSERT INTO pokemondata2.pokemon_reference VALUES (200, 'Misdreavus');
INSERT INTO pokemondata2.pokemon_reference VALUES (201, 'Unown');
INSERT INTO pokemondata2.pokemon_reference VALUES (202, 'Wobbuffet');
INSERT INTO pokemondata2.pokemon_reference VALUES (203, 'Girafarig');
INSERT INTO pokemondata2.pokemon_reference VALUES (204, 'Pineco');
INSERT INTO pokemondata2.pokemon_reference VALUES (205, 'Forretress');
INSERT INTO pokemondata2.pokemon_reference VALUES (206, 'Dunsparce');
INSERT INTO pokemondata2.pokemon_reference VALUES (207, 'Gligar');
INSERT INTO pokemondata2.pokemon_reference VALUES (208, 'Steelix');
INSERT INTO pokemondata2.pokemon_reference VALUES (209, 'Snubbull');
INSERT INTO pokemondata2.pokemon_reference VALUES (210, 'Granbull');
INSERT INTO pokemondata2.pokemon_reference VALUES (211, 'Qwilfish');
INSERT INTO pokemondata2.pokemon_reference VALUES (212, 'Scizor');
INSERT INTO pokemondata2.pokemon_reference VALUES (213, 'Shuckle');
INSERT INTO pokemondata2.pokemon_reference VALUES (214, 'Heracross');
INSERT INTO pokemondata2.pokemon_reference VALUES (215, 'Sneasel');
INSERT INTO pokemondata2.pokemon_reference VALUES (216, 'Teddiursa');
INSERT INTO pokemondata2.pokemon_reference VALUES (217, 'Ursaring');
INSERT INTO pokemondata2.pokemon_reference VALUES (218, 'Slugma');
INSERT INTO pokemondata2.pokemon_reference VALUES (219, 'Magcargo');
INSERT INTO pokemondata2.pokemon_reference VALUES (220, 'Swinub');
INSERT INTO pokemondata2.pokemon_reference VALUES (221, 'Piloswine');
INSERT INTO pokemondata2.pokemon_reference VALUES (222, 'Corsola');
INSERT INTO pokemondata2.pokemon_reference VALUES (223, 'Remoraid');
INSERT INTO pokemondata2.pokemon_reference VALUES (224, 'Octillery');
INSERT INTO pokemondata2.pokemon_reference VALUES (225, 'Delibird');
INSERT INTO pokemondata2.pokemon_reference VALUES (226, 'Mantine');
INSERT INTO pokemondata2.pokemon_reference VALUES (227, 'Skarmory');
INSERT INTO pokemondata2.pokemon_reference VALUES (228, 'Houndour');
INSERT INTO pokemondata2.pokemon_reference VALUES (229, 'Houndoom');
INSERT INTO pokemondata2.pokemon_reference VALUES (230, 'Kingdra');
INSERT INTO pokemondata2.pokemon_reference VALUES (231, 'Phanpy');
INSERT INTO pokemondata2.pokemon_reference VALUES (232, 'Donphan');
INSERT INTO pokemondata2.pokemon_reference VALUES (233, 'Porygon2');
INSERT INTO pokemondata2.pokemon_reference VALUES (234, 'Stantler');
INSERT INTO pokemondata2.pokemon_reference VALUES (235, 'Smeargle');
INSERT INTO pokemondata2.pokemon_reference VALUES (236, 'Tyrogue');
INSERT INTO pokemondata2.pokemon_reference VALUES (237, 'Hitmontop');
INSERT INTO pokemondata2.pokemon_reference VALUES (238, 'Smoochum');
INSERT INTO pokemondata2.pokemon_reference VALUES (239, 'Elekid');
INSERT INTO pokemondata2.pokemon_reference VALUES (240, 'Magby');
INSERT INTO pokemondata2.pokemon_reference VALUES (241, 'Miltank');
INSERT INTO pokemondata2.pokemon_reference VALUES (242, 'Blissey');
INSERT INTO pokemondata2.pokemon_reference VALUES (243, 'Raikou');
INSERT INTO pokemondata2.pokemon_reference VALUES (244, 'Entei');
INSERT INTO pokemondata2.pokemon_reference VALUES (245, 'Suicune');
INSERT INTO pokemondata2.pokemon_reference VALUES (246, 'Larvitar');
INSERT INTO pokemondata2.pokemon_reference VALUES (247, 'Pupitar');
INSERT INTO pokemondata2.pokemon_reference VALUES (248, 'Tyranitar');
INSERT INTO pokemondata2.pokemon_reference VALUES (249, 'Lugia');
INSERT INTO pokemondata2.pokemon_reference VALUES (250, 'Ho-oh');
INSERT INTO pokemondata2.pokemon_reference VALUES (251, 'Celebi');
INSERT INTO pokemondata2.pokemon_reference VALUES (252, 'Treecko');
INSERT INTO pokemondata2.pokemon_reference VALUES (253, 'Grovyle');
INSERT INTO pokemondata2.pokemon_reference VALUES (254, 'Sceptile');
INSERT INTO pokemondata2.pokemon_reference VALUES (255, 'Torchic');
INSERT INTO pokemondata2.pokemon_reference VALUES (256, 'Combusken');
INSERT INTO pokemondata2.pokemon_reference VALUES (257, 'Blaziken');
INSERT INTO pokemondata2.pokemon_reference VALUES (258, 'Mudkip');
INSERT INTO pokemondata2.pokemon_reference VALUES (259, 'Marshtomp');
INSERT INTO pokemondata2.pokemon_reference VALUES (260, 'Swampert');
INSERT INTO pokemondata2.pokemon_reference VALUES (261, 'Poochyena');
INSERT INTO pokemondata2.pokemon_reference VALUES (262, 'Mightyena');
INSERT INTO pokemondata2.pokemon_reference VALUES (263, 'Zigzagoon');
INSERT INTO pokemondata2.pokemon_reference VALUES (264, 'Linoone');
INSERT INTO pokemondata2.pokemon_reference VALUES (265, 'Wurmple');
INSERT INTO pokemondata2.pokemon_reference VALUES (266, 'Silcoon');
INSERT INTO pokemondata2.pokemon_reference VALUES (267, 'Beautifly');
INSERT INTO pokemondata2.pokemon_reference VALUES (268, 'Cascoon');
INSERT INTO pokemondata2.pokemon_reference VALUES (269, 'Dustox');
INSERT INTO pokemondata2.pokemon_reference VALUES (270, 'Lotad');
INSERT INTO pokemondata2.pokemon_reference VALUES (271, 'Lombre');
INSERT INTO pokemondata2.pokemon_reference VALUES (272, 'Ludicolo');
INSERT INTO pokemondata2.pokemon_reference VALUES (273, 'Seedot');
INSERT INTO pokemondata2.pokemon_reference VALUES (274, 'Nuzleaf');
INSERT INTO pokemondata2.pokemon_reference VALUES (275, 'Shiftry');
INSERT INTO pokemondata2.pokemon_reference VALUES (276, 'Taillow');
INSERT INTO pokemondata2.pokemon_reference VALUES (277, 'Swellow');
INSERT INTO pokemondata2.pokemon_reference VALUES (278, 'Wingull');
INSERT INTO pokemondata2.pokemon_reference VALUES (279, 'Pelipper');
INSERT INTO pokemondata2.pokemon_reference VALUES (280, 'Ralts');
INSERT INTO pokemondata2.pokemon_reference VALUES (281, 'Kirlia');
INSERT INTO pokemondata2.pokemon_reference VALUES (282, 'Gardevoir');
INSERT INTO pokemondata2.pokemon_reference VALUES (283, 'Surskit');
INSERT INTO pokemondata2.pokemon_reference VALUES (284, 'Masquerain');
INSERT INTO pokemondata2.pokemon_reference VALUES (285, 'Shroomish');
INSERT INTO pokemondata2.pokemon_reference VALUES (286, 'Breloom');
INSERT INTO pokemondata2.pokemon_reference VALUES (287, 'Slakoth');
INSERT INTO pokemondata2.pokemon_reference VALUES (288, 'Vigoroth');
INSERT INTO pokemondata2.pokemon_reference VALUES (289, 'Slaking');
INSERT INTO pokemondata2.pokemon_reference VALUES (290, 'Nincada');
INSERT INTO pokemondata2.pokemon_reference VALUES (291, 'Ninjask');
INSERT INTO pokemondata2.pokemon_reference VALUES (292, 'Shedinja');
INSERT INTO pokemondata2.pokemon_reference VALUES (293, 'Whismur');
INSERT INTO pokemondata2.pokemon_reference VALUES (294, 'Loudred');
INSERT INTO pokemondata2.pokemon_reference VALUES (295, 'Exploud');
INSERT INTO pokemondata2.pokemon_reference VALUES (296, 'Makuhita');
INSERT INTO pokemondata2.pokemon_reference VALUES (297, 'Hariyama');
INSERT INTO pokemondata2.pokemon_reference VALUES (298, 'Azurill');
INSERT INTO pokemondata2.pokemon_reference VALUES (299, 'Nosepass');
INSERT INTO pokemondata2.pokemon_reference VALUES (300, 'Skitty');
INSERT INTO pokemondata2.pokemon_reference VALUES (301, 'Delcatty');
INSERT INTO pokemondata2.pokemon_reference VALUES (302, 'Sableye');
INSERT INTO pokemondata2.pokemon_reference VALUES (303, 'Mawile');
INSERT INTO pokemondata2.pokemon_reference VALUES (304, 'Aron');
INSERT INTO pokemondata2.pokemon_reference VALUES (305, 'Lairon');
INSERT INTO pokemondata2.pokemon_reference VALUES (306, 'Aggron');
INSERT INTO pokemondata2.pokemon_reference VALUES (307, 'Meditite');
INSERT INTO pokemondata2.pokemon_reference VALUES (308, 'Medicham');
INSERT INTO pokemondata2.pokemon_reference VALUES (309, 'Electrike');
INSERT INTO pokemondata2.pokemon_reference VALUES (310, 'Manectric');
INSERT INTO pokemondata2.pokemon_reference VALUES (311, 'Plusle');
INSERT INTO pokemondata2.pokemon_reference VALUES (312, 'Minun');
INSERT INTO pokemondata2.pokemon_reference VALUES (313, 'Volbeat');
INSERT INTO pokemondata2.pokemon_reference VALUES (314, 'Illumise');
INSERT INTO pokemondata2.pokemon_reference VALUES (315, 'Roselia');
INSERT INTO pokemondata2.pokemon_reference VALUES (316, 'Gulpin');
INSERT INTO pokemondata2.pokemon_reference VALUES (317, 'Swalot');
INSERT INTO pokemondata2.pokemon_reference VALUES (318, 'Carvanha');
INSERT INTO pokemondata2.pokemon_reference VALUES (319, 'Sharpedo');
INSERT INTO pokemondata2.pokemon_reference VALUES (320, 'Wailmer');
INSERT INTO pokemondata2.pokemon_reference VALUES (321, 'Wailord');
INSERT INTO pokemondata2.pokemon_reference VALUES (322, 'Numel');
INSERT INTO pokemondata2.pokemon_reference VALUES (323, 'Camerupt');
INSERT INTO pokemondata2.pokemon_reference VALUES (324, 'Torkoal');
INSERT INTO pokemondata2.pokemon_reference VALUES (325, 'Spoink');
INSERT INTO pokemondata2.pokemon_reference VALUES (326, 'Grumpig');
INSERT INTO pokemondata2.pokemon_reference VALUES (327, 'Spinda');
INSERT INTO pokemondata2.pokemon_reference VALUES (328, 'Trapinch');
INSERT INTO pokemondata2.pokemon_reference VALUES (329, 'Vibrava');
INSERT INTO pokemondata2.pokemon_reference VALUES (330, 'Flygon');
INSERT INTO pokemondata2.pokemon_reference VALUES (331, 'Cacnea');
INSERT INTO pokemondata2.pokemon_reference VALUES (332, 'Cacturne');
INSERT INTO pokemondata2.pokemon_reference VALUES (333, 'Swablu');
INSERT INTO pokemondata2.pokemon_reference VALUES (334, 'Altaria');
INSERT INTO pokemondata2.pokemon_reference VALUES (335, 'Zangoose');
INSERT INTO pokemondata2.pokemon_reference VALUES (336, 'Seviper');
INSERT INTO pokemondata2.pokemon_reference VALUES (337, 'Lunatone');
INSERT INTO pokemondata2.pokemon_reference VALUES (338, 'Solrock');
INSERT INTO pokemondata2.pokemon_reference VALUES (339, 'Barboach');
INSERT INTO pokemondata2.pokemon_reference VALUES (340, 'Whiscash');
INSERT INTO pokemondata2.pokemon_reference VALUES (341, 'Corphish');
INSERT INTO pokemondata2.pokemon_reference VALUES (342, 'Crawdaunt');
INSERT INTO pokemondata2.pokemon_reference VALUES (343, 'Baltoy');
INSERT INTO pokemondata2.pokemon_reference VALUES (344, 'Claydol');
INSERT INTO pokemondata2.pokemon_reference VALUES (345, 'Lileep');
INSERT INTO pokemondata2.pokemon_reference VALUES (346, 'Cradily');
INSERT INTO pokemondata2.pokemon_reference VALUES (347, 'Anorith');
INSERT INTO pokemondata2.pokemon_reference VALUES (348, 'Armaldo');
INSERT INTO pokemondata2.pokemon_reference VALUES (349, 'Feebas');
INSERT INTO pokemondata2.pokemon_reference VALUES (350, 'Milotic');
INSERT INTO pokemondata2.pokemon_reference VALUES (351, 'Castform');
INSERT INTO pokemondata2.pokemon_reference VALUES (352, 'Kecleon');
INSERT INTO pokemondata2.pokemon_reference VALUES (353, 'Shuppet');
INSERT INTO pokemondata2.pokemon_reference VALUES (354, 'Banette');
INSERT INTO pokemondata2.pokemon_reference VALUES (355, 'Duskull');
INSERT INTO pokemondata2.pokemon_reference VALUES (356, 'Dusclops');
INSERT INTO pokemondata2.pokemon_reference VALUES (357, 'Tropius');
INSERT INTO pokemondata2.pokemon_reference VALUES (358, 'Chimecho');
INSERT INTO pokemondata2.pokemon_reference VALUES (359, 'Absol');
INSERT INTO pokemondata2.pokemon_reference VALUES (360, 'Wynaut');
INSERT INTO pokemondata2.pokemon_reference VALUES (361, 'Snorunt');
INSERT INTO pokemondata2.pokemon_reference VALUES (362, 'Glalie');
INSERT INTO pokemondata2.pokemon_reference VALUES (363, 'Spheal');
INSERT INTO pokemondata2.pokemon_reference VALUES (364, 'Sealeo');
INSERT INTO pokemondata2.pokemon_reference VALUES (365, 'Walrein');
INSERT INTO pokemondata2.pokemon_reference VALUES (366, 'Clamperl');
INSERT INTO pokemondata2.pokemon_reference VALUES (367, 'Huntail');
INSERT INTO pokemondata2.pokemon_reference VALUES (368, 'Gorebyss');
INSERT INTO pokemondata2.pokemon_reference VALUES (369, 'Relicanth');
INSERT INTO pokemondata2.pokemon_reference VALUES (370, 'Luvdisc');
INSERT INTO pokemondata2.pokemon_reference VALUES (371, 'Bagon');
INSERT INTO pokemondata2.pokemon_reference VALUES (372, 'Shelgon');
INSERT INTO pokemondata2.pokemon_reference VALUES (373, 'Salamence');
INSERT INTO pokemondata2.pokemon_reference VALUES (374, 'Beldum');
INSERT INTO pokemondata2.pokemon_reference VALUES (375, 'Metang');
INSERT INTO pokemondata2.pokemon_reference VALUES (376, 'Metagross');
INSERT INTO pokemondata2.pokemon_reference VALUES (377, 'Regirock');
INSERT INTO pokemondata2.pokemon_reference VALUES (378, 'Regice');
INSERT INTO pokemondata2.pokemon_reference VALUES (379, 'Registeel');
INSERT INTO pokemondata2.pokemon_reference VALUES (380, 'Latias');
INSERT INTO pokemondata2.pokemon_reference VALUES (381, 'Latios');
INSERT INTO pokemondata2.pokemon_reference VALUES (382, 'Kyogre');
INSERT INTO pokemondata2.pokemon_reference VALUES (383, 'Groudon');
INSERT INTO pokemondata2.pokemon_reference VALUES (384, 'Rayquaza');
INSERT INTO pokemondata2.pokemon_reference VALUES (385, 'Jirachi');
INSERT INTO pokemondata2.pokemon_reference VALUES (386, 'Deoxys');
INSERT INTO pokemondata2.pokemon_reference VALUES (387, 'Turtwig');
INSERT INTO pokemondata2.pokemon_reference VALUES (388, 'Grotle');
INSERT INTO pokemondata2.pokemon_reference VALUES (389, 'Torterra');
INSERT INTO pokemondata2.pokemon_reference VALUES (390, 'Chimchar');
INSERT INTO pokemondata2.pokemon_reference VALUES (391, 'Monferno');
INSERT INTO pokemondata2.pokemon_reference VALUES (392, 'Infernape');
INSERT INTO pokemondata2.pokemon_reference VALUES (393, 'Piplup');
INSERT INTO pokemondata2.pokemon_reference VALUES (394, 'Prinplup');
INSERT INTO pokemondata2.pokemon_reference VALUES (395, 'Empoleon');
INSERT INTO pokemondata2.pokemon_reference VALUES (396, 'Starly');
INSERT INTO pokemondata2.pokemon_reference VALUES (397, 'Staravia');
INSERT INTO pokemondata2.pokemon_reference VALUES (398, 'Staraptor');
INSERT INTO pokemondata2.pokemon_reference VALUES (399, 'Bidoof');
INSERT INTO pokemondata2.pokemon_reference VALUES (400, 'Bibarel');
INSERT INTO pokemondata2.pokemon_reference VALUES (401, 'Kricketot');
INSERT INTO pokemondata2.pokemon_reference VALUES (402, 'Kricketune');
INSERT INTO pokemondata2.pokemon_reference VALUES (403, 'Shinx');
INSERT INTO pokemondata2.pokemon_reference VALUES (404, 'Luxio');
INSERT INTO pokemondata2.pokemon_reference VALUES (405, 'Luxray');
INSERT INTO pokemondata2.pokemon_reference VALUES (406, 'Budew');
INSERT INTO pokemondata2.pokemon_reference VALUES (407, 'Roserade');
INSERT INTO pokemondata2.pokemon_reference VALUES (408, 'Cranidos');
INSERT INTO pokemondata2.pokemon_reference VALUES (409, 'Rampardos');
INSERT INTO pokemondata2.pokemon_reference VALUES (410, 'Shieldon');
INSERT INTO pokemondata2.pokemon_reference VALUES (411, 'Bastiodon');
INSERT INTO pokemondata2.pokemon_reference VALUES (412, 'Burmy');
INSERT INTO pokemondata2.pokemon_reference VALUES (413, 'Wormadam');
INSERT INTO pokemondata2.pokemon_reference VALUES (414, 'Mothim');
INSERT INTO pokemondata2.pokemon_reference VALUES (415, 'Combee');
INSERT INTO pokemondata2.pokemon_reference VALUES (416, 'Vespiquen');
INSERT INTO pokemondata2.pokemon_reference VALUES (417, 'Pachirisu');
INSERT INTO pokemondata2.pokemon_reference VALUES (418, 'Buizel');
INSERT INTO pokemondata2.pokemon_reference VALUES (419, 'Floatzel');
INSERT INTO pokemondata2.pokemon_reference VALUES (420, 'Cherubi');
INSERT INTO pokemondata2.pokemon_reference VALUES (421, 'Cherrim');
INSERT INTO pokemondata2.pokemon_reference VALUES (422, 'Shellos');
INSERT INTO pokemondata2.pokemon_reference VALUES (423, 'Gastrodon');
INSERT INTO pokemondata2.pokemon_reference VALUES (424, 'Ambipom');
INSERT INTO pokemondata2.pokemon_reference VALUES (425, 'Drifloon');
INSERT INTO pokemondata2.pokemon_reference VALUES (426, 'Drifblim');
INSERT INTO pokemondata2.pokemon_reference VALUES (427, 'Buneary');
INSERT INTO pokemondata2.pokemon_reference VALUES (428, 'Lopunny');
INSERT INTO pokemondata2.pokemon_reference VALUES (429, 'Mismagius');
INSERT INTO pokemondata2.pokemon_reference VALUES (430, 'Honchkrow');
INSERT INTO pokemondata2.pokemon_reference VALUES (431, 'Glameow');
INSERT INTO pokemondata2.pokemon_reference VALUES (432, 'Purugly');
INSERT INTO pokemondata2.pokemon_reference VALUES (433, 'Chingling');
INSERT INTO pokemondata2.pokemon_reference VALUES (434, 'Stunky');
INSERT INTO pokemondata2.pokemon_reference VALUES (435, 'Skuntank');
INSERT INTO pokemondata2.pokemon_reference VALUES (436, 'Bronzor');
INSERT INTO pokemondata2.pokemon_reference VALUES (437, 'Bronzong');
INSERT INTO pokemondata2.pokemon_reference VALUES (438, 'Bonsly');
INSERT INTO pokemondata2.pokemon_reference VALUES (439, 'Mime Jr.');
INSERT INTO pokemondata2.pokemon_reference VALUES (440, 'Happiny');
INSERT INTO pokemondata2.pokemon_reference VALUES (441, 'Chatot');
INSERT INTO pokemondata2.pokemon_reference VALUES (442, 'Spiritomb');
INSERT INTO pokemondata2.pokemon_reference VALUES (443, 'Gible');
INSERT INTO pokemondata2.pokemon_reference VALUES (444, 'Gabite');
INSERT INTO pokemondata2.pokemon_reference VALUES (445, 'Garchomp');
INSERT INTO pokemondata2.pokemon_reference VALUES (446, 'Munchlax');
INSERT INTO pokemondata2.pokemon_reference VALUES (447, 'Riolu');
INSERT INTO pokemondata2.pokemon_reference VALUES (448, 'Lucario');
INSERT INTO pokemondata2.pokemon_reference VALUES (449, 'Hippopotas');
INSERT INTO pokemondata2.pokemon_reference VALUES (450, 'Hippowdon');
INSERT INTO pokemondata2.pokemon_reference VALUES (451, 'Skorupi');
INSERT INTO pokemondata2.pokemon_reference VALUES (452, 'Drapion');
INSERT INTO pokemondata2.pokemon_reference VALUES (453, 'Croagunk');
INSERT INTO pokemondata2.pokemon_reference VALUES (454, 'Toxicroak');
INSERT INTO pokemondata2.pokemon_reference VALUES (455, 'Carnivine');
INSERT INTO pokemondata2.pokemon_reference VALUES (456, 'Finneon');
INSERT INTO pokemondata2.pokemon_reference VALUES (457, 'Lumineon');
INSERT INTO pokemondata2.pokemon_reference VALUES (458, 'Mantyke');
INSERT INTO pokemondata2.pokemon_reference VALUES (459, 'Snover');
INSERT INTO pokemondata2.pokemon_reference VALUES (460, 'Abomasnow');
INSERT INTO pokemondata2.pokemon_reference VALUES (461, 'Weavile');
INSERT INTO pokemondata2.pokemon_reference VALUES (462, 'Magnezone');
INSERT INTO pokemondata2.pokemon_reference VALUES (463, 'Lickilicky');
INSERT INTO pokemondata2.pokemon_reference VALUES (464, 'Rhyperior');
INSERT INTO pokemondata2.pokemon_reference VALUES (465, 'Tangrowth');
INSERT INTO pokemondata2.pokemon_reference VALUES (466, 'Electivire');
INSERT INTO pokemondata2.pokemon_reference VALUES (467, 'Magmortar');
INSERT INTO pokemondata2.pokemon_reference VALUES (468, 'Togekiss');
INSERT INTO pokemondata2.pokemon_reference VALUES (469, 'Yanmega');
INSERT INTO pokemondata2.pokemon_reference VALUES (470, 'Leafeon');
INSERT INTO pokemondata2.pokemon_reference VALUES (471, 'Glaceon');
INSERT INTO pokemondata2.pokemon_reference VALUES (472, 'Gliscor');
INSERT INTO pokemondata2.pokemon_reference VALUES (473, 'Mamoswine');
INSERT INTO pokemondata2.pokemon_reference VALUES (474, 'Porygon-Z');
INSERT INTO pokemondata2.pokemon_reference VALUES (475, 'Gallade');
INSERT INTO pokemondata2.pokemon_reference VALUES (476, 'Probopass');
INSERT INTO pokemondata2.pokemon_reference VALUES (477, 'Dusknoir');
INSERT INTO pokemondata2.pokemon_reference VALUES (478, 'Froslass');
INSERT INTO pokemondata2.pokemon_reference VALUES (479, 'Rotom');
INSERT INTO pokemondata2.pokemon_reference VALUES (480, 'Uxie');
INSERT INTO pokemondata2.pokemon_reference VALUES (481, 'Mesprit');
INSERT INTO pokemondata2.pokemon_reference VALUES (482, 'Azelf');
INSERT INTO pokemondata2.pokemon_reference VALUES (483, 'Dialga');
INSERT INTO pokemondata2.pokemon_reference VALUES (484, 'Palkia');
INSERT INTO pokemondata2.pokemon_reference VALUES (485, 'Heatran');
INSERT INTO pokemondata2.pokemon_reference VALUES (486, 'Regigigas');
INSERT INTO pokemondata2.pokemon_reference VALUES (487, 'Giratina');
INSERT INTO pokemondata2.pokemon_reference VALUES (488, 'Cresselia');
INSERT INTO pokemondata2.pokemon_reference VALUES (489, 'Phione');
INSERT INTO pokemondata2.pokemon_reference VALUES (490, 'Manaphy');
INSERT INTO pokemondata2.pokemon_reference VALUES (491, 'Darkrai');
INSERT INTO pokemondata2.pokemon_reference VALUES (492, 'Shaymin');
INSERT INTO pokemondata2.pokemon_reference VALUES (493, 'Arceus');
INSERT INTO pokemondata2.pokemon_reference VALUES (494, 'Victini');
INSERT INTO pokemondata2.pokemon_reference VALUES (495, 'Snivy');
INSERT INTO pokemondata2.pokemon_reference VALUES (496, 'Servine');
INSERT INTO pokemondata2.pokemon_reference VALUES (497, 'Serperior');
INSERT INTO pokemondata2.pokemon_reference VALUES (498, 'Tepig');
INSERT INTO pokemondata2.pokemon_reference VALUES (499, 'Pignite');
INSERT INTO pokemondata2.pokemon_reference VALUES (500, 'Emboar');
INSERT INTO pokemondata2.pokemon_reference VALUES (501, 'Oshawott');
INSERT INTO pokemondata2.pokemon_reference VALUES (502, 'Dewott');
INSERT INTO pokemondata2.pokemon_reference VALUES (503, 'Samurott');
INSERT INTO pokemondata2.pokemon_reference VALUES (504, 'Patrat');
INSERT INTO pokemondata2.pokemon_reference VALUES (505, 'Watchog');
INSERT INTO pokemondata2.pokemon_reference VALUES (506, 'Lillipup');
INSERT INTO pokemondata2.pokemon_reference VALUES (507, 'Herdier');
INSERT INTO pokemondata2.pokemon_reference VALUES (508, 'Stoutland');
INSERT INTO pokemondata2.pokemon_reference VALUES (509, 'Purrloin');
INSERT INTO pokemondata2.pokemon_reference VALUES (510, 'Liepard');
INSERT INTO pokemondata2.pokemon_reference VALUES (511, 'Pansage');
INSERT INTO pokemondata2.pokemon_reference VALUES (512, 'Simisage');
INSERT INTO pokemondata2.pokemon_reference VALUES (513, 'Pansear');
INSERT INTO pokemondata2.pokemon_reference VALUES (514, 'Simisear');
INSERT INTO pokemondata2.pokemon_reference VALUES (515, 'Panpour');
INSERT INTO pokemondata2.pokemon_reference VALUES (516, 'Simipour');
INSERT INTO pokemondata2.pokemon_reference VALUES (517, 'Munna');
INSERT INTO pokemondata2.pokemon_reference VALUES (518, 'Musharna');
INSERT INTO pokemondata2.pokemon_reference VALUES (519, 'Pidove');
INSERT INTO pokemondata2.pokemon_reference VALUES (520, 'Tranquill');
INSERT INTO pokemondata2.pokemon_reference VALUES (521, 'Unfezant');
INSERT INTO pokemondata2.pokemon_reference VALUES (522, 'Blitzle');
INSERT INTO pokemondata2.pokemon_reference VALUES (523, 'Zebstrika');
INSERT INTO pokemondata2.pokemon_reference VALUES (524, 'Roggenrola');
INSERT INTO pokemondata2.pokemon_reference VALUES (525, 'Boldore');
INSERT INTO pokemondata2.pokemon_reference VALUES (526, 'Gigalith');
INSERT INTO pokemondata2.pokemon_reference VALUES (527, 'Woobat');
INSERT INTO pokemondata2.pokemon_reference VALUES (528, 'Swoobat');
INSERT INTO pokemondata2.pokemon_reference VALUES (529, 'Drilbur');
INSERT INTO pokemondata2.pokemon_reference VALUES (530, 'Excadrill');
INSERT INTO pokemondata2.pokemon_reference VALUES (531, 'Audino');
INSERT INTO pokemondata2.pokemon_reference VALUES (532, 'Timburr');
INSERT INTO pokemondata2.pokemon_reference VALUES (533, 'Gurdurr');
INSERT INTO pokemondata2.pokemon_reference VALUES (534, 'Conkeldurr');
INSERT INTO pokemondata2.pokemon_reference VALUES (535, 'Tympole');
INSERT INTO pokemondata2.pokemon_reference VALUES (536, 'Palpitoad');
INSERT INTO pokemondata2.pokemon_reference VALUES (537, 'Seismitoad');
INSERT INTO pokemondata2.pokemon_reference VALUES (538, 'Throh');
INSERT INTO pokemondata2.pokemon_reference VALUES (539, 'Sawk');
INSERT INTO pokemondata2.pokemon_reference VALUES (540, 'Sewaddle');
INSERT INTO pokemondata2.pokemon_reference VALUES (541, 'Swadloon');
INSERT INTO pokemondata2.pokemon_reference VALUES (542, 'Leavanny');
INSERT INTO pokemondata2.pokemon_reference VALUES (543, 'Venipede');
INSERT INTO pokemondata2.pokemon_reference VALUES (544, 'Whirlipede');
INSERT INTO pokemondata2.pokemon_reference VALUES (545, 'Scolipede');
INSERT INTO pokemondata2.pokemon_reference VALUES (546, 'Cottonee');
INSERT INTO pokemondata2.pokemon_reference VALUES (547, 'Whimsicott');
INSERT INTO pokemondata2.pokemon_reference VALUES (548, 'Petilil');
INSERT INTO pokemondata2.pokemon_reference VALUES (549, 'Lilligant');
INSERT INTO pokemondata2.pokemon_reference VALUES (550, 'Basculin');
INSERT INTO pokemondata2.pokemon_reference VALUES (551, 'Sandile');
INSERT INTO pokemondata2.pokemon_reference VALUES (552, 'Krokorok');
INSERT INTO pokemondata2.pokemon_reference VALUES (553, 'Krookodile');
INSERT INTO pokemondata2.pokemon_reference VALUES (554, 'Darumaka');
INSERT INTO pokemondata2.pokemon_reference VALUES (555, 'Darmanitan');
INSERT INTO pokemondata2.pokemon_reference VALUES (556, 'Maractus');
INSERT INTO pokemondata2.pokemon_reference VALUES (557, 'Dwebble');
INSERT INTO pokemondata2.pokemon_reference VALUES (558, 'Crustle');
INSERT INTO pokemondata2.pokemon_reference VALUES (559, 'Scraggy');
INSERT INTO pokemondata2.pokemon_reference VALUES (560, 'Scrafty');
INSERT INTO pokemondata2.pokemon_reference VALUES (561, 'Sigilyph');
INSERT INTO pokemondata2.pokemon_reference VALUES (562, 'Yamask');
INSERT INTO pokemondata2.pokemon_reference VALUES (563, 'Cofagrigus');
INSERT INTO pokemondata2.pokemon_reference VALUES (564, 'Tirtouga');
INSERT INTO pokemondata2.pokemon_reference VALUES (565, 'Carracosta');
INSERT INTO pokemondata2.pokemon_reference VALUES (566, 'Archen');
INSERT INTO pokemondata2.pokemon_reference VALUES (567, 'Archeops');
INSERT INTO pokemondata2.pokemon_reference VALUES (568, 'Trubbish');
INSERT INTO pokemondata2.pokemon_reference VALUES (569, 'Garbodor');
INSERT INTO pokemondata2.pokemon_reference VALUES (570, 'Zorua');
INSERT INTO pokemondata2.pokemon_reference VALUES (571, 'Zoroark');
INSERT INTO pokemondata2.pokemon_reference VALUES (572, 'Minccino');
INSERT INTO pokemondata2.pokemon_reference VALUES (573, 'Ciccino');
INSERT INTO pokemondata2.pokemon_reference VALUES (574, 'Gothita');
INSERT INTO pokemondata2.pokemon_reference VALUES (575, 'Gothorita');
INSERT INTO pokemondata2.pokemon_reference VALUES (576, 'Gothitelle');
INSERT INTO pokemondata2.pokemon_reference VALUES (577, 'Solosis');
INSERT INTO pokemondata2.pokemon_reference VALUES (578, 'Duosion');
INSERT INTO pokemondata2.pokemon_reference VALUES (579, 'Reuniclus');
INSERT INTO pokemondata2.pokemon_reference VALUES (580, 'Ducklett');
INSERT INTO pokemondata2.pokemon_reference VALUES (581, 'Swanna');
INSERT INTO pokemondata2.pokemon_reference VALUES (582, 'Vanillite');
INSERT INTO pokemondata2.pokemon_reference VALUES (583, 'Vanillish');
INSERT INTO pokemondata2.pokemon_reference VALUES (584, 'Vanilluxe');
INSERT INTO pokemondata2.pokemon_reference VALUES (585, 'Deerling');
INSERT INTO pokemondata2.pokemon_reference VALUES (586, 'Sawsbuck');
INSERT INTO pokemondata2.pokemon_reference VALUES (587, 'Emolga');
INSERT INTO pokemondata2.pokemon_reference VALUES (588, 'Karrablast');
INSERT INTO pokemondata2.pokemon_reference VALUES (589, 'Escavalier');
INSERT INTO pokemondata2.pokemon_reference VALUES (590, 'Foongus');
INSERT INTO pokemondata2.pokemon_reference VALUES (591, 'Amoonguss');
INSERT INTO pokemondata2.pokemon_reference VALUES (592, 'Frillish');
INSERT INTO pokemondata2.pokemon_reference VALUES (593, 'Jellicent');
INSERT INTO pokemondata2.pokemon_reference VALUES (594, 'Alomomola');
INSERT INTO pokemondata2.pokemon_reference VALUES (595, 'Joltik');
INSERT INTO pokemondata2.pokemon_reference VALUES (596, 'Galvantula');
INSERT INTO pokemondata2.pokemon_reference VALUES (597, 'Ferroseed');
INSERT INTO pokemondata2.pokemon_reference VALUES (598, 'Ferrothorn');
INSERT INTO pokemondata2.pokemon_reference VALUES (599, 'Klink');
INSERT INTO pokemondata2.pokemon_reference VALUES (600, 'Klang');
INSERT INTO pokemondata2.pokemon_reference VALUES (601, 'Klinklang');
INSERT INTO pokemondata2.pokemon_reference VALUES (602, 'Tynamo');
INSERT INTO pokemondata2.pokemon_reference VALUES (603, 'Eelektrik');
INSERT INTO pokemondata2.pokemon_reference VALUES (604, 'Eelektross');
INSERT INTO pokemondata2.pokemon_reference VALUES (605, 'Elgyem');
INSERT INTO pokemondata2.pokemon_reference VALUES (606, 'Beheeyem');
INSERT INTO pokemondata2.pokemon_reference VALUES (607, 'Litwick');
INSERT INTO pokemondata2.pokemon_reference VALUES (608, 'Lampent');
INSERT INTO pokemondata2.pokemon_reference VALUES (609, 'Chandelure');
INSERT INTO pokemondata2.pokemon_reference VALUES (610, 'Axew');
INSERT INTO pokemondata2.pokemon_reference VALUES (611, 'Fraxure');
INSERT INTO pokemondata2.pokemon_reference VALUES (612, 'Haxorus');
INSERT INTO pokemondata2.pokemon_reference VALUES (613, 'Cubchoo');
INSERT INTO pokemondata2.pokemon_reference VALUES (614, 'Beartic');
INSERT INTO pokemondata2.pokemon_reference VALUES (615, 'Cryogonal');
INSERT INTO pokemondata2.pokemon_reference VALUES (616, 'Shelmet');
INSERT INTO pokemondata2.pokemon_reference VALUES (617, 'Accelgor');
INSERT INTO pokemondata2.pokemon_reference VALUES (618, 'Stunfisk');
INSERT INTO pokemondata2.pokemon_reference VALUES (619, 'Mienfoo');
INSERT INTO pokemondata2.pokemon_reference VALUES (620, 'Mienshao');
INSERT INTO pokemondata2.pokemon_reference VALUES (621, 'Druddigon');
INSERT INTO pokemondata2.pokemon_reference VALUES (622, 'Golett');
INSERT INTO pokemondata2.pokemon_reference VALUES (623, 'Golurk');
INSERT INTO pokemondata2.pokemon_reference VALUES (624, 'Pawniard');
INSERT INTO pokemondata2.pokemon_reference VALUES (625, 'Bisharp');
INSERT INTO pokemondata2.pokemon_reference VALUES (626, 'Bouffalant');
INSERT INTO pokemondata2.pokemon_reference VALUES (627, 'Rufflet');
INSERT INTO pokemondata2.pokemon_reference VALUES (628, 'Braviary');
INSERT INTO pokemondata2.pokemon_reference VALUES (629, 'Vullaby');
INSERT INTO pokemondata2.pokemon_reference VALUES (630, 'Mandibuzz');
INSERT INTO pokemondata2.pokemon_reference VALUES (631, 'Heatmor');
INSERT INTO pokemondata2.pokemon_reference VALUES (632, 'Durant');
INSERT INTO pokemondata2.pokemon_reference VALUES (633, 'Deino');
INSERT INTO pokemondata2.pokemon_reference VALUES (634, 'Zweilous');
INSERT INTO pokemondata2.pokemon_reference VALUES (635, 'Hydreigon');
INSERT INTO pokemondata2.pokemon_reference VALUES (636, 'Larvesta');
INSERT INTO pokemondata2.pokemon_reference VALUES (637, 'Volcarona');
INSERT INTO pokemondata2.pokemon_reference VALUES (638, 'Cobalion');
INSERT INTO pokemondata2.pokemon_reference VALUES (639, 'Terrakion');
INSERT INTO pokemondata2.pokemon_reference VALUES (640, 'Virizion');
INSERT INTO pokemondata2.pokemon_reference VALUES (641, 'Tornadus');
INSERT INTO pokemondata2.pokemon_reference VALUES (642, 'Thundurus');
INSERT INTO pokemondata2.pokemon_reference VALUES (643, 'Reshiram');
INSERT INTO pokemondata2.pokemon_reference VALUES (644, 'Zekrom');
INSERT INTO pokemondata2.pokemon_reference VALUES (645, 'Landorus');
INSERT INTO pokemondata2.pokemon_reference VALUES (646, 'Kyurem');
INSERT INTO pokemondata2.pokemon_reference VALUES (647, 'Keldeo');
INSERT INTO pokemondata2.pokemon_reference VALUES (648, 'Meloetta');
INSERT INTO pokemondata2.pokemon_reference VALUES (649, 'Genesect');
INSERT INTO pokemondata2.pokemon_reference VALUES (650, 'Chespin');
INSERT INTO pokemondata2.pokemon_reference VALUES (651, 'Quilladin');
INSERT INTO pokemondata2.pokemon_reference VALUES (652, 'Chesnaught');
INSERT INTO pokemondata2.pokemon_reference VALUES (653, 'Fennekin');
INSERT INTO pokemondata2.pokemon_reference VALUES (654, 'Braixen');
INSERT INTO pokemondata2.pokemon_reference VALUES (655, 'Delphox');
INSERT INTO pokemondata2.pokemon_reference VALUES (656, 'Froakie');
INSERT INTO pokemondata2.pokemon_reference VALUES (657, 'Froadier');
INSERT INTO pokemondata2.pokemon_reference VALUES (658, 'Greninja');
INSERT INTO pokemondata2.pokemon_reference VALUES (659, 'Bunnelby');
INSERT INTO pokemondata2.pokemon_reference VALUES (660, 'Diggersby');
INSERT INTO pokemondata2.pokemon_reference VALUES (661, 'Fletchling');
INSERT INTO pokemondata2.pokemon_reference VALUES (662, 'Fletchinder');
INSERT INTO pokemondata2.pokemon_reference VALUES (663, 'Talonflame');
INSERT INTO pokemondata2.pokemon_reference VALUES (664, 'Scatterbug');
INSERT INTO pokemondata2.pokemon_reference VALUES (665, 'Spewpa');
INSERT INTO pokemondata2.pokemon_reference VALUES (666, 'Vivillon');
INSERT INTO pokemondata2.pokemon_reference VALUES (667, 'Litleo');
INSERT INTO pokemondata2.pokemon_reference VALUES (668, 'Pyroar');
INSERT INTO pokemondata2.pokemon_reference VALUES (669, 'Flabebe');
INSERT INTO pokemondata2.pokemon_reference VALUES (670, 'Floette');
INSERT INTO pokemondata2.pokemon_reference VALUES (671, 'Florges');
INSERT INTO pokemondata2.pokemon_reference VALUES (672, 'Skiddo');
INSERT INTO pokemondata2.pokemon_reference VALUES (673, 'Gogoat');
INSERT INTO pokemondata2.pokemon_reference VALUES (674, 'Pancham');
INSERT INTO pokemondata2.pokemon_reference VALUES (675, 'Pangoro');
INSERT INTO pokemondata2.pokemon_reference VALUES (676, 'Furfrou');
INSERT INTO pokemondata2.pokemon_reference VALUES (677, 'Espurr');
INSERT INTO pokemondata2.pokemon_reference VALUES (678, 'Meowstic');
INSERT INTO pokemondata2.pokemon_reference VALUES (679, 'Honedge');
INSERT INTO pokemondata2.pokemon_reference VALUES (680, 'Doublade');
INSERT INTO pokemondata2.pokemon_reference VALUES (681, 'Aegislash');
INSERT INTO pokemondata2.pokemon_reference VALUES (682, 'Spritzee');
INSERT INTO pokemondata2.pokemon_reference VALUES (683, 'Aromatisse');
INSERT INTO pokemondata2.pokemon_reference VALUES (684, 'Swirlix');
INSERT INTO pokemondata2.pokemon_reference VALUES (685, 'Slurpuff');
INSERT INTO pokemondata2.pokemon_reference VALUES (686, 'Inkay');
INSERT INTO pokemondata2.pokemon_reference VALUES (687, 'Malamar');
INSERT INTO pokemondata2.pokemon_reference VALUES (688, 'Binacle');
INSERT INTO pokemondata2.pokemon_reference VALUES (689, 'Barbaracle');
INSERT INTO pokemondata2.pokemon_reference VALUES (690, 'Skrelp');
INSERT INTO pokemondata2.pokemon_reference VALUES (691, 'Dragalge');
INSERT INTO pokemondata2.pokemon_reference VALUES (692, 'Clauncher');
INSERT INTO pokemondata2.pokemon_reference VALUES (693, 'Clawitzer');
INSERT INTO pokemondata2.pokemon_reference VALUES (694, 'Helioptile');
INSERT INTO pokemondata2.pokemon_reference VALUES (695, 'Heliolisk');
INSERT INTO pokemondata2.pokemon_reference VALUES (696, 'Tyrunt');
INSERT INTO pokemondata2.pokemon_reference VALUES (697, 'Tyrantrum');
INSERT INTO pokemondata2.pokemon_reference VALUES (698, 'Amaura');
INSERT INTO pokemondata2.pokemon_reference VALUES (699, 'Aurorus');
INSERT INTO pokemondata2.pokemon_reference VALUES (700, 'Sylveon');
INSERT INTO pokemondata2.pokemon_reference VALUES (701, 'Hawlucha');
INSERT INTO pokemondata2.pokemon_reference VALUES (702, 'Dedenne');
INSERT INTO pokemondata2.pokemon_reference VALUES (703, 'Carbink');
INSERT INTO pokemondata2.pokemon_reference VALUES (704, 'Goomy');
INSERT INTO pokemondata2.pokemon_reference VALUES (705, 'Sliggoo');
INSERT INTO pokemondata2.pokemon_reference VALUES (706, 'Goodra');
INSERT INTO pokemondata2.pokemon_reference VALUES (707, 'Klefki');
INSERT INTO pokemondata2.pokemon_reference VALUES (708, 'Phantump');
INSERT INTO pokemondata2.pokemon_reference VALUES (709, 'Trevenant');
INSERT INTO pokemondata2.pokemon_reference VALUES (710, 'Pumpkaboo');
INSERT INTO pokemondata2.pokemon_reference VALUES (711, 'Gourgeist');
INSERT INTO pokemondata2.pokemon_reference VALUES (712, 'Bergemite');
INSERT INTO pokemondata2.pokemon_reference VALUES (713, 'Avalugg');
INSERT INTO pokemondata2.pokemon_reference VALUES (714, 'Noibat');
INSERT INTO pokemondata2.pokemon_reference VALUES (715, 'Noivern');
INSERT INTO pokemondata2.pokemon_reference VALUES (716, 'Xerneas');
INSERT INTO pokemondata2.pokemon_reference VALUES (717, 'Yveltal');
INSERT INTO pokemondata2.pokemon_reference VALUES (718, 'Zygarde');


--
-- Data for Name: pokemon_types; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.pokemon_types VALUES (0, 'None');
INSERT INTO pokemondata2.pokemon_types VALUES (1, 'Grass');
INSERT INTO pokemondata2.pokemon_types VALUES (2, 'Normal');
INSERT INTO pokemondata2.pokemon_types VALUES (3, 'Fire');
INSERT INTO pokemondata2.pokemon_types VALUES (4, 'Fighting');
INSERT INTO pokemondata2.pokemon_types VALUES (5, 'Water');
INSERT INTO pokemondata2.pokemon_types VALUES (6, 'Flying');
INSERT INTO pokemondata2.pokemon_types VALUES (7, 'Poison');
INSERT INTO pokemondata2.pokemon_types VALUES (8, 'Electric');
INSERT INTO pokemondata2.pokemon_types VALUES (9, 'Ground');
INSERT INTO pokemondata2.pokemon_types VALUES (10, 'Psychic');
INSERT INTO pokemondata2.pokemon_types VALUES (11, 'Rock');
INSERT INTO pokemondata2.pokemon_types VALUES (12, 'Ice');
INSERT INTO pokemondata2.pokemon_types VALUES (13, 'Bug');
INSERT INTO pokemondata2.pokemon_types VALUES (14, 'Dragon');
INSERT INTO pokemondata2.pokemon_types VALUES (15, 'Ghost');
INSERT INTO pokemondata2.pokemon_types VALUES (16, 'Dark');
INSERT INTO pokemondata2.pokemon_types VALUES (17, 'Steel');
INSERT INTO pokemondata2.pokemon_types VALUES (18, 'Fairy');


--
-- Data for Name: ptu_damage_levels; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.ptu_damage_levels VALUES (1, '1d6 + 1', '5');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (2, '1d6 + 3', '7');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (3, '1d6 + 5', '9');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (4, '1d8 + 6', '11');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (5, '1d8 + 8', '13');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (6, '2d6 + 8', '15');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (7, '2d6 + 10', '17');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (8, '2d8 + 10', '19');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (9, '2d10 + 10', '21');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (10, '3d8 + 10', '24');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (11, '3d10 + 10', '27');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (12, '3d12 + 10', '30');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (13, '4d10 + 10', '35');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (14, '4d10 + 15', '40');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (15, '4d10 + 20', '45');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (16, '5d10 + 20', '50');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (17, '5d12 + 25', '60');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (18, '6d12 + 25', '65');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (19, '6d12 + 30', '70');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (20, '6d12 + 35', '75');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (21, '6d12 + 40', '80');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (22, '6d12 + 45', '85');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (23, '6d12 + 50', '90');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (24, '6d12 + 55', '95');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (25, '6d12 + 60', '100');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (26, '7d12 + 65', '110');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (27, '8d12 + 70', '120');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (28, '8d12 + 80', '130');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (0, '0', '0');
INSERT INTO pokemondata2.ptu_damage_levels VALUES (-1, '-1', '-1');


--
-- Data for Name: ptu_pokemon_abilities; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (1, 'Static', 'Increase the Damage of all Moves with which the user shares an Elemental Type by +1 Damage Base.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (2, 'Battle - Free Action', 'When the user is reduced to 0 HP or less, they create a Burst 1. Everything in the Burst loses Â¼ of its Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (3, 'Battle - Free Action', 'The weather is set to normal as long as the Pokémon with Air Lock wants it to remain that way. The user may continue to sustain this effect as a Swift Action each round.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (4, 'Static', 'Whenever the user targets uses a damaging Move on a Pokémon or Trainer that have acted before it during Initiative this Round, that Move deals an additional +5 Damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (5, 'At-Will - Free Action', 'When the Pokémon receives a Critical Hit, they become Enraged and gain +6 Attack Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (6, 'At-Will - Swift Action', 'Target: Pokémon or Trainers<br>The target reveals if they have any Moves that are Super-Effective against the Pokémon with Anticipation. You may not target a Pokémon or Trainer more than once per encounter with Anticipation. Anticipation only reveals whether the opponent does or does not have those moves, not the specific moves themselves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (7, 'Battle - Free Action', 'Target: Pokémon or Trainers<br>Once Arena trap is activated, all foes within 5 meters of the user are considered Slowed. This does not affect targets of the Flying Type, or with a Levitate, Sky, or Burrow Speed of 4 or higher. The user may end the effect as a Free Action, and the effect ends if the user is fainted or returned to a Poké Ball.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (8, 'Static', 'Anything sleeping within 10 meters of the Pokémon with Bad Dreams lose 1/8th of their full HP at the beginning of each of their turns.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (9, 'Static', 'The user is immune to Critical Hits; they are instead normal hits.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (10, 'Static', 'The user cannot have its Defense Stat lowered. The user cannot have its Defense Combat Stages lowered.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (11, 'Static', 'Keyword: Last Chance<br>Fire');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (12, 'Static', 'While in Sunny Weather, the user gains +4 Speed Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (13, 'Static', 'The Pokémon''s Combat Stages may not be lowered by the effect of Abilities or Moves. Status effects may still alter their Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (14, 'Battle - Free Action', 'The weather of the field is set to normal.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (15, 'At-Will - Free Action', 'Trigger: The user is targeted by a Move<br>The User''s Type changes to match the Type of the triggering Move.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (16, 'Static', 'The user gains a +3 Bonus to all Accuracy Rolls.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (17, 'Static', 'If something would raise the user''s Combat Stages, it instead lowers the user''s Combat Stages by the same amount. If something would lower the user''s Combat Stages, it instead raises the user''s Combat Stages by the same amount.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (18, 'Battle - Free Action', 'Trigger: The user is damaged by a Melee Move<br>The Move becomes Disabled.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (19, 'Battle - Free Action', 'Trigger: A foe of the opposite gender attacks the user with a Melee Attack<br>The foe becomes Infatuated.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (20, 'Static', 'The Moves Selfdestruct and Explosion may not be used when a Pokémon with Damp is within 10-meters of Selfdestruct or Explosion''s user. The Ability Aftermath may not be activated when a Pokémon with Damp is within 10- meters of the Pokémon attempting to activate Aftermath.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (21, 'Static', 'Keyword: Last Chance<br>Dark');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (22, 'Static', 'When below 50% HP, this Pokémon''s Attack and Special Attack are lowered by 1 Combat Stage each. If the user is healed above 50% HP, they regain these combat stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (23, 'Static', 'Whenever the user has its Combat Stages lowered, by something other than its own Moves or Abilities, the user''s Attack is raised 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (24, 'Battle - Free Action', 'Target: Trainer or Pokémon<br>The target must reveal whether its Defense or Special Defense Stats are lower. If the Defense Stat is lower, the user gains a +5 Damage Bonus with Physical Moves when attacking the target. If the Special Defense Stat is lower, the Damage Bonus is instead to Special Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (25, 'Battle - Swift Action', 'The Weather changes to be Rainy. The Rainy Weather persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (26, 'Battle - Free Action', 'The Weather changes to be Sunny. The Sunny Weather persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (27, 'Static', 'Whenever the user is hit by a damaging Fire Type Move or ends their turn in Sunny Weather, they lose 1/8th of their Max HP. The user is immune to Water Type Moves, and whenever the user is hit by a damaging Water-Type Move or ends their turn in Rainy Weather, they gain 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (28, 'Static', 'The user gains a +3 Bonus to rolls made due to Status Afflictions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (29, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Attack<br>Roll 1d6. On a result of 1 or 2, the attacker is Poisoned. On a result of 3 or 4, the attacker is Paralyzed. On a result of 5 or 6, the attacker falls asleep.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (30, 'Static', 'When the user is hit by a Super-Effective attack, the attack deals 1.5x damage instead of x2 damage. If the user is hit by a Super-Super-Effective attack, the attack deals x2 damage instead of x3 damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (31, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Attack<br>The attacking foe becomes Burned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (32, 'Static', 'While Burned, the user''s Special Attack is raised by 2 Combat Stages. If the user is cured of its Burn, its Special Attack is lowered by 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (33, 'Static', 'The user does not take damage from Fire Type Moves. If the user is hit by a Fire Type Move, the user raises the Base Power of their next Fire-Type Move by +1.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (34, 'Battle - Free Action', 'Keyword: Burst<br>If it is Sunny, Flower Gift creates a 4-meter Burst. The user and all of their allies in the burst have their Attack raised 2 Combat Stages and have their Special Defense raised 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (35, 'Trigger', 'Keyword: Last Chance<br>Fighting');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (36, 'Static', 'The user''s Type changes depending on the weather. It changes to Fire Type if it is Sunny, Ice Type if it is Hailing, Water Type if it is Rainy, Rock Type if there is a Sandstorm. It returns to Normal Type if it is in normal weather or foggy weather. If there are multiple Weather Effects on the field, choose one type for the user to be that corresponds with an existing Weather Effect.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (37, 'Battle - Free Action', 'The Move with the highest Damage Dice Roll known by the targeted foe is revealed. If there is a tie, all tied Moves are revealed. The Moves revealed gain a -2 Penalty during Accuracy Checks when used by the target for the rest of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (38, 'Trigger', 'Keyword: Last Chance<br>Ice');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (39, 'Battle - Free Action', 'Trigger: An adjacent Ally takes Damage<br>The damage is resisted one step further.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (40, 'Battle - Free Action', 'Target: An Adjacent Pokémon<br>The target reveals their Type, Ability, Nature, Level, and name of any Held Items they are currently holding, if any.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (41, 'Weekly - Standard Action', 'A random Unown appears. The Unown has a Level of 2d8, but it cannot exceed the user''s Level. They are not immediately hostile.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (42, 'Static', 'The user may eat up to three Food Items per encounter, and up to two refreshments per half hour.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (43, 'Trigger - Hourly', 'While suffering from Burn, Poison, Paralysis, Freezing, or while Asleep, the user''s Attack is raised 2 Combat Stages. If suffering from none of these conditions, the user loses any Combat Stages gained this way.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (45, 'Trigger', 'Keyword: Last Chance<br>Ghost');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (46, 'Battle - Free Action', 'Target: An Adjacent Pokémon or Trainer<br>The target is cured of all Status conditions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (47, 'Static', 'The user resists Fire Type moves one step further ( Super-Effective Becomes Neutral, Doubly-Super Effective becomes Super-Effective, Neutral becomes Resistant, Resistant becomes doubly Resistant).');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (48, 'Static', 'When referring to Weight Classes, treat the Pokémon as if it is 2 Weight Classes higher.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (49, 'Center - Extended Action', 'If allowed time in an environment with abundant plant life, the user finds Honey if they are not holding an item.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (50, 'Static', 'The Pokémon''s Base Attack stat is doubled. This may double any bonuses from Nature or Vitamins, but not bonuses from Trainer Features.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (51, 'Static', 'The user receives a -2 penalty to all Accuracy Rolls. At the beginning of the user''s turn, if the user''s Attack Stat is at 0 Combat Stages or lower, the user gains +1 Attack Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (52, 'Static', 'At the end of the User''s turn, if the weather is Rainy, the user is cured of one Status Condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (53, 'Static', 'The user''s Attack Stat may not be lowered, and its Attack Combat Stages may not be lowered.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (54, 'Trigger', 'While Hailing, the user gains 1/16th of their full HP at the beginning of each of their turns. The user is not damaged by Hail.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (55, 'Static', 'Moves that target the user have a -2 Accuracy Penalty against the user. Does not affect attackers with the Blindsense Capability.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (56, 'At-Will - Free Action', 'Trigger: The user joins an encounter<br>Choose another Pokémon on your roster. The user now looks exactly like that Pokémon from your team until the user takes Damage as a result of a Move. This change is aesthetic and does not affect typing or Moves. The user may dismiss Illusion as a Free Action.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (57, 'Static', 'The user cannot be Poisoned or Badly Poisoned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (59, 'Static', 'The user gains a +2 Bonus to Stealth Checks, does not trigger Hazards, and Blessings cannot be activated in response to its actions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (60, 'Static', 'The user cannot be Flinched.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (61, 'Static', 'The user is immune to the Sleep condition, and cannot use the move Rest.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (62, 'Battle - Swift Action', 'Target: Pokémon or Trainer within 5 meters<br>Lower the target''s Attack 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (63, 'At-Will - Free Action', 'Trigger: The user is hit by a damaging Melee Attack<br>The attacker loses HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (64, 'Static', 'The user deals +5 Damage when using any of the following Moves; Bullet Punch, Comet Punch, Dizzy Punch, Drain Punch, Dynamicpunch, Fire Punch, Meteor Mash, Shadow Punch, Ice Punch, Mach Punch, Mega Punch, Sky Uppercut, Thunderpunch, Focus Punch, or Hammer Arm.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (65, 'At-Will - Free Action', 'Trigger: The user is hit by a damaging Dark Type Move<br>The user may raise its Attack 1 Combat Stage. The user always gains a +4 bonus to Skill Checks made to Intercept.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (66, 'Static', 'The user''s Accuracy cannot be lowered and their attacks cannot have Accuracy Penalties (such as from Illuminate) and the user is immune to the Blind condition (but not Total Blindness) and the user ignores any Evasion not directly derived from Stats (such as from the Instinct Ability, or from moves like Minimize). Additionally, the user is always able to tell which Double Team clone is the real one.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (67, 'Static', 'The Pokémon ignores the effects of all held Items in its possession. The user may drop held items, at-will, as a Free Action during their turn, even if they have Status Afflictions that prevent them from taking actions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (68, 'Trigger', 'Keyword: Last Chance<br>Ground');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (69, 'Trigger', 'Keyword: Last Chance<br>Normal');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (70, 'Static', 'At the end of the User''s turn, if the weather is Sunny, the user is cured of one Status Condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (71, 'Static', 'The Pokémon is immune to Ground Type Moves, and gains a Levitate Speed of 4, or has existing Levitate Speeds increased by +4.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (72, 'Static', 'When referring to Weight Classes, treat the Pokémon as if it is 2 Weight Classes lower.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (73, 'Battle - Free Action', 'Trigger: A ranged Electric Type Move is used within 10 Meters of the user.<br>The Move is turned into a Single-Target Move and is re-directed at the User without fail, and cannot miss. This negates Lock-On or Mind Reader. Additionally, the user is always immune to Electric Type Moves, and each time they are hit by an Electric Move, the User''s Special Attack is raised 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (74, 'Static', 'The user is immune to Paralysis.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (75, 'Static', 'When the Pokémon with Liquid Ooze is damaged by Absorb, Drain Punch, Giga Drain, Horn Leech, Leech Life, Leech Seed or Mega Drain, that Move gains Recoil Â½ and the Move''s user does not gain any HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (76, 'Trigger', 'Keyword: Last Chance<br>Flying');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (77, 'Battle - Free Action', 'Trigger: The user is hit by a Status Move<br>The user may reflect the Move back to the offender. This Ability may be used to change the placement and affiliation of any Hazards being set within 10 meters of the user as well.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (78, 'Static', 'Whenever the user would lose HP or take damage that isn''t a result of a Damage Dice Roll the user does not lose HP or take Damage. This includes, but is not limited to, Weather, Leech Seed, Afflictions, Traps, Recoil, etc.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (79, 'Static', 'The user cannot be Frozen.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (80, 'At-Will - Swift Action', 'Target: A Steel-Type Pokémon<br>Until the end of the user''s next turn, the target may not move more then 8-meters away from the user and/or may not move closer than 3-meters to the user.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (81, 'Static', 'When Asleep, Paralyzed, Burned, Frozen or Poisoned, Marvel Scale raises the user''s Defense by +2 Combat Stages. The Combat Stages return to normal if the user is cured of their status affliction.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (82, 'Trigger', 'Keyword: Last Chance<br>Psychic');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (83, 'Battle - Free Action', 'Target: An ally with Plus within 10 Meters<br>The target''s Special Attack is raised by +2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (84, 'Battle - Free Action', 'Target: An Adjacent Pokémon or Trainer<br>One of the target''s Abilities, chosen at Random, is disabled for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (85, 'At-Will - Free Action', 'Trigger: The user joins an encounter, misses with a Move, or hurts itself in Confusion<br>Moody must be activated whenever it is triggered. Roll 1d10 to determine a Stat to be raised by +2 Combat Stages, then roll 1d10 to determine a Stat to be lower 2 Combat Stages. 1 or 2 is Attack, 3 or 4 is Defense, 5 or 6 is Special Attack, 7 or 8 is Special Defense, 9 or 10 is Speed.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (86, 'Static', 'The Pokémon is immune to Electric Type Moves. Whenever an Electric Type Move hits the Pokémon, raise their Speed by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (87, 'Trigger', 'Keyword: Last Chance<br>Rock');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (88, 'Static', 'Whenever the user''s Move causes a target to faint, it may raise its Attack Combat Stage by +1. You may only trigger Moxie once per Move, even if the Move causes multiple targets to faint.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (89, 'Static', 'When at full HP, when taking damage from a Move, half the total damage before applying weakness and resistance, after applying your Defenses.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (90, 'At Will - Free Action', 'The user changes its Elemental Type to any of the Elemental Types. Multitype cannot be copied or disabled.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (91, 'Center - Effect', 'Trigger: The user is targeted by a Melee Move<br>Replace all of the Attacker''s abilities with Mummy until the end of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (92, 'Center - Free Action', 'Whenever the user is returned to its Poké Ball, it may activate Natural Cure to cure itself of all Status Afflictions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (93, 'Static', 'The user may not apply any form of Evasion to avoiding melee attacks; however, the user ignores all forms of evasion when making Melee attack rolls.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (94, 'Static', 'All Moves performed by the Pokémon are considered Normal Type instead of whatever Type they normally are.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (95, 'Static', 'The user is immune to the Infatuated condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (96, 'Trigger', 'Keyword: Last Chance<br>Electric');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (97, 'Static', 'The user does not take damage from any Weather that would normally cause it to take damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (98, 'Trigger', 'Keyword: Last Chance<br>Grass');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (99, 'Static', 'The user is immune to Confusion.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (100, 'Battle - Free Action', 'Trigger: The user hits an opponent with a Melee Move<br>If the target has a Held Item and the user does not, the user takes the Held Item the opponent is holding.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (102, 'Battle - Free Action', 'Target: An ally with Minus within 10 Meters<br>The target''s Special Attack is raised by +2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (103, 'Static', 'When Poisoned or Badly Poisoned, the Pokémon gains 1/8th of its full HP each turn instead of losing any HP. The Pokémon does not have any Combat Stages lowered as a result of being Poisoned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (104, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Move<br>The attacking foe is Poisoned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (105, 'Static', 'The Pokémon''s Moves which deal damage Poison Legal Targets on 19-20. If a move already has a chance of Poisoning foes, Poison Touch increased the effect range by 2.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (106, 'Static', 'The user may use Status Moves as Interrupts.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (107, 'Static', 'While within 3 meters of the user, all foes are Suppressed. This effect ends when the user is Fainted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (108, 'Trigger', 'Keyword: Last Chance<br>Dragon');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (109, 'Static', 'The Pokémon''s base attack stat is doubled. This may double any bonuses from Nature or Vitamins, but not bonuses from Features.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (110, 'Static', 'When Poisoned, Burned, Paralyzed, Frozen or put to Sleep, the user''s Speed is raised 2 Combat Stages. The user does not lose Speed Combat Stages from Paralysis. If the user is healed all Status Conditions, their Speed is lowered appropriately.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (111, 'Static', 'While Rainy, the user gains 1/16th of their Max HP at the beginning of each of their turns.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (112, 'At-Will - Free Action', 'Trigger: The user is hit by a Bug, Dark, or Ghost Type Move<br>The user''s Speed is raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (113, 'Static', 'The user deals +5 Damage when using Submission, Double-Edge, Take Down, Jump Kick, Hi Jump Kick, Volt Tackle, Wood Hammer, Flare Blitz, Brave Bird or Head Smash.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (114, 'Center - Special', 'The user instantly heals 1/4th of its max HP. Regenerator may be triggered either by spending 5 consecutive Full Actions attempting to regenerate, or by spending 3 turns inside a Poké Ball.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (115, 'Static', 'Whenever the user deals direct damage to a target of the same gender, increase the Damage dealt by +5.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (116, 'Static', 'The user ignores the Recoil keyword when attacking.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (117, 'At-Will - Free Action', 'Trigger: The user is hit by a damaging Melee Attack<br>The attacker loses HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (118, 'Static', 'The user cannot be Slowed, Stuck, or Trapped.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (119, 'Static', 'While in a Sandstorm, the user''s Ground, Rock, and Steel-Type Direct-Damage Moves deal +5 Damage. Additionally, the user is immune to damage from Sandstorms.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (120, 'Static', 'While the Weather is a Sandstorm, the user gains +4 Speed Combat Stages. Additionally, the user is immune to damage from Sandstorms.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (121, 'Battle - Free Action', 'The Weather changes to a Sandstorm. The Sandstorm persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (122, 'Static', 'The user''s Evasion is increased by +2 while in a Sandstorm. Allies adjacent to the user are not damaged by the Sandstorm.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (123, 'Static', 'The user is immune to the Grass Type. If a damaging Grass Type Move hits the user, the user gains +1 Attack Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (124, 'Static', 'Ghosts are not immune to the user''s Normal and Fighting-Type Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (125, 'Static', 'Move Effects that are triggered by a sufficiently high accuracy roll have their activation range increased by 3. This does not apply to Critical Hits.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (126, 'Battle - Free Action', 'Target: An adjacent Trainer or Pokémon<br>The target is slowed, and may not move more than 6 meters away from the user.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (127, 'Battle - Free Action', 'The user is cured of Paralysis, Freezing, Burns, Poison, and Sleep.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (128, 'Static', 'If a Pokémon with Sheer Force uses a Move with a secondary effect that triggers during Accuracy Roll, increase that Move''s Base Damage by +2. However, the secondary effects of Move never trigger. This does not affect Critical Hits, or moves with increased Critical Hit ranges.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (129, 'Static', 'The user is immune to Critical Hits; they are instead normal hits.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (130, 'Static', 'The user ignores the secondary effects that trigger during accuracy roll of damaging Moves that target the user. For example, Flamethrower can never inflict the Burn Condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (131, 'Static', 'When the Pokémon''s Combat Stages are altered, double the amount of Combat Stages they are raised or lowered.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (132, 'Battle - Free Action', 'Trigger: The user hits with a Move with the Five Strike keyword.<br>The Triggering Move automatically hits 5 Times.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (133, 'Static', 'For 3 rounds after joining an encounter, the Pokémon''s Speed and Attack Stats are halved.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (134, 'Static', 'When the Pokémon gets a Critical Hit, add the value of the Damage Dice Roll an additional time to the total damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (135, 'Static', 'The user''s Evasion is increased by +2 while in Hail. The user and allies adjacent to the user are not damaged by Hail.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (136, 'Battle - Free Action', 'The Weather changes and it begins Hailing. The Hail persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (137, 'Static', 'When Sunny, the Pokémon loses 1/16th of its Max HP at the beginning of its turn. When Sunny, its Special Attack Stat is increased by 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (138, 'Static', 'When the user is hit by a Super-Effective attack, the attack deals 1.5x damage instead of x2 damage. If the user is hit by a Super-Super-Effective attack, the attack deals x2 damage instead of x3 damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (139, 'Static', 'The Pokémon is immune to damage caused by and the effects of the Moves Bug Buzz, Chatter, Echoed Voice, Grasswhistle, Growl, Heal Bell, Hyper Voice, Metal Sound, Perish Song, Relic Song, Roar, Screech, Sing, Snore, Supersonic and Uproar.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (140, 'Static', 'The Pokémon''s Speed is raised 1 Combat Stage at the end of each of its turns. Speed Boost has no effect while out of combat.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (141, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Attack<br>The attacking foe becomes Paralyzed.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (142, 'Static', 'In a round''s queue, a Pokémon with Stall is always last. If a Pokémon goes to the end of the queue, the Pokémon with Stall is still the last to move.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (143, 'At-Will - Free Action', 'Trigger: The user is Flinched<br>The user''s Speed is raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (144, 'Static', 'The Pokémon''s Moves Flinch Targets on a roll of 19-20 during Accuracy Check. If a move already has a chance of Flinching foes, Stench lowers the number needed to roll in order to Flinch by -2.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (145, 'Static', 'The Pokémon''s held items cannot be stolen, switched, destroyed or dropped.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (146, 'Battle - Free Action', 'Trigger: A ranged Water Type Move is used within 10 Meters of the user.<br>The Move is turned into a Single-Target Move and is re-directed at the User without fail, and cannot miss. This negates Lock-On or Mind Reader. Additionally, the user is always immune to Water Type Moves, and each time they are hit by a Water-Type Move, the User''s Special Attack is raised 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (147, 'Static', 'The Pokémon is immune to the Moves Sheer Cold, Guillotine, Horn Drill and Fissure. If any attack would lower this Pokémon to 0 HP or less from full HP, instead the Pokémon''s HP is set to 1. Pokémon with Sturdy do not gain Injuries from Massive Damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (148, 'Static', 'The user is immune to Push effects, and the effects of Roar.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (149, 'Static', 'The Pokémon''s Moves are Critical Hits on 18-20. If a Move already has an extended Critical Hit range, Super Luck extends that range by 2.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (150, 'Trigger', 'Keyword: Last Chance<br>Bug');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (151, 'Static', 'While in Rainy Weather, the user gains +4 Speed Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (152, 'Battle - Free Action', 'Trigger: The user is Paralyzed, Frozen, Burned, Poisoned, or put to Sleep.<br>The foe which caused the Status Condition is given the same Status they inflicted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (153, 'Trigger', 'While Confused, the user gains +3 Evasion.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (154, 'Static', 'Moves with a Damage Base of 6 or lower have their Damage Base increased by +2. This bonus always applies to Moves with the Double Strike or Fivestrike Keywords.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (155, 'Static', 'The user is never hit by the area-of-effect attacks of allied targets.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (156, 'At-Will - Free Action', 'Trigger: The user damages a foe<br>The damaged foe''s Abilities are disabled for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (157, 'Static', 'The user is one step more Resistant to Fire Type Moves and Ice Type Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (158, 'Static', 'The user''s Resisted moves are instead Neutral. The user''s Doubly Resisted moves are instead Resisted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (159, 'Trigger', 'Keyword: Last Chance<br>Water');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (160, 'Static', 'When Poisoned or Badly Poisoned, the user''s Attack is raised by 2 Combat Stages. If the user is cured of its Poisoning, its Attack stat is lowered by 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (161, 'Battle - Free Action Target: A Trainer or PokÃ©mon within 10 meters', 'The Pokémon gains an Ability known by the Target for the remainder of the encounter, or until it is Fainted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (162, 'Static', 'At the beginning of each of its turns, the user must roll 1d20. On a roll of 7 or lower, the target refuses to act; they heal 1/8th of its Max HP, and do not get a Standard Action that turn. Turns in which the user refuses to act count towards turns used up by Interrupts or the Exhausted Condition, and the user may make Rolls to cure themselves from Status Effects with a +3 Bonus that turn.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (163, 'At-Will - Free Action', 'Trigger: The user damages a foe<br>The damaged foe''s Abilities are disabled for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (164, 'Static', 'When the Pokémon is attacking or being attacked, it the foe must make all damage calculations as if their Combat Stages were at their default state.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (165, 'Trigger', 'Keyword: Last Chance<br>Steel');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (166, 'Trigger', 'After consuming or dropping a held item, the Pokémon''s Speed is raised 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (167, 'Static', 'During battle, as long as you have a line of sight to a foe, that foe may not eat or drink any Food Items.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (168, 'Trigger', 'Keyword: Last Chance<br>Poison');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (169, 'Static', 'Any allied Pokémon in the encounter gain a +2 Bonus to Accuracy Rolls.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (170, 'Static', 'Keyword: Immune<br>Sleep');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (171, 'Static', 'The user is immune to Electric-Type Moves, and whenever they are hit with an Electric Type Move, they gain HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (172, 'Static', 'The user is immune to Water-Type Moves, and whenever they are hit with a Water Type Move, they gain HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (173, 'Static', 'Keyword: Immune<br>Burns');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (174, 'Trigger', 'Whenever the user is hit by an attack that consults the user''s Defense stat, the user may lower its Defense Combat Stage one level in order to raise its Speed Combat Stage one level after Damage is resolved.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (175, 'Static', 'The user''s Combat Stages, Evasion, or Accuracy may not be lowered except by the user''s own Moves and effects.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (176, 'Static', 'Only damaging Moves that are Super-Effective hit the Pokémon with Wonder Guard, all other moves always deal 0 damage. Wonder Guard loses its effect if the user has no weaknesses.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (177, 'Static', 'The user gains +6 Evasion against Status Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (178, 'At-Will - Free Action', 'Keep two sets of Base Stats for Darmanitan, the first set of Base Stats are its normal stats while the second will be referred to during Zen Mode. The HP Stat for both sets of Base Stats must be the same. If Darmanitan has its Base Stats altered in any way, both sets of Base Stats are affected. As a free action, Darmanitan may activate Zen Mode if it is at less than 50% of its full HP. Darmanitan may change back from Zen Mode as a free action if its HP is at 50% or higher. Darmanitan may switch from one form to another once per encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (1, 'Static', 'Increase the Damage of all Moves with which the user shares an Elemental Type by +1 Damage Base.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (2, 'Battle - Free Action', 'When the user is reduced to 0 HP or less, they create a Burst 1. Everything in the Burst loses Â¼ of its Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (3, 'Battle - Free Action', 'The weather is set to normal as long as the Pokémon with Air Lock wants it to remain that way. The user may continue to sustain this effect as a Swift Action each round.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (4, 'Static', 'Whenever the user targets uses a damaging Move on a Pokémon or Trainer that have acted before it during Initiative this Round, that Move deals an additional +5 Damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (5, 'At-Will - Free Action', 'When the Pokémon receives a Critical Hit, they become Enraged and gain +6 Attack Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (6, 'At-Will - Swift Action', 'Target: Pokémon or Trainers<br>The target reveals if they have any Moves that are Super-Effective against the Pokémon with Anticipation. You may not target a Pokémon or Trainer more than once per encounter with Anticipation. Anticipation only reveals whether the opponent does or does not have those moves, not the specific moves themselves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (7, 'Battle - Free Action', 'Target: Pokémon or Trainers<br>Once Arena trap is activated, all foes within 5 meters of the user are considered Slowed. This does not affect targets of the Flying Type, or with a Levitate, Sky, or Burrow Speed of 4 or higher. The user may end the effect as a Free Action, and the effect ends if the user is fainted or returned to a Poké Ball.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (8, 'Static', 'Anything sleeping within 10 meters of the Pokémon with Bad Dreams lose 1/8th of their full HP at the beginning of each of their turns.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (9, 'Static', 'The user is immune to Critical Hits; they are instead normal hits.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (10, 'Static', 'The user cannot have its Defense Stat lowered. The user cannot have its Defense Combat Stages lowered.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (11, 'Static', 'Keyword: Last Chance<br>Fire');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (12, 'Static', 'While in Sunny Weather, the user gains +4 Speed Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (13, 'Static', 'The Pokémon''s Combat Stages may not be lowered by the effect of Abilities or Moves. Status effects may still alter their Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (14, 'Battle - Free Action', 'The weather of the field is set to normal.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (15, 'At-Will - Free Action', 'Trigger: The user is targeted by a Move<br>The User''s Type changes to match the Type of the triggering Move.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (16, 'Static', 'The user gains a +3 Bonus to all Accuracy Rolls.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (17, 'Static', 'If something would raise the user''s Combat Stages, it instead lowers the user''s Combat Stages by the same amount. If something would lower the user''s Combat Stages, it instead raises the user''s Combat Stages by the same amount.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (18, 'Battle - Free Action', 'Trigger: The user is damaged by a Melee Move<br>The Move becomes Disabled.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (19, 'Battle - Free Action', 'Trigger: A foe of the opposite gender attacks the user with a Melee Attack<br>The foe becomes Infatuated.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (20, 'Static', 'The Moves Selfdestruct and Explosion may not be used when a Pokémon with Damp is within 10-meters of Selfdestruct or Explosion''s user. The Ability Aftermath may not be activated when a Pokémon with Damp is within 10- meters of the Pokémon attempting to activate Aftermath.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (21, 'Static', 'Keyword: Last Chance<br>Dark');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (22, 'Static', 'When below 50% HP, this Pokémon''s Attack and Special Attack are lowered by 1 Combat Stage each. If the user is healed above 50% HP, they regain these combat stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (23, 'Static', 'Whenever the user has its Combat Stages lowered, by something other than its own Moves or Abilities, the user''s Attack is raised 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (24, 'Battle - Free Action', 'Target: Trainer or Pokémon<br>The target must reveal whether its Defense or Special Defense Stats are lower. If the Defense Stat is lower, the user gains a +5 Damage Bonus with Physical Moves when attacking the target. If the Special Defense Stat is lower, the Damage Bonus is instead to Special Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (25, 'Battle - Swift Action', 'The Weather changes to be Rainy. The Rainy Weather persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (26, 'Battle - Free Action', 'The Weather changes to be Sunny. The Sunny Weather persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (27, 'Static', 'Whenever the user is hit by a damaging Fire Type Move or ends their turn in Sunny Weather, they lose 1/8th of their Max HP. The user is immune to Water Type Moves, and whenever the user is hit by a damaging Water-Type Move or ends their turn in Rainy Weather, they gain 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (28, 'Static', 'The user gains a +3 Bonus to rolls made due to Status Afflictions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (29, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Attack<br>Roll 1d6. On a result of 1 or 2, the attacker is Poisoned. On a result of 3 or 4, the attacker is Paralyzed. On a result of 5 or 6, the attacker falls asleep.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (30, 'Static', 'When the user is hit by a Super-Effective attack, the attack deals 1.5x damage instead of x2 damage. If the user is hit by a Super-Super-Effective attack, the attack deals x2 damage instead of x3 damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (31, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Attack<br>The attacking foe becomes Burned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (32, 'Static', 'While Burned, the user''s Special Attack is raised by 2 Combat Stages. If the user is cured of its Burn, its Special Attack is lowered by 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (33, 'Static', 'The user does not take damage from Fire Type Moves. If the user is hit by a Fire Type Move, the user raises the Base Power of their next Fire-Type Move by +1.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (34, 'Battle - Free Action', 'Keyword: Burst<br>If it is Sunny, Flower Gift creates a 4-meter Burst. The user and all of their allies in the burst have their Attack raised 2 Combat Stages and have their Special Defense raised 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (35, 'Trigger', 'Keyword: Last Chance<br>Fighting');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (36, 'Static', 'The user''s Type changes depending on the weather. It changes to Fire Type if it is Sunny, Ice Type if it is Hailing, Water Type if it is Rainy, Rock Type if there is a Sandstorm. It returns to Normal Type if it is in normal weather or foggy weather. If there are multiple Weather Effects on the field, choose one type for the user to be that corresponds with an existing Weather Effect.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (37, 'Battle - Free Action', 'The Move with the highest Damage Dice Roll known by the targeted foe is revealed. If there is a tie, all tied Moves are revealed. The Moves revealed gain a -2 Penalty during Accuracy Checks when used by the target for the rest of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (38, 'Trigger', 'Keyword: Last Chance<br>Ice');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (39, 'Battle - Free Action', 'Trigger: An adjacent Ally takes Damage<br>The damage is resisted one step further.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (40, 'Battle - Free Action', 'Target: An Adjacent Pokémon<br>The target reveals their Type, Ability, Nature, Level, and name of any Held Items they are currently holding, if any.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (41, 'Weekly - Standard Action', 'A random Unown appears. The Unown has a Level of 2d8, but it cannot exceed the user''s Level. They are not immediately hostile.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (42, 'Static', 'The user may eat up to three Food Items per encounter, and up to two refreshments per half hour.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (43, 'Trigger - Hourly', 'While suffering from Burn, Poison, Paralysis, Freezing, or while Asleep, the user''s Attack is raised 2 Combat Stages. If suffering from none of these conditions, the user loses any Combat Stages gained this way.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (45, 'Trigger', 'Keyword: Last Chance<br>Ghost');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (46, 'Battle - Free Action', 'Target: An Adjacent Pokémon or Trainer<br>The target is cured of all Status conditions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (47, 'Static', 'The user resists Fire Type moves one step further ( Super-Effective Becomes Neutral, Doubly-Super Effective becomes Super-Effective, Neutral becomes Resistant, Resistant becomes doubly Resistant).');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (48, 'Static', 'When referring to Weight Classes, treat the Pokémon as if it is 2 Weight Classes higher.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (49, 'Center - Extended Action', 'If allowed time in an environment with abundant plant life, the user finds Honey if they are not holding an item.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (50, 'Static', 'The Pokémon''s Base Attack stat is doubled. This may double any bonuses from Nature or Vitamins, but not bonuses from Trainer Features.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (51, 'Static', 'The user receives a -2 penalty to all Accuracy Rolls. At the beginning of the user''s turn, if the user''s Attack Stat is at 0 Combat Stages or lower, the user gains +1 Attack Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (52, 'Static', 'At the end of the User''s turn, if the weather is Rainy, the user is cured of one Status Condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (53, 'Static', 'The user''s Attack Stat may not be lowered, and its Attack Combat Stages may not be lowered.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (54, 'Trigger', 'While Hailing, the user gains 1/16th of their full HP at the beginning of each of their turns. The user is not damaged by Hail.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (55, 'Static', 'Moves that target the user have a -2 Accuracy Penalty against the user. Does not affect attackers with the Blindsense Capability.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (56, 'At-Will - Free Action', 'Trigger: The user joins an encounter<br>Choose another Pokémon on your roster. The user now looks exactly like that Pokémon from your team until the user takes Damage as a result of a Move. This change is aesthetic and does not affect typing or Moves. The user may dismiss Illusion as a Free Action.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (57, 'Static', 'The user cannot be Poisoned or Badly Poisoned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (59, 'Static', 'The user gains a +2 Bonus to Stealth Checks, does not trigger Hazards, and Blessings cannot be activated in response to its actions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (60, 'Static', 'The user cannot be Flinched.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (61, 'Static', 'The user is immune to the Sleep condition, and cannot use the move Rest.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (62, 'Battle - Swift Action', 'Target: Pokémon or Trainer within 5 meters<br>Lower the target''s Attack 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (63, 'At-Will - Free Action', 'Trigger: The user is hit by a damaging Melee Attack<br>The attacker loses HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (64, 'Static', 'The user deals +5 Damage when using any of the following Moves; Bullet Punch, Comet Punch, Dizzy Punch, Drain Punch, Dynamicpunch, Fire Punch, Meteor Mash, Shadow Punch, Ice Punch, Mach Punch, Mega Punch, Sky Uppercut, Thunderpunch, Focus Punch, or Hammer Arm.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (65, 'At-Will - Free Action', 'Trigger: The user is hit by a damaging Dark Type Move<br>The user may raise its Attack 1 Combat Stage. The user always gains a +4 bonus to Skill Checks made to Intercept.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (66, 'Static', 'The user''s Accuracy cannot be lowered and their attacks cannot have Accuracy Penalties (such as from Illuminate) and the user is immune to the Blind condition (but not Total Blindness) and the user ignores any Evasion not directly derived from Stats (such as from the Instinct Ability, or from moves like Minimize). Additionally, the user is always able to tell which Double Team clone is the real one.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (67, 'Static', 'The Pokémon ignores the effects of all held Items in its possession. The user may drop held items, at-will, as a Free Action during their turn, even if they have Status Afflictions that prevent them from taking actions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (68, 'Trigger', 'Keyword: Last Chance<br>Ground');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (69, 'Trigger', 'Keyword: Last Chance<br>Normal');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (70, 'Static', 'At the end of the User''s turn, if the weather is Sunny, the user is cured of one Status Condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (71, 'Static', 'The Pokémon is immune to Ground Type Moves, and gains a Levitate Speed of 4, or has existing Levitate Speeds increased by +4.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (72, 'Static', 'When referring to Weight Classes, treat the Pokémon as if it is 2 Weight Classes lower.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (73, 'Battle - Free Action', 'Trigger: A ranged Electric Type Move is used within 10 Meters of the user.<br>The Move is turned into a Single-Target Move and is re-directed at the User without fail, and cannot miss. This negates Lock-On or Mind Reader. Additionally, the user is always immune to Electric Type Moves, and each time they are hit by an Electric Move, the User''s Special Attack is raised 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (74, 'Static', 'The user is immune to Paralysis.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (75, 'Static', 'When the Pokémon with Liquid Ooze is damaged by Absorb, Drain Punch, Giga Drain, Horn Leech, Leech Life, Leech Seed or Mega Drain, that Move gains Recoil Â½ and the Move''s user does not gain any HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (76, 'Trigger', 'Keyword: Last Chance<br>Flying');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (77, 'Battle - Free Action', 'Trigger: The user is hit by a Status Move<br>The user may reflect the Move back to the offender. This Ability may be used to change the placement and affiliation of any Hazards being set within 10 meters of the user as well.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (78, 'Static', 'Whenever the user would lose HP or take damage that isn''t a result of a Damage Dice Roll the user does not lose HP or take Damage. This includes, but is not limited to, Weather, Leech Seed, Afflictions, Traps, Recoil, etc.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (79, 'Static', 'The user cannot be Frozen.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (80, 'At-Will - Swift Action', 'Target: A Steel-Type Pokémon<br>Until the end of the user''s next turn, the target may not move more then 8-meters away from the user and/or may not move closer than 3-meters to the user.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (81, 'Static', 'When Asleep, Paralyzed, Burned, Frozen or Poisoned, Marvel Scale raises the user''s Defense by +2 Combat Stages. The Combat Stages return to normal if the user is cured of their status affliction.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (82, 'Trigger', 'Keyword: Last Chance<br>Psychic');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (83, 'Battle - Free Action', 'Target: An ally with Plus within 10 Meters<br>The target''s Special Attack is raised by +2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (84, 'Battle - Free Action', 'Target: An Adjacent Pokémon or Trainer<br>One of the target''s Abilities, chosen at Random, is disabled for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (85, 'At-Will - Free Action', 'Trigger: The user joins an encounter, misses with a Move, or hurts itself in Confusion<br>Moody must be activated whenever it is triggered. Roll 1d10 to determine a Stat to be raised by +2 Combat Stages, then roll 1d10 to determine a Stat to be lower 2 Combat Stages. 1 or 2 is Attack, 3 or 4 is Defense, 5 or 6 is Special Attack, 7 or 8 is Special Defense, 9 or 10 is Speed.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (86, 'Static', 'The Pokémon is immune to Electric Type Moves. Whenever an Electric Type Move hits the Pokémon, raise their Speed by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (87, 'Trigger', 'Keyword: Last Chance<br>Rock');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (88, 'Static', 'Whenever the user''s Move causes a target to faint, it may raise its Attack Combat Stage by +1. You may only trigger Moxie once per Move, even if the Move causes multiple targets to faint.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (89, 'Static', 'When at full HP, when taking damage from a Move, half the total damage before applying weakness and resistance, after applying your Defenses.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (90, 'At Will - Free Action', 'The user changes its Elemental Type to any of the Elemental Types. Multitype cannot be copied or disabled.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (91, 'Center - Effect', 'Trigger: The user is targeted by a Melee Move<br>Replace all of the Attacker''s abilities with Mummy until the end of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (92, 'Center - Free Action', 'Whenever the user is returned to its Poké Ball, it may activate Natural Cure to cure itself of all Status Afflictions.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (93, 'Static', 'The user may not apply any form of Evasion to avoiding melee attacks; however, the user ignores all forms of evasion when making Melee attack rolls.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (94, 'Static', 'All Moves performed by the Pokémon are considered Normal Type instead of whatever Type they normally are.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (95, 'Static', 'The user is immune to the Infatuated condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (96, 'Trigger', 'Keyword: Last Chance<br>Electric');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (97, 'Static', 'The user does not take damage from any Weather that would normally cause it to take damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (98, 'Trigger', 'Keyword: Last Chance<br>Grass');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (99, 'Static', 'The user is immune to Confusion.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (100, 'Battle - Free Action', 'Trigger: The user hits an opponent with a Melee Move<br>If the target has a Held Item and the user does not, the user takes the Held Item the opponent is holding.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (102, 'Battle - Free Action', 'Target: An ally with Minus within 10 Meters<br>The target''s Special Attack is raised by +2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (103, 'Static', 'When Poisoned or Badly Poisoned, the Pokémon gains 1/8th of its full HP each turn instead of losing any HP. The Pokémon does not have any Combat Stages lowered as a result of being Poisoned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (104, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Move<br>The attacking foe is Poisoned.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (105, 'Static', 'The Pokémon''s Moves which deal damage Poison Legal Targets on 19-20. If a move already has a chance of Poisoning foes, Poison Touch increased the effect range by 2.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (106, 'Static', 'The user may use Status Moves as Interrupts.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (107, 'Static', 'While within 3 meters of the user, all foes are Suppressed. This effect ends when the user is Fainted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (108, 'Trigger', 'Keyword: Last Chance<br>Dragon');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (109, 'Static', 'The Pokémon''s base attack stat is doubled. This may double any bonuses from Nature or Vitamins, but not bonuses from Features.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (110, 'Static', 'When Poisoned, Burned, Paralyzed, Frozen or put to Sleep, the user''s Speed is raised 2 Combat Stages. The user does not lose Speed Combat Stages from Paralysis. If the user is healed all Status Conditions, their Speed is lowered appropriately.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (111, 'Static', 'While Rainy, the user gains 1/16th of their Max HP at the beginning of each of their turns.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (112, 'At-Will - Free Action', 'Trigger: The user is hit by a Bug, Dark, or Ghost Type Move<br>The user''s Speed is raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (113, 'Static', 'The user deals +5 Damage when using Submission, Double-Edge, Take Down, Jump Kick, Hi Jump Kick, Volt Tackle, Wood Hammer, Flare Blitz, Brave Bird or Head Smash.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (114, 'Center - Special', 'The user instantly heals 1/4th of its max HP. Regenerator may be triggered either by spending 5 consecutive Full Actions attempting to regenerate, or by spending 3 turns inside a Poké Ball.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (115, 'Static', 'Whenever the user deals direct damage to a target of the same gender, increase the Damage dealt by +5.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (116, 'Static', 'The user ignores the Recoil keyword when attacking.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (117, 'At-Will - Free Action', 'Trigger: The user is hit by a damaging Melee Attack<br>The attacker loses HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (118, 'Static', 'The user cannot be Slowed, Stuck, or Trapped.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (119, 'Static', 'While in a Sandstorm, the user''s Ground, Rock, and Steel-Type Direct-Damage Moves deal +5 Damage. Additionally, the user is immune to damage from Sandstorms.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (120, 'Static', 'While the Weather is a Sandstorm, the user gains +4 Speed Combat Stages. Additionally, the user is immune to damage from Sandstorms.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (121, 'Battle - Free Action', 'The Weather changes to a Sandstorm. The Sandstorm persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (122, 'Static', 'The user''s Evasion is increased by +2 while in a Sandstorm. Allies adjacent to the user are not damaged by the Sandstorm.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (123, 'Static', 'The user is immune to the Grass Type. If a damaging Grass Type Move hits the user, the user gains +1 Attack Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (124, 'Static', 'Ghosts are not immune to the user''s Normal and Fighting-Type Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (125, 'Static', 'Move Effects that are triggered by a sufficiently high accuracy roll have their activation range increased by 3. This does not apply to Critical Hits.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (126, 'Battle - Free Action', 'Target: An adjacent Trainer or Pokémon<br>The target is slowed, and may not move more than 6 meters away from the user.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (127, 'Battle - Free Action', 'The user is cured of Paralysis, Freezing, Burns, Poison, and Sleep.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (172, 'Static', 'The user is immune to Water-Type Moves, and whenever they are hit with a Water Type Move, they gain HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (173, 'Static', 'Keyword: Immune<br>Burns');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (128, 'Static', 'If a Pokémon with Sheer Force uses a Move with a secondary effect that triggers during Accuracy Roll, increase that Move''s Base Damage by +2. However, the secondary effects of Move never trigger. This does not affect Critical Hits, or moves with increased Critical Hit ranges.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (129, 'Static', 'The user is immune to Critical Hits; they are instead normal hits.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (130, 'Static', 'The user ignores the secondary effects that trigger during accuracy roll of damaging Moves that target the user. For example, Flamethrower can never inflict the Burn Condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (131, 'Static', 'When the Pokémon''s Combat Stages are altered, double the amount of Combat Stages they are raised or lowered.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (132, 'Battle - Free Action', 'Trigger: The user hits with a Move with the Five Strike keyword.<br>The Triggering Move automatically hits 5 Times.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (133, 'Static', 'For 3 rounds after joining an encounter, the Pokémon''s Speed and Attack Stats are halved.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (134, 'Static', 'When the Pokémon gets a Critical Hit, add the value of the Damage Dice Roll an additional time to the total damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (135, 'Static', 'The user''s Evasion is increased by +2 while in Hail. The user and allies adjacent to the user are not damaged by Hail.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (136, 'Battle - Free Action', 'The Weather changes and it begins Hailing. The Hail persists until the end of the encounter, unless the user stops it as a Swift Action, or it is replaced by another Weather condition.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (137, 'Static', 'When Sunny, the Pokémon loses 1/16th of its Max HP at the beginning of its turn. When Sunny, its Special Attack Stat is increased by 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (138, 'Static', 'When the user is hit by a Super-Effective attack, the attack deals 1.5x damage instead of x2 damage. If the user is hit by a Super-Super-Effective attack, the attack deals x2 damage instead of x3 damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (139, 'Static', 'The Pokémon is immune to damage caused by and the effects of the Moves Bug Buzz, Chatter, Echoed Voice, Grasswhistle, Growl, Heal Bell, Hyper Voice, Metal Sound, Perish Song, Relic Song, Roar, Screech, Sing, Snore, Supersonic and Uproar.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (140, 'Static', 'The Pokémon''s Speed is raised 1 Combat Stage at the end of each of its turns. Speed Boost has no effect while out of combat.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (141, 'Battle - Free Action', 'Trigger: The user is hit by a Melee Attack<br>The attacking foe becomes Paralyzed.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (142, 'Static', 'In a round''s queue, a Pokémon with Stall is always last. If a Pokémon goes to the end of the queue, the Pokémon with Stall is still the last to move.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (143, 'At-Will - Free Action', 'Trigger: The user is Flinched<br>The user''s Speed is raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (144, 'Static', 'The Pokémon''s Moves Flinch Targets on a roll of 19-20 during Accuracy Check. If a move already has a chance of Flinching foes, Stench lowers the number needed to roll in order to Flinch by -2.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (145, 'Static', 'The Pokémon''s held items cannot be stolen, switched, destroyed or dropped.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (146, 'Battle - Free Action', 'Trigger: A ranged Water Type Move is used within 10 Meters of the user.<br>The Move is turned into a Single-Target Move and is re-directed at the User without fail, and cannot miss. This negates Lock-On or Mind Reader. Additionally, the user is always immune to Water Type Moves, and each time they are hit by a Water-Type Move, the User''s Special Attack is raised 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (147, 'Static', 'The Pokémon is immune to the Moves Sheer Cold, Guillotine, Horn Drill and Fissure. If any attack would lower this Pokémon to 0 HP or less from full HP, instead the Pokémon''s HP is set to 1. Pokémon with Sturdy do not gain Injuries from Massive Damage.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (148, 'Static', 'The user is immune to Push effects, and the effects of Roar.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (149, 'Static', 'The Pokémon''s Moves are Critical Hits on 18-20. If a Move already has an extended Critical Hit range, Super Luck extends that range by 2.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (150, 'Trigger', 'Keyword: Last Chance<br>Bug');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (151, 'Static', 'While in Rainy Weather, the user gains +4 Speed Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (152, 'Battle - Free Action', 'Trigger: The user is Paralyzed, Frozen, Burned, Poisoned, or put to Sleep.<br>The foe which caused the Status Condition is given the same Status they inflicted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (153, 'Trigger', 'While Confused, the user gains +3 Evasion.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (154, 'Static', 'Moves with a Damage Base of 6 or lower have their Damage Base increased by +2. This bonus always applies to Moves with the Double Strike or Fivestrike Keywords.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (155, 'Static', 'The user is never hit by the area-of-effect attacks of allied targets.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (156, 'At-Will - Free Action', 'Trigger: The user damages a foe<br>The damaged foe''s Abilities are disabled for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (157, 'Static', 'The user is one step more Resistant to Fire Type Moves and Ice Type Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (158, 'Static', 'The user''s Resisted moves are instead Neutral. The user''s Doubly Resisted moves are instead Resisted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (159, 'Trigger', 'Keyword: Last Chance<br>Water');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (160, 'Static', 'When Poisoned or Badly Poisoned, the user''s Attack is raised by 2 Combat Stages. If the user is cured of its Poisoning, its Attack stat is lowered by 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (161, 'Battle - Free Action Target: A Trainer or PokÃ©mon within 10 meters', 'The Pokémon gains an Ability known by the Target for the remainder of the encounter, or until it is Fainted.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (162, 'Static', 'At the beginning of each of its turns, the user must roll 1d20. On a roll of 7 or lower, the target refuses to act; they heal 1/8th of its Max HP, and do not get a Standard Action that turn. Turns in which the user refuses to act count towards turns used up by Interrupts or the Exhausted Condition, and the user may make Rolls to cure themselves from Status Effects with a +3 Bonus that turn.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (163, 'At-Will - Free Action', 'Trigger: The user damages a foe<br>The damaged foe''s Abilities are disabled for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (164, 'Static', 'When the Pokémon is attacking or being attacked, it the foe must make all damage calculations as if their Combat Stages were at their default state.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (165, 'Trigger', 'Keyword: Last Chance<br>Steel');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (166, 'Trigger', 'After consuming or dropping a held item, the Pokémon''s Speed is raised 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (167, 'Static', 'During battle, as long as you have a line of sight to a foe, that foe may not eat or drink any Food Items.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (168, 'Trigger', 'Keyword: Last Chance<br>Poison');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (169, 'Static', 'Any allied Pokémon in the encounter gain a +2 Bonus to Accuracy Rolls.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (170, 'Static', 'Keyword: Immune<br>Sleep');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (171, 'Static', 'The user is immune to Electric-Type Moves, and whenever they are hit with an Electric Type Move, they gain HP equal to 1/8th of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (174, 'Trigger', 'Whenever the user is hit by an attack that consults the user''s Defense stat, the user may lower its Defense Combat Stage one level in order to raise its Speed Combat Stage one level after Damage is resolved.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (175, 'Static', 'The user''s Combat Stages, Evasion, or Accuracy may not be lowered except by the user''s own Moves and effects.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (176, 'Static', 'Only damaging Moves that are Super-Effective hit the Pokémon with Wonder Guard, all other moves always deal 0 damage. Wonder Guard loses its effect if the user has no weaknesses.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (177, 'Static', 'The user gains +6 Evasion against Status Moves.');
INSERT INTO pokemondata2.ptu_pokemon_abilities VALUES (178, 'At-Will - Free Action', 'Keep two sets of Base Stats for Darmanitan, the first set of Base Stats are its normal stats while the second will be referred to during Zen Mode. The HP Stat for both sets of Base Stats must be the same. If Darmanitan has its Base Stats altered in any way, both sets of Base Stats are affected. As a free action, Darmanitan may activate Zen Mode if it is at less than 50% of its full HP. Darmanitan may change back from Zen Mode as a free action if its HP is at 50% or higher. Darmanitan may switch from one form to another once per encounter.');


--
-- Data for Name: ptu_pokemon_moves; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (1, 1, 'At-Will', '2', 13, 8, 0, '6', 'Attack Order is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (2, 2, 'At-Will', '2', 13, 6, 0, 'Melee', 'If the target has a consumable Held Item, Bug Bite destroys the Item and Bug Biteâs user may use the Itemâs effect.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (3, 3, 'Scene x2', '2', 13, 9, 1, 'Cone 2, Sonic', 'Each target''s Special Defense is lowered by -1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (4, 4, 'EOT', '-', 13, 0, 2, 'Self', 'Raise the user''s Defense and Special Defense 1 Combat Stage each.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (5, 5, 'At-Will', '3', 13, 2, 0, 'Melee', 'If Fury Cutter is used successfully and consecutively on the same target, the Damage Base will double. For example, the first hit would have a DB of 2; the second hit a DB of 4, the third hit a DB of 8, and the fourth and all further hits have a DB of 16. This does not double any modifiers which raise DB, including STAB; those effects are applied after the doubling effect. If Fury Cuter misses or fails the damage its target, its Damage Base resets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (6, 6, 'Daily x2', '-', 13, 0, 2, 'Self', 'The user regains HP equal to half of its full HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (7, 8, 'At-Will', '2', 13, 2, 0, 'Melee', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (8, 9, 'Scene x2', '5', 13, 12, 0, 'Melee, Push', 'The target is Pushed 3 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (10, 11, 'Scene x2', '-', 13, 0, 2, 'Self', 'Raise the user''s Special Attack, Special Defense, and Speeed by +1 Combat Stage each.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (11, 12, 'Scene x2', '-', 13, 0, 2, 'Burst 1 or Line 6', 'All targets hit by Rage Powder are Enraged. While enraged, they must shift to target the user when using a Move or Attack if the user is within reach. If the user is Fainted or Switched out, all targets hit by Rage Powder are cured of rage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (12, 13, 'EOT', '2', 13, 8, 1, '6', 'Signal Beam confuses the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (13, 14, 'At-Will', '2', 13, 6, 1, '6, Spirit Surge', 'If you rolled 19-20 during Accuracy Check for Silver Wind, the user has each of its stats raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (14, 15, 'Scene x2', '-', 13, 0, 2, '5', 'Spider Web cannot miss. The target is Stuck and Trapped *Grants: Threaded');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (15, 16, 'EOT', '2', 13, 7, 0, 'Melee, Pass', 'Steamroller Flinches the target on 15-20 during Accuracy Check. If the target is Small, Steamroller deals an additional 1d10 Damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (16, 17, 'At-Will', '3', 13, 0, 2, 'Cone 2', 'Targets have their Speed CS lowered by -1. If this lowers their Speed CS to -6, or if their Speed CS was already at -6, the target is instead Stuck. *Grants Threaded');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (17, 18, 'At-Will', '2', 13, 3, 1, 'Cone 2', 'On hit, lowers the target''s Special Attack by -1 CS.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (18, 19, 'EOT', '-', 13, 0, 2, 'Self', 'Raise the userâs Special Attack 3 Combat Stages. *Grants: Glow');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (19, 20, 'At-Will', '3', 13, 3, 0, 'Melee, Doublestrike', 'Twineedle Poisons the target on an Accuracy Check of 18-20.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (20, 7, 'Scene x2', '2', 13, 2, 1, '3, 1 Target', 'The target is put in a Vortex.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (21, 566, 'Scene x2', '2', 13, 2, 1, '3, 1 Target', 'The target is put in a Vortex.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (22, 25, 'At-Will', '2', 16, 5, 0, 'Melee', 'When you hit with Assurance, if Assuranceâs target has already been damaged by a Move on the same round Assurance is being used, Assurance has a Damage Base of 12 (3d12+10 / 30) instead. This effect may trigger only once per Scene per Target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (23, 26, 'EOT', '-', 16, 0, 2, 'Melee', 'The user and up to two allies adjacent to the target may each make a Struggle Attack against the target. These Struggle Attacks hit for Dark Type Damage instead of their usual Type.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (24, 27, 'At-Will', '2', 16, 6, 0, 'Melee', 'Bite Flinches the target on 15+.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (25, 28, 'At-Will', '2', 16, 8, 0, 'Melee', 'Crunch lowers the targetâs Defense 1 Combat Stage on 17+');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (26, 30, 'At-Will', '2', 16, 8, 1, '8', 'Dark Pulse Flinches the target on 17+');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (27, 31, 'EOT', '4', 16, 0, 2, 'Burst 5, Friendly', 'The target falls Asleep. Once per Scene, Dark Void may be used as if its range were âBurst 5, Friendlyâ instead');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (28, 32, 'At-Will', '2', 16, 0, 2, '6', 'The target cannot use or benefit from held items for the remainder of the encounter. Embargo may only affect one target at a time; if Embargo is used on a new target, the previous target is freed from the effect.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (29, 34, 'EOT', '2', 16, 0, 2, '8', 'Lower the target''s Special Defense 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (30, 35, 'At-Will', '2', 16, 0, 2, '8', 'Flatter Confuses the target and raises the target''s Special Attack 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (31, 36, 'At-Will', '2', 16, 6, 0, '6', 'The user may throw its held item when using Fling, changing its Damage Dice Roll. If a berry or restorative item is thrown, the target receives the item''s effect instead of taking any damage. If an item that causes an effect is thrown, the item''s effect is activated. If any other item without an effect is thrown with Fling, increase the Damage Base by +2. All berries or other consumable held items are destroyed when used with Fling. Items that are not destroyed by Fling may be retrieved after an encounter.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (32, 37, 'Scene x2', '2', 16, 10, 0, 'Melee', 'The target reveals its Attack stat. When calculating damage, add the target''s Attack stat instead of the user''s Attack stat.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (33, 38, 'At-Will', '-', 16, 0, 2, 'Self', 'Raise the user''s Attack 1 Combat Stage, and the user''s Accuracy by +1 for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (34, 39, 'Scene', '6', 16, 2, 0, 'Melee', 'If the target has a Held Item, the target drops it. If targeting a Trainer, Knock Off targets any Hand-held equipment such as weapons. Consumable Items are destroyed; other items may be picked up again as a Standard Action.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (35, 40, 'Scene', '-', 16, 0, 2, '8', 'The user''s HP is set to 0. Memento cannot be used if the user is at or below 0 HP. Each of the target''s stats are lowered by -2 CS.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (36, 41, 'EOT', '-', 16, 0, 2, 'Self', 'Raise the user''s Special Attack 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (37, 42, 'EOT', '2', 16, 9, 1, '5', 'The target''s Accuracy is lowered by -1.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (38, 43, 'EOT', '2', 16, 7, 0, 'Melee, Pass', 'Night Slash is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (39, 44, 'EOT', '2', 16, 5, 0, 'Melee', 'If the target damaged Payback''s user on their last turn, Payback has a Damage Base of 10 instead.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (40, 45, 'EOT', '2', 16, 6, 0, 'Melee', 'Punishment''s Damage Base is raised by +2 for each Combat Stage the target has, to a maximum of DB 20.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (83, 580, 'Scene', '2', 8, 2, 0, 'Melee, 1 Target', 'Nuzzle paralyzes the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (41, 46, 'At-Will', '2', 16, 4, 0, 'Melee', 'If the foe is fleeing or being switched out, Pursuit may be used as an Interrupt, targeting the triggering foe. When used as an Interrupt, Pursuit grants the user a +5 bonus to all Movement Speeds, and has a Damage Base of 8');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (42, 47, 'At-Will', '2', 16, 0, 2, '10', 'Quash changes the target''s Initiative to 0 for the remainder of the round.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (43, 48, 'EOT', '3', 16, 6, 1, 'Cone 2, Sonic', 'All Legal Targets have their Special Attack lowered 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (44, 49, 'Scene x2', '-', 16, 0, 2, '6, Interrupt', 'If the target uses a Self-Targeting Move, you may use Snatch. You gain the benefits of the Self-Targeting Move instead of the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (45, 50, 'At-Will', '2', 16, 8, 0, 'Melee, Interrupt, Trigger', 'If an adjacent foe targets the user with a Damaging Attack, Sucker Punch may be used as an Interrupt against the triggering foe.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (46, 51, 'At-Will', '2', 16, 0, 2, 'Melee', 'The user and the target exchange held items.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (47, 52, 'EOT', '3', 16, 0, 2, '6', 'The target becomes Enraged.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (48, 53, 'At-Will', '2', 16, 4, 0, 'Melee', 'Thief takes the target''s held item and attaches it to Thief''s user, if the user is not holding anything.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (49, 54, 'Scene x2', '2', 16, 0, 2, '10', 'The target becomes Suppressed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (50, 55, 'Scene', '4', 14, 14, 1, '8, Ranged Blast 3', 'Lower the user''s Special Attack 2 Combat Stages after damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (51, 56, 'At-Will', '2', 14, 8, 0, 'Melee', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (52, 57, 'EOT', '-', 14, 0, 2, 'Self', 'Raise the userâs Attack 1 Combat Stage and raise the userâs Speed 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (53, 58, 'EOT', '2', 14, 9, 1, '8', '*May Grant Aura Reader');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (54, 59, 'At-Will', '2', 14, -1, 1, '8,  ', 'If it hits, Dragon Rage causes the target to lose 15 HP. Dragon Rage is Special and interacts with other moves and effects as such (Special Evasion may be applied to avoid it, Mirror Coat can reflect it, etc.).');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (55, 60, 'At-Will', '4', 14, 10, 0, 'Melee, Dash, Push', 'The target is Pushed 3-meters. Dragon Rush Flinches the target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (56, 61, 'At-Will', '3', 14, 6, 0, 'Melee, Push', 'The target is Pushed 8 meters minus their Weight Class.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (57, 62, 'EOT', '2', 14, 6, 1, '6', 'Dragonbreath Paralyzes the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (58, 63, 'EOT', '3', 14, 5, 0, 'Melee, Doublestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (59, 64, 'Scene x2', '3', 14, 12, 0, 'All Adjacent Foes', 'After damage is dealt, the user becomes Enraged and Confused.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (60, 65, 'Daily x2', '4', 14, 15, 1, 'Burst 8, Exhaust', 'All legal targets are Slowed');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (61, 66, 'Daily x2', '3', 14, 10, 1, '10', 'Spacial Rend is a Critical Hit on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (62, 67, 'At-Will', '2', 14, 4, 1, '6, Ranged Blast 3', 'Small or Medium targets in the central square of the blast are not hit. Twister Flinches the target on 18-20 during Accuracy Check. Any Pokémon Airborne as a result of Fly or Sky Drop above the Blast are hit, ignoring range, and Twister has a Damage Base of 8 against those targets instead.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (63, 68, 'Scene x2', '5', 8, 13, 0, '10', 'Bolt Strike Paralyzes the target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (64, 69, 'EOT', '-', 8, 0, 2, 'Self', 'If the user performs an Electric Move on their next turn that deals damage, add its Damage Dice Roll an extra time to the damage. Raise the userâs Special Defense 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (65, 70, 'At-Will', '4', 8, 5, 1, '6, Spirit Surge', 'If Charge Beam successfully hits a target, the user''s Special Attack is raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (66, 71, 'EOT', '2', 8, 8, 1, 'Burst 1', 'Discharge Paralyzes the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (67, 72, 'Scene x2', '2', 8, 6, 1, '10', 'The user adds their Speed Stat, including Combat Stages, in addition to their Special Attack when determining the damage dealt by Electro Ball. The Defender in turn subtracts both their Special Defense and Speed Stats from the damage dealt before applying Type Effectiveness.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (68, 73, 'EOT', '3', 8, 6, 1, '4, Ranged Blast 2', 'All Legal Targets are lowered 1 Speed Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (69, 74, 'Scene x2', '2', 8, 10, 0, '8', 'If Fusion Flare was used this round or last round by any participant of the encounter, Fusion Bolt has its Damage Base increased by +3.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (70, 75, 'Daily x2', '-', 8, 0, 2, 'Self', 'Magnet Rise grants the user the Levitate Ability until the end of the Encounter. This does not replace the user''s normal Ability. This effect ends if the user is switched out or is knocked out. *Grants Magnetic');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (71, 76, 'At-Will', '-', 8, 6, 1, '6', 'Shock Wave cannot miss. *Grants: Zapper');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (72, 77, 'EOT', '2', 8, 6, 0, 'Melee, Dash', 'Spark Paralyzes the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (73, 78, 'Scene x2', '7', 8, 12, 1, '8, Smite', 'Thunder Paralyzes its target on 15-20 during Accuracy Check. If the target is in Sunny Weather, Thunder''s Accuracy Check is 11. If the target is in Rainy Weather, Thunder cannot miss. If the target is airborne as a result of Fly or Sky Drop, Thunder cannot miss them.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (74, 79, 'At-Will', '3', 8, 7, 0, 'Melee', 'Thunder Fang Paralyzes or Flinches on 18-19 during Accuracy Check; flip a coin to determine whether the foe gets Paralyzed or Flinches. On 20 during Accuracy Check, the foe is Paralyzed and Flinched.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (75, 80, 'Scene x2', '-', 8, 0, 2, '6', 'Thunderwave cannot miss. Thunderwave Paralyzes the target. Pokémon immune to Electric Attacks are immune to Thunderwave.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (76, 81, 'EOT', '2', 8, 10, 1, '4', 'Thunderbolt Paralyzes the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (77, 82, 'At-Will', '2', 8, 8, 0, 'Melee', 'Thunderpunch Paralyzes the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (78, 83, 'At-Will', '2', 8, 4, 1, '4', 'Thundershock Paralyzes the target on 17-20 during Accuracy Check. *Grants: Zapper');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (79, 84, 'At-Will', '2', 8, 7, 1, '5', 'If Volt Switch successfully hits its target, the user deals damage and then immediately is returned to its Poké Ball in the same turn. A New Pokémon may immediately be sent out. Using Volt Switch lets a Trapped user be recalled.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (80, 85, 'EOT', '2', 8, 12, 0, 'Melee, Dash, Push, Recoil 1/3', 'The target is pushed back 5 meters. Volt Tackle Paralyzes the target on 19-20 during Accuracy Check. After Volt Tackle deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (81, 86, 'At-Will', '2', 8, 9, 0, 'Melee, Dash, Recoil 1/4', 'After Wild Charge deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (82, 87, 'At-Will', '11', 8, 12, 1, '12', 'Zap Cannon Paralyzes the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (84, 581, 'Scene', '2', 8, 5, 1, 'Cone 2', 'After the targets take damage, the user gains Hit Points equal to half of the total damage they dealt to all targets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (85, 562, 'EoT', '2', 18, 8, 1, 'Cone 2', 'None');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (86, 575, 'EoT', '2', 18, 8, 1, 'Cone 2', 'None');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (87, 574, 'At-Will', '-', 18, 4, 1, 'Burst 1, Sonic', 'Disarming Voice cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (88, 570, 'EOT', '2', 18, 5, 1, 'Melee, 1 Target', 'After the target takes damage, the user gains Hit Points equal to half of the damage they dealt to the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (89, 578, 'Scene', '-', 18, 0, 2, 'Burst 3, Friendly', 'All legal targets become Trapped and Slowed while the user remains in the encounter. Switching or being knocked out both end this effect.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (90, 576, 'At-Will', '2', 18, 4, 1, '6, 1 Target', 'None');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (91, 572, 'Scene', '-', 18, 0, 2, 'Self, Set Up', 'Set-Up Effect: The user may not shift this round. The user may create as many squares of Rough Terrain as it wants within a Burst 3 as plants burst through the ground, regardless of the surface material. Resolution Effect: The user raises its Special Attack, Special Defense, and Speed by 2 Combat Stages each.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (92, 571, 'EOT', '2', 18, 10, 1, '6, 1 Target', 'Moonblast lowers the targetâs Special Attack by 1 Combat Stage on 15+.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (93, 573, 'EoT', '4', 18, 9, 0, 'Melee, 1 Target', 'Play Rough lowers the targetâs Attack 1 Combat Stage on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (95, 89, 'EOT', '-', 4, 10, 1, '8', 'Aura Sphere cannot miss. *May Grant Aura Reader');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (96, 90, 'At-Will', '2', 4, 8, 0, 'Melee', ' Light Screen and Reflect may not be activated in response to Brick Break.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (97, 91, 'EOT', '-', 4, 0, 2, 'Self', 'Raise the userâs Attack 1 Combat Stage and raise the userâs Defense 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (98, 92, 'At-Will', '4', 4, 6, 0, 'Melee, Push', 'The target is Pushed 8 meters minus their Weight Class.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (99, 93, 'Scene x2', '2', 4, 12, 0, 'Melee, Dash', 'The userâs Defense and Special Defense are lowered 1 Combat Stage each.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (100, 94, 'Scene x2', '-', 4, 0, 2, 'Melee, Reaction', 'Reaction - Counter may be used as a Reaction to Attacks that deal Physical Damage to the user. The target loses HP equal to the amount of damage the user received. Do not apply weakness or resistance, do apply immunity. Do not apply stats.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (101, 95, 'Scene x2', '4', 4, 10, 0, 'Melee, Dash, Push', 'Cross Chop is a Critical Hit on 16-20 during Accuracy Check. On Critical Hit, the target is Pushed 5 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (102, 96, 'Scene', '-', 4, 0, 2, 'Self, Intercept', ' If the user is hit by a Move, the user may use Detect. The user is instead not hit by the Move. You do not take any damage nor are you affected by any of the Move''s effects');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (104, 98, 'Scene x2', '2', 4, 8, 0, 'Melee', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (105, 99, 'At-Will', '11', 4, 10, 0, 'Melee', 'Dynamicpunch Confuses the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (106, 100, 'Scene', '2', 4, 0, 2, 'Melee', 'Final Gambit lowers the user to 0 HP and to Faint. Final Gambit deals deals 1 point of damage to the taret for every point of health lost by the user. Final Gambit does not cause items to activate.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (107, 101, 'Scene x2', '7', 4, 12, 1, '8, Smite', 'Focus Blast lowers the target''s Special Defense 1 Combat Stage on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (108, 102, 'EOT', '2', 4, 15, 0, 'Melee, Push', 'The user begins to Focus, and ends their turn. At the beginning of their next turn, if they are still focused, they may use Focus Punch as a Standard Action and the focus is spent. If a user is hit by a Damaging Attack while they are focused, they forfeit their next turn and cannot use Focus Punch. Focus Punch pushes the targer 5 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (109, 103, 'At-Will', '2', 4, 6, 0, 'Melee', 'Force Palm Paralyzes the target on 18-20 during Accuracy Check. *May Grant Aura Reader');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (110, 104, 'EOT', '3', 4, 10, 0, 'Melee', 'The user lowers their Speed 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (111, 105, 'EOT', '3', 4, 13, 0, 'Melee', 'If Hi Jump Kick misses, the user loses 20 HP. A failure to hit due to Protect or Detect does not count as a miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (112, 106, 'At-Will', '3', 4, 7, 0, 'Melee, Dash', 'If Jump Kick misses, the user loses 10 HP. A failure to hit due to Protect or Detect does not count as a miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (113, 107, 'At-Will', '2', 4, 5, 0, 'Melee', 'Karate Chop is a Critical Hit on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (114, 108, 'EOT', '2', 4, -1, 0, 'Melee, Weight Class', 'Low Kick''s Damage Base is equal to twice the target''s Weight Class.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (115, 109, 'EOT', '2', 4, 6, 0, 'Melee', 'Lowers the targetâs Speed 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (116, 110, 'At-Will', '2', 4, 4, 0, 'Melee, Priority', 'Priority - If the user has not yet taken their turn that round, Mach Punch may be declared during a foe''s turn to immediately take your turn and use Mach Punch.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (117, 111, 'Scene', '-', 4, 0, 2, 'Mele, Interrupt', 'If the user or an adjacent ally is targeted by a Priority or Interrupt Attack, Quick Guard may be declared as an Interrupt, causing the triggering attack to miss all targets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (118, 112, 'EOT', '2', 4, 6, 0, 'Melee', 'When declaring Revenge, the user does nothing. At the end of the round, the user Shifts and uses Revenge on any legal target. If the target damaged the user this round, Revenge has a Damage Base of 12 (4d10+15 / 40) instead.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (119, 113, 'EOT', '2', 4, -1, 0, 'Melee', 'If the user has 100 to 70% of its total HP, use Damage Base 2 (1d6+/6). If the user has more than 69 to 36% of its total HP, use Damage Base 4 (1d8+5/10). If the user has 35 to 21% of its total HP, use Damage Base 8 (3d6+10/21). If the user has 20 to 1% of its total HP, use Damage Base 10 (3d12+10/30)');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (120, 114, 'At-Will', '2', 4, 4, 0, 'Melee', 'Rock Smash lowers the targetâs Defense 1 Combat Stage on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (121, 115, 'At-Will', '4', 4, 6, 0, 'Melee, Dash', 'Rolling Kick Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (122, 116, 'EOT', '-', 4, 8, 0, 'Melee, Pass', 'Sacred Sword cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (123, 118, 'Scene x2', '2', 4, 0, 2, 'Melee', 'The target loses HP equal to the level of Seismic Toss'' user. Do not apply weakness or resistance. Do not apply stats. Seismic Toss is physical');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (165, 164, 'Daily x2', '-', 6, 0, 2, 'Field, Weather', 'The Weather becomes Clear, and all Blessings, Coats, and Hazards are destroyed. Clear Weather is the default weather, conferring no bonuses or penalties of any sort.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (166, 165, 'EOT', '2', 6, 8, 0, 'Melee, Dash', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (167, 166, 'EOT', '2', 6, 0, 2, 'Burst 1, Friendly', 'All legal targets have their Attack lowered 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (124, 119, 'At-Will', '3', 4, 9, 0, 'Melee, Push', ' The target is Pushed 2-meters. If the target is airborne, the target immediately crashes to the ground and loses 2d10 HP. If the target is airborne as a result of Fly or Sky Drop, Sky Uppercut cannot miss as long as you are in a space adjacent to the airborne target, and the attack''s Resolution does not occur (the target may take their turn normally however).');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (125, 120, 'EOT', '2', 4, 4, 0, 'Melee', 'If Storm Throw hits, it Critically Hits.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (126, 121, 'At-Will', '6', 4, 8, 0, 'Melee, Recoil 1/4', 'On an accuracy roll of 15-20, the target is Tripped. After Submission deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (127, 122, 'Scene x2', '2', 4, 12, 0, 'Melee, Dash, Push', 'Superpower lowers the user''s Attack and Defense by 1 Combat Stage each. The target is pushed 6 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (128, 123, 'At-Will', '3', 4, -1, 0, 'Melee', 'Make three attacks with Triple Kick. If you hit once, Triple Kick has a DB of 1. If you hit two times, Triple Kick has a DB of 3. If you hit three times, Triple Kick has a DB of 6.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (129, 125, 'EOT', '-', 4, 7, 0, 'Melee, Push, Interrupt', 'If the target uses a melee Move or attack on the user, you may declare use of Vital Throw. After the target''s attack is resolved, if the user is still able to take actions, the user may use Vital Throw as a Reaction. Vital Throw cannot miss. The target is pushed 6 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (130, 127, 'Daily x2', '4', 3, 15, 1, 'Close Blast 3, Smite, Exhaust', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (131, 128, 'EOT', '4', 3, 8, 0, 'Melee', 'Blaze Kick Burns the target on 19-20 during Accuracy CHeck. Blaze Kick is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (132, 129, 'Scene x2', '5', 3, 13, 1, '10', 'Blue Flare Burns the target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (133, 130, 'At-Will', '2', 3, 4, 1, '4', 'Ember Burns the target on 18-20 during Accuracy Check. *Grants: Firestarter');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (134, 131, 'Daily', '4', 3, 15, 1, 'Burst 1*', 'For each 10% of HP the user is missing, Eruption''s Damage Base is reduced by -1. Eruption creates a 1 meter burst, but also affects an area 10 meters tall straight up.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (135, 132, 'EOT', '2', 3, 8, 1, '4, Spirit Surge', 'Fiery Dance raises the userâs Special Attack by 1 Combat Stage on 11-20 on Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (136, 133, 'Scene x2', '4', 3, 12, 1, '6', 'Fire Blast burns the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (137, 134, 'At-Will', '3', 3, 7, 0, 'Melee', 'Fire Fang Burns or Flinches on 18-19 during Accuracy Check; flip a coin to determine whether the foe gets Burned or Flinches. On 20 during Accuracy Check, the foe is Burned and Flinches.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (138, 135, 'EOT', '2', 3, 5, 1, '6, Pledge', 'If used on the same round as Water Pledge, all secondary effects of Moves are activated at a -3 during the Accuracy Check for 1d4+1 rounds. If used on the same round as Grass Pledge, all foes within 20 meters of the user lose 1/8th of their max HP at the end of each round of combat for 1d4+1 rounds.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (139, 136, 'At-Will', '2', 3, 8, 0, 'Melee', 'Fire Punch Burns the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (140, 137, 'Scene x2', '4', 3, 4, 1, '3', 'The target is put in a Vortex.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (141, 138, 'At-Will', '2', 3, 7, 1, '6', 'Any Trainers or Pokémon cardinally (not diagonally) adjacent to the target lose 1/16th of their max HP');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (142, 139, 'At-Will', '2', 3, 5, 0, 'Melee, Dash', 'Raise the userâs Speed 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (143, 140, 'At-Will', '2', 3, 6, 0, 'Melee, Dash', 'Flame Wheel Burns the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (144, 141, 'EOT', '2', 3, 10, 1, '4', 'Flamethrower Burns the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (145, 142, 'Scene x2', '2', 3, 12, 0, 'Melee, Dash, Push, Recoil 1/3', 'The target is pushed back 5 meters. Flare Blitz Burns the target on 19-20 during Accuracy Check. After Flare Blitz deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (146, 143, 'Scene x2', '2', 3, 10, 1, '8', 'If Fusion Bolt was used this round or last round by any participant of the encounter, Fusion Flare has its Damage Base increased by +3.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (147, 144, 'EOT', '2', 3, 4, 0, 'Melee, Dash', 'For each weight class the user is above the target, increase Heavy Crash''s damage base by +2.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (148, 145, 'Scene x2', '4', 3, 10, 1, 'Close Blast 3', 'Heat Wave Burns all Legal Targets on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (149, 146, 'EOT', '2', 3, 3, 1, 'Line 3', 'f a target is holding a Berry, the Berry is destroyed, without its ability activating.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (150, 147, 'At-Will', '11', 3, 10, 1, '6', 'Inferno Burns the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (151, 148, 'EOT', '2', 3, 8, 1, 'Burst 1', 'Lava Plume burns all targets on 16-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (152, 149, 'Scene', '7', 3, 12, 1, '8', 'The target is put in a Vortex; this effect occurs even if Magma Storm misses its target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (153, 150, 'Scene', '4', 3, 14, 1, 'Burst 1 or Close Blast 3', 'Lower the user''s Special Attack 2 Combat Stages after damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (154, 151, 'EOT', '3', 3, 10, 0, 'Burst 7, Friendly', 'Sacred Fire Burns all Legal Targets in the Burst on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (155, 152, 'Eot', '2', 3, 10, 1, 'Burst 2', 'Searing Shot Burns all targets on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (156, 153, 'Daily x2', '-', 3, 0, 2, 'Field, Weather', 'The weather becomes Sunny. While Sunny, Fire-Type attacks have their Base Damage increased by half (rounded down), and Water Type Attacks have their Base Damage reduced by half (rounded down).');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (157, 156, 'At-Will', '2', 6, 6, 0, 'Melee', 'If the user is not holding an item, Acrobatics instead has a Damage Base of 12 (4d10+15/40) and has its frequency reduced to Battle.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (158, 157, 'EOT', '-', 6, 6, 0, 'Melee', 'Aerial Ace cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (159, 158, 'Daily', '3', 6, 10, 1, 'Line 6', 'Aeroblast is a Critical Hit on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (160, 159, 'At-Will', '2', 6, 6, 1, 'Cone 2', 'Air Cutter is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (161, 160, 'EOT', '3', 6, 8, 1, '8', 'Air Slash Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (162, 161, 'At-Will', '4', 6, 8, 0, 'Melee, Set-Up, Full Action', 'Set-Up Effect: The user is moved up 15 meters into the air. Resolution Effect: The user may shift twice while in the air, using their overland or sky speed, and then comes down next to a legal target, and attacks with Bounce. Bounce Paralyzes the target on 16-20 on Accuracy Check. *Grants: Jump +1');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (163, 162, 'Scene x2', '2', 6, 12, 0, 'Melee, Dash, Push, Recoil 1/3', 'The target is pushed back 5 meters. After Brave Bird deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (164, 163, 'At-Will', '2', 6, 6, 1, '4, Sonic', 'Chatter confuses all targets on 16-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (312, 315, 'Daily x2', '4', 2, 15, 0, 'Melee, Dash, Exhaust, Smite', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (168, 167, 'At-Will', '3', 6, 8, 0, 'Melee, Dash, Set-Up', 'Set-Up Effect: The user is moved up 25 meters into the air. Resolution Effect: The user may shift twice while in the air, using their overland or sky speed, and then comes down next to a legal target, and attacks with Fly. *Grants: Sky +3');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (169, 168, 'At-Will', '2', 6, 4, 1, '4', 'If the target is airborne as a result of Fly or Sky Drop, Gust can hit them, ignoring Range and has a Damage Base of 8 instead.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (170, 169, 'Scene x2', '7', 6, 12, 1, '12, Smite', 'Hurricane Confuses its target on 15-20 during Accuracy Check. If the target is in Sunny Weather, Hurricane''s Accuracy Check is 11. If the target is in Rainy Weather, Hurricane cannot miss. If the target is airborne as a result of Fly or Sky Drop, Hurricane cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (171, 170, 'Scene x2', '-', 6, -1, 2, '6, Illusion', 'Use the Move the target has used on their last turn. You may choose new targets for the Move. Mirror Move cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (172, 171, 'At-Will', '2', 6, 4, 0, 'Melee', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (173, 172, 'At-Will', '2', 6, 6, 0, 'Melee', 'If the target is holding a Berry, Pluck''s user consumes the Berry.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (174, 173, 'Daily x2', '-', 6, 0, 1, 'Self', 'The user regains HP equal to half of its full HP. If the user is a Flying Type, it loses the Flying Type until the start of their next turn.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (175, 174, 'Scene x2', '4', 6, 14, 0, 'Melee, Pass, Set-Up, Full Action', 'Set-Up Effect: The user is moved up 25 meters into the air. Resolution Effect: The user may shift until they are next to a legal target in the encounter. They may then shift again, and pass through legal targets to attack with Sky Attack. Sky Attack Flinches a target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (176, 175, 'Scene x2', '3', 6, 6, 0, 'Melee, Pass, Set-Up, Full Action', 'Set-Up Effect: Make Sky Drop''s Accuracy Check. If you hit, the user and target are moved 25-meters into the air. The target forfeits their next turn, and cannot Shift or take actions until Sky Drop is resolved. Resolution Effect: Shift while in the air, and lower both the user and the target heights back to the ground. Then apply Sky Drop''s damage. If the user is a Flying Type, Sky Drop fails to deal damage. If the user is Fainted after the Set-Up but before the Resolution, the target falls to the ground and takes damage as if Sky Drop had a Damage Base of 3 (1d6+5/8) unless they are a Flying Type or have a Sky or Levitate Speed, in which case they take no damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (177, 176, 'Scene', '-', 6, 0, 1, 'Blessing', 'For the remainder of the encounter, all allied trainers and Pokémon gain +5 to their Initiative. Multiple instances of Tailwind cannot stack.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (178, 177, 'At-Will', '2', 6, 6, 0, 'Melee', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (179, 178, 'At-Will', '2', 15, 3, 0, 'Melee', 'Astonish Flinches the target on 18-20 during Accuracy Check. Once per Battle, if the target is unaware of the user''s presence, Astonish automatically Flinches.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (180, 179, 'Scene x2', '-', 15, 0, 2, '6', 'The target is Confused. Confuse Ray cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (181, 24, 'EOT/Scene', '-', 15, 0, 2, 'Self', 'If the user is not a Ghost Type, Curse has a Frequency of EOT, and when used the user lowers its Speed by -1 Combat Stage, but raises Attack and Defense by +1 Combat Stage each. If the user is a Ghost Type, Curse has a Frequency of Scene, and when used the user loses 1/3rd of their Max Hit Points and a target Pokémon or Trainer within 8 meters of the user becomes Cursed. This Hit Point loss cannot be prevented in any way.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (182, 180, 'EOT', '-', 15, 0, 2, 'Burst 10, Friendly', 'All enemy targets in the burst become Bound to the user until the end of your next turn. If a Bound target causes the user to Faint through a Damaging Attack, the Bound target immediately faints after their attack is resolved.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (183, 181, 'Daily', '-', 15, 0, 2, '6, Interrupt', 'You may use Grudge as an Interrupt when a Damaging Attack causes the user to faint. Grudge is activated as a Free Action (does not take up a Command). The attack is resolved as usual, and the user Faints. The attacker that caused the user to Faint becomes Suppressed for the remainder of the encounter; switching does not end Suppression when used this way.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (184, 182, 'EOT', '2', 15, 5, 1, '6', 'For each Persistent Status affliction on the target, Hex''s Damage Base is raised by +2 to a maximum of +6.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (185, 183, 'At-Will', '2', 15, 2, 0, 'Melee', 'Lick Paralyzes the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (186, 184, 'Scene x2', '2', 15, 0, 2, '8', 'The target loses HP equal to the level of Night Shade''s user. Do not apply weakness or resistance. Do not apply stats.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (187, 185, 'EOT', '2', 15, 0, 2, 'Melee', 'Nightmare can only hit Legal Targets that are Asleep. The target gains Bad Sleep. Whenever the user makes a Save Check to save against Sleep, they lose 1/4 th of their Max HP. Bad Sleep may only afflict Sleeping targets; if the target is cured of Sleep, they are also cured of Bad Sleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (188, 186, 'EOT', '2', 15, 6, 1, '6, Spirit Surge', 'If you rolled 19-20 during Accuracy Check for Ominous Wind, the user has each of its stats raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (189, 187, 'At-Will', '2', 15, 8, 1, '8', 'Shadow Ball lowers the foe''s Special Defense 1 Combat Stage on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (190, 188, 'At-Will', '2', 15, 7, 0, 'Melee, Pass', 'Shadow Claw is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (191, 189, 'Daily x3', '2', 15, 12, 0, 'Melee', 'Set-Up Effect: The user is removed from the field, and their turn ends. Resolution Effect: Shadow Force''s user appears adjacent to any legal Target, ignoring Movement Capabilities, and then uses Shadow Force''s attack.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (192, 190, 'EOT', '-', 15, 6, 0, '6', 'Shadow Punch cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (193, 191, 'At-Will', '2', 15, 4, 0, 'Melee, Priority', 'Priority - If the user has not yet taken their turn that round, Shadow Sneak may be declared during a foe''s turn to immediately take your turn and use Shadow Sneak.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (194, 192, 'EOT', '2', 15, 0, 2, '6', 'The last used Move used by the target becomes Hated. Hated Moves have their Frequency lowered one step. This condition lasts until the remainder of the encounter, or until the target is switched out.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (195, 193, 'At-Will', '2', 1, 2, 1, '4', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (196, 194, 'Scene ', '2', 1, 0, 1, 'Burst 1', 'All allies in the burst are cured of one status condition of their choice.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (197, 195, 'At-Will', '4', 1, 3, 0, '6, fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (198, 196, 'Scene', '-', 1, 0, 1, 'Self', 'Raise the userâs Defense 3 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (199, 197, 'EOT', '2', 1, 0, 1, 'Burst 1', 'All legal targets have their Speed lowered 2 combat stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (200, 198, 'EOT', '2', 1, 8, 1, '8', 'Energy Ball lowers the foeâs Special Defense 1 Combat Stage on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (201, 199, 'Daily x2', '4', 1, 15, 1, '3, 5 Targets, Smite, Exhaust', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (202, 200, 'Scene x2', '2', 1, 8, 1, '6', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (203, 201, 'EOT', '2', 1, -1, 1, '5', 'Grass Knot''s Damage Base is equal to twice the target''s Weight Class.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (204, 202, 'Scene', '2', 1, 5, 1, '6, Pledge', 'If used on the same turn as Water Pledge, all foes are treated as if at -2 Speed Combat Stages for 1d4+1 turns, if any foe has additional Speed Combat Stages, apply them as usual. If used on the same turn as Fire Pledge, all foes within 20 meters of the user lose 1/8th of their max HP at the end of each round of combat for 1d4+1 turns.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (205, 203, 'EOT', '10', 1, 0, 1, '6, Sonic', 'The target falls Asleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (206, 204, 'Scene x2', '2', 1, 8, 0, 'Melee, Dash', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (207, 205, 'Scene', '-', 1, 0, 1, 'Self, Coat', 'Ingrain applies a Coat to the user, which has the following effect; the user cannot be pushed or pulled, and cannot be switched out. At the beginning of each of the user''s turn, the user gains HP equal to 1/16th of its max HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (208, 206, 'EOT', '2', 1, 8, 0, 'Melee, Pass', 'Leaf Blade is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (209, 207, 'Scene', '4', 1, 14, 1, 'Close Blast 3', 'Lower the userâs Special Attack 2 Combat Stages after damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (210, 208, 'At-Will', '4', 1, 7, 1, '6, Ranged Blast 3', 'Small or Medium targets in the central square of the blast are not hit. On 15-20 during Accuracy Check, all legal targets have their Accuracy lowered by -1.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (211, 209, 'Daily x2', '4', 1, 0, 1, '6,  ', 'At the beginning of each of the target''s turns, Leech Seed''s target loses 1/8th of their full HP. Leech Seed''s user then gains HP equal to the amount the target lost. Leech Seed lasts until the target faints or is returned to a Poké Ball. Targets immune to Grass Attacks are immune to Leech Seed');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (212, 210, 'EOT', '-', 1, 6, 1, '8', 'Magical Leaf cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (213, 211, 'At-Will', '2', 1, 4, 1, '6', 'After the target takes damage, the user gains HP equal to half of the damage they dealt to the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (214, 212, 'At-Will', '2', 1, 6, 0, 'Melee', 'Needle Arm Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (215, 213, 'Scene x2', '3', 1, 12, 1, 'All adjacent foes', 'After damage is dealt, the user becomes Enraged and Confused.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (216, 214, 'Scene x2', '5', 1, 12, 0, '8', '*Grants: Threaded');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (217, 215, 'At-Will', '4', 1, 6, 0, 'Cone 2', 'Razor Leaf is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (218, 216, 'At-Will', '2', 1, 8, 0, '8', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (219, 217, 'Scene', '5', 1, 12, 1, '6, Ranged Blast 3', 'All Legal Targets have their Special Defense lowered 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (220, 218, 'Scene x2', '6', 1, 0, 1, '4', 'The target falls Asleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (221, 220, 'Scene', '-', 1, 0, 1, '4', 'The target falls Asleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (222, 221, 'EOT', '6', 1, 0, 1, '6', 'The target is paralyzed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (223, 222, 'Daily x2', '-', 1, 0, 1, 'Self', 'The user regains HP equal to half of its full HP. If it is Sunny, the user gains 2/3 of its full HP instead. If it is Rainy, Sand Storming or Hailing the user gains 1/4 of their full HP instead.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (224, 223, 'At-Will', '2', 1, 4, 0, '4', '*Grants: Threaded');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (225, 224, 'EOT', '2', 1, 12, 0, 'Melee, Dash, Recoil 1/3', 'After Wood Hammer deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (226, 225, 'Scene', '2', 1, 0, 2, '8', 'The target''s Ability is replaced with Insomnia. If the target has multiple Abilities, Worry Seed only replaces one, chosen at random.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (227, 226, 'At-Will', '5', 9, 7, 0, '1', 'Bone Club Flinches the target on 18-20 during Accuracy Check. Despite having a range of 1, Bone Club does not count as a melee attack.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (228, 227, 'EOT', '4', 9, 3, 0, '1, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (229, 228, 'EOT', '3', 9, 5, 0, '8, Doublestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (230, 229, 'EOT', '2', 9, 6, 0, 'Burst 1', 'All Legal Targets are lowered 1 Speed Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (231, 230, 'EOT', '2', 9, 8, 0, 'Burst 1, Set-Up, Full Action, Groundsource', 'Set-Up Effect: The user shifts 25 meters underground and their turn ends. Resolution Effect: The user may shift horizontally using their burrow or overland speed, and then shifts 25 meters straight up. Upon reaching the surface, the user attacks with Dig, creating a Burst 1. *Grants: Burrow +3');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (232, 231, 'At-Will', '3', 9, 8, 0, 'Melee', 'Drill Run is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (233, 232, 'EOT', '2', 9, 8, 1, '6, Groundsource', 'Earth Power lowers the Special Defense of all Legal Targets 1 Combat Stage on 16-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (234, 233, 'Scene', '2', 9, 10, 0, 'Burst 3, Groundsource', 'Earthquake can hit targets that are underground, including those using the Move Dig. *Grants Groundshaper');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (235, 234, 'Daily', '-', 9, 0, 2, '5, Execute, Groundsource', 'Roll 1d100. This roll may not be modified in any way. If you roll X or lower, the target Faints. X is equal to 30 + The User''s Level - The Target''s Level.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (236, 235, 'EOT', '2', 9, -1, 0, 'Burst 2, Groundsource', 'When you use Magnitude, roll 1d6. Magnitudeâs Damage Base is equal to 4+X, where X is the value of the d6. Magnitude can hit targets that are underground, including those using the Move Dig.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (237, 236, 'At-Will', '4', 9, 7, 1, '6', 'The target''s Accuracy is lowered by -1.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (238, 237, 'At-Will', '3', 9, 6, 1, '3', 'The target''s Speed is lowed by -1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (239, 238, 'EOT', '-', 9, 0, 2, 'Burst 5', 'All targets in the burst, including the user, gain a Coat which grants them 1 Step of Resistance to Electric Type Moves. After a target has been hit by a damaging Electric Type Move, the coat is removed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (240, 240, 'Scene x2', '4', 9, 4, 0, '5', 'The target is put in a Vortex.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (241, 242, 'At-Will', '-', 9, 0, 2, '6, Hazard', 'Set 8 square meters of Spikes within your range, all 8 meters must be adjacent with at least one other space of Spikes. Spikes cause terrain to count as Slow Terrain, and a foe that runs into the hazards will lose 1/8th of their full HP and become Slowed until the end of their next turn. If there are 2 Layers of Spikes on the same space, the foes lose 1/6th of their full HP. If there are 3 or more Layers of Spikes on the same space, the foes lose 1/4th of their full HP. Flying-Type Pokémon and Pokémon with Levitate are not affected by Spikes.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (242, 243, 'At-Will', '2', 12, 7, 1, '6', 'Aurora Beam lowers the target''s Attack 1 Combat Stage on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (243, 244, 'EOT', '2', 12, 6, 0, 'Melee', 'When declaring Avalanche, the user does nothing. At the end of the round, the user Shifts and uses Avalanche on any legal target. If the target damaged the user this round, Avalanche has a Damage Base of 12 (4d10+15 / 40) instead.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (244, 245, 'Scene x2', '7', 12, 12, 1, '4, Ranged Blast 2', 'Blizzard Freezes all legal target on 15-20 during accuracy Check. If the target is in Hailing Weather, Blizzard cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (245, 246, 'Scene', '4', 12, 14, 0, '10, Set-Up, Full Action', 'Set-Up Effect: The user may shift, then ends their turn. Resolution Effect: The user uses Freeze Shock''s attack. Freeze Shock paralyzes on 15-20 on Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (246, 247, 'EOT', '3', 12, 4, 1, '4', 'If Frost Breath hits, it is a Critical Hit.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (247, 248, 'EOT', '3', 12, 7, 1, 'Burst 2', 'All Legal Targets have their Speed lowered 1 Combat Stage. On a roll of 11-20 during Accuracy Check, all Legal Targets on the ground are Slowed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (248, 249, 'Daily x2', '-', 12, 0, 2, 'Field, Weather', 'The weather changes to Hail. While it is Hailing, all non-Ice Type Pokémon lose 1/16th of their full HP at the beginning of their turn.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (249, 250, 'Scene x2', '-', 12, 0, 2, 'Field', 'The Combat Stages of the user and all Pokémon and Trainers in the encounter are set to their default state (usually 0).');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (250, 251, 'At-Will', '4', 12, 3, 0, 'Melee', 'The user continues to use Ice Ball on each of its turns until they miss any target with Ice Ball, or are not able to hit any target with Ice Ball during their turn. Each successive use of Ice Ball increases Ice Ball''s Damage Base by +3.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (251, 252, 'EOT', '2', 12, 10, 1, '6', 'Ice Beam Freezes on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (252, 253, 'Scene', '4', 12, 14, 1, '10, Set-Up, Full Action', 'Set-Up Effect: The user may shift, then ends their turn. Resolution Effect: The user uses Ice Burn''s attack. Ice Burn Burns on 15-20 on Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (253, 254, 'At-Will', '3', 12, 7, 0, 'Melee', 'Ice Fang Freezes or Flinches on 18-19 during Accuracy Check; flip a coin to determine whether the foe gets Frozen or Flinches. On 20 during Accuracy Check, the foe is Frozen and Flinches.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (254, 255, 'At-Will', '2', 12, 8, 0, 'Melee', 'Ice Punch Freezes the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (255, 256, 'At-Will', '2', 12, 4, 0, '4, Priority', 'Priority - If the user has not yet taken their turn that round, Ice Shard may be declared during a foe''s turn to immediately take your turn and use Ice Shard.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (256, 257, 'EOT', '4', 12, 8, 0, '6', 'Icicle Crash Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (257, 258, 'EOT', '4', 12, 3, 0, '6, Five Strike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (258, 259, 'EOT', '3', 12, 6, 1, 'Cone 2', 'All Legal Targets have their Speed lowered 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (259, 260, 'Scene x2', '-', 12, 0, 2, '5, 3 targets, Coat', 'Targets with Mist''s Coat may not have their Combat Stages lowered. The user may target themselves with Mist.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (260, 261, 'At-Will', '2', 12, 4, 1, 'Line 4', 'Powder Snow Freezes all Legal Targets on 19-20 during Accuracy Check. *Grants: Freezer');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (261, 262, 'Daily', '-', 12, 0, 2, '4, Execute', 'Roll 1d100. This roll may not be modified in any way. If you roll X or lower, the target Faints. X is equal to 30 + The User''s Level - The Target''s Level.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (262, 263, 'EOT', '2', 2, 0, 2, 'Melee or Target Self', ' Roll 1d6. On a result of 1, raise the target''s Attack 2 Combat Stages. On a result of 2, raise the target''s Defense 2 Combat Stages. On a result of 3, raise the target''s Special Attack 2 Combat Stages. On a result of 4, raise the target''s Special Defense 2 Combat Stages. On a result of 5, raise the target''s Speed 2 Combat Stages. On a result of 6, raise the target''s Accuracy by +2.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (263, 264, 'At-Will', '-', 2, 0, 2, '6', 'The target takes their turn for the round immediately after the user finishes their turn, ignoring Initiative. After You may only affect a target that has not yet acted that round, and if it is used on a Target that has, it fails.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (264, 265, 'Scene x2', '-', 2, 0, 2, 'Self', 'Randomly select another Pokémon on the user''s roster and then randomly select a Move that Pokémon knows. Assist''s user uses that Move immediately.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (265, 266, 'Scene x2', '2', 2, 0, 2, '3', 'Attract Infatuates the target its gender is the opposite of the user''s. Attract fails when used by or against Genderless targets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (266, 267, 'At-Will', '4', 2, 2, 0, '6, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (267, 268, 'At-Will', '-', 2, 0, 2, 'Self', 'The user is replaced with another Pokémon from their trainer''s roster. All Combat Stages and Coats on Baton Pass'' user are transferred to the replacement. Baton Pass may be used to switch even if the user is Trapped.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (268, 269, 'Scene', '-', 2, 0, 2, 'Self,  ', 'The user gains +6 Attack Combat Stages, and loses HP equal to Â½ of their Max HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (269, 270, 'At-Will', '2', 2, 0, 2, '4', 'The user gives its held item to the target, unless the target is already holding an item.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (270, 271, 'Scene', '-', 2, 0, 2, 'Burst 1, Friendly', 'The user may use Bide as a Priority Move upon being Hit by a Damaging Move. During their next available turn, the user may Shift and then use Bide, causing all Adjacent foes to lose X HP, where X is the amount of Damage taken since declaring use of Bide (Loss of life through effects such as Poison is not ''Damage'').');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (271, 272, 'Static', '-', 2, 0, 2, 'Melee', 'The user gains a +1 Bonus to Accuracy Checks to Struggle Attacks made to initiate Grapple Maneuvers, and +2 to Skill Checks made to initiate Grapple  Maneuvers. Whenever the user ends their turn and isgrappling a target, that target loses 1/10th of their Max Hit Points. All effects stack with Wrap and Clamp.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (272, 273, 'At-Will', '2', 2, 0, 2, 'Melee, Trap', 'Both the user and the target are Stuck, and the target is Trapped. The user may choose to end this effect on its turn as a Free Action, freeing both the user and the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (273, 274, 'Scene x2', '2', 2, 10, 0, 'Melee', 'Body Slam Paralyzes the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (274, 275, 'EOT', '-', 2, 0, 2, 'Self,  ', 'The user changes their Type to match the field. Forests and grassy areas change the user into Grass-Type. Watery areas change the user into Water-Type. Caves and Mountains could change the user into Rock-Type or Ground-Type. An icy terrain would turn the user into Ice-Type. A building may change the user into Steel-Type or Normal-Type. Weather affects what Type the user becomes. Use common sense, if you are having difficult determining what type the user should become, consult the GM.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (313, 316, 'Scene x2', '3', 2, 0, 2, '4', 'Glare Paralyzes the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (314, 317, 'At-Will', '2', 2, 0, 2, 'Burst 1, Friendly, Sonic', 'Growl lowers all Legal Targets Attack 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (275, 276, 'EOT', '2', 2, 0, 2, 'Cone 2, Friendly', 'Captivate lowers the target''s Special Attack 2 Combat Stages. Captivate may not affect something that is the same gender as the user or something that is genderless.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (276, 277, 'EOT', '2', 2, 0, 2, '6', 'Charm lowers the targetâs Attack 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (277, 278, 'EOT', '2', 2, 7, 0, 'Melee', 'Ignore any Armor or changes in the target''s Defense or Special Defense when calculating damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (278, 279, 'At-Will', '4', 2, 2, 0, 'Melee, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (279, 280, 'At-Will', '2', 2, 1, 0, 'Melee', 'Constrict lowers the targetâs Speed 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (280, 281, 'At-Will', '-', 2, 0, 2, 'Self', 'The user becomes the elemental Type of their choice as long as they have a Move that is the same elemental Type until the end of the encounter. Replace all other Types.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (281, 282, 'At-Will', '-', 2, 0, 2, 'Self', 'The user becomes the elemental Type of their choice as long as the Type resists the elemental Type of the Move it last took damage from until the end of the encounter. Replace all other Types.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (282, 283, 'Daily', '-', 2, 0, 2, '4', 'Use the Move the target has used on their last turn. You may choose new targets for the Move. Copycat cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (283, 284, 'At-Will', '2', 2, 6, 0, 'Melee', 'Covet takes the targetâs held item and attaches it to Covetâs user, if the user is not holding anything.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (284, 285, 'EOT', '3', 2, 7, 0, 'Melee, Dash', 'Crush Claw lowers the targetâs Defense 1 Combat Stage on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (285, 286, 'Scene', '2', 2, 12, 0, 'Melee', 'For every 10% the target is below their full HP, Crush Grip''s Damage Base is reduced by 1');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (286, 287, 'At-Will', '3', 2, 5, 0, 'Melee, Pass', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (287, 288, 'At-Will', '-', 2, 0, 2, 'Self', 'The user becomes Curled Up. While Curled Up, the user becomes immune to Critical Hits and gains 10 Damage Reduction. However, while Curled Up, the user is Slowed and their Accuracy is lowered by -4. The user may stop being Curled Up as a Swift Action. If the user has Rollout or Ice Ball in their Move List, they do not become Slowed while Curled Up. Furthermore, when using the Moves Rollout or Ice Ball while Curled Up, the user gains a +10 bonus to the damage rolls of those Moves and does not suffer Accuracy Penalties from being Curled Up.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (288, 289, 'Scene', '-', 2, 0, 2, 'Reaction', 'Reaction - Disable may be declared as a Reaction after the user is hit by a Move. The Move becomes Disabled. Disable cannot Miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (289, 290, 'At-Will', '2', 2, 7, 0, 'Melee', 'Dizzy Punch Confuses the target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (290, 291, 'EOT', '3', 2, 4, 0, 'Melee, Twostrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (291, 292, 'Scene', '-', 2, 0, 2, 'Self, Illusion', 'The user gains 3 activations of Double Team. The user may either activate Double Team when being targeted by an attack to increase their Evasion by +2 against that attack; or when making an attack to increase their Accuracy by +2 for that attack.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (292, 294, 'At-Will', '4', 2, 2, 0, 'Melee, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (293, 295, 'At-Will', '2', 2, 4, 1, '3', 'If Echoed Voice was used by any Pokémon or Trainer in the Encounter on the previous round, increase its Damage Base by +4. If Echoed Voice was used by any Pokémon or Trainers two rounds ago, increase its Damage Base by +8.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (294, 296, 'Scene x2', '6', 2, 10, 0, '5, Blast 2', 'Egg Bomb creates a 2 meter Blast.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (295, 297, 'Scene x2', '2', 2, 0, 2, '4', 'Roll 1d6. On a result of 1 or 2, the target becomes Confused; on a result of 3 or 4 the target becomes Suppressed; on a result of 5 or 6 the target becomes Enraged.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (296, 298, 'Scene', '2', 2, 0, 2, 'Melee, Dash', 'The target loses 1/8th of its current HP for each Injury the user has.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (297, 299, 'Daily', '-', 2, 0, 2, 'Self, Intercept', 'If the user is hit by a damaging Move, you may use Endure. If the Move would bring Endure''s user down to 0 HP or less, Endure''s user instead is set to 1 HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (298, 300, 'Scene', '2', 2, 0, 2, '4', 'Entrainment changes one of the target''s abilities into one Ability that the user has for 1d4+1 turns.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (299, 301, 'Daily', '2', 2, 25, 0, 'Burst 3', 'The user''s HP is set to -50% of their full HP. The user''s loyalty toward its trainer may be lowered.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (300, 302, 'EOT', '2', 2, 8, 0, 'Melee, Dash, Priority', 'Priority - If the user has not yet taken their turn that round, Extremespeed may be declared during a foe''s turn to immediately take your turn and use Extremespeed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (301, 304, 'At-Will', '2', 2, 4, 0, 'Melee, 1 Target, Priority', 'Priority - You may only use Fake Out with Priority upon joining an encounter; if you do, Fake Out Flinches the target. Switching out resets the requirement of joining an encounter.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (302, 305, 'At-Will', '2', 2, 4, 0, 'Melee, Pass', 'False Swipe''s damage cannot bring a target lower than 1HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (303, 306, 'EOT', '2', 2, 3, 0, 'Melee, Interrupt, Trigger', 'If an Enemy uses Detect, Protect, Quick Guard, or Wide Guard, the user may immediately Shift as an Interrupt and use Feint as a Free Action against that enemy. This is a free Attack and does not consume a turn or Command.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (304, 307, 'EOT', '2', 2, -1, 0, 'Melee', 'If the user is at 75% to 100% Health, Flail uses DB 2 (1d6+3/6). If the user is at 50% to 75% health, Flail uses DB 4 (1d8+5/10). If the user is at 25% to 50% Health, Flail uses DB 7 (2d6+10/18). If the user is under 25% Health but above 1 HP, Flail uses DB 10 (3d12+10/30). If the user is exactly at 1 HP, Flail uses DB 12 (4d10+15 / 40)');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (305, 308, 'EOT', '2', 2, 0, 2, 'Cone 2', 'The Accuracy of all Legal Targets is lowered by -1.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (306, 309, 'At-Will', '-', 2, 0, 2, 'Self', 'The user becomes Pumped. While Pumped, the user''s Critical Range is extended by 3, or 17-20 if the Critical Range is not otherwise extended. Being switched will cause this effect to end.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (307, 310, 'Scene', '-', 2, 0, 2, 'Burst 5', 'Until the end of the user''s next turn, all Foes must target the user when using a Move that targets their opponents. This effect ends if the user is Fainted or Switched out.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (308, 311, 'Scene x2', '-', 2, 0, 2, 'Self', 'Foresight may be activated as a Swift Action on the userâs turn. For the rest of the turn, the userâs Normal-Type and Fighting-Type Moves can hit and affect Ghost-Type targets, and the user can see through the Illusion Ability, Moves with the Illusion keyword, and effects created by the Illusionist Capability, ignoring all effects from those.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (309, 312, 'At-Will', '2', 2, -1, 0, 'Melee', 'Frustration''s Damage Base is equal to 9 minus the user''s Loyalty Value. Using Frustration may make your Pokémon dislike you.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (310, 313, 'At-Will', '4', 2, 2, 0, 'Melee, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (311, 314, 'EOT', '5', 2, 3, 0, 'Melee, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (315, 318, 'EOT', '-', 2, 0, 2, 'Self', 'Raise the user''s Attack 1 Combat Stage and raise the user''s Special Attack 1 Combat Stage. If it is Sunny, double the amount of Combat Stages gained.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (316, 319, 'Daily', '-', 2, 0, 2, 'Melee, Execute', 'Roll 1d100. This roll may not be modified in any way. If you roll X or lower, the target Faints. X is equal to 30 + The User''s Level - The Target''s Level.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (317, 320, 'At-Will', '-', 2, 0, 2, 'Self', 'Raise the userâs Defense 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (318, 321, 'EOT', '2', 2, 7, 0, 'Melee', 'Headbutt Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (319, 322, 'EOT', '2', 2, 12, 0, 'Melee, Dash, Push, Recoil 1/4', 'The target is Pushed back 2 meters. After Head Charge deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (320, 323, 'Scene', '-', 2, 0, 2, 'Burst 3, Sonic', 'All targets are cured of any Persistent Status ailments.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (321, 324, 'EOT', '-', 2, 0, 2, '4, Priority', 'Priority - If the user has not yet taken their turn that round, Helping Hand may be declared during an Ally''s turn, before they make any rolls, to immediately take your turn and use Helping Hand. Helping Hand grants the target +1 on their next Attack Roll this round, and +5 to the next Damage Roll this round.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (322, 325, 'EOT', '2', 2, 6, 1, 'Burst 1', 'When a Pokémon first obtains the Move Hidden Power, roll 1d20. Hidden Powerâs Elemental Type will be changed from Normal to Bug on a result of 1; Dark on 2; Dragon on 3; Electric on 4; Fairy on 5; Fighting on 6; Fire on 7; Flying on 8; Ghost on 9; Grass on 10; Ground on 11; Ice on 12; Normal on 13; Poison on 14; Psychic on 15; Rock on 16; Steel on 17; Water on 18; and on 19 or 20, reroll until you roll another number. This effect is permanent âif Hidden Power is forgotten and relearned, the chosen Type remains the same.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (323, 326, 'At-Will', '2', 2, 7, 0, 'Melee, Dash', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (324, 327, 'Daily', '-', 2, 0, 2, 'Melee, Execute', 'Roll 1d100. This roll may not be modified in any way. If you roll X or lower, the target Faints. X is equal to 30 + The User''s Level - The Target''s Level.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (325, 328, 'At-Will', '-', 2, 0, 2, 'Self', 'Raise the userâs Attack 1 Combat stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (326, 329, 'Daily x2', '4', 2, 15, 1, '10, Exhaust, Smite', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (327, 330, 'At-Will', '4', 2, 8, 0, 'Melee', 'Hyper Fang Flinches the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (328, 331, 'Scene x2', '2', 2, 9, 1, 'Close Blast 3, Sonic', 'All Legal Targets are pushed back to the squares immediately outside the blast, away from the user.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (329, 332, 'Daily', '2', 2, 10, 1, '6, Ranged Blast 3', 'Judgment''s Type can be whatever Elemental Type the user wants it to be.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (330, 333, 'At-Will', '2', 2, 14, 0, 'Melee, Dash', 'Last Resort can only be used after the user has performed 5 other different Moves during a single fight, without being switched out.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (331, 334, 'At-Will', '2', 2, 0, 2, 'Cone 2, Friendly', 'The targetâs Defense is lowered 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (332, 336, 'Scene x2', '6', 18, 0, 2, '6', 'The target falls Asleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (333, 337, 'Scene', '-', 2, 0, 2, 'Blessing', 'Blessing â Any user affected by Lucky Chant may activate it when receiving a Critical Hit to cause the attack to instead deal damage as if it was not a Critical Hit. Lucky Chant may be activated 3 times, and then disappears.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (334, 338, 'Scene', '-', 2, 0, 2, 'Self, Trigger, Interrupt', 'If an opponent declares a Damaging Attack against the user, and Me First''s user has a higher Speed stat then the target, the user may use Me First as an Interrupt. The User will then use the same Move the triggering foe was about to use on that foe.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (335, 339, 'Scene', '-', 2, 0, 2, '6', 'The user casts a foul spell on the target, causing it to become Trapped and Slowed for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (336, 340, 'Scene x2', '6', 2, 12, 0, 'Melee, Dash, Push', 'The target is Pushed 2 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (337, 341, 'At-Will', '4', 2, 8, 0, 'Melee', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (338, 342, 'Scene x2', '-', 2, 0, 2, 'Self', 'Metronome randomly uses any other Move except for After You, Assist, Bestow, Copycat, Counter, Covet, Destiny Bond, Detect, Endure, Feint, Focus Punch, Follow Me, Helping Hand, Metronome, Me First, Mimic, Mirror Coat, Mirror Move, Protect, Quash, Quick Guard, Rage Powder, Sketch, Sleep Talk, Snatch, Snore, Switcheroo, Thief, Transform, Trick, and Wide Guard. The GM helps to pick the random Move.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (339, 343, 'Daily x2', '-', 2, 0, 2, 'Melee', 'The target regains HP equal to half of its full HP. The user may target themselves with Milk Drink.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (340, 344, 'Scene', '-', 2, 0, 2, '6', 'Choose a Move that the target has used during the encounter. For the remainder of the encounter, that Move replaces Mimic on the userâs Move List. Mimic cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (341, 345, 'Scene', '-', 2, 0, 2, '6', 'he target becomes Read to the user until the end of the user''s next turn. The user may end this effect when making an Attack on the user, causing that attack to automatically hit; OR when the Red target uses an Attack against the user, causing that attack to automatically miss. If the user has the Telepathy Capability, the user automatically succeeds on a mind-reading attempt against the target, and may listen to the target''s surface thoughts as long as they remain Read. Mind Reader automatically misses against targets with the Mindlock Capability.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (342, 346, 'Scene', '-', 2, 0, 2, 'Self', 'The user gains +4 Evasion, and user''s size is lowered to Small for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (343, 347, 'Daily x2', '-', 18, 0, 2, 'Self', 'In morning and day, clear conditions restore 1/4HP, sunny conditions restore 1/2HP and other conditions restore 1/8 HP. At night, the move restores twice as much of HP..');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (344, 348, 'Daily x2', '-', 2, 0, 2, 'Self', 'In day and at night, clear conditions restore 1/4HP, sunny conditions restore 1/2HP and other conditions restore 1/8 HP. In morning, the move restores twice as much of HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (345, 349, 'Scene', '2', 2, -1, 1, '6, Berry', 'Refer to the Move Keywords Berry list. Natural Gift deals damage according to the Berry list and Natural Gift''s Type is also defined there. The user''s Berry is destroyed and is not consumed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (346, 350, 'EOT', 'See ', 2, -1, 2, 'See Effect', 'Nature Power uses a Move defined by the Environ keyword.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (347, 351, 'Scene x2', '-', 2, 0, 2, '6', 'The user''s Normal-Type and Fighting-Type Moves can now hit and affect Ghost-Type targets. Odor Sleuth''s user ignores any Accuracy Penalties it has or may receive. Odor Sleuth''s user may now see through the Illusion Ability and through Moves with the Illusion keyword.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (516, 522, 'EOT', '3', 17, 5, 0, 'Melee, Double Strike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (384, 389, 'Scene x2', '2', 2, 6, 0, 'Melee', 'If the target is Paralyzed, SmellingSalt''s Damae Base is doubled, and cures the target of Paralysis.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (348, 352, 'Daily x2', '-', 2, 0, 2, '4', 'The user and the target both lose Â½ of their current HP. Add the amount of HP the user and the target lost together, and divide the value by 2. Both the target and the user gain HP equal to this value. Do not add Injuries from Pain Split from HP Markers until the full effect of the Move has been resolved. Pain Split never causes Massive Damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (349, 353, 'Daily', '2', 2, 4, 0, 'Cone 2', 'Pay Day scatters metal coins equal in value to 1d8 times the user''s level. If it is a trainer battle, the winner of the battle gets to pick up the coins.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (350, 354, 'Daily', '-', 2, 0, 2, 'Burst 15, Sonic', 'Perish Song creates a 15-meter Burst. Perish Song cannot miss. Perish Song can affect only Pokémon. All targets, including the user, receive a Perish Count of 3. At the beginning of each of the target''s turns, their Perish count is lowered by 1. Once a Perish Count reaches 0, set the Pokémon''s HP to 0. A Perish Count disappears if a Pokémon returns to their Poké Ball or is knocked out. Perish Song never causes Massive Damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (351, 355, 'At-Will', '2', 2, 4, 0, 'Melee', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (352, 356, 'EOT', '3', 2, -1, 0, '4', 'Roll 1d4. On a result of 1, use DB 4 (1d8+5/10); on a result of 2, use DB8 (3d6+10/21); on a result of 3, use DB12 (4d10+15/40); on a result of 4 the target is healed 65 HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (353, 357, 'Scene', '-', 2, 0, 2, 'Self, Interrupt, Trigger', 'If the user is hit by a Move, the user may use Protect. The user is instead not hit by the Move. You do not take any damage nor are you affected by any of the Move''s effects.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (354, 358, 'Scene', '-', 2, 0, 2, '6', 'The user''s Combat Stages are changed to match the target''s Combat Stages. Psych Up cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (355, 359, 'At-Will', '2', 2, 4, 0, 'Melee, Priority', 'Priority - If the user has not yet taken their turn that round, Quick Attack may be declared during a foe''s turn to immediately take your turn and use Quick Attack.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (356, 360, 'At-Will', '2', 2, 2, 0, 'Melee, Spirit Surge', 'Until the end of the user''s next turn, whenever the user is damaged by a Damaging Move or Attack, it gains +1 Attack Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (357, 361, 'At-Will', '2', 2, 2, 0, 'Melee, Spirit Surge', 'Rapid Spin destroys all Hazards within 5 meters, removes Leech Seeds, and removes the user''s Trapped or Stuck status.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (358, 362, 'EOT', '2', 2, 8, 1, '10, 3 Targets, Set -Up', 'Set-Up Effect: The user may not shift this round. The user whips up a whirlwind around themselves, granting +2 Evasion until the end of their next turn, and destroying any Smokescreen or Hazards on any squares adjacent to them. Resolution Effect: The user attacks with Razor Wind. Razor Wind is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (359, 363, 'Daily x2', '-', 2, 0, 2, 'Self', 'The user regains HP equal to half of its full HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (360, 364, 'Scene', '-', 2, 0, 2, 'Self', 'The effect of a consumable item used earlier in the encounter is used again as if it had not been destroyed. The item is still gone.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (361, 365, 'Scene', '2', 2, 0, 2, 'Melee', 'Reflect Type changes one of the user''s Types into one Type of your choice that the target has for 1d4+1 turns.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (362, 366, 'EOT', '-', 2, 0, 2, 'Self', 'The user is cured of all Poison, Burns, and Paralysis.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (363, 367, 'Scene', '2', 2, 8, 1, 'Burst 3, Friendly, Sonic', 'All Legal Targets fall Asleep on 16-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (364, 368, 'Scene x2', '2', 2, 7, 0, 'Melee', 'Retaliate''s Damage Base is doubled to DB 14 (5d10+20/50) if an ally has been Fainted by a Damaging Move used by the Target in the last 2 rounds of Combat.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (365, 369, 'EOT', '2', 2, -1, 0, 'Melee', 'Return''s Damage Base is equal to 3 plus the user''s Loyalty Value.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (366, 370, 'Scene', '2', 2, 0, 2, 'Burst 1, Sonic', 'When declaring Roar, the user does nothing. At the end of the round, the user Shifts and uses Roar. Targets hit by Roar immediately Shifts away from the target using their highest useable movement capability, and Towards their Trainer if possible. If the target is an owned Pokémon and ends this shift within 6 meters of their Poké Ball, they are immediately recalled to their Poké Ball. If that Trainer sends out a replacement, they do not lose their Command action.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (367, 371, 'At-Will', '5', 2, 8, 0, 'Melee, Dash', 'Rock Climb Confuses the target on 17-20 during Accuracy Checks.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (368, 372, 'EOT', '2', 2, -1, 1, 'Burst 1, Sonic', 'Round''s Damage Base is equal to 6, plus +2 more for each use of Round by any Trainer or Pokémon this round, up to a maximum of DB12.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (369, 373, 'Scene', '-', 2, 0, 2, 'Blessing', 'Blessing â Any user affected by Safeguard may activate it when receiving a Status Ailment to instead not gain that Status Ailment. Safeguard may be activated 3 times, and then disappears.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (370, 374, 'EOT', '2', 2, 0, 2, '4', 'The targetâs Speed is lowered 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (371, 375, 'At-Will', '2', 2, 4, 0, 'Melee, Pass', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (372, 376, 'EOT', '4', 2, 0, 2, 'Burst 2, Friendly, Sonic', 'All Legal Targets have their Defense lowered 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (373, 377, 'At-Will', '2', 2, 7, 1, '4, Environ', 'Secret Power''s effect depends on Environ. Secret Power''s effect activates on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (374, 379, 'At-Will', '-', 2, 0, 2, 'Self', 'Raise the userâs Attack 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (375, 380, 'Scene', '-', 2, 0, 2, 'Self', 'Raise the user''s Attack 2 Combat Stages, raise the user''s Special Attack 2 Combat Stages and raise the user''s Speed 2 Combat Stages Lower the user''s Defense 1 Combat Stage and lower the user''s Special Defense 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (376, 381, 'Scene', '2', 2, 0, 2, '6', 'Simple Beam changes one of the targetâs abilities to Simple for the remainder of the encounter.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (377, 382, 'Scene', '10', 2, 0, 2, 'Burst 2, Friendly, Sonic', 'All legal Targets fall Asleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (378, 383, 'Daily', '-', 2, 0, 2, '15', 'Sketch cannot miss. Once Sketch has been used, remove Sketch from the user''s Move list. The last Move that the target used is added to the user''s Move list permanently. Sketch may not be Interrupted or Intercepted.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (379, 384, 'Scene x2', '2', 2, 10, 0, 'Melee, Dash, Push, Set-Up', 'Set-Up Effect: The use gains +1 Defense CS. Resolution Effect: The user may attack with Skull Bash. The target is pushed 3 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (380, 385, 'Daily x2', '-', 2, 0, 2, 'Self', 'The user regains HP equal to half of its full HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (381, 386, 'At-Will', '6', 2, 8, 0, 'Melee, Dash', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (382, 387, 'EOT', '2', 2, 7, 0, 'Melee, Pass', 'Slash is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (383, 388, 'Scene', '-', 2, 0, 2, 'Self', 'The user randomly uses one of their other Moves, ignoring Frequencies. Sleep Talk can only be used while the user is Asleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (385, 390, 'EOT', '-', 2, 0, 2, '5, Ranged Blast 3', 'Smokescreen creates a blast of Smoke that covers the target area; the Smoke persists until the end of the encounter, or until Defog or Whirlwind are used. All targets attacking from or into the Smoke receive a -3 penalty to Accuracy.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (386, 391, 'EOT', '2', 2, 4, 1, 'Burst 1, Sonic', 'Snore Flinches all legal targets on 15-20 during Accuracy Check. Snore can only be used by a Sleeping Pokémon.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (387, 393, 'EOT', '6', 2, -1, 1, '8', 'Sonicboom causes the target to lose 15 HP. Sonicboom is Special and interacts with other moves and effects as such (Special Evasion may be applied to avoid it, Mirror Coat can reflect it, etc.)');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (388, 394, 'EOT', '4', 2, 2, 0, '6, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (389, 395, 'Scene', '2', 2, -1, 1, '8', 'For each Stockpiled Count the user has, Spit Up''s Damage Base is increased by +8. If the user has no Stockpiled count, Spit Up does nothing.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (390, 396, 'At-Will', '-', 2, 0, 2, 'Self', 'The user jumps, jumping an additional 1d6 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (391, 397, 'EOT', '-', 2, 0, 2, 'Self', 'The user adds 1 to their Stockpiled count to a maximum of 3. For each number a Stockpiled count is above 0, raise the user''s Defense 1 Combat Stage and raise the user''s Special Defense 1 Combat Stage. If a Stockpiled count is set to 0, the Combat Stages gained from the Stockpiled count are removed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (392, 398, 'EOT', '2', 2, 7, 0, 'Melee', 'Stomp Flinches the target on 15-20 during Accuracy Check. If the target is at least size category smaller than the user, Stomp deals an additional 1d10 damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (393, 399, 'EOT', '4', 2, 8, 0, 'Melee, Push', 'The target is Pushed 4 meters. *Grants: +1 Power');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (394, 400, 'Scene', '-', 2, 0, 2, 'Self, Illusion, Coat', 'The user loses 1/4 of their full HP. The user creates an Illusory Substitute Coat, which has HP equal to 1/4 th of the user''s full HP +1. If the user would be hit by a Move or attack, instead the Substitute gets hit. Apply weakness, resistance and stats to the Substitute. The Substitute is immune to Status Afflictions and Status Moves. Once the Substitute has been destroyed, the user may be hit as normal. Substitute cannot be used if the user has less than 1/4 of their full HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (395, 401, 'Scene', '4', 2, 0, 2, 'Melee', ' The target loses 1/2 of their current HP.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (396, 402, 'Scene x2', '6', 2, 0, 2, '4, 1 Target, Sonic', 'Supersonic Confuses all Legal Targets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (397, 403, 'EOT', '4', 2, 0, 2, '6', 'The target''s Attack is raised 2 Combat Stages. Swagger Confuses the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (398, 404, 'Daily x2', '-', 2, 0, 2, 'Self', 'If the user is Stockpiled 1, they are healed 25% of their full HP; if the user is Stockpiled 2, they are healed half of their full HP; if the user is Stockpiled 3, they are healed back to full HP. After using Swallow, the user''s Stockpiled count is set to 0. If the user has no Stockpiled count, Swallow does nothing.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (399, 405, 'Battle', '6', 2, 0, 2, '6', 'Sweet Kiss Confuses the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (400, 406, 'Scene', '2', 2, 0, 2, 'Burst 2, Friendly', 'Targets hit by Sweet Scent gain a -2 Penalty to Evasion. Evasion may not be lowered to a negative value.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (401, 407, 'EOT', '-', 2, 6, 1, '8, Ranged Blast 2, Friendly', 'Swift cannot Miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (402, 408, 'EOT', '-', 2, 0, 2, 'Self', 'The userâs Attack is raised 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (403, 409, 'At-Will', '3', 2, 4, 0, 'Melee, Dash, Push', 'The target is pushed 2 Meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (404, 410, 'EOT', '4', 2, 3, 0, 'Melee, Fivestrike', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (405, 411, 'At-Will', '2', 2, 0, 2, 'Burst 1, Friendly', 'The targetâs Defense is lowered 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (406, 412, 'EOT', '5', 2, 9, 0, 'Melee, Dash, Recoil 1/4', 'On an accuracy roll of 15-20, the target is Tripped. After Take Down deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (407, 413, 'EOT', '2', 2, 8, 1, '6, Ranged Blast 2', 'Techno Blastâs Type can be any Type while holding the appropriate Drive item or Plate item.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (408, 414, 'Scene x2', '2', 2, 0, 2, 'Burst 1', 'Teeter Dance Confuses all Legal Targets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (409, 415, 'Scene x2', '3', 2, 12, 0, 'Melee', 'After damage is dealt, the user becomes Enraged and Confused.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (410, 416, 'EOT', '2', 2, 0, 2, 'Melee', 'Lower the targetâs Attack 1 Combat Stage and lower the targetâs Defense 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (411, 417, 'At-Will', '-', 2, 0, 2, '10', 'The user targets a Pokémon within 10 meters, and assumes the form of the target. It gains all of the user''s Moves, gains its Abilities, copies its weight and height and Capabilities. Transform lasts until the user is switched out, KO''d or until the end of the encounter. The user may choose to end the Transformation on its turn as a free action, regaining its previous Move List. The user''s Stats do not change from using Transform. Transform cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (412, 418, 'EOT', '2', 2, 8, 1, '6', 'Tri Attack gives the target a Status ailment on 17-20 during Accuracy Check. If you rolled 17-20, roll 1d4; on 2 the target is Paralyzed; on 3 the target is Burned; on 4 the target is Frozen; on 1 reroll the die.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (413, 419, 'EOT', '2', 2, 6, 1, '6', 'Whenever Trump Card is used, the user gains a Trump Count after the attack is resolved. Trump Card''s Damage Base is increased by +2 for each Trump Count.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (414, 420, 'EOT', '2', 2, 5, 1, 'Burst 1, Spirit Surge, Sonic', 'All Pokémon and Trainers within 5 meters of the user are cured of sleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (415, 421, 'At-Will', '2', 2, 6, 0, 'Melee', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (416, 422, 'EOT', '2', 2, 5, 1, '8', 'If it is Sunny, Weather Ball is Fire-Type. If it is Rainy, Weather Ball is Water-Type. If it is Hailing, Weather Ball is Ice-Type. If it is Sandstorming, Weather Ball is Rock-Type. When a weather effect is on the field, Weather Ball has a Damage Base of 10 (3d12+10/30). If there are multiple Weather Effects on the field, choose one type for Weather Ball to be that corresponds with an existing Weather Effect.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (417, 423, 'Scene x2', '2', 2, 0, 2, 'Line 6', 'All targets are pushed X meters, where X is 8 minus their weight class. If the Line targets into a Smokescreen, the smoke is dispersed. All hazards in the Whirlwind are destroyed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (418, 424, 'Daily x2', '-', 2, 0, 2, '15', 'At the end of the target''s next turn, the target regains HP equal to half of its full HP. If the user targets themselves and are replaced in battle, the replacement is healed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (419, 425, 'EOT', '-', 2, 0, 2, 'Self', 'Raise the userâs Attack 1 Combat Stage and raise the userâs Special Attack 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (515, 521, 'At-Will', '2', 17, 8, 1, '6', 'Flash Cannon lowers the target''s Special Defense 1 Combat Stage on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (420, 426, 'Static', '-', 2, 0, 2, 'Melee', 'The user gains a +2 Bonus to Accuracy Checks to Struggle Attacks made to initiate Grapple Maneuvers, and +1 to Skill Checks made to initiate Grapple Maneuvers. Whenever the user ends their turn and is grappling a target, that target loses 1/10th of their Max Hit Points. All effects stack with Bind and Clamp.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (421, 427, 'Scene x2', '2', 2, 12, 0, 'Melee', 'For every 10% the target is below their full HP, Wring Out''s Damage Base is reduced by 1.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (422, 428, 'Scene x2', '-', 2, 0, 2, '2', 'The target falls Asleep at the end of their next turn. Yawn cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (423, 429, 'At-Will', '2', 7, 4, 1, 'Cone 2', 'Acid lowers the targetâs Defense 1 Combat Stage on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (424, 430, 'Scene', '-', 7, 0, 2, 'Self', 'Set-Up Effect: The user becomes Liquefied. While Liquefied, the user is Slowed and cannot take Standard Actions, but their Movement is never obstructed by rough or slow terrain, and they can shift even through the smallest openings. Furthermore, while liquefied, the user is completely immune to all Physical damage, and becomes completely invisible if fully submerged in any liquid. Resolution Effect: The user gains +1 Defense Combat Stage, and then stops being liquified.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (425, 431, 'EOT', '2', 7, 4, 1, '4', 'Acid Spray lowers the targets'' Special Defense 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (426, 432, 'Scene x2', '-', 7, 5, 1, '6', 'The target''s Combat Stages, Accuracy, and Evasion are reset to their default. Clear Smog cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (427, 433, 'Scene x2', '-', 7, 0, 2, 'Self', 'Raise the user''s Attack 1 Combat Stage, raise the user''s Defense 1 Combat Stage, and the user gains +1 Accuracy.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (428, 434, 'EOT', '2', 7, 7, 0, 'Melee, Pass', 'Cross Poison is a Critical Hit on 18-20 during Accuracy Check. Cross Poison Poisons the target on 19-20 on Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (429, 435, 'Scene', '2', 7, 0, 2, '4', 'The target''s ability is disabled until the end of the encounter. If the target has more than one ability, Gastro Acid disables one of them chosen at random.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (430, 436, 'Daily x2', '7', 7, 12, 0, '8, Smite', 'Gunk Shot Poisons the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (431, 437, 'EOT', '2', 7, 5, 0, 'Melee', 'Poison Fang Badly Poisons the target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (432, 438, 'Scene', '6', 7, 0, 2, 'Burst 1', 'Poison Gas Poisons all Legal Targets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (433, 439, 'EOT', '2', 7, 8, 0, 'Melee', 'Poison Jab Poisons the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (434, 440, 'At-Will', '2', 7, 2, 0, '6', 'Poison Sting Poisons the target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (435, 441, 'At-Will', '2', 7, 5, 0, 'Melee, Pass', 'Poison Tail is a Critical Hit on 18-20 during Accuracy Check. Poison Tail Poisons the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (436, 442, 'EOT', '6', 7, 0, 2, '4', 'Poisonpowder Poisons the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (437, 443, 'EOT', '2', 7, 7, 1, '6', 'Sludge Poisons on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (438, 444, 'EOT', '2', 7, 9, 1, '8', 'Sludge Bomb poisons the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (439, 445, 'Scene x2', '2', 7, 10, 1, 'See effect', 'The user shifts up to 5 meters in a straight line, attacking all targets along the path. The user may stop at any point; when they do, they create a Burst 1. You may not attack a target with Sludge Wave more than once.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (440, 446, 'At-Will', '5', 7, 2, 1, 'Burst 1', 'Smog Poisons all Legal Targets on 13-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (441, 447, 'Scene x2', '4', 7, 0, 2, '4,  ', 'The target is Badly Poisoned.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (442, 448, 'EOT', '-', 7, 0, 2, '6, Hazard', 'Set 8 square meters of Toxic Spikes, all 8 meters must be adjacent with at least one other space of Toxic Spikes next to each other. Toxic Spikes cause Terrain to become Slow Terrain, and a foe that runs into the hazard becomes Poisoned, and Slowed until the end of their next turn. If there are 2 Layers of Toxic Spikes on the same space, it Deadly Poisons the foes instead. Flying-Type Pokémon and Pokémon with Levitate are not affected by Toxic Spikes. Poison-Type Pokémon may move over Toxic Spikes harmlessly, destroying the Hazards as they do so.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (443, 449, 'Scene x2', '2', 7, 7, 1, '6', 'If the target is Poisoned, Venoshock has a Damage Base of 13 (4d10+20/45) instead.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (444, 450, 'EOT', '-', 10, 0, 2, 'Self', 'Raise the userâs Speed 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (445, 451, 'Scene', '-', 10, 0, 2, '6, Interrupt', 'Ally Switch may be declared during a foe''s turn as an Interrupt. The user chooses one willing ally within 6 meters; the target and the user switch places. If the ally was a target of a Move, the user is now the target; If the user was a target of a Move, the ally is now the target.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (446, 452, 'EOT', '-', 10, 0, 2, 'Self', 'Raise the userâs Special Defense 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (447, 453, 'Scene x2', '-', 10, 0, 2, 'Self', 'The user creates a Barrier of psychic energy. The user places up to 4 segments of Barrier; each segment must be continuous with another segment, and at least one must be adjacent to the user. These barriers count as blocking terrain and last until the end of the encounter or until they are destroyed. Each Barrier segment is 2 meters tall, 1 meter wide, and 2 centimeters thick. Each segment has 20 HP, 15 Damage Reduction, and takes damage as if it was Psychic Typed.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (448, 454, 'EOT', '-', 10, 0, 2, 'Self', 'Raise the userâs Special Attack 1 Combat Stage and raise the userâs Special Defense 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (449, 455, 'At-Will', '2', 10, 5, 1, '6', 'Confusion Confuses the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (450, 456, 'EOT', '-', 10, 0, 2, 'Self', 'Raise the userâs Defense 1 Combat Stage and raise the userâs Special Defense 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (451, 457, 'EOT', '2', 10, 10, 1, 'Melee', 'Dream Eater can only target Sleeping Pokémon or Trainers. After the target takes damage, the user gains HP equal to half of the damage they dealt to the target. Dream Eater does not wake up sleeping targets.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (452, 458, 'At-Will', '2', 10, 8, 1, '5', 'Extrasensory Flinches the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (453, 459, 'Scene x2', '2', 10, 10, 1, '10', 'Future Sight does nothing on the turn it is used. At the end of the user''s next turn, attack with Future Sight.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (454, 460, 'Daily x2', '-', 10, 0, 2, 'Field', 'For 1d4+1 rounds, the area is considered Warped. While Warped, Moves that involve the user being airborne may not be used. Flying-Types and Pokémon with the Ability Levitate are no longer immune to Ground-Type Moves. All Accuracy Rolls receive a +2 Bonus.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (483, 489, 'EOT', '2', 10, 10, 1, '4,  ', ' When calculating damage, the target subtracts their Defense from Psystrike''s damage instead of their Special Defense. Psystrike is still otherwise Special ( Special Evasion is used to avoid it, Mirror Coat can reflect it, etc. )');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (455, 461, 'Scene', '-', 10, 0, 2, 'Melee', 'Choose between Defense and Special Defense. The target reveals the value of whichever stat you chose, and then adds it to the user''s stat of the same choice. Divide the total by two and call the result X. For the remainder of the encounter, the target and the user''s stat that you chose is X. This effect ends if either the target or the user is Switched out or Fainted, but only for that Pokémon or Trainer.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (456, 462, 'Scene', '-', 10, 0, 2, 'Melee', ' The user trades the stat value of their Defense and Special Defense, for the target''s Defense and Special Defense for the rest of the encounter. This effect ends if either the target or the user is Switched out or Fainted, but only for that Pokémon or Trainer. Combat Stages are not traded. Guard Swap cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (457, 463, 'EOT', '2', 10, 0, 2, '10', 'Until the end of the encounter, the target may not gain HP or Temporary HP from any source. This effect ends if the target is switched out.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (458, 464, 'Daily', '-', 10, 0, 2, '6', 'The user immediately Faints, lowering its HP to 0. The user takes no Injuries from HP Markers when using Healing Wish. The target is immediately is immediately Healed as if they had spent an Hour at a Pokémon Center. Healing Wish may target a Pokémon in a Poké Ball as long as they immediately join the encounter or are sent out. If the target knows Healing Wish or Lunar Dance, the user''s Healing Wish does not restore its Center Frequency.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (459, 465, 'Daily x2', '-', 10, 0, 2, '6', 'Restores 50% of the target''s max HP. Heal Pulse''s user may not target itself with Heal Pulse. *May grant Aura Reader');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (460, 466, 'EOT', '2', 10, 6, 0, 'Melee', 'Heart Stamp Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (461, 467, 'Daily', '-', 10, 0, 2, '10, 2 Targets', 'The targets trade their Combat Stages, both positive and negative.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (462, 468, 'Scene x2', '6', 10, 0, 2, '4,  ', 'The target falls Asleep.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (463, 469, 'Scene x2', '-', 10, 0, 2, '10', 'The target is Locked. A Locked target may not use any Moves the user knows. Each user may only make 1 target Locked at a time. Using Imprison on a new target transfers Locked to the new target. Imprison cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (464, 470, 'Scene', '-', 10, 0, 2, '6', 'If the user or an Ally within 6 meters is about to be hit by an attack, the user may use Kinesis as an interrupt. The triggering attack roll receives a -4 penalty. This may causes Moves to miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (465, 471, 'Scene', '-', 10, 0, 2, 'Blessing', 'Any user affected by Light Screen may activate it when receiving Special Damage to resist the Damage one step. Light Screen may be activated 3 times, and then disappears.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (466, 472, 'Daily', '-', 10, 0, 2, '8', 'The user immediately Faints, lowering its HP to 0. The user takes no Injuries from HP Markers when using Lunar Dance. The target is immediately is immediately Healed as if they had spent an Hour at a Pokémon Center. Lunar Dance may target a Pokémon in a Poké Ball as long as they immediately join the encounter or are sent out. If the target knows Healing Wish or Lunar Dance, the user''s Lunar Dance does not restore its Center Frequency.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (467, 473, 'Scene x2', '2', 10, 7, 1, '12', 'Lust Purge lowers the target''s Special Defense 1 Combat Stage on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (468, 474, 'Daily', '-', 10, 0, 2, '4, Interrupt, Trigger', 'If the user is about to get a hit by a Move that does not have a Damage Dice Roll, they may use Magic Coat as an Intercept. The Intercepted Moveâs user is treated as if they were the target of their own Move.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (469, 475, 'Daily x2', '-', 10, 0, 2, 'Field', 'The area becomes Useless for 1d4+1 rounds. While Useless, Pokémon may not benefit from the effects of any Held Items, and Trainers cannot benefit from any Accessory-Slot equipment.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (470, 476, 'At-Will', '-', 10, 0, 2, 'Self', 'Raise the userâs Attack 1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (471, 477, 'Scene x2', '-', 10, 0, 2, 'Self, Swift Action', 'Miracle Eye may be activated as a Swift Action on the userâs turn. For the rest of the turn, the userâs Psychic-Type Moves can hit and affect Dark-Type targets, and the user can see through the Illusion Ability, Moves with the Illusion keyword, and effects created by the Illusionist Capability, ignoring all effects from those.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (472, 478, 'Scene', '-', 10, 0, 2, 'Any, Reaction', 'Reaction - Mirror Coat may be used as a Reaction to Attacks that deal Special Damage to the user. The target loses HP equal to the amount of damage the user received. Do not apply weakness or resistance, do apply immunity. Do not apply stats.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (473, 479, 'Scene x2', '2', 10, 7, 1, '12', 'Mist Ball lowers the target''s Special Attack 1 Combat Stage on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (474, 480, 'Scene', '-', 10, 0, 2, 'Melee', 'Choose between Attack and Special Attack. The target reveals the value of whichever stat you chose, and then adds it to the user''s stat of the same choice. Divide the total by two and call the result X. For the remainder of the encounter, the target and the user''s stat that you chose is X. This effect ends if either the target or the user is Switched out or Fainted, but only for that Pokémon or Trainer.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (475, 481, 'Scene', '-', 10, 0, 2, 'Melee', 'The user trades the stat value of their Attack and Special Attack, for the target''s Attack and Special Attack for the rest of the encounter. Combat Stages are not traded. Power Swap cannot miss. This effect ends if either the target or the user is Switched out or Fainted, but only for that Pokémon or Trainer.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (476, 482, 'Scene', '-', 10, 0, 2, 'Self', 'The user''s Attack stat and Defense stat are switched for the remainder of the encounter, or until the user is switched out or Fainted.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (477, 483, 'At-Will', '2', 10, 7, 1, '6', 'Psybeam Confuses the target on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (478, 484, 'EOT', '2', 10, 9, 1, '5, Push', 'The target is Pushed 2 meters in any direction. Psychic lowers the target''s Special Defense 1 Combat Stage on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (479, 485, 'Scene', '4', 10, 14, 1, '8, Ranged Blast 3', 'Lower the user''s Special Attack 2 Combat Stages after damage is resolved.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (480, 486, 'EOT', '2', 10, 7, 0, '6,  ', 'Psycho Cut is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (481, 487, 'Scene', '-', 10, 0, 2, 'Melee', 'The user is cured of a Status ailment and the target is given that Status ailment. Psycho Shift cannot miss. Psycho Shift can only be used if the user has a Status ailment and the target does not have the status ailment that is being transferred.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (482, 488, 'At-Will', '2', 10, 8, 1, '4,  ', 'When calculating damage, the target subtracts their Defense from Psyshock''s damage instead of their Special Defense. Psyshock is still otherwise Special ( Special Evasion is used to avoid it, Mirror Coat can reflect it, etc. )');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (514, 520, 'Scene x2', '2', 17, 14, 1, '10', 'Doom Desire does nothing on the turn it is used. At the end of the user''s next turn, attack with Doom Desire.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (484, 490, 'Scene', '5', 10, 0, 2, '6', 'Roll 1d4; on 1 the target loses HP equal to half the user''s Level; on 2 the target loses HP equal to the user''s Level; on 3 the target loses HP equal to 1.5x the user''s level; on 4 the target loses HP equal to the user''s Level doubled. Do not apply weakness or resistance, and do not apply Stats. Do apply Immunity.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (485, 491, 'Scene', '-', 10, 0, 2, 'Blessing', 'Any user affected by Reflect may activate it when receiving Physical Damage to resist the Damage one step. Reflect may be activated 3 times, and then disappears.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (486, 492, 'Scene', '-', 10, 0, 2, 'Self', 'The user''s HP is set to their full HP. The user is cured of any Status ailments. Then, the user falls Asleep. The user cannot make Sleep Checks at the beginning of their turn. They are cured of the Sleep at the end of their turn in 2 rounds.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (487, 493, 'Daily', '-', 10, 0, 2, 'Melee', 'The user gains one of the target''s Abilities, chosen at random, for the remainder of the encounter. This effect ends if the user Faints or is switched out. Role Play cannot miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (488, 494, 'Scene', '-', 10, 0, 2, 'Melee', ' The user loses one of their Abilities, selected by the user, and gains one the target''s Abilities, selected at random, for the remainder of encounter. The target loses the copied Ability, and gains the user''s lost Ability. This effect ends if either the target or the user is Switched out or Fainted, but only for that Pokémon or Trainer.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (489, 495, 'EOT', '2', 10, 2, 1, '10,  ', 'For every Combat Stage the user has above 0, in each stat, add +1 to Stored Power''s Damage Base.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (490, 496, 'Scene x2', '2', 10, 7, 1, 'Burst 3', 'Synchronoise can only hit targets that share a type with Synchronoise''s user.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (491, 497, 'Scene x2', '-', 10, 0, 2, '4', 'The target becomes Lifted. While Lifted, they gain the Levitate Ability, are Slowed, and lose all Movement Capabilities except for the Levitate 4 granted by Levitate (reduced to 2 by the Slow condition). While Lifted, the user may not apply any Evasion bonuses to determine whether they are hit by Moves or not. The Lifted target may use a Shift Action to roll 1d20; on a result of 16 or higher, they stop being Lifted.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (492, 498, 'Scene', '-', 10, 0, 2, 'Self, Intercept', 'The user Teleports up to X, where X is its Teleporter Capability. Teleport can be used as an Interrupt at any time. Moves that targeted Teleport''s user continue through the desired target''s space if the Move allows for it as if the user hadn''t been there; single target moves simply miss.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (493, 499, 'Scene', '2', 10, 0, 2, '5, 2 Targets', 'Both targets must be hit for Trick to succeed. The user may target itself or willing allies with Trick; you do not need to roll for Accuracy Check in these cases. Both targets lose their Held Item, and gain the other target''s Held Item. If a target has no Held Item, the still can gain the other target''s Held Item.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (494, 500, 'Daily x2', '-', 10, 0, 2, 'Field', 'Starting at the beginning of the next round, for 1d4+1 rounds, the area is considered Rewinding. While Rewinding, Initiative is reversed, and participants instead go from lowest Initiative to Highest.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (495, 501, 'Daily x2', '-', 10, 0, 2, 'Field', 'For 1d4+1 rounds, the area is considered Wondered. While Wondered, each individual Pokémon''s Defense and Special Defense are switched.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (496, 502, 'EOT', '4', 10, 8, 0, 'Melee Dash', 'Zen Headbutt Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (497, 503, 'EOT', '2', 11, 6, 1, '6, Spirit Surge', 'If you rolled 19-20 during Accuracy Check for AncientPower, the user has each of its stats raised by +1 Combat Stage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (498, 504, 'Scene', '5', 11, 15, 0, 'Melee, Dash, Push, Recoil 1/2', 'The target is pushed back 5-meters. The target takes an additional 1d6 if it is Pushed into Blocking Terrain. If the target is pushed into another Legal Target, instead, both take 1d6. After Head Smash deals damage, Recoil.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (499, 505, 'At-Will', '2', 11, 7, 1, '8,  ', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (500, 506, 'EOT', '5', 11, 3, 0, '6, 5 Strike', '*Grants Materializer');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (501, 507, 'EOT', '-', 11, 0, 2, 'Self', 'Raise the userâs Speed 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (502, 508, 'Scene x2', '4', 11, 8, 0, '6, Ranged Blast 3', 'Rock Slide Flinches all Legal Targets on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (503, 509, 'At-Will', '4', 11, 5, 0, '8', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (504, 510, 'At-Will', '5', 11, 5, 0, '6', 'Rock Tomb lowers the target''s Speed by -1 Combat Stage. *Grants Materializer');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (505, 511, 'Daily x2', '4', 11, 15, 0, 'Melee, Dash, Exhaust, Smite', '*Grants Materializer');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (506, 512, 'At-Will', '4', 11, 3, 0, 'Melee, Pass', 'The user continues to use Rollout on each of its turns until they miss any target with Rollout, or are not able to hit any target with Rollout during their turn. Each successive use of Rollout increases Rollout''s Damage Base by +4 to a maximum of DB 15.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (507, 513, 'Daily x2', '-', 11, 0, 2, 'Field, Weather', 'The weather changes to a Sandstorm. While it is Sandstorming, all non-Ground, Rock, or Steel Type Pokémon lose 1/16th of their full HP at the beginning of their turn.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (508, 514, 'Scene x2', '2', 11, 5, 0, '8,  ', 'If the target is Flying-type or is floating because of the Levitate Ability, then the target is knocked down to the ground, and loses its Flying-Type, or its Levitate Ability. It also loses its Sky and Levitate Speeds. This effect lasts for 3 turns; if Levitate was gained through a Move or Effect, it is instead lost permanently.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (509, 515, 'Scene', '-', 11, 0, 2, 'Field, Hazard', 'Set 4 square meters of Stealth Rock hazards. All 4 Rocks must be adjacent with at least one other space of Rocks next to each other. If a foe moves within 2 meters of a space occupied by Rocks, move at most one Rock to the offender, then destroy the Rock. When that happens, the Stealth Rock causes a foe to lose 1/8th of their full HP. Stealth Rock is considered to be dealing damage; Apply Weakness and Resistance. Do not apply stats. A Pokémon who has been hit by a Stealth Rock Hazard cannot get hit by another in the same encounter until it is returned to a Poké Ball and then sent back out.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (510, 516, 'EOT', '5', 11, 10, 0, '8,  ', 'Stone Edge is a Critical Hit on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (511, 517, 'Scene', '-', 11, 0, 2, 'Burst 1, Interrupt, Trigger', 'If an Ally adjacent to Wide Guard''s user is hit by a Move, you may use Wide Guard as an Interrupt. All targets adjacent to Wide Guard''s user, including the user, are instead not hit by the triggering Move and do not suffer any of its effects.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (512, 518, 'EOT', '-', 17, 0, 2, 'Self', 'For the remainder of the Encounter, the user''s Weight Class is one value lower, to a minimum of 1. Raise the user''s Speed 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (513, 519, 'At-Will', '2', 17, 4, 0, 'Melee, Priority', 'Priority - If the user has not yet taken their turn that round, Bullet Punch may be declared during a foe''s turn to immediately take your turn and use Bullet Punch.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (517, 523, 'Scene', '2', 17, 6, 0, '6,  ', 'The target reveals their Speed Stat. If it is higher than the user''s, subtract the user''s Speed Stat from the target''s, and apply the difference as Bonus Damage.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (518, 524, 'EOT', '2', 17, 4, 0, 'Melee', 'For each weight class the user is above the target, increase Heavy Slam''s damage base by +2.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (519, 525, 'EOT', '-', 17, 0, 2, 'Self', 'Raise the userâs Defense 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (520, 526, 'EOT', '2', 17, 8, 0, 'Melee, Dash', 'Iron Head Flinches the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (521, 527, 'EOT', '6', 17, 10, 0, 'Melee', 'Iron Tail lowers the targetâs Defense 1 Combat Stage on 19-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (522, 528, 'EOT', '-', 17, 6, 0, '8,  ', 'Magnet Bomb cannot miss. *Grants: Magnetic');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (523, 529, 'Scene', '2', 17, -1, 0, 'Burst 1', 'Metal Burst may only be used if the user didn''t move first in the round and the user has taken Damage from a Move or Attack this round. Metal Burst deals damage equal to the total amount of Damage it has taken since the beginning of this Round. Do not apply weakness, resistance. Do apply immunity. Do not apply stats.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (524, 530, 'At-Will', '3', 17, 5, 0, 'Melee, Pass, Spirit Surge', 'Raise the user''s Attack 1 Combat Stage on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (525, 531, 'EOT', '4', 17, 0, 2, 'Burst 2, Friendly, Sonic', 'All Legal Targets have their Special Defense lowered 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (526, 532, 'EOT', '4', 17, 10, 0, 'Melee, Dash, Spirit Surge', 'Raise the user''s Attack 1 Combat Stage on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (527, 533, 'EOT', '5', 17, 7, 1, '6, Ranged Blast 2', 'All Legal Targets have their Accuracy lowered by -2 on 16-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (528, 534, 'Scene', '-', 17, 0, 2, 'Self', 'Raise the userâs Attack 1 Combat Stage and raise the userâs Speed 2 Combat Stages.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (529, 535, 'At-Will', '3', 17, 7, 0, 'Melee, Pass, Spirit Surge', 'Raise the user''s Defense 1 Combat Stage on 15-20 during Accuracy Check');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (530, 536, 'At-Will', '2', 5, 4, 0, 'Melee, Interrupt', 'Priority - If the user has not yet taken their turn that round, Aqua Jet may be declared during a foe''s turn to immediately take your turn and use Aqua Jet.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (531, 537, 'Scene', '-', 5, 0, 2, 'Self, Coat', 'Aqua Ring covers the user in a Coat that heals the user at the beginning of each of their turns. The user is healed 1/16th of their full HP each turn');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (532, 538, 'EOT', '4', 5, 9, 0, 'Melee, Pass', '-');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (533, 539, 'Scene x2', '2', 5, 7, 1, '6,  1 Target', 'If the target is below 50% HP, Brine''s Damage Base is doubled to DB 14.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (534, 540, 'At-Will', '2', 5, 2, 1, 'Burst 1', 'Bubble lowers the target''s Speed on 16-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (535, 541, 'At-Will', '2', 5, 8, 1, '4', 'Bubblebeam lowers the target''s Speed on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (536, 542, 'Static', '-', 5, 0, 2, 'Melee', 'The user gains a +2 Bonus to Accuracy Checks to Struggle Attacks made to initiate Grapple Maneuvers, and +2 to Skill Checks made to initiate Grapple Maneuvers. Whenever the user ends their turn and is grappling a target, that target loses 1/10th of their Max Hit Points. All effects stack with Bind and Wrap.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (537, 543, 'EOT', '4', 5, 9, 0, 'Melee', 'Crabhammer is a Critical Hit on 18-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (538, 544, 'Scene x2', '2', 5, 8, 0, 'Burst 1, Set Up, Full Action', 'Set-Up Effect: The user moves underwater and their turn ends. The user must be in water at least 10 meters deep to use Dive. While underwater, the user may not be targeted by Moves. Resolution Effect: The user may shift horizontally using their underwater speed, and then may shift straight up until reaching a target. The user then attacks with Dive, creating a Burst 1.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (539, 545, 'Daily x2', '4', 5, 15, 1, 'Line 9, Smite, Exhaust', 'None');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (540, 546, 'Daily x2', '4', 5, 12, 1, '6, Push', 'The target is pushed away from the user 3 meters.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (541, 547, 'Scene x2', '5', 5, 10, 1, 'See Effect, Full Action', 'The user shifts up to 5 meters in a straight line, attacking all targets along the path. The user may stop at any point; when they do, they create a Burst 1. You may not attack a target with Muddy Water more than once. All Legal Targets must roll +2 during Accuracy Checks to hit on 16-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (542, 548, 'At-Will', '3', 5, 7, 1, '6,  1 Target', 'The target''s Accuracy is lowered by -1 on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (543, 549, 'Daily x2', '-', 5, 0, 2, 'Field, Weather', 'The weather becomes Rainy. While Rainy, Water-Type attacks have their Base Damage increased by half (rounded down), and Fire Type Attacks have their Base Damage reduced by half (rounded down).');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (544, 550, 'EOT', '3', 5, 7, 0, 'Melee, Dash', 'Razor Shell lowers the Target''s Defense 1 Combat Stage on 11-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (545, 551, 'Scene x2', '2', 5, 8, 1, '5,  ', 'Scald Burns the target on 15-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (546, 552, 'EOT', '2', 5, 0, 2, '5,  ', 'The target''s Type or Types are changed to âWaterâ until the end of the user''s next turn.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (547, 553, 'Scene x2', '2', 5, 10, 1, 'See Effect, Full Action', 'The user shifts up to 5 meters in a straight line, attacking all targets along the path with Surf. The user may stop at any point; when they do, they create a Burst 1. You may not attack a target with Surf more than once. *Removes the Sinker Capability');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (548, 554, 'At-Will', '2', 5, 4, 1, '4', '*Grants: Fountain');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (549, 555, 'EOT', '2', 5, 5, 1, '6, Pledge', 'If used on the same turn as Fire Pledge, all secondary effects of Moves are activated at a -3 during the Accuracy Check for 1d4+1 turns. If used on the same turn as Grass Pledge, all foes are treated as if at -2 Speed Combat Stages for 1d4+1 turns, if any foe has additional Speed Combat Stages, apply them as usual.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (550, 556, 'At-Will', '2', 5, 6, 1, '8', 'Water Pulse Confuses the target on 17-20 during Accuracy Check. *May grant Aura Reader');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (551, 557, 'EOT', '-', 5, 0, 2, 'Burst 2, Coat', 'All targets in the burst, including the user, gain a Coat which grants them 1 Step of Resistance to Fire Type Moves. After a target has been hit by a damaging Fire Type Move, the coat is removed. *Grants: Fountain');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (552, 558, 'EOT', '4', 5, 15, 1, 'Burst 1*', 'For each 10% of HP the user is missing, Water Spout''s Damage Base is reduced by -1. Water Spout creates a 1 meter burst, but also affects an area 10 meters tall straight up.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (553, 559, 'EOT', '2', 5, 8, 0, 'Melee, Push', 'Waterfall Flinches the target on 17-20 during Accuracy Check.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (554, 560, 'Scene x2', '4', 5, 4, 1, '3', 'The target is put in a Vortex.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (555, 561, 'At-Will', '-', 5, 0, 2, 'Self', 'The user becomes Withdrawn. While Withdrawn, the user becomes immune to Critical Hits and gain 15 Damage Reduction. However, while Withdrawn, the user cannot Shift, and may only use self-targeting Moves. The user may stop being Withdrawn as a Shift Action.');
INSERT INTO pokemondata2.ptu_pokemon_moves VALUES (556, 155, 'EOT', '5', 3, 0, 2, '6, 1 Target', 'The target is Burned.');


--
-- Data for Name: trainer_classes; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.trainer_classes VALUES (1, 'Trainer');
INSERT INTO pokemondata2.trainer_classes VALUES (2, 'Ace Trainer');
INSERT INTO pokemondata2.trainer_classes VALUES (3, 'Chaser');
INSERT INTO pokemondata2.trainer_classes VALUES (4, 'Enduring Soul');
INSERT INTO pokemondata2.trainer_classes VALUES (5, 'Type Ace');
INSERT INTO pokemondata2.trainer_classes VALUES (6, 'Strategist');
INSERT INTO pokemondata2.trainer_classes VALUES (7, 'Tag Battler');
INSERT INTO pokemondata2.trainer_classes VALUES (9, 'Underdog');
INSERT INTO pokemondata2.trainer_classes VALUES (10, 'Breeder');
INSERT INTO pokemondata2.trainer_classes VALUES (11, 'Botanist');
INSERT INTO pokemondata2.trainer_classes VALUES (12, 'Chef');
INSERT INTO pokemondata2.trainer_classes VALUES (13, 'Evolver');
INSERT INTO pokemondata2.trainer_classes VALUES (14, 'Groomer');
INSERT INTO pokemondata2.trainer_classes VALUES (15, 'Hatcher');
INSERT INTO pokemondata2.trainer_classes VALUES (16, 'Medic');
INSERT INTO pokemondata2.trainer_classes VALUES (17, 'Move Tutor');
INSERT INTO pokemondata2.trainer_classes VALUES (18, 'Capture Specialist');
INSERT INTO pokemondata2.trainer_classes VALUES (19, 'Artificer');
INSERT INTO pokemondata2.trainer_classes VALUES (20, 'Collector');
INSERT INTO pokemondata2.trainer_classes VALUES (21, 'Engineer');
INSERT INTO pokemondata2.trainer_classes VALUES (22, 'Juggler');
INSERT INTO pokemondata2.trainer_classes VALUES (23, 'Poke Ball Designer');
INSERT INTO pokemondata2.trainer_classes VALUES (24, 'Snagger');
INSERT INTO pokemondata2.trainer_classes VALUES (25, 'Trapper');
INSERT INTO pokemondata2.trainer_classes VALUES (26, 'Coordinator');
INSERT INTO pokemondata2.trainer_classes VALUES (27, 'Beauty Modeler');
INSERT INTO pokemondata2.trainer_classes VALUES (28, 'Choreographer');
INSERT INTO pokemondata2.trainer_classes VALUES (29, 'Cool Trainer');
INSERT INTO pokemondata2.trainer_classes VALUES (30, 'Cute Idol');
INSERT INTO pokemondata2.trainer_classes VALUES (31, 'Fashion Designer');
INSERT INTO pokemondata2.trainer_classes VALUES (32, 'Smart Teacher');
INSERT INTO pokemondata2.trainer_classes VALUES (33, 'Tough Guy');
INSERT INTO pokemondata2.trainer_classes VALUES (34, 'Martial Artist');
INSERT INTO pokemondata2.trainer_classes VALUES (35, 'Athlete');
INSERT INTO pokemondata2.trainer_classes VALUES (36, 'Aura User');
INSERT INTO pokemondata2.trainer_classes VALUES (37, 'Black Belt');
INSERT INTO pokemondata2.trainer_classes VALUES (38, 'Dirty Fighter');
INSERT INTO pokemondata2.trainer_classes VALUES (39, 'Massage Therapist');
INSERT INTO pokemondata2.trainer_classes VALUES (40, 'Ninja');
INSERT INTO pokemondata2.trainer_classes VALUES (41, 'Weapons Master');
INSERT INTO pokemondata2.trainer_classes VALUES (42, 'Mystic');
INSERT INTO pokemondata2.trainer_classes VALUES (43, 'Body Snatcher');
INSERT INTO pokemondata2.trainer_classes VALUES (44, 'Buffet');
INSERT INTO pokemondata2.trainer_classes VALUES (45, 'Godspeaker');
INSERT INTO pokemondata2.trainer_classes VALUES (46, 'Guardian');
INSERT INTO pokemondata2.trainer_classes VALUES (47, 'Rune Master');
INSERT INTO pokemondata2.trainer_classes VALUES (48, 'Shaman');
INSERT INTO pokemondata2.trainer_classes VALUES (49, 'Touched');
INSERT INTO pokemondata2.trainer_classes VALUES (50, 'Psychic');
INSERT INTO pokemondata2.trainer_classes VALUES (51, 'Air Adept');
INSERT INTO pokemondata2.trainer_classes VALUES (52, 'Clairsentient');
INSERT INTO pokemondata2.trainer_classes VALUES (53, 'Earth Shaker');
INSERT INTO pokemondata2.trainer_classes VALUES (54, 'Empath');
INSERT INTO pokemondata2.trainer_classes VALUES (55, 'Fire Breather');
INSERT INTO pokemondata2.trainer_classes VALUES (56, 'Hex Maniac');
INSERT INTO pokemondata2.trainer_classes VALUES (57, 'Influential');
INSERT INTO pokemondata2.trainer_classes VALUES (58, 'Rain Waker');
INSERT INTO pokemondata2.trainer_classes VALUES (59, 'Ranger');
INSERT INTO pokemondata2.trainer_classes VALUES (60, 'Coach');
INSERT INTO pokemondata2.trainer_classes VALUES (61, 'Commander');
INSERT INTO pokemondata2.trainer_classes VALUES (62, 'Detective');
INSERT INTO pokemondata2.trainer_classes VALUES (63, 'Rider');
INSERT INTO pokemondata2.trainer_classes VALUES (64, 'Signer');
INSERT INTO pokemondata2.trainer_classes VALUES (65, 'Special Operations');
INSERT INTO pokemondata2.trainer_classes VALUES (66, 'Survivalist');
INSERT INTO pokemondata2.trainer_classes VALUES (67, 'Researcher');
INSERT INTO pokemondata2.trainer_classes VALUES (68, 'Cryptozoologist');
INSERT INTO pokemondata2.trainer_classes VALUES (69, 'Dream Doctor');
INSERT INTO pokemondata2.trainer_classes VALUES (70, 'Petrologist');
INSERT INTO pokemondata2.trainer_classes VALUES (71, 'Photographer');
INSERT INTO pokemondata2.trainer_classes VALUES (72, 'Professor');
INSERT INTO pokemondata2.trainer_classes VALUES (73, 'Scientist');
INSERT INTO pokemondata2.trainer_classes VALUES (74, 'Watcher');


--
-- Data for Name: trainer_features; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.trainer_features VALUES (1, 'Aim For the Horn!', 'Your Pokemon targeting with a Move', 3, '--', 'Trainer', 1, 'On a roll of 19 or 20 during Accuracy Check, your Pokemonâs attack will deal Neutral damage regardless of Immunities or Resistances.');
INSERT INTO pokemondata2.trainer_features VALUES (2, 'Aim For the Horn! +', 'Your Pokemon targeting with a Move', 6, '--', 'Free', 1, 'On a roll of 16-20 during Accuracy Check, your Pokemonâs attack will deal Neutral damage regardless of immunities or resistances. This Feature replaces Aim For the Horn!');
INSERT INTO pokemondata2.trainer_features VALUES (3, 'Back Off', '--', 2, 'A Trainer, not involved in a Gym or Competition battle, challenges you.', 'Free', 1, 'Roll 1d20 and add your CHA modifier. If the result is higher then 10, the Trainer is intimidated and withdraws their challenge.');
INSERT INTO pokemondata2.trainer_features VALUES (4, 'Chosen One', '--', 1, 'You fail to roll high enough for any type of check.', 'Free', 1, 'You don''t fail the check. You may not apply this to a Pokemon''s check.');
INSERT INTO pokemondata2.trainer_features VALUES (5, 'Close Your Eyes!', '--', 3, 'Your Pokemon is targeted by a Move listed below.', 'Free', 1, 'Use when one of your Pokemon is targeted by one of these Moves: Attract, Astonish, Captivate, Charm, Encore, Follow Me, Flash, Glare, Hypnosis, Leer, Mean Look, Sand-Attack, Scary Face, Sleep Powder, Spore, Tail Whip, Taunt, Teeter Dance. The foe must roll +2 during Accuracy Check to hit your Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (6, 'Cover Your Ears!', '--', 3, 'Your Pokemon is targeted by a Move listed below.', 'Free', 1, 'Use when one of you pokemon is targeted by one of these Moves: Bug Buzz, Chatter, Grasswhistle, Growl, Hyper Voice, Metal Sound, Perish Song, Roar, Screech, Sing, Snore, Supersonic, Uproar, Yawn. The foe must roll +2 during Accuracy Check to hit your Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (7, 'Dual Wielding', '--', 0, '--', 'Static', 1, 'You may control 2 Pokemon at the same time. During a round of battle, they are each included in the battle queue. You are still only allotted 1 Trainer Action. During a round in which you use Dual Wielding, you may not use the effects of Multitasking.');
INSERT INTO pokemondata2.trainer_features VALUES (8, 'Give it Your All', '--', 0, '--', 'Free', 1, 'Target one of your Pokemonâs Moves. For one use, it is a Critical Hit that cannot miss.');
INSERT INTO pokemondata2.trainer_features VALUES (9, 'Hey Guys, Watch This', '--', 0, '--', 'Static', 1, 'From now on, instead of gaining a new Feature when you level up during levels that you would gain a Feature, you gain 1 Feat Point. A Feat Point can be spent at anytime you can use a Trainer Action, and does not take a Trainer Action to use. When you spend a Feat Point, you may add any Feature to your Features whose prerequisites you meet. You may not regain any Feat Points you spend. You do not gain a Feat Point on the same level you take Hey Guys, Watch This.');
INSERT INTO pokemondata2.trainer_features VALUES (10, 'Hold Your Breath!', '--', 3, 'Your Pokemon is targeted by a Move listed below.', 'Free', 1, 'Use when one of you Pokemon is targeted by one of these Moves: Muddy Water, Poison Gas, Poisonpowder, Smog, Stun Spore, Surf, Sweet Scent, Whirlpool. The foe must roll +2 during Accuracy Check to hit your Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (11, 'I Can Take a Hit', '--', 0, '--', 'Static', 1, 'When taking damage from anything reduce that damage by 5. This does not reduce the cost of activating Features that require HP loss.');
INSERT INTO pokemondata2.trainer_features VALUES (12, 'I Can Take a Hit +', '--', 0, '--', 'Static', 1, 'When taking damage from anything reduce that damage by 10. This does not reduce the cost of activating Features that require HP loss. This Feature replaces I Can Take a Hit.');
INSERT INTO pokemondata2.trainer_features VALUES (13, 'I Believe In You!', 'Your Pokemon that just hit a target with a Move.', 2, '--', 'Free', 1, 'Your Pokemon deals an additional 1d6 during the Moveâs damage for each point you have in CHA modifier. You may not use I Believe In You! With Moves that ignore weakness, resistances and stats. This may only be used once per Move.');
INSERT INTO pokemondata2.trainer_features VALUES (14, 'I''ve Heard About This Place Before', 'A Town or City', 1, '--', 'Free', 1, 'Roll 1d20 and add your WIS and INT modifiers. If you roll higher than 12, you know local lore, Gym specialties, major sights, and the names of important persons related to the town or city.');
INSERT INTO pokemondata2.trainer_features VALUES (15, 'League Member', '--', 0, '--', 'Static', 1, 'You take on the responsibilities of either a Frontier Brain or a Gym Leader, and you must accept challenges at least once a week. If you lose, you must give the victor a Frontier Medal if you are a brain, or a Gym badge if you are a leader. If you have 10 Badges you may become a Gym Leader, but you do not need to choose an elemental type. If you have 10 medals you may become a Frontier Brain. You donât need to remain in your facilityâs location to accept challenges, but you do need to let those at your facilities know where you are to forward challengers. Each week you are issued 2000 (for Leaders) or 4500 (for Brains) for your services as a League Member and to create Medals/Badges, which can only be done at your facilities for 1050 (for Leaders) or 2050 (for Brains). You are only paid weekly if you accept at least 3 challenges. You may not take League Member more then once, even if you have qualified for multiple positions. Add 2 to your CHA stat.');
INSERT INTO pokemondata2.trainer_features VALUES (16, 'Let Me Help You With That', 'An allied Trainer making a check.', 3, '--', 'Trainer', 1, 'The ally has +2 added to their check. A check is made while using a Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (17, 'Let Me Help You With That+', 'An allied Trainer making a check.', 2, '--', 'Trainer', 1, 'The ally has +5 added to their check. A check is made while using a Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (18, 'Let''s Get That Lock Open', 'A non-computerized lock.', 3, '--', 'Trainer', 1, 'Roll 1d20 and add your INT modifier. If the result is higher then 15, the lock is unlocked and is undamaged and doesnât appear tampered with.');
INSERT INTO pokemondata2.trainer_features VALUES (19, 'Look Out!', 'Your Pokemon that was targeted by a Move.', 2, '--', 'Free', 1, 'Flip a coin until you flip tails. The foe must roll 1 higher during Accuracy Check to hit your Pokemon for each heads during the coin flips.');
INSERT INTO pokemondata2.trainer_features VALUES (20, 'Multitasking', '--', 0, '--', 'Static', 1, 'During encounters, you may perform 2 Trainer Actions per round. During a round in which you use Multitasking, you may not use the effects of Dual Wielding.');
INSERT INTO pokemondata2.trainer_features VALUES (21, 'Not Yet!', '--', 1, 'Your Pokemon is lowered to 0 HP or less, but not greater than -100% HP.', 'Free', 1, 'Before fainting, the targeted Pokemon can make one last shift and Move and then immediately faints afterwards. This cannot be used with the Move Endeavor, Explosion, Flail, Pain Split, Reversal or Selfdestruct.');
INSERT INTO pokemondata2.trainer_features VALUES (22, 'Random Knowledge', 'Anything you have line of sight to, or an idea or phrase you heard about from any source.', 3, '--', 'Free', 1, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher then 13, you know about the thing you targeted. If you are targeting a Pokemon, you must have targeted the Poke- mon with a Pokedex.');
INSERT INTO pokemondata2.trainer_features VALUES (23, 'Remedial First Aid', 'A Trainer', 2, '--', 'Trainer', 1, 'Roll 1d20 and Add your WIS or INT Modifier. Heal the target this much HP.');
INSERT INTO pokemondata2.trainer_features VALUES (24, 'Staoshi''s Karma', 'A roll.', 1, '--', 'Free', 1, 'You may re-roll any single die. This Feature replaces Satoshiâs Luck.');
INSERT INTO pokemondata2.trainer_features VALUES (25, 'Satoshi''s Luck', 'A roll.', 1, '--', 'Free', 1, 'At the cost of 15 HP, you may re-roll any single die. The 15 HP may not be reduced in any way.');
INSERT INTO pokemondata2.trainer_features VALUES (78, 'Move Recognition', '--', 0, '--', 'Static', 6, 'When your opponentâs pokemon uses a Move that it has already used in that encounter, it must roll 2 higher on Accuracy Check to hit your Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (26, 'Step Aside!', '--', 0, 'Your Pokemon is targeted by a Move or Trainer Attack.', 'Free', 1, 'Your Pokemon immediately Shifts. If it Shifts away from the targeted area, the Move or\n\\ Trainer is avoided. If the target is unable to shift out of the way, it takes no damage from the Move or Trainer Attack. Only additional effects with the âSpirit Surgeâ keyword may activate, should the Accuracy Check permit.');
INSERT INTO pokemondata2.trainer_features VALUES (27, 'Study Session', '--', 0, '--', 'Static', 1, 'You must buy a book at each Pokemart for 70 per town visited. If you donât have 70 when you enter a town you have never visited, you lose this Feature and cannot get it back. Your Wisdom stat gains 1 point or your Intelligence stat gains 1 point. You may take the Study Session Feature multiple times. If you take this Feature multiple times, you still only need to spend 70 at a time.');
INSERT INTO pokemondata2.trainer_features VALUES (28, 'Voltorb Flip', '--', 0, 'A human or Pokemon tries to pry into your mind to read it.', 'Free', 1, 'Roll 1d20 and add either your CON, INT or WIS modifier to the roll. If the roll is 13 or higher, you begin to think of an elaborate game of Voltorb Flip. The person reading your mind cannot read anything other then the game of Voltorb Flip in your mind and all other thoughts, secrets and bits of knowledge are safe from the mind reader. If Voltorb Flip is successful, any attempts to read your mind are unsuccessful for the next hour.');
INSERT INTO pokemondata2.trainer_features VALUES (29, 'What a Guy', '--', 0, '--', 'Static', 1, 'You must donate 70 to a Pokecenter per town visited. If you donât have 70 when you enter a town you have never visited, you lose this Feature and cannot get it back. Your Charisma stat gains 1 point. You may take the What a Guy Feature multiple times. If you take this Feature multiple times, you still only need to donate 70 at a time.');
INSERT INTO pokemondata2.trainer_features VALUES (30, 'Workout', '--', 0, '--', 'Static', 1, 'You must exercise at least once every 3 days. A workout session should consume at least 30 minutes of time. While exercising you lose 25 HP. If you forget to exercise at least once every 3 days you lose Workout. Your Strength stat gains 1 point or your Constitution stat gains 1 point. You may take the Workout Feature multiple times. If you take this Feature multiple times, you still only lose 25 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (31, 'Yoga Break', '--', 0, '--', 'Static', 1, 'You must practice yoga at least once every 3 days. A yoga session should consume at least 30 minutes of time. While exercising you lose 25 HP. If you forget to do yoga at least once every 3 days you lose Yoga Break. Your Dexterity stat gains 1 point. You may take the Yoga Break multiple times. If you take this Feature multiple times, you still only lose 25 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (32, 'Weapon of Choice', '--', 0, '--', 'Static', 1, 'Choose a specific weapon type such as âlongswordâ, âunarmedâ, or âslingshotâ. This becomes your âWeapon of Choiceâ. You may take Weapon of Choice multiple times, each time choosing a new weapon. - When using your Weapon of Choice, your AC check for Arms Features is\nAC4, and you deal [Damage Base 2] damage. - If you are level 10 or higher, you deal [Damage Base 4] damage instead. - If you are level 15 or higher, you deal [Damage Base 6] damage instead.');
INSERT INTO pokemondata2.trainer_features VALUES (33, 'Enhanced Training', '--', 0, '--', 'Static', 2, 'Each of your Pokemon gains an additional 20% the amount of experience they would gain normally.');
INSERT INTO pokemondata2.trainer_features VALUES (34, 'Improved Attacks', '--', 0, 'Your Pokemon''s damage dealing attack hits.', 'Static', 2, 'When adding up damage dealt to the foe, add either half of your STR modifier or half of your CON modifier before your foes subtracts their defense or special defense from the attack.');
INSERT INTO pokemondata2.trainer_features VALUES (35, 'Affirmation', '--', 0, 'Your Pokemon fells a foe or scores a critical hit.', 'Free', 2, 'Your Pokemon gains temporary Hit Points equal to your STR modifier doubled.');
INSERT INTO pokemondata2.trainer_features VALUES (36, 'Beast Master', 'Your Pokemon.', 0, '--', 'Static', 2, 'Your Pokemon do not protest to your commands. They cannot be disobedient unless they are Legendary');
INSERT INTO pokemondata2.trainer_features VALUES (37, 'Break Through!', '--', 1, 'Your Pokemon''s damage dealing attack hits.', 'Free', 2, 'Your Pokemonâs attack deals typeless damage.');
INSERT INTO pokemondata2.trainer_features VALUES (38, 'Brutal Workout', 'Your Pokemon who just defeated another Pokemon.', 2, '--', 'Free', 2, 'The target loses half of its full HP but gains +100% the experience they would have gained from the foe they just felled. This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (39, 'Constructive Criticism', 'Your Pokemon that missed all targets with a move on its previous turn.', 2, '--', 'Free', 2, 'Your Pokemon needs to roll -1 on accuracy checks for the remainder of the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (40, 'Focus', '--', 1, 'Your Pokemon uses a move without a Damage Dice Roll.', 'Free', 2, 'Subtract half your CON modifier from the moveâs Accuracy Check. This may not be used with moves that set the targetâs HP to 0.');
INSERT INTO pokemondata2.trainer_features VALUES (41, 'Improved Attacks +', '--', 0, 'Your Pokemon''s damage dealing attack hits.', 'Static', 2, 'When adding up damage dealt to the foe, add your STR modifier or your CON modifier before your foes subtracts their defense or special defense from the attack. The Feature replaces Improved Attacks.');
INSERT INTO pokemondata2.trainer_features VALUES (42, 'Improved Attacks Z', '--', 0, 'Your Pokemon''s damage dealing attack hits.', 'Static', 2, 'When adding up damage dealt to the foe, add your STR modifier and your CON modifier before your foes subtracts their defense or special defense from the attack. The Feature replaces Improved Attacks +.');
INSERT INTO pokemondata2.trainer_features VALUES (43, 'Intimidate', 'A Pokemon.', 3, '--', 'Trainer', 2, 'You use the Intimidate Ability on the target.');
INSERT INTO pokemondata2.trainer_features VALUES (44, 'Press', 'Your own Pokemon.', 3, '--', 'Trainer', 2, 'Deal damage to your Pokemon equal to 1/5th of their total HP with your weapon. Raise any of their statsâ Combat Stages 1 level. Using Press more than once per Pokemon, per day may make them dislike you.');
INSERT INTO pokemondata2.trainer_features VALUES (45, 'Press +', 'Your own Pokemon.', 3, '--', 'Trainer', 2, 'Deal damage to your Pokemon equal to 1/4th of their total HP with your weapon. Raise any of their statsâ Combat Stages 2 levels. Using Press more than once per Pokemon, per day may make them dislike you. This Feature replaces Press.');
INSERT INTO pokemondata2.trainer_features VALUES (46, 'Taskmaster', '--', 0, '--', 'Static', 2, 'Whenever you use Press, Press+, or Positive Press on a target, remove the Flinched and Confused conditions on the target if applicable, and raise any negative combat stages to 0.');
INSERT INTO pokemondata2.trainer_features VALUES (47, 'No Escape', 'Self.', 0, '--', 'Static', 3, 'When Pokemon or trainers try to flee during an encounter that you are participating in and their movement speed is equal to or greater than yours or your Pokemonâs, they must roll 1d20 and add either their DEX modifier or half their relevant speed capability. If they surpass 8 + your STR modifier, they successfully escape. Otherwise, they are unable to leave the encounter. Someone using the Run Away ability does not need to roll to escape regardless of their movement speed.');
INSERT INTO pokemondata2.trainer_features VALUES (48, 'Torrential Assault', '--', 2, 'A pokemon or trainer successfully flees or a trainer recalls their Pokemon.', 'Free', 3, 'You may have an active pokemon make an attack on a Pokemon or trainer as an Interrupt before they escape or are returned. If you are attacking a Pokemon that has fainted and you lower them to -100% they must still make a death savings throw.');
INSERT INTO pokemondata2.trainer_features VALUES (49, 'Aha! Got You!', '--', 3, '--', 'Free', 3, 'When your Pokemon use a move with the Trap keyword, you may choose to maximize its duration instead of rolling.');
INSERT INTO pokemondata2.trainer_features VALUES (50, 'Bloodthirst', '--', 0, '--', 'Static', 3, ' You can tell if a target is under 50% HP. In addition to this, whenever a hostile target is below 50% HP, your active Pokemon gains 1 Speed Combat Stage. This Speed Combat Stage fades when no hostile targets are below 50% health, and you do not gain multiple Combat Stages when multiple enemies are under 50% HP.');
INSERT INTO pokemondata2.trainer_features VALUES (51, 'Don''t Stop', '--', 2, 'Your Pokemon knocks out a foe.', 'Free', 3, 'After knocking out a foe, the triggering Pokemon may make another Shift and use another Move in that same turn during the encounter. You may only activate this feature once per Pokemon per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (52, 'Finish Them!', 'Your Pokemon using a damaging Move.', 2, '--', 'Free', 3, 'Declare this Feature when a Pokemon hits with Move with a Damage Dice Roll. If the Moveâs target has less than 20 HP after dealing damage, the Pokemon faints, otherwise nothing happens.');
INSERT INTO pokemondata2.trainer_features VALUES (53, 'Hunting Techniques', 'A Pokemon.', 0, '--', 'Trainer', 3, 'Pay 1200, then roll 1d20 and add your STR modifier. If you roll 15 or higher, that Pokemon learns the Move Mean Look, Odor Sleuth, or Pursuit. You must have two Pokemon that already know the move you attempting to tutor to your Pokemon to be able to tutor that specific move.');
INSERT INTO pokemondata2.trainer_features VALUES (54, 'Natural High', '--', 0, 'Your Pokemon fells a foe.', 'Free', 3, 'After knocking out a foe, chose a stat other than HP. That stat is raised 1 Combat Stage.');
INSERT INTO pokemondata2.trainer_features VALUES (55, 'No Escape +', 'Self.', 0, '--', 'Static', 3, 'When Pokemon or trainers try to flee during an encounter that you are participating in and their movement speed is equal to or greater than yours or your Pokemonâs, they must roll 1d20 and add either their DEX modifier or half their relevant speed capability. If they surpass 12 + your STR modifier, they successfully escape. Otherwise, they are unable to leave the encounter. Someone using the Run Away ability must roll to escape as if they did not have that ability. If the target successfully escapes, your movement speed as well as the movement speed of all of your pokemon increases by 4 meters per round for 10 minutes as long as you try to pursue the escapee.');
INSERT INTO pokemondata2.trainer_features VALUES (56, 'Pursuit', 'A Pokemon or human.', 3, '--', 'Trainer', 3, 'Use the Move Pursuit. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (57, 'Shifting Pursuit', 'A Pokemon or human.', 0, '--', 'Static', 3, 'When you purchase this feature, choose a type. When you or one of your Pokemon uses the\n Move Pursuit, Pursuit may instead be that chosen type instead of Dark. You may not change the Type once you pick the type. You may take this Feature more than once to acquire multiple elemental types for Pursuit.');
INSERT INTO pokemondata2.trainer_features VALUES (58, 'Sprints', 'Your Pokemon.', 0, '--', 'Static', 3, 'You may add to your Pokemonâs Speed stat during level up and ignore Base Relation, but only for the Speed Stat.');
INSERT INTO pokemondata2.trainer_features VALUES (59, 'Thrill of the Hunt', 'Your Pokemon gaining experience.', 0, '--', 'Static', 3, 'When your Pokemon pursues a foe and fells them, with Pursuit, due to the effects of a Chaser feature, or in an encounter after the target has previously escaped, they gain +25% the experience they would have gained.');
INSERT INTO pokemondata2.trainer_features VALUES (60, 'Boundless Endurance', '--', 0, '--', 'Static', 4, 'You may add to your Pokemonâs HP stat when they level up, ignoring Base Relation.');
INSERT INTO pokemondata2.trainer_features VALUES (61, 'Press On!', '--', 0, '--', 'Static', 4, 'Your Pokemon faint when they reach -25% HP instead of at 0 HP. Pokemon cannot use the Moves Endeavor, Explosion, Flail, Pain Split, Reversal or Selfdestruct while they have 0 HP or less. Pokemon with the Soulless ability cannot benefit from Press On!');
INSERT INTO pokemondata2.trainer_features VALUES (62, 'Aware', '--', 0, '--', 'Static', 4, 'You may sleep and have just as much awareness to sound, feeling, and smell as if you are awake. You also instinctively sense danger while asleep and can wake up instantly. If you have the status affliction Sleep, treat it as normal non-status afflicted sleep. You do not need to make perception checks with a penalty while asleep.');
INSERT INTO pokemondata2.trainer_features VALUES (63, 'Hold!', '--', 2, 'You are hit by a Move which consults the Attack stat or you are hit by a Trainer Arms Feature attack.', 'Free', 4, 'Lose 25 HP instead of the damage you would have taken.');
INSERT INTO pokemondata2.trainer_features VALUES (64, 'Padding', '--', 0, 'You are hit by a Move.', 'Static', 4, 'Subtract your CON modifier from the damage you would take.');
INSERT INTO pokemondata2.trainer_features VALUES (65, 'Padding +', '--', 0, 'You are hit by a Move.', 'Static', 4, 'Subtract twice your CON modifier from the damage you would take. This Feature replaces Padding.');
INSERT INTO pokemondata2.trainer_features VALUES (66, 'Soul''s Protection', '--', 2, 'You are hit by a Move.', 'Trainer', 4, 'Use the Move Protect.');
INSERT INTO pokemondata2.trainer_features VALUES (67, 'Soul''s Endurance', '--', 2, 'You are hit by a Move.', 'Trainer', 4, 'Use the Move Endure.');
INSERT INTO pokemondata2.trainer_features VALUES (68, 'Split', '--', 2, 'One of your adjacent Pokemon is hit by a damaging Move.', 'Trainer', 4, 'You take half of the damage that would have been done to your Pokemon. Your pokemon takes half of the damage it was supposed to take. Apply DEF and SP.DEF for your Pokemon. Apply any damage modifiers for yourself.');
INSERT INTO pokemondata2.trainer_features VALUES (69, 'Stand!', '--', 2, 'You are hit by a Move that consults the Special Attack stat.', 'Free', 4, 'Lose 25 HP instead of the damage you would have taken.');
INSERT INTO pokemondata2.trainer_features VALUES (70, 'Still Standing', '--', 0, 'You are lowered to or below 0 HP.', 'Static', 4, 'You may still issue commands to your Pokemon while unconscious. If you chose to, and in that encounter you are lowered to -100% HP, you may not make a death saving roll.');
INSERT INTO pokemondata2.trainer_features VALUES (71, 'Still Standing', '--', 0, 'You are lowered to or below 0 HP.', 'Static', 4, 'You may still issue commands to your Pokemon while unconscious. You may still make a death savings throw when lowered to -100% HP. This Feature replaces Still Standing.');
INSERT INTO pokemondata2.trainer_features VALUES (72, 'Field Scout', 'Your Pokemon.', 3, '--', 'Free', 6, 'On its next turn, the target may use the move Rapid Spin as if it was on their Move List, and deals additional damage equal to your STR modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (73, 'Terrain Mastery', 'Self.', 3, '--', 'Trainer', 6, 'For the remainder of the encounter, none of your Pokemon receive movement penalties for moving through Rough Terrain, nor Accuracy Penalties when targeting foes in Rough Terrain.');
INSERT INTO pokemondata2.trainer_features VALUES (74, 'Adaptive Boost', '--', 2, 'Your Pokemon uses a Self-Targeting Move that raises Combat Stages.', 'Free', 6, 'Your Pokemon gains an additional combat stage in any Stat in which they didnât gain a combat stage that turn.');
INSERT INTO pokemondata2.trainer_features VALUES (75, 'Heightened Potential', '--', 2, 'Your Pokemon makes a check on a 1d20 to use a Capability.', 'Free', 6, 'Add your STR modifier to the 1d20 result. This may be used to modify an Accuracy Roll when using the Threaded Capability.');
INSERT INTO pokemondata2.trainer_features VALUES (76, 'Helpful Priorities', '--', 2, 'Your Pokemon uses a Move that targets only other allies.', 'Free', 6, 'Your Pokemon gains X HP, where X is your STR Modifier doubled. Helpful Priorities may be\n triggered on Burst moves like Heal Bell that target Self as well, but only if they affect an Allied Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (77, 'Hazardous Intent', '--', 0, '--', 'Static', 6, 'When your Pokemon are placing Hazards, your Pokemon may place an additional X meters of Hazards, where X is your STR modifier. You may place Hazards as you like within your range, and each meter of hazards need not be adjacent to another. If you put Hazards in a square occupied by an enemy, they immediately suffer the effects of the Hazard.');
INSERT INTO pokemondata2.trainer_features VALUES (79, 'Personal Walls', '--', 3, 'Your Pokemon uses a Move with the Wall Keyword.', 'Free', 6, 'When using moves with the Wall keyword, instead of creating a Wall, your Pokemon creates a coat with the wallâs effect. This effect has a single target, and your Pokemon may target itself or others with this effect. These coats last until the end of the encounter, or until the target is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (80, 'Quick Set-Up', '--', 1, 'Your Pokemon uses a move with the Coat, Hazard, Wall, or Weather keyword, or uses a Capability to affect Terrain.', 'Free', 6, 'Your Pokemon may immediately use a different move with the Coat, Hazard, Wall, or Weather Keyword, or use a different Capability to affect Terrain.');
INSERT INTO pokemondata2.trainer_features VALUES (81, 'Terrain Tactics', 'Your Pokemon.', 0, '--', 'Static', 6, 'Your Pokemon with the Fountain, Freezer, Groundshaper, Materializer, or Sprouter Capabilities may, instead of performing a Move on its turn, target up to X square meters within 6 meters, turning the targetted spaces into Rough Terrain. X is equal to half your STR Modifier plus the Pokemonâs Power or Intelligence Capability, whichever is higher. This ability may be limited by the targetted terrain; for example, while a Pokemon with Fountain could turn dirt into mud to create rough terrain, it may not be able to create rough terrain when fighting on concrete.');
INSERT INTO pokemondata2.trainer_features VALUES (82, 'Versatility', 'Your Pokemon.', 1, '--', 'Trainer', 6, 'The target may forfeit the use of a Battle Frequency Move to regain use of a different Battle Frequency Move, or they may forfeit the use of a Center Frequency Move to regain the use of a different Battle or Center Frequency Move from their Move List.');
INSERT INTO pokemondata2.trainer_features VALUES (83, 'Weather Vortex', '--', 1, 'Your Pokemon uses a move with the Weather keyword.', 'Free', 6, 'The targetâs Weather does not affect the entire field, and does not replace any existing Weather conditions. Instead, your Pokemon targets a space within 6 meters of itself. From that space originates a Blast with a radius of up to 4 meters, though it may be smaller if you wish. Your Weather Move affects only this area, and acts as normal within this area.');
INSERT INTO pokemondata2.trainer_features VALUES (84, 'Team Spirit', 'Your two active Pokemon.', 0, '--', 'Static', 7, 'Each of your pokemon are treated as if one of their Combat Stages are raised 1 Combat Stage. The Combat Stage raised depends on what the highest Base Stat of your other active Pokemon is, ignoring HP. For example, if one of your active pokemonâs highest stat, ignoring HP, is Attack, the other active pokemonâs Attack will be raised 1 Combat Stage. When switching, the Combat Stages are lowered and then raised again depending on the stats of each active pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (85, 'Together!', 'Your two active Pokemon.', 1, '--', 'Trainer', 7, 'The targets may combine two moves that share the same Stat, Elemental Type, and can each legally target the target according to each moveâs range.\nMechanic: When you use a Feature that combines two Moves, the Combined Move happens on the slower participantâs turn; the faster participant shifts and uses the move along with the slower on that turn. If the moves are of the same type, the Combined Move shares that type. If combined moves are of differing types, the Combined Move is typeless. The Moves must both be able to legally target the target according to each Moveâs Range. Neither Move can have the Scatter keyword. The Moveâs Accuracy Check is the average of the two Movesâ Accuracy Checks. The Damage Dice Roll is both of the Movesâ Damage Dice Rolls combined. Treat the Frequencies of the Moves chosen as you would if you werenât combining Moves. All Effects are added to the new, combined Move. Combined Moves may not be used by only one pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (86, 'Brace Each Other!', 'Your two adjacent active Pokemon.', 0, '--', 'Static', 7, 'As long as your two active pokemon are adjacent, neither can suffer Push damage nor be Pushed. If your pokemon are adjacent to you, you cannot be Pushed nor suffer Push damage either.');
INSERT INTO pokemondata2.trainer_features VALUES (87, 'Combine Them!', 'Your two active Pokemon.', 1, '--', 'Trainer', 7, 'The targets may combine two moves that share the same Stat, and can each legally target the target according to each moveâs range. This feature does not replace Together!');
INSERT INTO pokemondata2.trainer_features VALUES (88, 'Dual Assault', '--', 2, 'Your Pokemon damages an opponent another of your Pokemon has damaged this turn.', 'Free', 7, 'The damaged pokemon loses one Combat Stage in the triggering pokemonâs highest stat.');
INSERT INTO pokemondata2.trainer_features VALUES (89, 'Dual Interference', '--', 0, 'Your Pokemon damages an opponent another of your Pokemon has damaged this turn.', 'Static', 7, 'The targeted foe must roll +2 on Accuracy checks during its next turn when targetting your Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (90, 'Taking One For A Friend', '--', 2, 'One of your two adjacent active Pokemon is targeted by a Move.', 'Free', 7, ' Roll 1d20 and add your CON modifier. If you roll higher than 15, the active pokemon who was not targeted may intercept the Move for the targeted pokemon. If the moveâs area of effect still hits both pokemon, the pokemon who is intercepting the hit may take both sets of damage before applying Defense or Special Defense.');
INSERT INTO pokemondata2.trainer_features VALUES (91, 'Taking One For A Friend +', '--', 2, 'One of your adjacent active Pokemon or ally''s Pokemon is targeted by a Move.', 'Free', 7, 'Roll 1d20 and add you CON modifier. If you roll higher than 15, the active pokemon who was not targeted may intercept the Move for the targeted pokemon. If the moveâs area of effect still hits both pokemon, the pokemon who is intercepting the hit may take both sets of damage before applying Defense or Special Defense. This Feature replaces Taking One For A Friend.');
INSERT INTO pokemondata2.trainer_features VALUES (92, 'With Them!', 'Your one active Pokemon while you are in a trainer battle with allies.', 1, '--', 'Trainer', 7, 'Your pokemon and one of your allyâs pokemon may combine two moves that share the same Stat, Elemental Type, and can each legally target the target according to each moveâs range.');
INSERT INTO pokemondata2.trainer_features VALUES (93, 'Try This!', 'Your two active Pokemon.', 1, '--', 'Trainer', 7, 'The targets may combine two No Damage moves, that do not directly affect HP, have the Wall keyword or copy other moves and can each legally target the target according to each moveâs range.');
INSERT INTO pokemondata2.trainer_features VALUES (94, 'Synchronized Shove', '--', 3, 'Your Pokemon damages an opponent another of your Pokemon has damaged this turn.', 'Free', 7, 'The enemy is pushed a number of meters in a direction of your choice equal to the sum of your active pokemonâs Power capabilities.');
INSERT INTO pokemondata2.trainer_features VALUES (95, 'Teamwork', 'Your two active Pokemon.', 0, '--', 'Static', 7, 'Each of your pokemon are treated as if one of their Speed Capabilities are raised by an amount equal to half of your CON modifier. The Capability raised depends on what the highest Speed Capability of your other active pokemon is.');
INSERT INTO pokemondata2.trainer_features VALUES (96, 'Type Training', '--', 0, 'Your chosen type Pokemon gains experience points.', 'Static', 5, 'Each of your chosen typed Pokemon gains +30% the amount of experience they would gain normally.');
INSERT INTO pokemondata2.trainer_features VALUES (97, 'Type Training', '--', 0, 'Your chosen type Pokemon gains experience points.', 'Static', 8, 'Each of your chosen typed Pokemon gains +30% the amount of experience they would gain normally.');
INSERT INTO pokemondata2.trainer_features VALUES (98, 'Improved Type Attacks', '--', 0, 'Your Pokemon''s chosen type damage dealing attack hits.', 'Static', 5, 'When adding up damage dealt to the foe, add half of your CON modifier to the total.');
INSERT INTO pokemondata2.trainer_features VALUES (221, 'Treat Wounds', 'Pokemon or Trainers.', 2, '--', 'Trainer', 16, 'Heal the target 40 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (99, 'Improved Type Attacks', '--', 0, 'Your Pokemon''s chosen type damage dealing attack hits.', 'Static', 8, 'When adding up damage dealt to the foe, add half of your CON modifier to the total.');
INSERT INTO pokemondata2.trainer_features VALUES (100, 'Elemental Shifting', 'A Pokemon.', 3, '--', 'Trainer', 5, 'X is your CON modifier multiplied by 6 seconds, or your CON modifier multiplied by 1 round. The target temporarily gains the Type you feel bound to. If it has 2 Types already, temporarily replace one of their types. It becomes that Type for X. At the end of combat apply experience multipliers from Type Training.');
INSERT INTO pokemondata2.trainer_features VALUES (101, 'Elemental Shifting', 'A Pokemon.', 3, '--', 'Trainer', 8, 'X is your CON modifier multiplied by 6 seconds, or your CON modifier multiplied by 1 round. The target temporarily gains the Type you feel bound to. If it has 2 Types already, temporarily replace one of their types. It becomes that Type for X. At the end of combat apply experience multipliers from Type Training.');
INSERT INTO pokemondata2.trainer_features VALUES (102, 'Elemental Sync', 'A Pokemon.', 0, '--', 'Trainer', 5, 'Elemental Sync takes approximately 10 hours to complete. The targeted Pokemon permanently gains the Type you feel bound to. If the target has two Types, permanently replace one Type. If this pokemon is a single type, it gains a second type. The pokemonâs physical appearance is altered appropriately. You may take this feature up to three times.');
INSERT INTO pokemondata2.trainer_features VALUES (103, 'Elemental Sync', 'A Pokemon.', 0, '--', 'Trainer', 8, 'Elemental Sync takes approximately 10 hours to complete. The targeted Pokemon permanently gains the Type you feel bound to. If the target has two Types, permanently replace one Type. If this pokemon is a single type, it gains a second type. The pokemonâs physical appearance is altered appropriately. You may take this feature up to three times.');
INSERT INTO pokemondata2.trainer_features VALUES (104, 'Improved Type Attacks +', '--', 0, 'Your Pokemon''s chosen type damage dealing attack hits.', 'Static', 5, 'When adding up damage dealt to the foe, add your CON modifier to the total. This feature replaces Improved Type Attacks.');
INSERT INTO pokemondata2.trainer_features VALUES (105, 'Improved Type Attacks +', '--', 0, 'Your Pokemon''s chosen type damage dealing attack hits.', 'Static', 8, 'When adding up damage dealt to the foe, add your CON modifier to the total. This feature replaces Improved Type Attacks.');
INSERT INTO pokemondata2.trainer_features VALUES (106, 'Move Shift', 'Your Pokemon''s Move.', 3, '--', 'Free', 5, 'The Move''s Type temporarily becomes the Type you feel bound to for that use.');
INSERT INTO pokemondata2.trainer_features VALUES (107, 'Move Shift', 'Your Pokemon''s Move.', 3, '--', 'Free', 8, 'The Move''s Type temporarily becomes the Type you feel bound to for that use.');
INSERT INTO pokemondata2.trainer_features VALUES (108, 'Move Sync', 'A Pokemon''s Move.', 0, '--', 'Trainer', 5, 'Move Sync takes approximately 5 hours to complete. The targeted move is now permanently the type you feel bound to.');
INSERT INTO pokemondata2.trainer_features VALUES (109, 'Move Sync', 'A Pokemon''s Move.', 0, '--', 'Trainer', 8, 'Move Sync takes approximately 5 hours to complete. The targeted move is now permanently the type you feel bound to.');
INSERT INTO pokemondata2.trainer_features VALUES (110, 'Soulbound', '--', 0, '--', 'Static', 5, 'When taking damage of your chosen type, treat yourself as if you are Resistant.');
INSERT INTO pokemondata2.trainer_features VALUES (111, 'Soulbound', '--', 0, '--', 'Static', 8, 'When taking damage of your chosen type, treat yourself as if you are Resistant.');
INSERT INTO pokemondata2.trainer_features VALUES (112, 'Superior Typing', 'Your Pokemon of your chosen Type.', 0, '--', 'Static', 5, 'When your foe uses attacks of your chosen type they do not add STAB. When your foe uses Moves of your chosen type they cannot Critical Hit or kill your chosen typed pokemon with those Moves.');
INSERT INTO pokemondata2.trainer_features VALUES (113, 'Superior Typing', 'Your Pokemon of your chosen Type.', 0, '--', 'Static', 8, 'When your foe uses attacks of your chosen type they do not add STAB. When your foe uses Moves of your chosen type they cannot Critical Hit or kill your chosen typed pokemon with those Moves.');
INSERT INTO pokemondata2.trainer_features VALUES (114, 'Type Soul', '--', 0, '--', 'Static', 5, 'You feel bound to that Elemental Type, but are not obligated to only use that type. You can sense Pokemon of that type nearby; 5-meters multiplied by your CON modifier. You can also sense that Type in Movesets of pokemon; 5-meters multiplied by your CON modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (115, 'Type Soul', '--', 0, '--', 'Static', 8, 'You feel bound to that Elemental Type, but are not obligated to only use that type. You can sense Pokemon of that type nearby; 5-meters multiplied by your CON modifier. You can also sense that Type in Movesets of pokemon; 5-meters multiplied by your CON modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (116, 'Type Connection', 'An indifferent or hostile Wild Pokemon of your chosen Type.', 0, '--', 'Trainer', 5, 'Roll 1d20 and add your CON modifier. If the result is 15 or higher, the pokemon becomes more friendly. Targets that were initially indifferent may show interest in the trainer. Targets that were initially hostile may still be wary, or may decide to flee, but will cease attacking. Targets may become hostile again if you attack it or its allies. You may target any single Pokemon with this feature only once per day.');
INSERT INTO pokemondata2.trainer_features VALUES (117, 'Type Connection', 'An indifferent or hostile Wild Pokemon of your chosen Type.', 0, '--', 'Trainer', 8, 'Roll 1d20 and add your CON modifier. If the result is 15 or higher, the pokemon becomes more friendly. Targets that were initially indifferent may show interest in the trainer. Targets that were initially hostile may still be wary, or may decide to flee, but will cease attacking. Targets may become hostile again if you attack it or its allies. You may target any single Pokemon with this feature only once per day.');
INSERT INTO pokemondata2.trainer_features VALUES (118, 'With The Elements', '--', 1, 'You start an encounter with wild Pokemon.', 'Trainer', 5, 'Roll 1d20 and add your CON modifier. If the result is 15 or higher, if the area contains a wild Pokemon of your chosen type, at least one wild Pokemon of that type appears in the current encounter');
INSERT INTO pokemondata2.trainer_features VALUES (119, 'With The Elements', '--', 1, 'You start an encounter with wild Pokemon.', 'Trainer', 8, 'Roll 1d20 and add your CON modifier. If the result is 15 or higher, if the area contains a wild Pokemon of your chosen type, at least one wild Pokemon of that type appears in the current encounter');
INSERT INTO pokemondata2.trainer_features VALUES (120, 'Everstone Finder', 'Anywhere on a Route.', 0, '--', 'Trainer', 9, 'Roll 1d20 and add your CON modifier. If the result is above 15, you find an Everstone.');
INSERT INTO pokemondata2.trainer_features VALUES (121, 'Hidden Strength', 'Your Pokemon, which has at least one evolutionary stage remaining.', 2, '--', 'Trainer', 9, 'Choose a Move of the same type as the Target that one of its evolved forms can learn naturally. The Target may use that Move once. This may only apply to moves learned at X levels above the targetâs level or lower where X is your CON modifier doubled.');
INSERT INTO pokemondata2.trainer_features VALUES (122, 'Hidden Strength +', 'Your Pokemon, which has at least one evolutionary stage remaining.', 2, '--', 'Trainer', 9, 'Choose a Move that one of the Targetâs evolved forms can learn naturally. The Target may use that move once. This may only apply to moves learned at X levels above the targetâs level or lower where X is your CON modifier. This Feature replaces Hidden Strength.');
INSERT INTO pokemondata2.trainer_features VALUES (123, 'Hidden Strength X', 'Your Pokemon, which has at least one evolutionary stage remaining.', 2, '--', 'Trainer', 9, 'Choose a Tutor Move or Level Up Move that one of the Targetâs evolved forms can learn. The Target may use that move once. This may only apply to moves learned at X levels above the targetâs level or lower where X is your CON modifier doubled. This Feature replaces Hidden Strength+.');
INSERT INTO pokemondata2.trainer_features VALUES (124, 'Versatile Technique', 'Your Pokemon, which has at least one evolutionary stage remaining and whose evolved forms are of a different Type.', 0, '--', 'Static', 9, 'The Target may add STAB as if it were of a Type that one of its evolved forms has.');
INSERT INTO pokemondata2.trainer_features VALUES (125, 'Forceful Technique', 'Your first or second-stage Pokemon.', 0, '--', 'Static', 9, 'The Target may add STAB as if it were 10 Levels higher. If the target is at level 91 or higher add one bonus STAB.');
INSERT INTO pokemondata2.trainer_features VALUES (126, 'Anything You Can Do', 'Your Pokemon, which has at least one evolutionary stage remaining and whose evolved forms are of a different Type.', 2, '--', 'Trainer', 9, 'Your CON modifier halved is X. For X rounds, the Target replaces one of its Types with that of one of its evolved forms.');
INSERT INTO pokemondata2.trainer_features VALUES (127, 'Capable', 'Your first or second-stage Pokemon.', 0, '--', 'Static', 9, 'All of the Targetâs existing numerical Capabilities are increased by 1. You may only apply this\nFeature to one Target at a time. Changing what it is applied to costs a trainer action.');
INSERT INTO pokemondata2.trainer_features VALUES (128, 'Highly Capable', 'Your Pokemon, which has at least two evolutionary stages remaining.', 3, '--', 'Trainer', 9, 'Your CON modifier is X. For X minutes, all of the Targetâs existing numerical Capabilities are increased by 2.');
INSERT INTO pokemondata2.trainer_features VALUES (129, 'Incredibly Capable', 'Your Pokemon, which has at least one evolutionary stage remaining.', 1, '--', 'Trainer', 9, 'Your CON modifier halved is X. For X minutes, the Target gains one of the Capabilities of one of its evolved forms.');
INSERT INTO pokemondata2.trainer_features VALUES (130, 'Everstone Improvement', 'An Everstone.', 1, '--', 'Trainer', 9, 'Roll 1d20 and add your CON modifier. If the result is above 20, designate a Type. From then on, the Target, when held by a Pokemon of the designated Type that has at least one evolutionary stage remaining or is a first-stage Pokemonthat cannot evolve, allows that Pokemon to roll 1 additional STAB value.');
INSERT INTO pokemondata2.trainer_features VALUES (131, 'Everstone Perfection', 'An Everstone.', 1, '--', 'Trainer', 9, 'Roll 1d20 and add your CON modifier. If the result is above 20, designate an evolutionary family. From then on, when held by a Pokemon of the designated family that has at least one evolutionary stage remaining, the target acts as an Eviolite for that Pokemonâs two highest Stats.');
INSERT INTO pokemondata2.trainer_features VALUES (132, 'Champ In The Making', 'A Pokemon with at least two evolutionary stages remaining, the last of which evolves at a minimum of Level 30 or higher.', 1, '--', 'Trainer', 9, 'Choose one Stat. For one battle, the Target increases the chosen Stat by an amount equal to its final stageâs chosen Base Stat.');
INSERT INTO pokemondata2.trainer_features VALUES (133, 'The Bigger They Are', 'Your Pokemon when dealing damage.', 0, '--', 'Static', 9, 'For every evolutionary stage the Target is below the Pokemon receiving its damage, add your CON modifier to the damage before applying Defense or Special Defenses.');
INSERT INTO pokemondata2.trainer_features VALUES (134, 'Egg Factory', '--', 0, '--', 'Static', 10, 'You may make up to 7 different Breeding Checks per day, and the check for Breeding is 35 instead of 25. Subtract your CHA or WIS mod from the breeding check. Your Pokemon must still have at least 4 hours together. You can identify what pokemon will hatch from an Egg.');
INSERT INTO pokemondata2.trainer_features VALUES (135, 'Natural Edge', 'A hatching egg you own.', 1, '--', 'Free', 10, 'Add half of your CHA modifier to any of the pokemonâs base stat and add half of your WIS modifier to any different base stat of the same pokemon. This becomes your pokemonâs new base stats. A Pokemon may only have one Natural Edge or Natural Edge + applied to it when it hatches. This bonus may not exceed +6 in either stat.');
INSERT INTO pokemondata2.trainer_features VALUES (136, 'Breed', 'Two Pokemon who are compatible for breeding.', 1, '--', 'Free', 10, 'Give the targets at least 8 hours of time alone, they will be guaranteed to produce an egg.');
INSERT INTO pokemondata2.trainer_features VALUES (137, 'Egg Hatcher', 'Eggs in the possession of the Breeder.', 0, '--', 'Static', 10, 'Eggs hatch at 3/4 of the rate they usually would.');
INSERT INTO pokemondata2.trainer_features VALUES (138, 'Egg Hatcher +', 'Eggs in the possession of the Breeder.', 0, '--', 'Static', 10, 'Eggs hatch at 1/2 of the rate they usually would. This Feature replaces Egg Hatcher.');
INSERT INTO pokemondata2.trainer_features VALUES (139, 'Head Start', 'A hatching egg.', 0, '--', 'Free', 10, 'Roll 1d20 and add your Charisma mod. If the result is 15 or greater, the Pokemon learns all moves learned at or before level âXâ where X equals your Charisma mod.');
INSERT INTO pokemondata2.trainer_features VALUES (140, 'Home Cooking', '--', 2, '--', 'Trainer', 10, 'Roll 1d4 and add your WIS modifier. The total represents the amount of food portions you make for humans and or Pokemon, feeding them for the whole day. Pokemon that eat your food have their loyalty towards you slightly increased. You know what dietary needs a Pokemon has.');
INSERT INTO pokemondata2.trainer_features VALUES (141, 'I''ll Take Good Care Of It', 'A non-hostile Female Wild Pokemon with eggs.', 1, '--', 'Trainer', 10, 'Roll 1d100 and subtract your charisma modifier. If you rolled lower than the targetâs base capture rate, you may receive an egg from the target Pokemon. This roll can be modified by your GM depending on its mood towards you. If you fail, the target may become hostile.');
INSERT INTO pokemondata2.trainer_features VALUES (142, 'Latent Potential', 'A Pokemon who is leveling up to a level evenly divisible by 5.', 2, '--', 'Trainer', 10, 'Roll 1d20 and add your Wisdom Modifier. If the total exceeds 15, the pokemon learns a move from its tutor list marked with an (N), or any move on its level-up list at a level lower than their current level.');
INSERT INTO pokemondata2.trainer_features VALUES (143, 'Litters', 'Pokemon who are breeding.', 1, '--', 'Free', 10, 'Roll 1d4. The roll represents how many eggs are produced after breeding if the breeding was successful. This number may not be modified.');
INSERT INTO pokemondata2.trainer_features VALUES (144, 'Litters +', 'Pokemon who are breeding.', 1, '--', 'Free', 10, 'Roll 1d6 and add 1. The roll represents how many eggs are produced after breeding if the breeding was successful. This number may not be modified.');
INSERT INTO pokemondata2.trainer_features VALUES (145, 'Natural Edge +', 'A hatching egg.', 1, '--', 'Free', 10, 'Add your CHA modifier to any of the Pokemonâs base stat and add your WIS modifier to any different base stat of the same Pokemon. This becomes your Pokemonâs new base stats. A Pokemon may only have one Natural Edge or Natural Edge + applied to it when it hatches. Neither bonus may exceed +6. This Feature replaces Natural Edge.');
INSERT INTO pokemondata2.trainer_features VALUES (146, 'Natural Progression', '--', 0, 'A Pokemon you own levels up to a level evenly divisible by 5.', 'Static', 10, 'The target pokemon gains +1 to two different base stats. The chosen stats must remain the same each time this feature is applied, and the cumulative bonus cannot exceed the limit of your Natural Edge/+ features. If this is used on a Pokemon with Natural Edge/+ applied, the same stats must be chosen and the combination of the two feats still may not exceed the limit. This feature is not retroactive.');
INSERT INTO pokemondata2.trainer_features VALUES (147, 'Never Would Have Happened', '2 opposite gendered Pokemon who aren''t in the same egg group.', 1, '--', 'Free', 10, 'Roll 1d20 and add your WIS and CHA modifiers. If the total is higher then 22, they are allowed  to breed but must still make a Breeding Check to see if an egg is produced.');
INSERT INTO pokemondata2.trainer_features VALUES (148, 'Tender Loving Care', 'A Pokemon.', 2, '--', 'Trainer', 10, 'Roll 1d20 and Add your WIS or CHA Modifier. Heal the target this much HP. You may also spend a use of this feature to heal a number of Pokemon equal to your WIS or CHA modifier to their full HP and cure them of any status afflictions after an 8 hour rest. Center Frequency moves are not restored by Tender Loving Care.');
INSERT INTO pokemondata2.trainer_features VALUES (149, 'Berry Planter', '--', 0, '--', 'Static', 11, 'You create a portable Planter, able to grow and produce plants which grow Apricorns or Berries. Plant an Apricorn or Berry into the Planter Extension, roll 1d4 and add 1. The berry plant will produce Berries in that many days. Once ready to pick, roll 1d4 to determine how many Berries grow per plant. You may plant up to 4 Berries in your planter. You may not plant a fifth Berry until you harvest Berries and make room for it.');
INSERT INTO pokemondata2.trainer_features VALUES (150, 'Healer Berry Search', 'A Route, or any wilderness area with plant life', 2, '--', 'Trainer', 11, 'Roll 1d20 and add your WIS modifier. On a result of 15 or higher, you find a berry. To determine its type, roll 1d10. The result is the number of the berry you find in the berry index.');
INSERT INTO pokemondata2.trainer_features VALUES (151, 'Altering Berry Search', 'A Route, or any wilderness area with plant life', 2, '--', 'Trainer', 11, 'Roll 1d20 and add your WIS modifier, and choose a Pokemon that you own with a stat above 20. On a result of 20 or higher, you find a berry that lowers the stat you selected the Pokemon for.');
INSERT INTO pokemondata2.trainer_features VALUES (152, 'Berry Efficiency', '--', 0, '--', 'Static', 11, 'When using any given berry, the target may not consume it if you choose, but still benefits from its effect. The second time the target benefits from the effects of the same berry, it is consumed as normal. If applied to a reusable berry, this feature allows use of it twice in a day without becoming useless.');
INSERT INTO pokemondata2.trainer_features VALUES (153, 'Berry Expert', '--', 0, '--', 'Static', 11, 'You can identify any Berry, its properties, and what it yields in terms of Contest Stats. When you are making Berries into Poffins, Aprijuice, or PokeBlocks, you get +2 to your rolls. When your pokemon eat a flavor of Berry that they like, any numerical effects of any loyalty gained is doubled.');
INSERT INTO pokemondata2.trainer_features VALUES (154, 'Berry Merge', 'Berries', 0, '--', 'Trainer', 11, 'Choose 5 berries with an identical set of effects and pay 1,500. The berries are consumed, and you create a hold item that has the same effects as the component berries, but is not consumed on use. If the item is used more than once a day, it loses its flavor and becomes useless. Call the item whatever youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (155, 'Booster Berry Search', 'A Route, or any wilderness area with plant life', 2, '--', 'Trainer', 11, 'Roll 1d20 and add your WIS modifier, and choose one of your Pokemon with a stat of 20 or higher. On a result of 15 or higher, you find a berry that increases a Combat Stage when below 50% HP. The stat increased by the berry will be the stat you chose when selecting a Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (156, 'Eat It!', 'An allied Pokemon', 2, '--', 'Trainer', 11, 'The target immediately consumes and benefits from the effects of what berry they are holding, regardless of their current HP or status.');
INSERT INTO pokemondata2.trainer_features VALUES (157, 'Effectiveness Berry Search', 'A Route, or any wilderness area with plant life', 2, '--', 'Trainer', 11, 'Roll 1d20 and add your WIS modifier, and optionally choose a Pokemon that you own. On a result of 20 or higher, you find a berry that reduces damage from a type that your chosen Pokemon is weak to. If you do not choose a Pokemon when using this feature, you find a Chilan Berry instead.');
INSERT INTO pokemondata2.trainer_features VALUES (158, 'Flavor Berry Search', 'A Route, or any wilderness area with plant life', 2, '--', 'Trainer', 11, 'Roll 1d20 and add your WIS modifier. On a result of 15 or higher, you find a berry. To determine its type, roll 1d6+10 (reroll a result of 16). The result is the number of the Berry you find in the berry listing.');
INSERT INTO pokemondata2.trainer_features VALUES (159, 'Hybridization', 'Berries', 0, '--', 'Trainer', 11, 'When planting a berry, you may instead plant two berries in the same spot, using parts of each and being unable to use the remainder. The resulting berry plant will grow berries that are a combination of both the ingredients, and has both their effects. When eaten, if both effects cannot apply, then only apply the relevant one. Berries created as a result of this feature cannot have this feature applied to them.');
INSERT INTO pokemondata2.trainer_features VALUES (160, 'Plain Berry Search', 'A Route, or any wilderness area with plant life', 2, '--', 'Trainer', 11, 'Roll 1d20 and add your WIS modifier. On a result of 15 or higher, you find a berry that has no effect of your choice.');
INSERT INTO pokemondata2.trainer_features VALUES (161, 'Rare Berry Search', 'A Route, or any wilderness area with plant life', 2, '--', 'Trainer', 11, 'Roll 1d20 and add your WIS modifier. On a result of 20 or higher, you find a berry. To determine its type, roll 1d6+58. The result is the number of the berry you find in the berry listing.');
INSERT INTO pokemondata2.trainer_features VALUES (162, 'Special Nutrients', 'Planted Berries', 1, '--', 'Trainer', 11, 'Choose a planted berry and pay 550. The berry will grow to full size and bear fruit within 24-X hours, where X is you WIS modifer.');
INSERT INTO pokemondata2.trainer_features VALUES (163, 'Energy Boost', '--', 0, '--', 'Trainer', 12, 'You create an Energy Drink that provides Trainers with Temporary Hit-Points equal to your WIS modifier x5. The Temporary Hit-Points disappear in 1 hour. It costs 250 to create the Energy Drink.');
INSERT INTO pokemondata2.trainer_features VALUES (164, 'Soul Food', 'A Pokemon.', 0, '--', 'Trainer', 12, 'Create a Dish from whatever edible food youâd like. Pokemon that eat this dish will have their mood greatly increased, and will not lose loyalty if they consume Herbal Medicines shortly before or after. It costs 100 to use Soul Food.');
INSERT INTO pokemondata2.trainer_features VALUES (165, 'Apricorn Blender', 'Aprijuice that is being blended', 2, '--', 'Trainer', 12, 'Add your WIS modifier to the value of the Aprijuice');
INSERT INTO pokemondata2.trainer_features VALUES (166, 'Baby Food', '--', 1, '--', 'Trainer', 12, 'You create a Dish that, when eaten by a Pokemon of level 25 or lower, causes that Pokemon to gain an additional 25% the amount of experience they would gain normally for the rest of the day. It costs 350 to use Baby Food.');
INSERT INTO pokemondata2.trainer_features VALUES (167, 'Bait', 'Anywhere on a Route.', 1, '--', 'Trainer', 12, 'Roll 1d20 and add you WIS modifier. You create a Dish and place it somewhere on the route. If your roll is less than 10, a random Pokemon, based on your GMâs discretion will appear. If you roll 15 or higher a Pokemon of at least the same level as your highest leveled loyal Pokemon will appear. If you roll 20 or higher, a Pokemon at least 5 levels higher than your highest leveled loyal Pokemon will appear. Pokemon acquired through the use of Bait cannot be used as the basis of determining the level of other Pokemon lured by using Bait.');
INSERT INTO pokemondata2.trainer_features VALUES (168, 'Herbal Medicine', '--', 0, '--', 'Trainer', 12, 'Create a Heal Powder (175) or Energy Powder (150).');
INSERT INTO pokemondata2.trainer_features VALUES (169, 'Poffin Mixer', 'A Poffin that is being mixed.', 2, '--', 'Trainer', 12, 'Add your WIS modifier to the value of the Poffin or Pokeblock.');
INSERT INTO pokemondata2.trainer_features VALUES (170, 'Soldier Pills', '--', 2, '--', 'Trainer', 12, 'You create a Soldier Pill that provides Trainers with enough energy to go 1 day without sleep. After 48 hours without sleep, the itemâs consumer loses 10 HP for every hour without sleep. While under the effects of a Soldier Pill, you may not be given the Sleep Status Affliction. If you would be given the Sleep Status Affliction, the Trainer loses 2 of the 48 hours allotted by Soldier Pills +. It costs 500 to create a Soldier Pill.');
INSERT INTO pokemondata2.trainer_features VALUES (171, 'Sugar Rush', '--', 0, '--', 'Trainer', 12, 'You create a Dish that provides Pokemon with Temporary Hit-Points equal to your Wis modifier x2. The Temporary Hit-Points disappear in 1 hour. It costs 150 to use Sugar Rush.');
INSERT INTO pokemondata2.trainer_features VALUES (219, 'Restore Strength', 'A Pokemon.', 1, '--', 'Trainer', 16, 'Treat the target Pokemon as if they have not used any Center Frequency moves since their last Pokemon Center visit.');
INSERT INTO pokemondata2.trainer_features VALUES (172, 'Throw Bait', 'A wild Pokemon.', 2, '--', 'Trainer', 12, 'You throw a tasty morsel of food a wild pokemon. Roll 1d20 and add your WIS modifier. If the result is 15 or higher, the Pokemon gives up its next move action to sample the food. If the result is 25 or higher, the Pokemon gives up its next attack action to completely eat the food. It costs 100 to use Throw Bait.');
INSERT INTO pokemondata2.trainer_features VALUES (173, 'Vile Cook', 'A Dish you''ve just created.', 0, '--', 'Trainer', 12, 'Choose Paralysis, Poison, or Sleep. Whenever the targeted Dish is consumed, it inflicts the chosen status. It costs 100 to use Vile Cook.');
INSERT INTO pokemondata2.trainer_features VALUES (174, 'Vitamins', '--', 2, '--', 'Trainer', 12, 'Roll 1d6. On a result of 1, you create an HP Up; on a result of 2, you create a Protein; on a result of 3, you create an Iron; on a result of 4, you create a Calcium; on a result of 5, you create a Zinc; on a result of 6, you create a Carbos. It costs 2,450 to use the Vitamins Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (175, 'Vitamins +', '--', 1, '--', 'Trainer', 12, 'Create a HP Up, a Protein, an Iron, a Calcium, a Zinc or a Carbos. It costs 2,450 to use the Vitamins + Feature. This Feature does not replace Vitamins.');
INSERT INTO pokemondata2.trainer_features VALUES (176, 'Early Evolution', '--', 0, '--', 'Static', 13, 'Your CHA modifier is X. Your Pokemon who evolve by happiness and level requirement may evolve up to X levels earlier if they meet their requirements.');
INSERT INTO pokemondata2.trainer_features VALUES (177, 'Quick Study', '--', 0, '--', 'Static', 13, 'Your CHA modifier halved is X. Your Pokemon''s attacks learned through level up are learned X levels earlier.');
INSERT INTO pokemondata2.trainer_features VALUES (178, 'Ancient Evolution', 'An allied Pokemon or allied Trainer''s Pokemon, which can evolve if it knows a specific Move.', 1, '--', 'Trainer', 13, 'Roll 1d20 and add your CHA modifier. If the result exceeds 18, the pokemon spontaneously evolves and learns the Move that it would have needed to know in order to evolve. If you fail the check, the pokemon loses 2 levels, and its exp is lowered appropriately for it to be 2 levels under where is just was. Lower stats appropriately and remove Moves appropriately.');
INSERT INTO pokemondata2.trainer_features VALUES (179, 'Clocked Evolution', 'An allied Pokemon or allied Trainer''s Pokemon, which can evolve based on the time of day.', 1, '--', 'Trainer', 13, 'Roll 1d20 and add your CHA modifier. If the result exceeds 18, the pokemon spontaneously evolves. If you fail the check, the pokemon loses 2 levels, and its exp is lowered appropriately for it to be 2 levels under where is just was. Lower stats appropriately and remove Moves appropriately.');
INSERT INTO pokemondata2.trainer_features VALUES (180, 'Devolve!', 'A Pokemon.', 1, '--', 'Trainer', 13, 'You may use this Feature when you successfully damage a pokemon. Roll 1d20 and add your CHA modifier. If the result is greater then 21 and the target has less than 10% of its HP left, it is returned to a previous stage of its evolutionary line. If the previous stage is known, it is returned to that particular pokemon. Adjust its stats appropriately, but its Move set is unaltered. That pokemon may not evolve for another 5 levels unless that pokemon is already above level 50.');
INSERT INTO pokemondata2.trainer_features VALUES (181, 'Early Evolution +', '--', 0, '--', 'Static', 13, 'Your CHA modifier doubled is X. Your Pokemon who level up by happiness and level requirement may evolve up to X levels earlier if they meet their requirements. This Feature replaces Early Evolution.');
INSERT INTO pokemondata2.trainer_features VALUES (182, 'Environ Evolution', 'An allied Pokemon or allied Trainer''s Pokemon, which can evolve based on location.', 1, '--', 'Trainer', 13, 'Roll 1d20 and add your CHA modifier. If the result exceeds 18, the pokemon spontaneously evolves. If you fail the check, the pokemon loses 2 levels, and its exp is lowered appropriately for it to be 2 levels under where is just was. Lower stats appropriately and remove Moves appropriately.');
INSERT INTO pokemondata2.trainer_features VALUES (183, 'Elemental Evolution', 'An allied Pokemon or allied Trainer''s Pokemon, which can evolve through the use of an Elemental Stone.', 1, '--', 'Trainer', 13, 'Roll 1d20 and add your CHA modifier. If the result exceeds 18, the pokemon spontaneously evolves. If you fail the check, the pokemon loses 2 levels, and its experience is lowered appropriately for it to be 2 levels under where it just was. Lower stats appropriately and remove Moves appropriately.');
INSERT INTO pokemondata2.trainer_features VALUES (184, 'Evolve!', 'The roll made during a check made with an Evolver Feature.', 1, '--', 'Free', 13, 'Add your CHA modifier to the check.');
INSERT INTO pokemondata2.trainer_features VALUES (185, 'Evolve! +', 'The roll made during a check made with an Evolver Feature.', 1, '--', 'Free', 13, 'Add your CHA modifier doubled to the check. This Feature replaces Evolve!');
INSERT INTO pokemondata2.trainer_features VALUES (186, 'Keepsake Builder', '--', 0, '--', 'Trainer', 13, 'You can create an Item that does nothing in battle, but it can serve as a replacement for a pokemonâs requirement to evolve if they would need a held item. The item can be named whatever youâd like. Like all other held items that influence evolution, the item disappears after the pokemon evolves. It costs 1000 to use the Keepsake Builder Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (187, 'Keepsake Evolution', 'An allied Pokemon or allied Trainer''s Pokemon, which can evolve through the use of Held Items.', 1, '--', 'Trainer', 13, 'Roll 1d20 and add your CHA modifier. If the result exceeds 18 and the pokemon has met the level minimum requirement, the pokemon spontaneously evolves. If you fail the check, the pokemon loses 2 levels, and its exp is lowered appropriately for it to be 2 levels under where is just was. Lower stats appropriately and remove Moves appropriately.');
INSERT INTO pokemondata2.trainer_features VALUES (188, 'Quick Study +', 'Pokemon the Breeder owns.', 0, '--', 'Static', 13, 'Your CHA modifier is X. Your Pokemon''s attacks learned through level up are learned X levels earlier. This feature replaces Quick Study.');
INSERT INTO pokemondata2.trainer_features VALUES (189, 'Good Grooming', 'A Pokemon.', 2, '--', 'Trainer', 14, 'After a 10 minute grooming, the target is temporarily at full Loyalty and appears more appealing. If they level up without a negative incident within 10 minutes of Good Grooming and have met all previous requirements for evolution, evolution is guaranteed. Loyalty returns to its usual level after 1 hour; repeated use of Good Grooming gradually raises its usual level of Loyalty.');
INSERT INTO pokemondata2.trainer_features VALUES (190, 'Contest Coating', '--', 0, '--', 'Static', 14, 'Your Pokemon may have up to 15 points in any Contest Stat. When participating in a Contest, you may burn one extra point of Contest appeal than you would usually be able to whenever you would be able to burn a point.');
INSERT INTO pokemondata2.trainer_features VALUES (191, 'Agility Training', 'One of your Pokemon.', 2, '--', 'Trainer', 14, 'After a 10 minute grooming, the target''s Speed Capabilities are +3 for the next 24 hours.');
INSERT INTO pokemondata2.trainer_features VALUES (192, 'Blinding Coat', 'An adjacent Pokemon.', 1, '--', 'Trainer', 14, 'Roll 1d20 and add your CHA modifier. If the total is 13 or higher, any time an enemy Pokemon or Trainer would target the Pokemon, they must roll +2 in order to hit during Accuracy Check for the remainder of the encounter. This may not target the same Pokemon more then once per day.');
INSERT INTO pokemondata2.trainer_features VALUES (193, 'Contest Breeding', 'A hatching Egg.', 2, '--', 'Free', 14, 'Choose a Contest Stat from one of the Egg''s parents. The Egg hatches with half the value of the chosen Contest Stat.');
INSERT INTO pokemondata2.trainer_features VALUES (194, 'Perfect Contest Breeding', 'A hatching Egg.', 2, '--', 'Free', 14, 'Choose a Contest Stat from one of the Eggâs parents, and then choose a different Contest Stat from the Eggâs other parent. The Egg hatches with either the full value of one of the parentsâ Contest Stats or hatches with half of each of the Eggâs parentsâ Contest Stats. This Feature replaces Contest Breeding.');
INSERT INTO pokemondata2.trainer_features VALUES (195, 'Rising Star', 'A Pokemon who is leveling up to a level evenly divisible by 5.', 2, '--', 'Free', 14, 'Roll 1d20 and add your CHA modifier. If the total is 10 or higher, choose a Contest Stat that the target already has at least 1 point in, and add 2 more points to the Stat. Rising Star canât raise any specific Contest Stat above 15.');
INSERT INTO pokemondata2.trainer_features VALUES (196, 'Sheen Breeding', 'Pokemon who are breeding and have successfully produced an Egg.', 1, '--', 'Free', 14, 'Roll 1d100 and subtract your CHA modifier doubled from the result. If you rolled 0 or under, when the egg hatches, the Pokemon will be Shiny.');
INSERT INTO pokemondata2.trainer_features VALUES (197, 'Sign Training', '--', 0, '--', 'Static', 14, 'Your Pokemon under the effects of Agility Training can use Moves and Shift on your command through non-verbal communication. This could be hand signals, audible cues, or anything that you work out that still requires some action on your part for your Pokemon to interpret.');
INSERT INTO pokemondata2.trainer_features VALUES (198, 'Specs Grooming', 'A Pokemon.', 2, '--', 'Trainer', 14, 'Raise the targetâs X Combat Stage 1 level. X is Attack, Defence, Special Attack, Special Defence or Speed, but only if the target has a corresponding Contest Ribbon. For X, Beauty Ribbon allows Special Attack; Cool Ribbon allows Attack; Cute Ribbon allows Speed; Tough Ribbon allows Defence or Smart Ribbon allows Special Defence. When using Specs Grooming, choose only one X at a time per encounter. You cannot target the same Pokemon more than once per encounter with Specs Grooming.');
INSERT INTO pokemondata2.trainer_features VALUES (199, 'Specs Grooming +', 'A Pokemon.', 2, '--', 'Trainer', 14, 'Raise the targetâs X Combat Stage 2 levels. X is Attack, Defence, Special Attack, Special Defence or Speed, but only if the target has a corresponding Contest Ribbon. For X, Beauty Ribbon allows Special Attack; Cool Ribbon allows Attack; Cute Ribbon allows Speed; Tough Ribbon allows Defence or Smart Ribbon allows Special Defence. When using Specs Grooming +, choose only one X at a time per encounter. You cannot target the same Pokemon more than once per encounter with Specs Grooming+. This Feature replaces Specs Grooming.');
INSERT INTO pokemondata2.trainer_features VALUES (200, 'You Get It From Me', 'A hatching egg.', 1, '--', 'Free', 14, 'Add your CHA modifier to any of the Egg''s Contest Stats as long as you''ve won at least 1 Ribbon for the Contest type you chose.');
INSERT INTO pokemondata2.trainer_features VALUES (201, 'This Is How You Do It, Kid', 'A Pokemon you''ve hatched, within at least 20 meters of one of its parents.', 0, '--', 'Static', 15, 'When the parent Pokemon gains Experience Points, instead it gains half of the experience points it would have gained, then the target gains the other half of the experience points. If both parents of a particular target are nearby, you may still only use This Is How You Do It, Kidâs Effect once.');
INSERT INTO pokemondata2.trainer_features VALUES (202, 'Egg Move Advantage', 'A hatching egg.', 1, '--', 'Free', 15, 'Your CHA modifier halved is X. The hatching pokemon learns up to X of their Egg Moves, as long as either parents have the Move(s) on their Level Up or Tutor Move list. These Moves are decided at random. You can only have one instance of any attack. If a pokemon has fewer legal Level Up/Tutor Moves than X, they learn all of the possible Moves.');
INSERT INTO pokemondata2.trainer_features VALUES (203, 'Attitude Blinders', 'A hatching egg.', 2, '--', 'Free', 15, ' Roll 1d20 and add your CHA modifier. If the result is 16 or higher, choose 6 Natures and assign each to the numbers 2, 3, 4, 5, 6. Roll 1d6; on the result, from 1 to 6, give the hatching egg the assigned Nature.');
INSERT INTO pokemondata2.trainer_features VALUES (204, 'Attitude Blinders +', 'A hatching egg.', 2, '--', 'Free', 15, 'Roll 1d20 and add your CHA modifier. If the result is 16 or higher, choose a nature and give the hatching pokemon the assigned Nature. This Feature replaces Attitude Blinders.');
INSERT INTO pokemondata2.trainer_features VALUES (205, 'Birthright', 'A hatching egg.', 2, '--', 'Free', 15, 'Roll 1d20 and add your CHA modifier. If the result is higher than 20, the Pokemon hatches with the Ability of your choice.');
INSERT INTO pokemondata2.trainer_features VALUES (206, 'Born Strong', 'A hatching egg.', 2, '--', 'Free', 15, 'Roll 1d20 and add your CHA modifier. If the result is 13 or higher, the Pokemon hatches with +1 to all of its Speed Capabilities and +1 to its Power Capability. If it evolves, these bonuses carry over to its new stage. This Feature can not raise a Power Capability to 8 or higher.');
INSERT INTO pokemondata2.trainer_features VALUES (207, 'Egg Move Tutor', 'An unevolved pokemon who can learn an egg move and is leveling up to a level evenly divisible by 5.', 1, '--', 'Trainer', 15, 'Roll 1d20 and add your CHA modifier. If the result is higher than 25, the target can be taught an Egg Move it has not yet learned. Egg Move Tutor can only successfully target a Pokemon 4 times.');
INSERT INTO pokemondata2.trainer_features VALUES (208, 'Master Hatcher', 'Eggs in the possession of the Breeder.', 0, '--', 'Static', 15, 'Eggs hatch at 1/3 the rate they would normally hatch at. This feature replaces Egg Hatcher or Egg Hatcher +.');
INSERT INTO pokemondata2.trainer_features VALUES (209, 'Natural Move Economy', '--', 0, '--', 'Static', 15, 'Egg Moves and Level Up Moves may be placed in your Pokemonâs âTM/Tutor Moveâ Move Slots. Moves taught by TMs or Tutors, which appear on your Pokemonâs Egg Move List or Natural Move List, may be placed on you Pokemonâs âLevel Up/Egg Moveâ List.');
INSERT INTO pokemondata2.trainer_features VALUES (210, 'Not Yet, Little One', '--', 0, '--', 'Static', 15, 'If an Egg that you, or one of your allied Trainers, own is starting to hatch, you may prevent it from hatching for up to 48 hours. If you do not own the Egg, you need permission from its owner to prevent it from hatching.');
INSERT INTO pokemondata2.trainer_features VALUES (211, 'Parental Hyperlexia', '--', 0, '--', 'Static', 15, 'You understand your Pokemon above Level 15 that you have hatched as if they are speaking to you in your language. They are equally capable of understanding you through body language as if you were verbally commanding them.');
INSERT INTO pokemondata2.trainer_features VALUES (212, 'Philoprogenitive', '--', 0, '--', 'Free', 15, 'If any Pokemon, within your Shift value, that you originally hatched has been successfully hit by a Move or Feature you may Shift as a Free Action to Intercept that Move. You take the damage and effects of that Move or Feature, after subtracting X from the incoming damage, where X is your CHA modifier. You may only use Philoprogenitive once per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (213, 'Thoroughbred', '--', 0, '--', 'Static', 15, 'Any Pokemon you hatch, that were also hatched from two Pokemon you own and whose parents are of the same species (or evolution lines, including split evolution lines) are âThoroughbred.â Your Thoroughbred Pokemon gains +30% the amount of experience they would gain normally.');
INSERT INTO pokemondata2.trainer_features VALUES (214, 'Treat Minor Wounds', 'Pokemon or Trainers.', 3, '--', 'Trainer', 16, 'Heal the target 20 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (215, 'Muscle Relaxants', 'A Paralyzed Trainer or Pokemon.', 3, '--', 'Trainer', 16, 'The target is no longer Paralyzed.');
INSERT INTO pokemondata2.trainer_features VALUES (216, 'Better Living Through Medicine', '--', 1, '--', 'Trainer', 16, 'You may use two Medic Features, two restorative items, or a Medic Feature and a restorative item as a single Trainer Action. Features used through Better Living Through Medicine still count toward their daily uses for that feature.');
INSERT INTO pokemondata2.trainer_features VALUES (217, 'Medicinal Expert', '--', 0, '--', 'Static', 16, 'Whenever you uses a health restoring item, such as a Potion, or an item that cures a Status Affliction, such as an Antidote, it heals an additional amount of HP equal to your WIS Stat.');
INSERT INTO pokemondata2.trainer_features VALUES (218, 'Pain Killers', 'A Poisoned or Burned Trainer or Pokemon.', 3, '--', 'Trainer', 16, 'The target is cured of Poison or Burn.');
INSERT INTO pokemondata2.trainer_features VALUES (220, 'Shock Therapy', 'A Frozen or Asleep Trainer or Pokemon.', 3, '--', 'Trainer', 16, 'The target is cured of Frozen or Sleep.');
INSERT INTO pokemondata2.trainer_features VALUES (222, 'Treat Major Wounds', 'Pokemon or Trainers.', 2, '--', 'Trainer', 16, 'Heal the target 60 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (223, 'Treat Serious Wounds', 'Pokemon or Trainers.', 2, '--', 'Trainer', 16, 'Heal the target 80 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (224, 'Won''t Die On Me', 'A Trainer or Pokemon who failed their Death Saving Throw.', 1, '--', 'Free', 16, 'The Target may re-roll that savings throw. The Target subtracts 5 from their roll if it is a Trainer, or 25 if it is a Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (225, 'Won''t Die On Me +', 'A Trainer or Pokemon who failed their Death Saving Throw.', 1, '--', 'Free', 16, 'The Target may re-roll that savings throw. The Target subtracts your Wisdom Stat from their roll. This Feature replaces Won''t Die On Me.');
INSERT INTO pokemondata2.trainer_features VALUES (226, 'Natural Arrangement', '--', 0, '--', 'Static', 17, 'When any of your Pokemon learn a Tutor or TM Move, you may place it on your Pokemonâs Natural Move list. When doing so, you may only place up to two Moves that would normally be on your Pokemonâs Tutor/TM Move list onto its Natural Move list.');
INSERT INTO pokemondata2.trainer_features VALUES (227, 'Tutor Pushing', 'A Pokemon (1 Push Point)', 2, '--', 'Trainer', 17, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, chose a Move from the Tutor Move list that the target pokemon can learn. Teach the target that Tutor Move as if you had used a TM. Once you successfully use Tutor Pushing on a pokemon, Tutor Pushing may not target that pokemon ever again.\nMechanic: Pokemon gain one âPush Pointâ every 5 levels. When a trainer acquires a Pokemon, it retroactively gains all unspent Push Points for all of its previously earned levels. To use certain Move Tutor Features, the targeted Pokemon must have a certain amount Push Points. Upon the successful use of certain Move Tutor Features, those Push Points are expended. Move Tutor Features that use Push Points, say so in the âTargetâ Line of the Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (228, 'Capability Pushing', 'A Pokemon (0 Push Points)', 1, '--', 'Trainer', 17, 'Choose a Move on the targeted Pokemonâs Level-up, Egg, TM or Tutor list that grants or modifies a Capability that is not Aura. The Pokemon gains that Capability. Capability Pushing may not target that pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (229, 'Elemental Unlock', 'A Pokemon (3 Push Points)', 0, '--', 'Trainer', 17, 'Choose an Elemental Type. That pokemon can now learn TMs of that Elemental Type, regardless of its other types. Elemental Unlock may not target that pokemon ever again. You may take Elemental Unlock up to 3 times.');
INSERT INTO pokemondata2.trainer_features VALUES (230, 'HM Smith', 'A TM.', 1, '--', 'Trainer', 17, 'Pay 8000. Change a TM into an HM.');
INSERT INTO pokemondata2.trainer_features VALUES (231, 'Physical Pushing', 'A Pokemon (2 Push Points)', 2, '--', 'Trainer', 17, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, chose a TM that teaches a Move that uses the Attack Stat as long as the target pokemon can learn that TM. Teach the target that TM as if you had used a TM. Once you successfully use Physical Pushing on a pokemon, Physical Pushing may not target that pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (232, 'Special Pushing', 'A Pokemon (2 Push Points)', 2, '--', 'Trainer', 17, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, chose a TM that teaches a Move that uses the Special Attack Stat as long as the target pokemon can learn that TM. Teach the target that TM as if you had used a TM. Once you successfully use Special Pushing on a pokemon, Special Pushing may not target that pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (233, 'Status Pushing', 'A Pokemon (2 Push Points)', 2, '--', 'Trainer', 17, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, choose a TM that teaches a Move that does not apply the Attack or Special Attack Stat that the target pokemon can learn. Teach the target that TM as if you had used a TM. Once you successfully use Status Pushing on a pokemon, Status Pushing may not target that pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (234, 'TM King', '--', 0, '--', 'Static', 17, 'Remove the following line from TM Makerâs Effect: You may not create the same TM more than once with this Feature. Remove the following line from TM Smithâs Effect: You may not create a TM with the same Move more than once with this Feature. Remove the following line from TM Pushingâs Effect: You may never select that TM again with TM pushing.');
INSERT INTO pokemondata2.trainer_features VALUES (235, 'TM Maker', '--', 1, '--', 'Trainer', 17, 'Pay 1500 , roll 1d20 and add your WIS modifier. If the total exceeds 20, chose a TM youâve Pushed onto a pokemon. You create that TM. You may not create the same TM more than once with this Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (236, 'TM Pushing', 'A Pokemon (2 Push Points)', 2, '--', 'Trainer', 17, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, chose a TM from TMs 1 to 95 or from A1 to A6 that the target pokemon can learn. Teach the target that TM as if you had used a TM. You may never select that TM again with TM Pushing.');
INSERT INTO pokemondata2.trainer_features VALUES (237, 'TM Smith', 'Items', 1, '--', 'Trainer', 17, 'Pay 1500 , roll 1d20 and add your WIS modifier. If the total exceeds 20, chose a Move that isnât on the TM list that one of your pokemon can perform. You create a TM with that Move. Give it any number above 101, or add a letter (A-Z) to a number to give it an unique identification. You may not create a TM with the same Move more than once with this Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (238, 'Tutor Capacity', '--', 0, '--', 'Static', 17, 'Remove the following line from Tutor Pushingâs Effect: Once you successfully use Tutor Pushing on a pokemon, Tutor Pushing may not target that pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (239, 'Capture Point', '--', 0, 'You throw a Poke Ball.', 'Static', 18, 'Subtract either half of your DEX modifier or half of your INT modifier from your d100 rolls when throwing any Poke Ball.');
INSERT INTO pokemondata2.trainer_features VALUES (240, 'Curve Ball', '--', 3, 'You throw a Poke Ball.', 'Free', 18, 'You may deal X damage to the target you are throwing a Poke Ball at where X is your DEX modifier. The targetâs Defense or Special Defense cannot reduce this damage. This Feature cannot be used when throwing Pokeballs as part of an Arms Attack, but may be used when releasing a Pokemon or attempting a Capture roll, or when throwing a Poke Ball specifically to trigger Curve Ball.');
INSERT INTO pokemondata2.trainer_features VALUES (241, 'Apricorn Ball', 'Any Apricorn', 1, '--', 'Trainer', 18, 'Roll 1d20, and add your INT modifier. On a result of 11 or better, you change the target Apricorn into a Basic Ball.');
INSERT INTO pokemondata2.trainer_features VALUES (242, 'Bean Ball', '--', 1, 'You use Curve Ball.', 'Free', 18, 'Roll 1d20. On a result of 11 or higher, you score a critical hit, doubling your damage dealt. Additionally, on a result of 17 or higher, the target is flinched. You may apply the bonuses from critical hits and flinching to the capture roll.');
INSERT INTO pokemondata2.trainer_features VALUES (243, 'Catch Combo', '--', 0, 'An allied trainer or Pokemon rolls 17-20 on an Accuracy Check whiel targeting a wild Pokemon.', 'Free', 18, 'You may throw a Poke Ball against the targeted enemy immediately after the triggering attack is resolved. You may use Catch Combo only once per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (244, 'Capture Point +', '--', 0, 'You throw a Poke Ball.', 'Static', 18, 'Subtract both half of your DEX modifier and half of your INT modifier from the d100 rolls when throwing any Poke Ball. This Feature replaces Capture Point.');
INSERT INTO pokemondata2.trainer_features VALUES (245, 'Capture Point Max', '--', 0, 'You throw a Poke Ball.', 'Static', 18, 'Subtract your DEX modifier and your INT modifier from your d100 roll when throwing any Poke Ball. This Feature replaces Capture Point +.');
INSERT INTO pokemondata2.trainer_features VALUES (246, 'False Swipe Tutor', 'A Pokemon who is leveling up to a level evenly divisible by 5.', 2, '--', 'Trainer', 18, ' Roll 1d20 and add your INT modifier. If the total exceeds 15, the Pokemon learns the Move, False Swipe. Once you successfully use False Swipe Tutor on a Pokemon, False Swipe Tutor may not target that Pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (247, 'Informed Tracker', 'A Route, cave, or other wild area.', 1, '--', 'Trainer', 18, 'Roll 1d20 and add your INT modifier. On a roll of 15 or higher, you identify the area. You know which pokemon are known to commonly inhabit identified areas, and if any apricorns commonly grow in the area.');
INSERT INTO pokemondata2.trainer_features VALUES (248, 'Informed Tracker +', 'A Route, cave, or other wild area.', 1, '--', 'Trainer', 18, 'Roll 1d20 and add your INT modifier. On a roll of 12 or higher, you identify the area. You know which pokemon are known to commonly inhabit identified areas, and if any apricorns commonly grow in the area. On a roll of 20 or higher, you know of any rare pokemon that may be said to inhabit the area, and subtract 10 from any Capture Rolls made identified areas for the rest of the day. This Feature replaces Informed Tracker.');
INSERT INTO pokemondata2.trainer_features VALUES (249, 'Member''s Discount', '--', 0, '--', 'Static', 18, 'You gain a 20% discount from all regular PokeMart products. Whenever you spend 2000 or more on a single purchase, you get a complimentary Premier Ball.');
INSERT INTO pokemondata2.trainer_features VALUES (250, 'Poke Ball Repair', 'Any Poke Ball that has failed to capture a Pokemon and broke.', 3, '--', 'Trainer', 18, 'Roll 1d20 and add your DEX and INT modifiers to the roll. If the total exceeds 15, the Poke Ball is fixed and treated as if it had not broken.');
INSERT INTO pokemondata2.trainer_features VALUES (251, 'Poke Ball Smith', '--', 0, '--', 'Trainer', 18, 'Create a Basic Ball (100), a Great Ball (250), or an Ultra Ball (500).');
INSERT INTO pokemondata2.trainer_features VALUES (252, 'Weighted Net', 'Pokemon or Trainer.', 0, '--', 'Trainer', 18, 'Pay X multiplied by 100, with a maximum value of 12 for X. You create a weighted net which can be thrown at a target to reduce its movement capabilities by X minus the targetâs Power capability. If targeting a trainer, use half their STR modifier as their power capability. A target may spend its full turn, taking no actions, to roll 1d20, adding their power capability. On a result of 12 or greater, they break free from the net. Throwing the net is an AC4 attack, and has a range of 4 meters.');
INSERT INTO pokemondata2.trainer_features VALUES (253, 'Type Booster', '--', 0, '--', 'Trainer', 19, 'You create a Type Booster that improves the power of any single Type of your choice. Name the item whatever youâd like. Pokemon add their STAB value to attacks of the chosen type. It costs 800 to use Type Booster.');
INSERT INTO pokemondata2.trainer_features VALUES (254, 'Weaponsmith', '--', 1, '--', 'Trainer', 19, 'Over 10 hours, which need not be spent consecutively, you create a Weapon. The Weapon is created with a level equal to your Trainer Level plus Xd6, where X is your DEX modifier, up to a maximum of level 100. The weapon will deal additional damage on an attack equal to the STAB bonus of a Pokemon of its level. Additionally, you may include up to two Crafting Materials into a single weapon. It costs 1500 to use Weaponsmith.');
INSERT INTO pokemondata2.trainer_features VALUES (255, 'Apprentice Craftsman', 'Items', 0, '--', 'Trainer', 19, 'Create a Light Clay (2500), Quick Claw (2800), Flame Orb (3200), or Toxic Orb (3200).');
INSERT INTO pokemondata2.trainer_features VALUES (256, 'Elemental Armaments', '--', 0, '--', 'Static', 19, 'You may use any Non-Plate Type Booster as a crafting Material for Weaponsmith. This will cause the Weapon to deal Elemental damage matching that of the Type-Booster used, but will lower the Weaponâs default Damage Base by 1. You may include only a single Type Booster into a Weapon.');
INSERT INTO pokemondata2.trainer_features VALUES (257, 'Expert Craftsman', '--', 0, '--', 'Trainer', 19, 'Create a Bright Powder (4000), Expert Belt (4000), Shell Bell (3500), or Wide Lens (3500).');
INSERT INTO pokemondata2.trainer_features VALUES (258, 'Flute Smith', 'Items', 0, '--', 'Trainer', 19, 'Choose Confusion, Infatuation, or Sleep. You create a flute that, when used, cures the chosen Status on all Pokemon or Trainers within 3 meters. A flute may only be activated once per day. It costs 550 to use Flute Smith.');
INSERT INTO pokemondata2.trainer_features VALUES (259, 'Incense Maker', 'Items', 0, '--', 'Trainer', 19, 'Create a Full Incense, Lax Incense, or Luck Incense. It costs 1200 to use Incense Maker.');
INSERT INTO pokemondata2.trainer_features VALUES (260, 'Keepsake Builder', 'Items', 0, '--', 'Trainer', 19, 'Create an Item that does nothing in battle, but it can serve as a replacement for a Pokemonâs requirement to evolve if they would need a held item. The item can be named whatever youâd like. Like all other held items that influence evolution, the item disappears after the pokemon evolves. It costs 500 to use the Keepsake Builder Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (261, 'Master Craftsman', 'Items', 0, '--', 'Trainer', 19, 'Create a Focus Band (4500), Focus Sash (4800), or Life Orb (5500).');
INSERT INTO pokemondata2.trainer_features VALUES (262, 'Protection Charm', '--', 1, '--', 'Trainer', 19, 'You create a Charm that, when activated, grants the trainer wearing it a Pokemon Ability for X hours, where X is your DEX modifier at the time the Charm was created. The Charm may not be activated for another 24 hours. The ability granted depends on the Item used to craft the Charm, as detailed below. The required Item is destroyed after using Ability Charm. A person may benefit from only a single charm on any given day.\n- Razor Claw: Battle Armor \n- Metal Coat: Immunity\n- Kingâs Rock: Inner Focus\n- Electririzer: Limber\n- Magmarizer: Magma Armor\n- Oval Stone: Oblivious\n- Reaper Cloth: Own Tempo\n- Protector: Sturdy\n- Dragon Scale: Vital Spirit\n- Deepseascale/Deepseatooth: Water Veil');
INSERT INTO pokemondata2.trainer_features VALUES (263, 'Stat Boosters', 'Items', 0, '--', 'Trainer', 19, 'Choose between Attack, Defense, Special Attack, Special Defense or Speed. You create a Held Item that, when released from a Poke Ball, the holderâs chosen Stat is raised 1 Combat Stage. Name the Item whatever youâd like. It costs 1000 to use the Stat Boosters Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (264, 'Stonesmith', '--', 0, '--', 'Static', 19, 'You may use the listed Stones as crafting Materials for Weaponsmith. Once Daily, on a roll of 16-20 on an Arms Attack using the weapon, you may activate the Stone as a Free Action to cause its listed effect to the attackâs target. Only the first target is affected if there are multiple targets due to a Feature.\n- Fire Stone: Burn\n- Shiny Stone: Critical Hit\n- Leaf Stone: Poison\n- Thunderstone: Paralyze\n- Water Stone: Confusion\n- Everstone: The targetâs defense is lowered by 1 CS');
INSERT INTO pokemondata2.trainer_features VALUES (265, 'Stonesmith +', '--', 0, '--', 'Static', 19, 'You may use the listed Stones as crafting Materials for Weaponsmith. Once Daily, you may activate the Stoneâs effect.\n- Dawn: You may activate to use an Arm Attack against an adjacent target as an Interrupt, but lower the Damage Base of your attack by 2.\n- Dusk: You may activate on a critical hit to have the Sniper ability for that attack.\n- Moon: You may activate when declaring an Arms Attack to ignore all Evasion on the target, and bypass Protect or Detect.\n- Sun: You may activate when you hit with an arms attack to deal Special damage rather than\nPhysical damage.');
INSERT INTO pokemondata2.trainer_features VALUES (266, 'Checklist', '--', 0, '--', 'Static', 20, 'From now on, every 8 different species of Pokemon you own will gain you a trainer level. Your Checklist Value is X, where X is the number of trainer levels you have gained in this way plus your DEX modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (267, 'Capture Maniac', '--', 2, 'You make a Capture Roll.', 'Free', 20, 'Subtract your Checklist Value from your Capture Roll.');
INSERT INTO pokemondata2.trainer_features VALUES (268, 'Assistance', '--', 2, 'Ally makes a Capture Roll.', 'Free', 20, 'Your Ally may subtract your Checklist Value from their Capture Roll, and benefits from your Capture Point Max Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (269, 'Capture Maniac +', '--', 3, 'You make a Capture Roll.', 'Free', 20, 'Subtract your Checklist Value from your Capture Roll. This Feature replaces Capture Maniac.');
INSERT INTO pokemondata2.trainer_features VALUES (270, 'Cosplay', 'Self.', 3, '--', 'Trainer', 20, 'You disguise yourself as a pokemon and may approach any wild Pokemon with an intelligence capability of 4 or lower. The pokemon you approach is not instantly provoked but may be startled, and will likely react to you as it would to a typical member of the species you are imitating. You may attempt to befriend the Wild as long as you donât provoke it.');
INSERT INTO pokemondata2.trainer_features VALUES (271, 'Multi Ball', '--', 3, '--', 'Trainer', 20, 'You may throw two Poke Ballls at the same time as a Trainer Action. You must target a different Pokemon with each Poke Ball.');
INSERT INTO pokemondata2.trainer_features VALUES (272, 'Obsessive Compulsive', '--', 2, 'You throw a Poke Ball that fails to capture your Quarry.', 'Free', 20, 'Throw any additional Poke Ball immediately. You may not throw the same Poke Ball that failed on the same turn, even if it was repaired. You may use Obsessive Compulsive only once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (273, 'Rarest Prize', '--', 0, '--', 'Static', 20, 'Any shiny pokemon count as two new species for the purposes of leveling and Collector Features, instead of their normal species. Any legendary pokemon, or pokemon with naturally occurring type shifts, count as Four new species for the purposes of leveling and Collector Features, instead of their normal species.');
INSERT INTO pokemondata2.trainer_features VALUES (274, 'Silent Stalker', 'A Route, cave, or other wild area.', 0, '--', 'Static', 20, 'You make no noise as if you had the Stealth Capability, as long as you move no more than half of your max Overland Speed during your turn.');
INSERT INTO pokemondata2.trainer_features VALUES (275, 'Stalk the Prey', '--', 1, '--', 'Free', 20, 'For the next X rounds, where X is your DEX modifier, if at the end of your turn you have moved no more than half of your max Overland Speed, you gain the Blender capability until the beginning of your next turn.');
INSERT INTO pokemondata2.trainer_features VALUES (276, 'Unshakeable', '--', 0, '--', 'Static', 20, 'You and your Pokemon are immune to all effects, excluding damage, from Moves used by other Pokemon which would force you to escape or switch Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (277, 'Wilderness Tracker', 'A Route, cave, or other wild area.', 1, '--', 'Trainer', 20, 'Roll 1d20 and add your DEX and INT modifiers. If the total exceeds 20, you initate an encounter with Pokemon you know to be in the area. If the total exceeds 25, a pokemon you have not captured appears during the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (278, 'Zeal', '--', 1, 'You use Capture Maniac or Capture Maniac +.', 'Free', 20, 'Subtract an additional X from your roll, where X is +1 for every 8 different species of Pokemon you own.');
INSERT INTO pokemondata2.trainer_features VALUES (279, 'Pokedex Modifications', '--', 0, '--', 'Static', 21, 'You may alter the Pokedex to have a Radar that works at a great range. You may alter that value from anywhere between a 5m radius to a 50m radius. The Pokedex can also identify how many wilds the radar detects and which direction they are. The radar cannot detect Pokemon who are not moving.');
INSERT INTO pokemondata2.trainer_features VALUES (280, 'Mech Arm', '--', 0, '--', 'Static', 21, 'You now have a mechanical arm you can wear over either your right or left arm. Add 2 points to your Strength stat. The Mech Arm has extending poles that can support the Armâs weight when you are getting tired. The arm weighs 40 pounds.');
INSERT INTO pokemondata2.trainer_features VALUES (281, 'Bullet Punch', 'A Trainer or Pokemon.', 3, '--', 'Trainer', 21, 'Use the move Bullet Punch. Use either your DEX or INT modifiers as your Attack stat.');
INSERT INTO pokemondata2.trainer_features VALUES (282, 'Drill Run', 'A Trainer or Pokemon.', 2, '--', 'Trainer', 21, 'Use the move Drill Run. Use either your DEX or INT modifiers as your Attack stat.');
INSERT INTO pokemondata2.trainer_features VALUES (283, 'Hacker', '--', 0, '--', 'Static', 21, 'You can access any information on any computer and make the computer do whatever you want, as long as the computer is capable of the thing you want it to do. If an encrypter wishes to contest hacking, they must have at least 20 INT. If they do, they must roll higher than you do on 1d20, adding their INT modifier while you add your INT modifier. GM decides the contesting stats. If they succeed, you may not use whatever you tried to hack into.');
INSERT INTO pokemondata2.trainer_features VALUES (284, 'Learning Curve', '--', 1, 'You make a roll that uses your INT modifier.', 'Free', 21, 'You may add X to your INT modifier for the next five minutes. X is the total of different Pokemon owned in your Pokedex divided by 10.');
INSERT INTO pokemondata2.trainer_features VALUES (285, 'Meteor Mash', 'A Trainer or Pokemon.', 1, '--', 'Trainer', 21, 'Use the move Meteor Mash. Use either your DEX or INT modifiers as your Attack stat.');
INSERT INTO pokemondata2.trainer_features VALUES (286, 'Pokeball Traps', 'Your Pokeballs.', 2, '--', 'Trainer', 21, 'At any given time, you may have X of your Pokeballs marked to be usable by Pokeball traps. X is your INT modifier. Applying or removing a modification to make a Pokeball usable with Pokeball Traps takes 10 minutes. Set or throw your Pokeball down anywhere. At any time you may, as a trainer action, trigger a Pokeball set by Pokeball Traps to either capture an adjacent Pokemon if it is empty or to release your Pokemon from a filled Pokeball. You may view the battle and give orders to your Pokemon released this way through a camera on your Pokeball.');
INSERT INTO pokemondata2.trainer_features VALUES (287, 'Poke Ball Arm Cannon', '--', 0, '--', 'Static', 21, 'Your Mech Arm can now fire Poke Balls, to send out your own or capture wilds. When firing any Poke Ball at a wild, subtract 12 from the Poke Ballâs capture rate. Also the Poke Ball deals 1d8 damage to the wild that cannot be reduced by Defense or Special Defense.');
INSERT INTO pokemondata2.trainer_features VALUES (288, 'Poke Bots', '--', 0, '--', 'Trainer', 21, 'You can make small remote controlled pokemon robots for 1000 that is .5m tall, of any species or general appearance of your choice. It can move 5m per turn and can hold any small object. Pokemon with the Wired capability that you own do not need to make a roll to possess one of your Pokebots. By spending additional money upon each use of this feature, you may add additional abilities to the Pokebot (up to three abilities per Pokebot). Basic Pokebots have 20 HP and take Super-Effective damage from Fire, Electric, Ground and Rock Moves, unless possessed by a Wired Pokemon, in which case the Pokebotâs Type is the same as the possessing Pokemon.\n-Additional Features: Camera (1000), Video Camera (2000), On-Board GPS (1500), Radio (1000), Computer (2500) Motion Sensing Alarm System (1750), Additional HP (1 per 1 HP, up to a maximum of 150), Self-Detonation (500) Deals 1d20 Normal damage in a 1m Burst against Defense, destroys the Pokebot. (500 more for each additional 1d20, up to a maximum of 3d20) (250 more per additional 1m of Burst, up to a maximum 5m) (500 to change its damage to Steel, Fire or Electric Type). Only one Pokebot may be detonated per turn. Detonation ejects any Pokemon possessing the Pokebot and sets them to -50% HP.');
INSERT INTO pokemondata2.trainer_features VALUES (289, 'Raft Arm', '--', 0, '--', 'Static', 21, 'Your Mech Arm is now buoyant and has a compartment that reveals a propeller. In water, you can move 1 meter per second or 10 meters per round.');
INSERT INTO pokemondata2.trainer_features VALUES (290, 'Scanner', '--', 0, '--', 'Static', 21, 'You can see a percentage when you look at a Pokemon that represents how much of its total HP it has remaining.');
INSERT INTO pokemondata2.trainer_features VALUES (517, 'Precisionist', '--', 0, '--', 'Static', 39, 'Whenever you make a Dexterity check, or make a roll that requires you to add your DEX modifier to your roll for damage, add 5 to your roll.');
INSERT INTO pokemondata2.trainer_features VALUES (291, 'Vehicle Builder', '--', 2, '--', 'Trainer', 21, 'You may build a vehicle using the following price guidelines. Your GM will determine how quickly you make the vehicle. Build it to look like whatever youâd like.\nFor Vehicle Type, you may combine the prices to combine the capabilities and have any combination of the Vehicle Types. For the vehicleâs HP, pay 1 for every 1 HP youâd like it to have. Your vehicle cannot have more then 4,500 HP. It is up to you and your GM to determine when your vehicle is out of power based on what your final product is.');
INSERT INTO pokemondata2.trainer_features VALUES (292, 'Weapon Arm', '--', 0, '--', 'Static', 21, 'You may attach a Melee Weapon Attachment to your Mech Arm. A default Weapon Attachment costs 500, but you may attach Artificer-Crafted Weapon Attachments. You always have the âWeapon of Choiceâ Feature for Arms Attacks made using your Mech Arm, and you may add your INT modifier to damage rolls instead of STR, DEX, or CON. You cannot be disarmed of your Weapon Attachment, and it may be crafted as being retractable into your Mech Arm.');
INSERT INTO pokemondata2.trainer_features VALUES (293, 'Throwing Master', '--', 0, '--', 'Static', 22, 'You gain the feat "Weapon of Choice" in the Short-Ranged weapon of your choice. You may throw Short-Ranged Weapons and Pokeballs an additional X meters, where X is your DEX modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (294, 'Quick Switch', '--', 2, 'Your Pokemon Faints; or an opponent sends out a Pokemon.', 'Free', 22, 'You may return or send out a Pokemon as a Free Action. You may perform this Feature on your turn without a Trigger.');
INSERT INTO pokemondata2.trainer_features VALUES (295, 'Bounce Juggle', '--', 0, 'You use a Juggler Feature that removes an item from your possession.', 'Free', 22, 'The item immediately returns to your hand after the effect is triggered.');
INSERT INTO pokemondata2.trainer_features VALUES (296, 'Bounce Shot', '--', 2, 'A Thrown item hits its intended target or area.', 'Free', 22, 'The thrown item is bounced a number of meters equal to your DEX modifier in any direction. This can cause your Features to hit targets that are otherwise out of range or to his a second target.');
INSERT INTO pokemondata2.trainer_features VALUES (297, 'Emergency Release', '--', 2, '--', 'Free', 22, 'You may release a Pokemon as an Interrupt.');
INSERT INTO pokemondata2.trainer_features VALUES (298, 'Enter Like Lightning', '--', 2, 'You release a Pokemon from its Pokeball.', 'Free', 22, 'Use the move Flash, centered around where you released your Pokemon. For this round, add your DEX modifier to your Pokemon''s Speed Stat for the purposes of determining initiative.');
INSERT INTO pokemondata2.trainer_features VALUES (299, 'Fast Draw', '--', 0, '--', 'Free', 22, 'Once per encounter, you may use an Item on yourself or an allied Trainer or Pokemon as a Free Action.');
INSERT INTO pokemondata2.trainer_features VALUES (300, 'First Blood', '--', 1, 'You release a Pokemon from its Pokeball.', 'Free', 22, 'Your pokemon may use a Move with the Dash keyword as an interrupt as soon as it is sent out. Moves used in this way have the additional effect of pushing the target 5 meters. This consumes your Command action for the round.');
INSERT INTO pokemondata2.trainer_features VALUES (301, 'Fling', '--', 3, '--', 'Trainer', 22, 'Use the move Fling. Any item in your possession can count as a Held Item when you use this Move. Use your DEX modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (302, 'No Hands!', '--', 0, '--', 'Static', 22, 'You may hide up to 3 Pokeball-sized or smaller items on your person which are undetectable by search. You may activate Pokeballs without the use of your hands.');
INSERT INTO pokemondata2.trainer_features VALUES (303, 'Pokeball Cascade', '--', 0, '--', 'Static', 22, 'Pokemon you own add half of your DEX mod to their speeds for the purpose of calculating initiative on the turn they are sent out.');
INSERT INTO pokemondata2.trainer_features VALUES (304, 'Quick Switch +', '--', 3, 'Your Pokemon faints; or an opponent sends out a Pokemon.', 'Free', 22, 'You may return and send out a Pokemon as a Free Action. You may perform this Feature on your turn without a Trigger.');
INSERT INTO pokemondata2.trainer_features VALUES (305, 'Round Trip', '--', 2, 'Your Pokemon uses a Move.', 'Free', 22, 'You may immediately switch your Pokemon that just performed a Move for another of your Pokemon. You may not issue commands to this Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (306, 'Tag In', '--', 2, 'You recall a Pokemon.', 'Free', 22, 'The next Pokemon you send out is treated as if the recalled Pokemon had used Baton Pass on it.');
INSERT INTO pokemondata2.trainer_features VALUES (307, 'Advanced Design', '--', 0, '--', 'Trainer', 23, 'You create a Dusk, Dive, Heal, Luxury, Net, Nest, Quick, Repeat, or Timer Ball. It costs 400 to use Advanced Design.');
INSERT INTO pokemondata2.trainer_features VALUES (308, 'Conditional Advantage', '--', 0, 'You throw a Pokeball.', 'Static', 23, 'If you would subtract an additional amount due to special circumstances defined by the Pokeballâs type - such as when throwing a Dusk Ball at night - you may subtract your INT modifier from the capture roll.');
INSERT INTO pokemondata2.trainer_features VALUES (309, 'Apricorn Shift', 'Any two Apricorns', 1, '--', 'Trainer', 23, 'Combine the targeted Apricorns into a single Apricorn of your choice.');
INSERT INTO pokemondata2.trainer_features VALUES (310, 'Apricorn Smith', 'An Apricorn.', 0, '--', 'Trainer', 23, 'Roll 1d20 and add your INT modifier. It the total exceeds 12, you change the target Apricorn into its corresponding Pokeball. If the total is 11 or below, you ruin the targeted Apricorn.');
INSERT INTO pokemondata2.trainer_features VALUES (311, 'Ball Modification: Habitat', 'Dive Ball', 2, '--', 'Trainer', 23, 'Add one of the following keywords to the targeted Dive Ball: Arctic, Mountain, Desert, Grassland, Rainforest, Forest, Tundra, Taiga, Marsh, Beach, Freshwater, Urban or Cave. Instead of when underwater or underground, the modified Poke Ball subtracts 15 from its Capture Rolls when thrown in an area that corresponds with the keyword chosen. It costs 200 to use Ball Modification: Habitat.');
INSERT INTO pokemondata2.trainer_features VALUES (312, 'Ball Modification: Power', 'Nest Ball', 2, '--', 'Trainer', 23, 'You change the Nest Ball into a Power Ball. It retains the conditional capture modifier of a Nest Ball, but additionally, when a Power Ball captures a target, roll 1d20 and add your INT modifier. On a result of 15 or better, the captured pokemon is raised 1d4 levels upon capture. On a result of 25 or better, the target is raised 2d4 levels upon capture instead. It costs 500 to use Ball Modification: Power.');
INSERT INTO pokemondata2.trainer_features VALUES (313, 'Ball Modification: Type', 'Net Ball', 2, '--', 'Trainer', 23, 'You change the Net Ball into a Earth Ball, Haunt Ball, Solid Ball, Heat Ball, Mystic Ball, Air Ball or Mold Ball. The properties of these unique balls are identical to the Net Ball, but instead of affecting Bug and Water types like the Net Ball, these Balls correspond to the following types. Earth Ball; Grass and Ground; Haunt Ball, Dark and Ghost; Solid Ball, Rock and Steel; Heat Ball, Electric and Fire; Mystic Ball, Dragon and Psychic; Air Ball, Flying and Ice; Mold Ball, Poison and Fighting.');
INSERT INTO pokemondata2.trainer_features VALUES (314, 'Booster Seal', 'Any Ball.', 0, '--', 'Trainer', 23, 'Choose any numbered Capability. You create a Booster Seal that corresponds to the chosen capability. Pokemon kept within a pokeball with a Booster Seal gain a +2 bonus to the chosen capability if you chose a Movement capability, or +1 if you chose Intelligence, Jump, or Power. It costs 300 to use Booster Seal. Up to three Booster Seals may be applied to a pokeball, but each must raise a different capability.');
INSERT INTO pokemondata2.trainer_features VALUES (315, 'Combat Seal', 'Any Ball.', 0, '--', 'Trainer', 23, 'Choose a pokemon stat other than HP. You create a Stat Seal of the chosen stat. Whenever a pokemon with full HP is released from a pokeball with a Stat Seal, the corresponding stat is raised by 1 combat stage. It costs 500 to use Stat Seal. Only one Stat Seal may be applied to a pokeball.');
INSERT INTO pokemondata2.trainer_features VALUES (518, 'Relaxation Therapy', '--', 2, 'You use Massage Therapy.', 'Free', 39, 'The target of Massage Therapy gains the ability "Inner Focus" for the next encounter that day.');
INSERT INTO pokemondata2.trainer_features VALUES (316, 'Contest Seal', 'Any Ball.', 0, '--', 'Trainer', 23, 'You create a Contest Seal. Stat. Pokemon captured in a ball with a Contest Seal get a +1d2 bonus during the Introduction Stage of a contest. It costs 500 to use Contest Seal. Up to three Contest Seals may be applied to a pokeball.');
INSERT INTO pokemondata2.trainer_features VALUES (317, 'Jail Break', 'Any Ball.', 0, '--', 'Trainer', 23, 'You may create an additional Seal slot on the target pokeball, or you may remove a Seal thereby opening up a Seal slot. Seals removed in this way are broken and cannot be repaired. You may use this feature to create up to 2 additional Seal slots, up to a maximum of 3 slots.\nMechanics: All Pokeballs have, by default, a single Seal Slot on which seals can be applied. Using their Jail Break feature, Pokeball Designers may add an additional two slots for a total of three.');
INSERT INTO pokemondata2.trainer_features VALUES (318, 'Save Ball', '--', 1, '--', 'Trainer', 23, 'Combine a White Apricorn, Red Apricorn, Blue Apricorn, Black Apricorn, Pink Apricorn, Green Apricron and a Yellow Apricorn to make a Save Ball. A Save Ball can capture a pokemon who was felled on the last turn of an encounter. It has no Capture Rate bonuses or penalties.');
INSERT INTO pokemondata2.trainer_features VALUES (319, 'Loyalty Meter', 'An Owned Pokemon.', 0, '--', 'Trainer', 24, 'By pointing your Snag Machine at an owned Pokemon, you may determine the Loyalty of that Pokemon. Loyalty is measured from 0 to 4. Pokemon with Loyalty 0 dislike their trainer, and/or is commonly used for attacking defenseless Pokemon or people. Pokemon with Loyalty 1 are newly caught, previously wild, Pokemon who donât trust their trainer and/or are used to commit crimes. Pokemon with Loyalty 2 Like their trainer or were traded to their trainer but are used to commit crimes. Pokemon with Loyalty 3 love their trainers and/or were hatched by their trainers. Pokemon with Loyalty 4 have unbreakable bonds with their trainer.');
INSERT INTO pokemondata2.trainer_features VALUES (320, 'Snag!', 'An Owned Pokemon with loyalty 0 or 1.', 1, '--', 'Trainer', 24, 'Throw a Poke Ball using your Snag Machine as if the target is a wild Pokemon and roll your 1d100 capture roll, subtracting an additional 5 from your check. If you beat the targetâs Capture Rate you have captured the target. The Pokemon is mistrustful towards you but just as mistrusting and just as trainable as any wild you would have caught in the wild.');
INSERT INTO pokemondata2.trainer_features VALUES (321, 'Hate Seeker', '--', 0, '--', 'Static', 24, 'When using Snag!, subtract an additional 3 from your roll if your target has Loyalty 1 or subtract an additional 10 from your roll if your target has Loyalty 0.');
INSERT INTO pokemondata2.trainer_features VALUES (322, 'Rescued Resolve', 'Your Pokemon with Loyalty 4 who you''ve Snagged.', 0, '--', 'Static', 24, 'Whenever a Target deals damage, they deal an additional X damage, where X is your INT modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (323, 'Rescuer', '--', 0, '--', 'Static', 24, 'When you are using Snag! on a Pokemon with Loyalty 0, it may have Loyalty 2 if you capture it and you want it to.');
INSERT INTO pokemondata2.trainer_features VALUES (324, 'Shadow Berserk', 'Your Owned Pokemon with Loyalty 0, 1, or 2.', 1, '--', 'Free', 24, 'The target immediately uses the Move Submission, but when applying Weakness/Resistances, treat Submission as having no Elemental Type, hitting for neutral damage. The target may not perform another Move during this round of combat. Using Shadow Berserk makes a Pokemon more prone to disliking its trainer.');
INSERT INTO pokemondata2.trainer_features VALUES (325, 'Shadow Blaze', 'Your Owned Pokemon with Loyalty 0, 1, or 2.', 1, '--', 'Free', 24, 'The target immediately uses the Move Flamethrower, but when applying Weakness/Resistances, treat Flamethrower as having no Elemental Type, hitting for neutral damage. The target may not perform another Move during this round of combat. Using a Shadow Blaze makes a Pokemon more prone to disliking its trainer.');
INSERT INTO pokemondata2.trainer_features VALUES (326, 'Shadow Bolt', 'Your Owned Pokemon with Loyalty 0, 1, or 2.', 1, '--', 'Free', 24, 'The target immediately uses the Move Thunderbolt, but when applying Weakness/Resistances, treat Thunderbolt as having no Elemental Type, hitting for neutral damage. The target may not perform another Move during this round of combat. Using Shadow Bolt makes a Pokemon more prone to disliking its trainer.');
INSERT INTO pokemondata2.trainer_features VALUES (327, 'Shadow Chill', 'Your Owned Pokemon with Loyalty 0, 1, or 2.', 1, '--', 'Free', 24, 'The target immediately uses the Move Ice Beam, but when applying Weakness/Resistances, treat Ice Beam as having no Elemental Type, hitting for neutral damage. The target may not perform another Move during this round of combat. Using Shadow Chill makes a Pokemon more prone to dislik- ing its trainer.');
INSERT INTO pokemondata2.trainer_features VALUES (328, 'Shadow Smash', 'Your Owned Pokemon with Loyalty 0, 1, or 2.', 1, '--', 'Free', 24, 'The target immediately uses the Move Brick Break, but when applying Weakness/Resistances, treat Brick Break as having no Elemental Type, hitting for neutral damage. The target may not perform another Move during this round of combat. Using a Shadow Smash makes a Pokemon more prone to disliking its trainer.');
INSERT INTO pokemondata2.trainer_features VALUES (329, 'Snag Machine Upgrade', '--', 0, '--', 'Static', 24, 'The Feature Snag! now has "Daily-Every 5 levels gained, you may perform this Feature another time per day." instead of "Daily."');
INSERT INTO pokemondata2.trainer_features VALUES (330, 'Subtle Break', 'A Pokemon with Loyalty 2.', 1, '--', 'Free', 24, 'Roll 1d20 and add your INT modifier. If you roll 20 or higher, you may target the Pokemon with Loyalty 2 for the next 3 rounds with Snag!');
INSERT INTO pokemondata2.trainer_features VALUES (331, 'Big Game Hunting', 'A wild Pokemon.', 0, '--', 'Free', 25, 'Name the Target as your Quarry. When calculating the Catch Rate of your Quarry, their level is considered to be reduced by X. X is equal to half your DEX modifier. You may only have one Quarry at a time, and may only declare or change your Quarry at the start of a round.');
INSERT INTO pokemondata2.trainer_features VALUES (332, 'Lasso', 'A Pokemon or Trainer.', 3, '--', 'Free', 25, 'Roll 1d20 and add your DEX modifier. On a roll of 12 or higher, the target is Lassoed. A Lassoed target cannot move than 6 meters away from you. A Lassoed pokemon may attempt to end the effect by forfeiting its turn, if it is not Confused, Asleep, or Knocked Out. It then rolls 1d20 plus their Power Capability. On a roll of 14 or higher, the Pokemon breaks free. If targeting a trainer, use half their STR modifier as their power capability.');
INSERT INTO pokemondata2.trainer_features VALUES (333, 'Big Game Hunting +', 'A wild Pokemon.', 0, '--', 'Free', 25, 'Name the Target as your Quarry. When calculating the Catch Rate of your Quarry, their level is considered to be reduced by X. X is equal to your DEX modifier. You may only have one Quarry at a time, and may only declare or change your Quarry at the start of a round. This feature replaces Big Game Hunting.');
INSERT INTO pokemondata2.trainer_features VALUES (334, 'Bring ''em Down', 'A Lassoed Pokemon or Trainer.', 2, '--', 'Trainer', 25, 'Roll 1d20 and add your DEX modifier. On a roll of X or higher, the target Pokemon becomes Trapped for a number of rounds equal to half your DEX modifier. X is equal to 10 plus the Pokemonâs Power Capability, or 10 plus half the Trainerâs Str modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (335, 'False Strike', '--', 3, 'You deal damage to your Quarry.', 'Free', 25, 'When you make attacks with an Arms Feature that would reduce a target to 0 HP or less, you may choose to have the target instead remain at 1 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (336, 'Ninety-Caliber Net', '--', 0, '--', 'Static', 25, 'You obtain a Net Cannon which may be used to launch Weighted Nets, at a distance of 10 meters. Additionally, you may use Curve Ball and Bean Ball with Nets launched from the Net Cannon as if they were pokeballs.');
INSERT INTO pokemondata2.trainer_features VALUES (337, 'Pheromone Spray', 'A Pokemon.', 3, '--', 'Trainer', 25, 'The target Pokemon becomes Infatuated with the nearest Pokemon of the opposite gender.');
INSERT INTO pokemondata2.trainer_features VALUES (338, 'Stun Trap', 'Pokemon or Trainers.', 2, '--', 'Trainer', 25, 'Place a marker on the field adjacent to you. If a pokemon or trainer crosses over that spot on the ground they trigger the Stun Trap. The pokemon or person who triggered the Trap is Paralyzed.');
INSERT INTO pokemondata2.trainer_features VALUES (339, 'Set for Capture', '--', 1, 'You successfully use Bring ''em Down on a Lassoed Pokemon.', 'Free', 25, 'The target Pokemon''s catch rate is increased by 15 for the remainder of the time they are Trapped.');
INSERT INTO pokemondata2.trainer_features VALUES (340, 'Sweet Trap', 'A Pokemon.', 1, '--', 'Trainer', 25, 'Use the Move Sweet Scent.');
INSERT INTO pokemondata2.trainer_features VALUES (341, 'Tranquilizer', 'Pokemon or Trainers.', 0, '--', 'Trainer', 25, 'Use the move Yawn on a single target within 30 meters. Firing your Tranquilizer Rifle requires a Tranquilizer dose, which can be purchased at Pokemarts for 100. The Rifle holds only one shot at a time, and loading requires a Trainer Action. After successfully falling asleep due to the effects of Tranquilizer, the target becomes immune to Tranquilizer for 6 hours.');
INSERT INTO pokemondata2.trainer_features VALUES (342, 'Yank!', '--', 2, 'A Lassoed Pokemon attempts to use a Move.', 'Free', 25, 'Roll 1d20. On a result of 1-10, the Pokemon takes damage equal to its STAB value, ignoring stats, and may not use any moves this turn. On a result of 11-20, the Pokemon acts normally.');
INSERT INTO pokemondata2.trainer_features VALUES (343, 'Natural Grace', '--', 0, '--', 'Static', 26, 'Your Pokemon Learn +20% the amount of experience they would gain normally from contests. If you win a Contest, you gain an additional +15% the amount of prize money you normally would.');
INSERT INTO pokemondata2.trainer_features VALUES (344, 'Style and Poise', '--', 0, '--', 'Static', 26, 'Your Pokemon may have a total number of combined Contest Stats equal to 24. Furthermore, they may gain the effects of any number of Poffins until they reach this maximum. If a Pokemon is traded away to a non-Coordinator, and the Pokemon has more then 20 points of Contest Stats, they do not lose those stats, but their new trainers may not have access to more than 20 Contest Points per Contest.');
INSERT INTO pokemondata2.trainer_features VALUES (345, 'Catch Up!', '--', 0, '--', 'Trainer', 26, 'Contest Effect: Replace a keyword on a Contest Move performed by your Pokemon with Catching Up. You may use Catch Up only once per contest.\nBattle Effect: Use the move Helping Hand.');
INSERT INTO pokemondata2.trainer_features VALUES (346, 'Crowd''s Cheers', '--', 1, '--', 'Trainer', 26, 'Contest Effect: Replace a Contest Keyword on a Contest Move performed by your Pokemon with Crowd Pleaser for one round of the Contest. You may use Crowdâs Cheers only once per contest.\nBattle Effect: Use the move Encore.');
INSERT INTO pokemondata2.trainer_features VALUES (347, 'Electrifying Performance', 'One of your Pokemon.', 0, '--', 'Free', 26, 'Contest Effect: Add the Contest Keyword Incredible to a Contest Move performed by the Pokemon this Round.\nBattle Effect: The target immediately uses the Move Lock-On as a Free Action. During the targetâs turn it may not use any of the following Moves: Moves Sheer Cold, Guillotine, Horn Drill or Fissure. You may still roll to determine additional effects or Critical Hit. This must be declared before the Accuracy Check is made.');
INSERT INTO pokemondata2.trainer_features VALUES (348, 'Judge Blinders', 'One of your Pokemon.', 2, '--', 'Free', 26, 'Contest Effect: Replace a Contest Keyword on a Contest Move performed by your Pokemon with Special Attention. You may use Judge Blinders only once per contest.\nBattle Effect: The target immediately uses the Move Follow Me as its Move Action, it may still shift during its turn during this round of combat.');
INSERT INTO pokemondata2.trainer_features VALUES (349, 'Lead Act', 'One of your Pokemon.', 3, '--', 'Trainer', 26, 'Contest Effect: Replace a Contest Keyword on a Contest Move performed by your Pokemon with Quick Set. You may use Lead Act only once per contest.\nBattle Effect: Use the move After You.');
INSERT INTO pokemondata2.trainer_features VALUES (350, 'Patience', 'One of your Pokemon.', 3, '--', 'Trainer', 26, 'Contest Effect: Replace a Contest Keyword on a Contest Move performed by your Pokemon with Slow Set. You may use Patience only once per contest.\nBattle Effect: Use the move Quash.');
INSERT INTO pokemondata2.trainer_features VALUES (351, 'Perfect Performance', 'Your Pokemon who just received First or Second place in a contest.', 2, '--', 'Free', 26, 'The target gains +30% from the Contest if they came in Second place. They gain +80% experience instead if they came in First place.');
INSERT INTO pokemondata2.trainer_features VALUES (352, 'Voltage Freeze', 'One of your Pokemon.', 2, '--', 'Free', 26, 'Contest Effect: Replace a Contest Keyword on a Contest Move performed by your Pokemon with either Excitement or Hold That Thought this round. You may use Voltage Freeze only once per contest.\nBattle Effect: Your Pokemon gains the keyword âReliableâ on the next Battle Frequency Move it performs during this encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (353, 'Voltage Freeze +', 'One of your Pokemon.', 2, '--', 'Free', 26, 'Contest Effect: Replace a Contest Keyword on a Contest Move performed by your Pokemon with either Excitement, Hold That Thought, or both. You may use Voltage Freeze+ only once per contest.\nBattle Effect: Your Pokemon gains the keyword âReliableâ on the next Battle or Center Frequency moves it performs. This feature replaces Voltage Freeze.');
INSERT INTO pokemondata2.trainer_features VALUES (354, 'You Call That Impressive?', 'One of your Pokemon.', 1, '--', 'Free', 26, 'Contest Effect: Roll 1d20 and add your CHA modifier. On a result of 13 or higher, add the Contest Keyword Seen Nothing Yet to your pokemonâs Contest Move for this round.\nBattle Effect: The target gains one of these effect based on which Move it will be using during this round of combat: If the Move has the keyword Blast or Burst, increase the size of the Blast/Burst by 2. If the Move does not have either of those keywords and is Ranged, increase its range by 4. If the Move is Melee, increase the targetâs Speed Capabilities by 4.');
INSERT INTO pokemondata2.trainer_features VALUES (355, 'Beautiful Advantage', '--', 0, '--', 'Static', 27, 'X is your CON modifier. Add X to your Pokemonâs appearance appeal in the first round of a Beauty Contest. Your Pokemon are Beautiful. All of your Pokemon with Loyalty 2 or higher may be targeted as if they have a Beauty Ribbon, but do not actually have one. Your Pokemon may have up to 20 points in their Beauty Contest Stat, and burn up to 5 points of its Beauty Stat on a single move.');
INSERT INTO pokemondata2.trainer_features VALUES (356, 'Beautiful Offense', 'Your Pokemon with a Beauty Contest Ribbon', 0, '--', 'Static', 27, 'Mark your Pokemon with Beauty Ribbons as âSuperior.â When adding stats during level up for Superior Pokemon, while the Pokemon is still yours, you may add to the Pokemonâs Special Attack Stat and ignore Base Relation.');
INSERT INTO pokemondata2.trainer_features VALUES (357, 'Beautiful Grace', 'Your Pokemon or allied Pokemon with a Beauty Ribbon', 2, '--', 'Trainer', 27, 'The target gains the Serene Grace Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Serene Grace, this feature has no effect. This effect ends when the Pokemon is recalled');
INSERT INTO pokemondata2.trainer_features VALUES (358, 'Beautiful Pull', 'Your Pokemon or allied Pokemon with a Beauty Ribbon', 2, '--', 'Trainer', 27, 'The target gains the Shadow Tag pokemon ability, in addition to the abilities they already have. If the Pokemon already has Shadow Tag, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (359, 'Beautiful Shine', 'Your Pokemon or allied Pokemon with a Beauty Ribbon', 2, '--', 'Trainer', 27, 'The target gains the Magic Guard pokemon ability, in addition to the abilities they already have. If the Pokemon already has Magic Guard, this feature has no effect. This effect ends when the Pokemon is recalled');
INSERT INTO pokemondata2.trainer_features VALUES (519, 'Smelling Salts', 'Pokemon or Trainers.', 1, '0', 'Trainer', 39, 'Use the Move SmellingSalt. Use your DEX modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (360, 'Beautiful Skin', 'Your Pokemon or allied Pokemon with a Beauty Ribbon', 2, '--', 'Trainer', 27, 'The target gains the Marvel Scale Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Marvel Scale, this feature has no effect. This effect ends when the Pokemon is recalled');
INSERT INTO pokemondata2.trainer_features VALUES (361, 'Beauty''s Allies', 'Your Pokemon or allied Pokemon with a Beauty Ribbon', 2, '--', 'Free', 27, 'Contest Effect: When the target uses a Cute Move or a Cool Move in a Contest, you may choose to have the Move raise the Voltage.\nBattle Effect: Once per combat, if the target uses a Move that has a Beauty Contest Type, the Move needs -2 to hit.');
INSERT INTO pokemondata2.trainer_features VALUES (362, 'Beauty''s New Allies', 'Your Pokemon or allied Pokemon with a Beauty Ribbon', 2, '--', 'Free', 27, 'When the target uses a Smart Move or Tough Move in a Contest, you may choose to have the Move not lower the Voltage.');
INSERT INTO pokemondata2.trainer_features VALUES (363, 'Dangerous Allure', '--', 0, '--', 'Static', 27, 'Your Pokemon with at least one Beauty Ribbon have the Alluring capability. When you, your Pokemon, an ally or allyâs pokemon, target any wild Pokemon who has attacked one of your Pokemon affected by Dangerous Allure within the same round, or last round, of combat, the Accuracy Check is -2.');
INSERT INTO pokemondata2.trainer_features VALUES (364, 'Fabulous Max', 'Your Pokemon with at least 15 in their Beauty Stat', 2, '--', 'Free', 27, 'When the target uses a Move that has a Beauty Contest Type, the move gains the keyword Burst with a size of 2 if Melee, or Blast with a size of 2 if ranged. If the move is already a Burst or Blast, increase the size of the Moveâs Range by 2. This Feature may only be applied once per move.');
INSERT INTO pokemondata2.trainer_features VALUES (365, 'Mind Makeover', 'Your Pokemon or allied Pokemon.', 1, '--', 'Trainer', 27, 'Roll 1d20 and add your CON modifier. If your result is 16 or greater, you may change the target''s Nature to Bashful, Modest, Mild, Rash, or Quiet.');
INSERT INTO pokemondata2.trainer_features VALUES (366, 'Ravishing Style', 'Your Pokemon with at least 15 in their Beauty Stat', 2, '--', 'Free', 27, 'Contest Effect: When the target uses a Beauty Move, roll an additional 1d4 during the appeal.\nBattle Effect: When the target uses a Move that has a Beauty Contest Type, the Move raises the targetâs Special Attack 1 Combat Stage.');
INSERT INTO pokemondata2.trainer_features VALUES (367, 'Stage Notation', '--', 0, '--', 'Static', 28, 'Once per contest, when one of your Pokemon performs a Song Move, roll +1d6 during that appeal. Once per contest, when one of your Pokemon performs a Dance Move, roll +1d6 during that appeal.');
INSERT INTO pokemondata2.trainer_features VALUES (368, 'Writing New Parts', 'A Move on a Pokemon''s Move List', 1, '--', 'Trainer', 28, 'Writing New Parts makes the target Move a âSong Move,â or a âDance Move,â but only for that Pokemon. Writing New Parts may not make more then five different Moves a Song Move or a Dance Move for a single Pokemon. You can make a new Move a Song Move or Dance Move, even if you already have five total Song Moves and Dance Moves made with Writing New Parts, as long as an older Move is no longer a Song Move/Dance Move. Moves can be Song and Dance Moves, but will count as two, when counting the total of five Song/Dance Moves. When counting the five Song and Dance Moves, ignore those considered Song/Dance Moves listed in the Choreographer Mechanics.\n\nThe following Moves are considered âDance Movesâ: Acrobatics, Attract, Dragon Dance, Entrainment, Featherdance, Fiery Dance, Lunar Dance, Petal Dance, Rain Dance, Rapid Spin, Role Play, Swords Dance, Teeter Dance, Quiver Dance, Work Up\n\nThe following Moves are considered âSong Movesâ: Chatter, Belly Drum, Bug Buzz, Echoed Voice, Grasswhistle, Growl, Heal Bell, Hyper Voice, Metal Sound, Perish Song, Relic Song, Roar, Roar of Time, Round, Screech, Sing, Snarl, Snore, Supersonic, Synchronoise, Uproar');
INSERT INTO pokemondata2.trainer_features VALUES (369, 'Acrobatic Steps', '--', 2, '--', 'Trainer', 28, 'For the remainder of the encounter, you have +3 Evasion. Acrobatic Steps may only be used once per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (370, 'Benesh Script', 'One of your Pokemon performing a Dance Move, with a Melee Range, in battle and another Pokemon with a line of sight to your Pokemon.', 2, '--', 'Free', 28, 'Roll 1d20 and add your CON modifier. On a result of 16 or better, the Pokemon you target will perform the same Dance Move that your Pokemon used during their next action. It may choose new targets. If the other target is an owned Pokemon, or has an Intelligence 5 or higher it may ignore Benesh Script.');
INSERT INTO pokemondata2.trainer_features VALUES (371, 'Dazzling the Stage', 'One of your Pokemon performing a Song Move or Dance Move in battle', 1, '--', 'Trainer', 28, 'Choose another Song Move or Dance Move without a Damage Dice Roll on the targetâs Move List. Add its effects to the Song Move or Dance Move the Pokemon is using, then it is Exhausted. Any effects that set a target to a certain HP cannot be used with Dazzling The Stage and any effects that make Hazards or Walls cannot be used with Dazzling The Stage. A Move modified by Dazzling The Stage cannot be combined through the use of Tag Battler Features.');
INSERT INTO pokemondata2.trainer_features VALUES (372, 'Demiflat Vibrato', '--', 0, '--', 'Static', 28, 'When your Pokemon would have any of its Combat Stages lowered by a Move with a Damage Dice Roll used by a foe, the foe must have rolled at least a 19 during accuracy check for it to successfully lower your Pokemonâs Combat Stages. When your Pokemon use a Song Move, anything targeting them during the same round of combat must roll +1 to hit once per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (373, 'Eskhol Stance', '--', 0, '--', 'Static', 28, 'When your Pokemon use a Dance Move, they cannot be Pushed or Flinched during that round of Combat. When your Pokemon are Paralyzed, if they use a Dance Move you may treat its next Paralyze check as a 16 once per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (374, 'Fortissimo Leap', 'One of your Pokemon performing a Song Move or Dance Move in battle', 1, '--', 'Trainer', 28, 'Your Pokemon uses the Song Move or Dance Move twice during their Move action, then is Exhausted for 2 rounds of Combat. The target cannot be returned to a Poke Ball for 2 rounds of Combat. If the Pokemon uses a Move with Exhaust, it is Exhausted for an additional 2 turns.');
INSERT INTO pokemondata2.trainer_features VALUES (375, 'Mirror Staccato', 'One of your Pokemon performing a Song Move, with at least one target, in battle', 2, '--', 'Free', 28, 'The Song Move forces any targets to use a Move with a Damage Dice Roll on the Pokemon using the Song Move during any targetâs next turn. If your Pokemon is successfully hit during any targetâs turn during the next round of combat, reduce the damage by your CON modifier. If any targets of the Song Move are owned Pokemon, or have an Intelligence 5 or higher it may ignore Mirror Staccato.');
INSERT INTO pokemondata2.trainer_features VALUES (376, 'Rising Accompaniment', 'One of your Pokemon performing a Song move, with no Damage Dice Roll, in battle', 1, '--', 'Free', 28, 'The Song Move may be used by any allied Pokemon as its Move action for the rest of the round of combat, if, on any allied Pokemonâs turn, they roll 8 or better on 1d20. Do not ignore Frequency for any allied Pokemon who may have used an EOT, Battle or Center Song Move during any previous round of combat. If an allied Pokemon fails the roll to use the Song Move, it may still make its normal Move action.');
INSERT INTO pokemondata2.trainer_features VALUES (377, 'Teamwork Chorus', '--', 1, '--', 'Trainer', 28, 'During the next round of combat, all allied Trainers and Pokemon within 10 meters of you either deal X more damage while using Moves or Features that have Damage Dice Rolls or take X less damage from Moves or Features that have Damage Dice Rolls. X is your CON modifier, but cannot exceed 5.');
INSERT INTO pokemondata2.trainer_features VALUES (378, 'Wachman Flair', '--', 0, '--', 'Static', 28, 'Once per Contest, when one of your Pokemon uses a Dance Move and if the Pokemon would get a STAB bonus using the Move during combat, you may raise any single judge''s voltage one level.');
INSERT INTO pokemondata2.trainer_features VALUES (379, 'Cool Advantage', '--', 0, '--', 'Static', 29, 'X is your CHA modifier. Add X to your Pokemonâs appearance appeal in the first round of a Cool Contest. Your Pokemon are Cool. All of your Pokemon with Loyalty 2 or higher may be targeted as if they have a Cool Ribbon, but do not actually have one. Your Pokemon may have up to 20 points in their Cool Contest Stat, and burn up to 5 points of its Cool Stat on a single move.');
INSERT INTO pokemondata2.trainer_features VALUES (380, 'Cool Offense', 'Your Pokemon with a Cool Contest Ribbon', 0, '--', 'Static', 29, 'Mark your Pokemon with Cool Ribbons as âUnleashed.â When adding stats during level up for Unleashed Pokemon, while the Pokemon is still yours, you may add to the Pokemonâs Attack Stat and ignore Base Relation.');
INSERT INTO pokemondata2.trainer_features VALUES (381, 'Cool Break', 'Your Pokemon or allied Pokemon with a Cool Ribbon', 2, '--', 'Trainer', 29, 'The target gains the Mold Breaker Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Mold Breaker, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (382, 'Cool Defiance', 'Your Pokemon or allied Pokemon with a Cool Ribbon', 2, '--', 'Trainer', 29, 'The target gains the Defiant Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Defiant, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (383, 'Cool Eye', 'Your Pokemon or allied Pokemon with a Cool Ribbon', 2, '--', 'Trainer', 29, 'The target gains the Sniper pokemon ability, in addition to the abilities they already have. If the Pokemon already has Sniper, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (384, 'Cool Stare', 'Your Pokemon or allied Pokemon with a Cool Ribbon', 2, '--', 'Trainer', 29, 'The target gains the Intimidate Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Intimidate, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (385, 'Cool''s Allies', 'Your Pokemon or allied Pokemon with a Cool Ribbon', 2, '--', 'Free', 29, 'Contest Effect: When the target uses a Beauty Move or a Tough Move in a Contest, you may choose to have the Move raise the Voltage.\nBattle Effect: Once per combat, if the target uses a Move that has a Cool Contest Type, the Move needs -2 to hit.');
INSERT INTO pokemondata2.trainer_features VALUES (386, 'Cool''s New Allies', 'Your Pokemon or allied Pokemon with a Cool Ribbon', 2, '--', 'Free', 29, 'When the target uses a Smart Move or Cute Move in a Contest, you may choose to have the Move not lower the Voltage.');
INSERT INTO pokemondata2.trainer_features VALUES (387, 'Crazy Awesome', 'Your Pokemon with at least 15 in their Cool Stat', 2, '--', 'Free', 29, 'Contest Effect: When the target uses a Cool Move, roll an additional 1d4 during the appeal.\nBattle Effect: When the target uses a Move that has a Cool Contest Type, the Move raises the targetâs Attack 1 Combat Stage.');
INSERT INTO pokemondata2.trainer_features VALUES (388, 'Leaders of the Pack', '--', 0, '--', 'Static', 29, 'Your Pokemon with at least 2 Cool Ribbons and a Cool Stat of 15 or higher have the Capability Pack Mon.');
INSERT INTO pokemondata2.trainer_features VALUES (389, 'Raditude', 'Your Pokemon or an ally''s Pokemon', 1, '--', 'Trainer', 29, 'Roll 1d20 and add your CHA modifier. If your result is 16 or greater, you may change the target''s Nature to Desperate, Lonely, Adamant, Naughty, or Brave.');
INSERT INTO pokemondata2.trainer_features VALUES (390, 'Rule of Cool', 'Your Pokemon with at least 15 in their Cool Stat', 2, '--', 'Free', 29, 'When the target uses a Move with a Cool Contest Type, that move cannot be Intercepted or Interrupted.');
INSERT INTO pokemondata2.trainer_features VALUES (391, 'Cute Advantage', '--', 0, '--', 'Static', 30, 'X is your CHA modifier. Add X to your Pokemonâs appearance appeal in the first round of a Cute Contest. Your Pokemon are Cute. All of your Pokemon with Loyalty 2 or higher may be targeted as if they have a Cute Ribbon, but do not actually have one. Your Pokemon may have up to 20 points in their Cute Contest Stat, and burn up to 5 points of its Cute Stat on a single move.');
INSERT INTO pokemondata2.trainer_features VALUES (392, 'Cute Moves', 'Your Pokemon with a Cute Contest Ribbon', 0, '--', 'Static', 30, 'Mark your Pokemon with Cute Ribbons as âSpeedy.â When adding stats during level up for Speedy Pokemon, while the Pokemon is still yours, you may add to the Pokemonâs Speed Stat and ignore Base Relation.');
INSERT INTO pokemondata2.trainer_features VALUES (393, 'Cute Chance', 'Your Pokemon or allied Pokemon with a Cute Ribbon', 2, '--', 'Trainer', 30, 'The target gains the Super Luck pokemon ability, in addition to the abilities they already have. If the Pokemon already has Super Luck, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (394, 'Cute Charm', 'Your Pokemon or allied Pokemon with a Cute Ribbon', 2, '--', 'Trainer', 30, 'The target gains the Cute Charm pokemon ability, in addition to the abilities they already have. If the Pokemon already has Cute Charm, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (395, 'Cute Feet', 'Your Pokemon or allied Pokemon with a Cute Ribbon', 2, '--', 'Trainer', 30, 'The target gains the Quick Feet pokemon ability, in addition to the abilities they already have. If the Pokemon already has Quick Feet, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (396, 'Cute Find', 'Your Pokemon or allied Pokemon with a Cute Ribbon', 2, '--', 'Trainer', 30, 'The target gains the Pick Up pokemon ability, in addition to the abilities they already have. If the Pokemon already has Pick Up, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (397, 'Cute''s Allies', 'Your Pokemon or allied Pokemon with a Cute Ribbon', 2, '--', 'Free', 30, 'Contest Effect: When the target uses a Beauty Move or a Smart Move in a Contest, you may choose to have the Move raise the Voltage.\nBattle Effect: Once per combat, if the target uses a Move that has a Cute Contest Type, the Move needs -2 to hit.');
INSERT INTO pokemondata2.trainer_features VALUES (398, 'Cute''s New Allies', 'Your Pokemon or allied Pokemon with a Cute Ribbon', 2, '--', 'Free', 30, 'When the target uses a Cool Move or Tough Move in a Contest, you may choose to have the Move not lower the Voltage.');
INSERT INTO pokemondata2.trainer_features VALUES (399, 'Dainty', 'Your Pokemon with at least 15 in their Cute Stat', 2, '--', 'Free', 30, 'Contest Effect: When the target uses a Cute Move, roll an additional 1d4 during the appeal.\nBattle Effect: When the target uses a Move that has a Cute Contest Type, the Move raises the targetâs Speed 1 Combat Stage.');
INSERT INTO pokemondata2.trainer_features VALUES (400, 'Diversion Tactics', 'Your Pokemon with a Cute Ribbon', 2, '--', 'Trainer', 30, 'As long as your Pokemon has not yet performed a Move this round during Combat, they immediately perform one of the following Moves: Captivate, Charm, Fake Tears, or Tickle');
INSERT INTO pokemondata2.trainer_features VALUES (401, 'Infantilization', 'Your Pokemon or an ally''s Pokemon', 1, '--', 'Trainer', 30, 'Roll 1d20 and add your CHA modifier. If your result is 16 or greater, you may change the target''s Nature to Serious, Timid, Hasty, Jolly, or Naive.');
INSERT INTO pokemondata2.trainer_features VALUES (422, 'Smart Focus', 'Your Pokemon or allied Pokemon with a Smart Ribbon', 2, '--', 'Trainer', 32, 'The target gains the Download Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Download, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (402, 'Too Cute to Hurt', '--', 1, 'Your Pokemon with at least two Cute Ribbons is targeted by an attack.', 'Free', 30, ' Roll 1d20 and your CHA modifier. If the result is 16 or greater, your Pokemon convinces the attacker to target a different Pokemon. The attacker keeps their accuracy roll, and must use the same move, but it can choose its new target. If there are no other available targets, the feature fails.');
INSERT INTO pokemondata2.trainer_features VALUES (403, 'Simple Accessory', '--', 0, '--', 'Trainer', 31, 'Create an Accessory. When worn, the accessory adds +1 Appeal during the Introduction Stage of a Contest. It costs 300 to use Simple Accessory.\nMechanics: Pokemon and Trainers alike can each equip and benefit from a maximum of 3 Accessories. Clothing Piece items count as Accessories, but may only be equipped and activated by Trainers. Conversely, Held-Items can only be equipped and activated by Pokemon, unless the Held-Item is also a Clothing Piece.');
INSERT INTO pokemondata2.trainer_features VALUES (404, 'Sparkles and Glitter', 'Your Pokemon entering a Contest.', 0, '--', 'Static', 31, 'Add +X to the Pokemon''s Appeal during the Introduction Stage, where X is the number of Fashion Designer accessories made by you being worn by the target.');
INSERT INTO pokemondata2.trainer_features VALUES (405, 'Ability Design', '--', 1, '--', 'Trainer', 31, 'Choose a Pokemon Ability known by a Pokemon you own. You create an Ability Design Held-Item that may be activated once per day. When activated, the holder gains the holder gains the chosen ability for 5 rounds. You may not copy Wonder Guard with Ability Design. It costs 3500 to use Ability Design.');
INSERT INTO pokemondata2.trainer_features VALUES (406, 'Capability Design', '--', 0, '--', 'Trainer', 31, 'Choose a numbered Capability. You create a Capability Design Held-Item that, when activated, adds +2 to the chosen Capability for five minutes. If you chose the Intelligence or Power Capabilities, add only +1 for 5 minutes, and may not raise Intelligence or Power above 7. A Pokemon may not benefit from multiple bonuses to the same Capability from a Capability Design item. Once activated a third time, the Accessory breaks. It costs 550 to use Capability Design.');
INSERT INTO pokemondata2.trainer_features VALUES (407, 'Designed Stability', '--', 0, '--', 'Trainer', 31, 'Whenever you create an Accessory or Clothing item that has a limited number of uses, you may pay an additional 500 to instead create that accessory as a Stable Accessory. Stable Accessories and Clothing do not break, but may only be activated once per day.');
INSERT INTO pokemondata2.trainer_features VALUES (408, 'Designed Volatility', '--', 0, '--', 'Trainer', 31, 'Whenever you create a Fashion Designer item that has a limited number of uses, you may pay an additional 200 to instead create that accessory as a Volatile Accessory. Volatile Accessories do not break after a set number of uses; instead, each time they are activated, you must roll 1d20. If you roll less than 5, the accessory or clothing item loses all its abilities.');
INSERT INTO pokemondata2.trainer_features VALUES (409, 'Item Stylist', 'An Item.', 0, '--', 'Trainer', 31, 'The Targetted item adds +1 Appeal during the introduction stage of a Contest if equipped. If the targetted item was not already an Accessory, it becomes an Accessory. You may not target the same item multiple times with Item Stylist.');
INSERT INTO pokemondata2.trainer_features VALUES (410, 'Lucky Tailor', '--', 0, '--', 'Trainer', 31, 'You create a Lucky Piece, which is a Clothing Piece. The Lucky Item may be used to roll 1d20 and add the result to any roll made as a result of a trainer action taken by the wearer. Once activated a third time, the Lucky Piece breaks. A Trainer may benefit from a Lucky Piece only once each round. It costs 550 to use Lucky Tailor.');
INSERT INTO pokemondata2.trainer_features VALUES (411, 'Move Accessory', '--', 1, '--', 'Trainer', 31, 'Choose a Pokemon Move known by a Pokemon you own. You create a Move Accessory that may be activated once per day to simulate the Chosen move while in a Contest. Once activated a third time, the Move Accessory loses all its abilities. It costs 400 to use Move Accessory.');
INSERT INTO pokemondata2.trainer_features VALUES (412, 'Practical Tailor', '--', 0, '--', 'Trainer', 31, 'Choose a Trainer Stat. You create a Stat Piece, which is a Clothing Piece. When activated, it adds +1 to the chosen statâs Modifier for five minutes. Once activated a third time, the Stat Piece loses all its abilities. A Trainer may not benefit from multiple pieces of Stat Tailor that add to the same Trainer Stat at the same time. It costs 550 to use Practical Tailor.');
INSERT INTO pokemondata2.trainer_features VALUES (413, 'Style Accessory', '--', 0, '--', 'Trainer', 31, 'Choose a Contest Stat. You create a Type Accessory that, when worn, adds +1 to the appeal roll of any moves of the chosen Contest Type. A Pokemon or Trainer may not benefit from multiple Type Accessories that add to the same Contest Stat. It costs 500 to use Type Accessory.');
INSERT INTO pokemondata2.trainer_features VALUES (414, 'Style Tailor', '--', 0, '--', 'Trainer', 31, 'Choose a Contest Stat. You create a Type Piece, which is a Clothing Piece, that adds +X to the chosen Contest Stat, where X is your base CHA modifier at the time you make the clothing. These Contest Stat Points may be burned when using a move through a Feature or Accessory to add to the Appeal score. A Trainer may not benefit from multiple pieces of Type Piece that add to the same Contest Stat at the same time. It costs 800 to use Style Tailor.');
INSERT INTO pokemondata2.trainer_features VALUES (415, 'Smart Advantage', '--', 0, '--', 'Static', 32, 'X is your CHA modifier. Add X to your Pokemonâs appearance appeal in the first round of a Smart Contest. Your Pokemon are Smart. All of your Pokemon with Loyalty 2 or higher may be targeted as if they have a Smart Ribbon, but do not actually have one. Your Pokemon may have up to 20 points in their Smart Contest Stat, and burn up to 5 points of its Smart Stat on a single move.');
INSERT INTO pokemondata2.trainer_features VALUES (416, 'Smart Defense', 'Your Pokemon with a Smart Contest Ribbon.', 0, '--', 'Static', 32, 'Mark your Pokemon with Smart Ribbons as âAware.â When adding stats during level up for Aware Pokemon, while the Pokemon is still yours, you may add to the Pokemonâs Special Defense Stat and ignore Base Relation.');
INSERT INTO pokemondata2.trainer_features VALUES (417, 'Intelligent Design', 'Your Pokemon or an ally''s Pokemon', 1, '--', 'Trainer', 32, 'Roll 1d20 and add your CHA modifier. If your result is 16 or greater, you may change the target''s Nature to Calm, Gentle, Sassy, Sickly, or Careful.');
INSERT INTO pokemondata2.trainer_features VALUES (418, 'Linguistics Lesson', 'Your Pokemon with high Loyalty, Intelligence 6, and a Smart Ribbon.', 0, '--', 'Trainer', 32, 'The target can now speak human languages. Upon activation of Linguistics Lesson, the target will be able to have remedial conversations, but within one week should be able to hold discussion as complicated as your conversations. Linguistics Lesson may target the same Pokemon more then once, teaching a new human language each time.');
INSERT INTO pokemondata2.trainer_features VALUES (419, 'Mental Potential', 'Your Pokemon with at least 15 in their Smart Stat', 2, '--', 'Free', 32, 'Contest Effect: When the target uses a Smart Move, roll an additional 1d4 during the appeal.\nBattle Effect: When the target uses a Move that has a Smart Contest Type, the Move raises the targetâs Special Defense 1 Combat Stage.');
INSERT INTO pokemondata2.trainer_features VALUES (420, 'Schooling', 'Your Pokemon with a Smart Ribbon.', 0, '--', 'Trainer', 32, 'Raise the target''s Intelligence Capability 1 level permanently. Schooling may not be used on a Pokemon with a natural Intelligence Capability of 6.');
INSERT INTO pokemondata2.trainer_features VALUES (421, 'Smart Details', 'Your Pokemon or allied Pokemon with a Smart Ribbon', 2, '--', 'Trainer', 32, 'The target gains the Anticipation Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Anticipation, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (423, 'Smart Planning', 'Your Pokemon or allied Pokemon with a Smart Ribbon', 2, '--', 'Trainer', 32, 'The target gains the Adaptability Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Adaptability, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (424, 'Smart Skin', 'Your Pokemon or allied Pokemon with a Smart Ribbon', 2, '--', 'Trainer', 32, 'The target gains the Filter Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Filter, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (425, 'Smart''s Allies', 'Your Pokemon or allied Pokemon with a Smart Ribbon', 2, '--', 'Free', 32, 'Contest Effect: When the target uses a Cute Move or a Tough Move in a Contest, you may choose to have the Move raise the Voltage.\nBattle Effect: Once per combat, if the target uses a Move that has a Smart Contest Type, the Move needs -2 to hit.');
INSERT INTO pokemondata2.trainer_features VALUES (426, 'Smart''s New Allies', 'Your Pokemon or allied Pokemon with a Smart Ribbon', 2, '--', 'Free', 32, 'When the target uses a Cool Move or Beauty Move in a Contest, you may choose to have the Move not lower the Voltage.');
INSERT INTO pokemondata2.trainer_features VALUES (427, 'Tough Advantage', '--', 0, '--', 'Static', 33, 'X is your CON modifier. Add X to your Pokemonâs appearance appeal in the first round of a Tough Contest. Your Pokemon are Tough. All of your Pokemon with Loyalty 2 or higher may be targeted as if they have a Tough Ribbon, but do not actually have one. Your Pokemon may have up to 20 points in their Tough Contest Stat, and burn up to 5 points of its Tough Stat on a single move.');
INSERT INTO pokemondata2.trainer_features VALUES (428, 'Tough Defense', 'Your Pokemon with a Tough Contest Ribbon', 0, '--', 'Static', 33, 'Mark your Pokemon with Tough Ribbons as âTank.â When adding stats during level up for Tank Pokemon, while the Pokemon is still yours, you may add to the Pokemonâs Defense Stat and ignore Base Relation.');
INSERT INTO pokemondata2.trainer_features VALUES (429, 'Burly Start', '--', 3, 'You send out a Pokemon with a Tough Stat of 10 or higher from a Poke Ball.', 'Free', 33, 'The Pokemon gains Temporary HP equal to their Tough Stat.');
INSERT INTO pokemondata2.trainer_features VALUES (430, 'Head Strong', 'Your Pokemon or an ally''s Pokemon', 1, '--', 'Trainer', 33, 'Roll 1d20 and add your CON modifier. If your result is 16 or greater, you may change the target''s Nature to Stark, Bold, Impish, Lax, or Relaxed.');
INSERT INTO pokemondata2.trainer_features VALUES (431, 'Immovable', 'Your Pokemon with at least 15 in their Tough Stat', 2, '--', 'Free', 33, 'Contest Effect: When the target uses a Tough Move, roll an additional 1d4 during the appeal.\nBattle Effect: When the target uses a Move that has a Tough Contest Type, the Move raises the targetâs Defense 1 Combat Stage.');
INSERT INTO pokemondata2.trainer_features VALUES (432, 'Muscle Up', 'Your Pokemon with a Tough Contest Ribbon', 0, '--', 'Trainer', 33, 'Raise the target''s Power Capability 1 level permanently. Muscle Up may not be used on a Pokemon with a natural Power Capability level of 7.');
INSERT INTO pokemondata2.trainer_features VALUES (433, 'Tough Blood', 'Your Pokemon or allied Pokemon with a Tough Ribbon.', 2, '--', 'Trainer', 33, 'The target gains the Big Pecks Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Big Pecks, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (434, 'Tough Hide', 'Your Pokemon or allied Pokemon with a Tough Ribbon.', 2, '--', 'Trainer', 33, 'The target gains the Rough Skin Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Rough Skin, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (435, 'Tough Spirit', 'Your Pokemon or allied Pokemon with a Tough Ribbon.', 2, '--', 'Trainer', 33, 'The target gains the Reckless Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Reckless, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (436, 'Tough Protectors', 'Your Pokemon or allied Pokemon with a Tough Ribbon.', 2, '--', 'Trainer', 33, 'The target gains the Battle Armor Pokemon ability, in addition to the abilities they already have. If the Pokemon already has Battle Armor, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (437, 'Tough''s Allies', 'Your Pokemon or allied Pokemon with a Tough Ribbon.', 2, '--', 'Free', 33, 'Contest Effect: When the target uses a Smart Move or a Cool Move in a Contest, you may choose to have the Move raise the Voltage.\nBattle Effect: Once per combat, if the target uses a Move that has a Tough Contest Type, the Move needs -2 to hit.');
INSERT INTO pokemondata2.trainer_features VALUES (438, 'Tough''s New Allies', 'Your Pokemon or allied Pokemon with a Tough Ribbon.', 2, '--', 'Free', 33, 'When the target uses a Beauty Move or Cute Move in a Contest, you may choose to have the Move not lower the Voltage.');
INSERT INTO pokemondata2.trainer_features VALUES (439, 'Combat Focus', '--', 0, '--', 'Static', 34, 'Add your STR or DEX modifier to the damage you deal as a trainer.');
INSERT INTO pokemondata2.trainer_features VALUES (440, 'Martial Endurance', 'n', 0, '--', 'Static', 34, 'Add half your STR and DEX modifiers and multiply the total by 5 HP. Add this to your HP total.');
INSERT INTO pokemondata2.trainer_features VALUES (441, 'Brick Break', 'Pokemon or Trainers.', 2, '--', 'Trainer', 34, 'Use the Move Brick Break. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (442, 'Double Kick', 'Pokemon or Trainers.', 3, '--', 'Trainer', 34, 'Use the Move Double Kick. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (443, 'Facade', 'Pokemon or Trainers.', 2, '--', 'Trainer', 34, 'Use the Move FacÌ§ade. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (444, 'Focus Punch', 'Pokemon or Trainers.', 2, '--', 'Trainer', 34, 'Use the Move Focus Punch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (445, 'Improved Combat Focus', '--', 0, '--', 'Static', 34, 'Add your STR and DEX modifier to the damage you deal as a Trainer. This Feature replaces Combat Focus.');
INSERT INTO pokemondata2.trainer_features VALUES (446, 'Improved Martial Endurance', '--', 0, '--', 'Static', 34, 'Add your STR and DEX modifiers and multiply the total by 5 HP. Add this to your HP total. This feature replaces Martial Endurance.');
INSERT INTO pokemondata2.trainer_features VALUES (447, 'Jump Kick', 'Pokemon or Trainers.', 3, '--', 'Trainer', 34, 'Use the Move Jump Kick. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (448, 'Karate Chop', 'Pokemon or Trainers.', 0, '--', 'Trainer', 34, 'Use the Move Karate Chop. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (449, 'Mega Punch', 'Pokemon or Trainers.', 2, '--', 'Trainer', 34, 'Use the Move Mega Punch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (450, 'Resilience', 'Self.', 1, '--', 'Free', 34, 'You are cured of any single status condition.');
INSERT INTO pokemondata2.trainer_features VALUES (451, 'Tough Skin', '--', 0, '--', 'Static', 34, 'When you take damage, from any source, reduce the damage by  your STR modifier unless the damage source specifically says it cannot be reduced.');
INSERT INTO pokemondata2.trainer_features VALUES (452, 'C''mon and Slam', 'Pokemon or Trainers.', 3, '--', 'Trainer', 35, 'Use the move Slam. Use your STR modifier as your ATK stat. If you hit, the next ally to target that enemy may ignore any Evasion and other effects that modify AC checks on the target.');
INSERT INTO pokemondata2.trainer_features VALUES (453, 'Run, Baby, Run!', '--', 3, '--', 'Free', 35, 'Add half of your STR modifier to your Overland, Surface, or Underwater capability until the end of your next turn. Run, Baby, Run! may be activated at the beginning of your turn, and only once per round.');
INSERT INTO pokemondata2.trainer_features VALUES (454, 'Comeback Kid', 'Pokemon or Trainers.', 1, '--', 'Trainer', 35, 'Use the move Retaliate. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (455, 'Defensive Line', '--', 1, 'Your Pokemon is hit by an attack.', 'Free', 35, 'Once per round, if you have not already shifted, you may roll to intercept an attack for one of your pokemon. Roll 1d20. If your Strength stat is 20 or below, you must roll 11 or better on the check you may shift into the way of the attack. If your Strength stat exceeds 20, you need only roll 6 or better on the check. If your Strength stat exceeds 35, you do not need to make a check.');
INSERT INTO pokemondata2.trainer_features VALUES (456, 'Dodge, Dip, Duck, Dive, and Dodge', '--', 1, '--', 'Trainer', 35, 'Use the move Detect.');
INSERT INTO pokemondata2.trainer_features VALUES (457, 'Double Play', '--', 2, 'Your Pokemon hits with a Damage dealing Melee Move.', 'Free', 35, 'If your Pokemon hits a foe that you dealt damage to this turn, it deals an additional X damage and pushes the target X meters, where X is its Power Capability. If the target is pushed into Blocking Terrain, the target takes an additional 2d12 damage. If the target is pushed into another Legal Target, both take 1d12 damage.');
INSERT INTO pokemondata2.trainer_features VALUES (458, 'Gotta Go Fast', 'Pokemon or Trainers.', 1, '--', 'Trainer', 35, 'Use the move Extremespeed. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (459, 'In the Zone', '--', 0, 'You activate Run, Baby, Run!', 'Static', 35, 'You may use your Strength, instead of your Dexterity, to calculate your Initiative and Evasion until the end of your next turn.');
INSERT INTO pokemondata2.trainer_features VALUES (460, 'Overtime', '--', 1, 'You are lowered to 0 HP or less, but not greater than -100% HP.', 'Free', 35, 'Before fainting, you may make one last shift, and perform a trainer action targeting an enemy.');
INSERT INTO pokemondata2.trainer_features VALUES (461, 'Strength Training', 'A Pokemon with Power 5 or greater who is leveling up to a level evenly divisible by 5.', 0, '--', 'Trainer', 35, 'Roll 1d20 and add your STR modifier. If the total exceeds 15, the Pokemon learns Strength.');
INSERT INTO pokemondata2.trainer_features VALUES (462, 'Welcome to the Jam', '--', 2, 'You use Slam.', 'Free', 35, 'Slamâs AC becomes AC4. If you successfully hit a foe that dealt damage to another of your allies this round or last round, the next time an allied Trainer of Pokemon would damage that foe they deal an additional Xd6 damage, where X is half of your STR modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (463, 'Work That Body', 'A Pokemon who is leveling up to a level evenly divisible by 10.', 0, '--', 'Static', 35, 'Choose Power or a Movement Capability that the target has at 4 or higher. Permanently increase the chosen Capability by 1. The Power Capability may not be raised to 7 or higher in this manner.');
INSERT INTO pokemondata2.trainer_features VALUES (464, 'Aura Reading', 'Pokemon or Trainers.', 0, '--', 'Static', 36, 'You can read the Aura of your target. Everything has an Aura, but not many can access their Aura. Auras can be any color. The shade of the color varies from very tinted to very darkened. If the color of the Aura is tinted, the target has little negative intentions. If the color of the Aura is very blackened, the target has many malicious intentions. An Auraâs shade can be anywhere in between. You may also project your intent to Trainers or Pokemon. This does not allow you to read their minds.');
INSERT INTO pokemondata2.trainer_features VALUES (465, 'Vacuum Wave', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the Move Vacuum Wave. Use your STR modifier as your SP. ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (466, 'Aura Sphere', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the Move Aura Sphere. Use your STR modifier as your SP. ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (467, 'Aura Thoughts', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'You know the general course of actions the target intends to take such as, âMeet with associateâ ''Fight our enemyâ âDestroy this locationâ âImpress close friendâ. These intentions can be misinterpreted by the Aura User, like reading the intention to harm someone, when it is simply a friendly competition. These intentions cannot be hidden by Voltorb Flip or the Mind Lock capability.');
INSERT INTO pokemondata2.trainer_features VALUES (468, 'Dark Pulse', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the move Dark Pulse. Use your STR modifier as your SP. ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (469, 'Drain Punch', 'Pokemon or Trainers.', 1, '--', 'Trainer', 36, 'Use the Move Drain Punch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (470, 'Dragon Pulse', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the Move Dragon Pulse. Use your STR modifier as your SP. ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (471, 'Fire Punch', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the Move Fire Punch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (472, 'Focus Blast', 'Pokemon or Trainers.', 1, '--', 'Trainer', 36, 'Use the Move Focus Blast. Use your STR modifier as your SP. ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (473, 'Ice Punch', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the Move Ice Punch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (474, 'Light Screen', 'Self.', 2, '--', 'Trainer', 36, 'Use the Move Light Screen.');
INSERT INTO pokemondata2.trainer_features VALUES (475, 'Shadow Punch', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the move Shadow Punch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (476, 'Sword of Body and Soul', '--', 0, '--', 'Static', 36, 'When you take Sword of Body and Soul, choose an elemental Type. You may have Arms attacks you make deal damage of that type.');
INSERT INTO pokemondata2.trainer_features VALUES (477, 'Thunderpunch', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the Move Thunderpunch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (478, 'Water Pulse', 'Pokemon or Trainers.', 2, '--', 'Trainer', 36, 'Use the Move Water Pulse. Use your STR modifier as your SP. ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (479, 'Close Combat', 'Pokemon or Trainers.', 1, '--', 'Trainer', 37, 'Use the attack Close Combat. Use your STR modifier as your ATK stat. For the next five minutes, attacks you take treat their added damage as if the user had one additional Combat Stage in their appropriate stat, including damage taken from trainers.');
INSERT INTO pokemondata2.trainer_features VALUES (480, 'Sensei', '--', 0, '--', 'Static', 37, 'Choose a specific Martial Art. You are a master of that form of Martial Arts and can perform stunts related to it without making checks. You may take Sensei as another form of Martial Art again as a secondary feature. Your Unarmed attacks have an AC of 2, and you may deal either Fighting or Normal Type damage with your Unarmed Attacks.');
INSERT INTO pokemondata2.trainer_features VALUES (481, 'Circle Throw', 'Pokemon or Trainers.', 1, '--', 'Trainer', 37, 'Use the Move Circle Throw. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (482, 'Double-Edge', 'Pokemon or Trainers.', 2, '--', 'Trainer', 37, 'Use the Move Double-Edge. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (483, 'Go Away!', 'Pokemon or Trainers.', 0, '--', 'Trainer', 37, 'Push the target a number of Meters equal to your STR modifier halved. If the target is pushed into Blocking Terrain, it takes 2d10 damage. If the target is pushed into another Legal Target, both take 1d10.');
INSERT INTO pokemondata2.trainer_features VALUES (484, 'Hi Jump Kick', 'Pokemon or Trainers.', 3, '--', 'Trainer', 37, 'Use the Move Hi Jump Kick. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (485, 'I Can Take It', '--', 0, '--', 'Static', 37, 'When taking damage from a move that you have used, reduce the damage by your STR modifier plus your DEX modifier. This may not reduce damage that was taken in order to use a Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (486, 'Low Sweep', 'Pokemon or Trainers.', 2, '--', 'Trainer', 37, 'Use the Move Low Sweep. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (487, 'Mach Punch', 'Pokemon or Trainers.', 3, '--', 'Trainer', 37, 'Use the Move Mach Punch. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (488, 'Reckless', '--', 0, '--', 'Static', 37, 'When using a Pokemon Move that can deal damage to the user, you may choose to be treated as if you have the Ability Reckless. Declare this Feature before rolling Accuracy Check if you intend to use it.');
INSERT INTO pokemondata2.trainer_features VALUES (489, 'Rolling Kick', 'Pokemon or Trainers.', 2, '--', 'Trainer', 37, 'Use the move Rolling Kick. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (490, 'Strong Guy', '--', 0, '--', 'Static', 37, 'Whenever you make a Strength check, or make a roll that requires you to add your STR modifier to your roll for damage, add 5 to your roll.');
INSERT INTO pokemondata2.trainer_features VALUES (491, 'Toughest Skin', '--', 0, '--', 'Static', 37, 'When you take damage from any source other than recoil, reduce the damage by your STR modifier doubled unless the damage source specifically says it cannot be reduced. This Feature replaces Tough Skin.');
INSERT INTO pokemondata2.trainer_features VALUES (492, 'Wide Guard', 'Pokemon or Trainers.', 1, '--', 'Trainer', 37, 'Use the move Wide Guard.');
INSERT INTO pokemondata2.trainer_features VALUES (493, 'Battle Chatter', 'A Trainer or Pokemon.', 2, '--', 'Trainer', 38, 'Select and use one of the following Moves: Taunt, Swagger, or Flatter. Regardless of Move selected, this Feature does not work on the same target twice in an encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (494, 'Psyche!', 'Pokemon or Trainer.', 2, '--', 'Trainer', 38, 'Use the Move Sucker Punch. Use your DEX modifier as your ATK stat. You may use this Feature as a Free Action when attacked by a Melee-ranged Move or Action-if you do, you may not perform a Trainer Action during your next turn.');
INSERT INTO pokemondata2.trainer_features VALUES (495, 'Ball Buster', 'A Trainer with Pokemon still within Poke Balls', 1, '--', 'Trainer', 38, 'Make an Arms Feature attack of your choice. If it hits, roll 1d20 and add your STR mod. If the result is 16 or higher, one Poke Ball containing a Pokemon that the target possesses is selected at random. That Poke Ball becomes damaged, and cannot be used to release the Pokemon inside for X hours where X is your level. Poke Balls damaged in this way can be repaired instantly by a Capture Specialist or at a Pokemon Center, Poke Mart, Ranger Station or any general place of Law Enforcement.');
INSERT INTO pokemondata2.trainer_features VALUES (496, 'Barbed Wire', 'One of your weapons.', 2, '--', 'Free', 38, 'You may only use this feature when combat begins. Roll 1d20 and add your DEX mod. If the result is 12 or higher, for the rest of the encounter, attacks you make with the target weapon deal an extra 1d10 damage. This may only be activated once per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (497, 'Below the Belt', 'A Trainer.', 1, '--', 'Trainer', 38, 'Use the Move Mega Kick. During the Accuracy Check for Mega Kick, if you roll 14 or higher, the target is Paralyzed. Use your DEX modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (498, 'Concealed Weapon', '--', 0, '--', 'Static', 38, 'Others are not aware you possess your qualifying Weapon of Choice normally. When you first perform an Arms Feature attack using this Weapon of Choice in a combat, your attack has an accuracy check of 2 and ignores the targetâs evasion, and doubles its Damage Dice Roll. This bonus does not take place on unarmed attacks.');
INSERT INTO pokemondata2.trainer_features VALUES (499, 'Crocodile Tears', 'Pokemon or Trainer who dealt damage to you on their last turn.', 0, '--', 'Trainer', 38, 'The next time you roll an Accuracy Check while targeting Crocodile Tearsâ target, you need -5 on your Accuracy Check. This effect overrides Think Fast! if both would affect the target. This feature only works once on a target per Encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (500, 'Desperate Assault', 'Pokemon or Trainer.', 1, '--', 'Trainer', 38, 'If you have used four different Dirty Fighter Features during a single Encounter, you may use the move Last Resort. Use your DEX modifier, multiplied by 3, as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (501, 'Face!', 'Pokemon or Trainer.', 3, '--', 'Trainer', 38, 'Use the Move Headbutt. Use your DEX modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (502, 'Look, a Three Headed Mankey', 'Pokemon or Trainer.', 2, '--', 'Trainer', 38, 'Your target rolls 1d20 and adds either their INT modifier or their Intelligence Capability as applicable. On a roll of 12 or less, they lose their Trainer Action, for Trainers, or Move, for Pokemon, this round. This Feature does not work on the same target twice in an encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (503, 'Riposte', '--', 2, 'You are attacked with a Melee Arms Feature other than Fists.', 'Free', 38, 'Roll 1d20 and add your DEX modifier. If the result is 20 or higher, the targetâs attack fails and their weapon is knocked 5m away. They must spend a trainer action to retrieve the weapon. A Trainer losing a Weapon as a result of Riposte may make a check to resist losing their Weapon on a 16 or better on 1d20 adding their STR modifier. This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (504, 'Tax', 'Pokemon or Trainer.', 3, '--', 'Trainer', 38, 'Use the Move Thief. Use your DEX modifier as your ATK stat. If you target a Trainer with Tax, and you hit with Thief, you may take anything from the Trainer that can be seen on their person.');
INSERT INTO pokemondata2.trainer_features VALUES (505, 'Think Fast!', '--', 0, 'You miss with an Arms Feature or Unarmed attack.', 'Free', 38, 'Your action on your next turn that targets the same target requires 3 less on Accuracy Check to succeed.');
INSERT INTO pokemondata2.trainer_features VALUES (506, 'You''ll Pay For That!', 'Pokemon or Trainer.', 1, '--', 'Trainer', 38, 'Use the Move Payback. Use your DEX modifier, multiplied by 3, as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (507, 'Massage Therapy', 'A Pokemon.', 0, '--', 'Trainer', 39, 'Massage Therapy requires an uninterrupted 5 minutes to apply. The target is temporarily at full happiness and appears more appealing. If they level up without a negative incident within an hour of Massage Therapy and have met all previous requirements for evolution, evolution is guaranteed.');
INSERT INTO pokemondata2.trainer_features VALUES (508, 'Pressure Points', '--', 2, 'You hit with an Unarmed arms attack.', 'Free', 39, 'You flinch the target. If the target is successfully flinched, the target becomes immune to further uses of Pressure Points for the rest of the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (509, 'Boost Therapy', '--', 2, 'You use Massage Therapy.', 'Free', 39, 'Choose a trainer stat. The target of Massage Therapy gains +2 to the chosen statâs modifier for 12 hours. You may only apply Boost Therapy to trainers, and a trainer may only benefit from one instance of Boost Therapy at a time.');
INSERT INTO pokemondata2.trainer_features VALUES (510, 'Hand Burst', 'Pokemon or Trainers.', 2, '--', 'Trainer', 39, 'Use the Move Arm Thrust. Use your DEX modifier as your ATK stat. If the same target is hit 4 times in the same round by Arm Thrust, used with Hand Burst, the target is Paralyzed.');
INSERT INTO pokemondata2.trainer_features VALUES (511, 'Healing Touch', 'Pokemon or Trainers.', 2, '--', 'Trainer', 39, 'The target regains HP equal to 2d12+10 plus your DEX modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (512, 'Impose Limberness', 'Any Paralyzed or Flinched Target.', 3, '--', 'Trainer', 39, 'The target is cured of their Paralyzed and Flinched status.');
INSERT INTO pokemondata2.trainer_features VALUES (513, 'Invigorating Massage', '--', 2, 'You use Massage Therapy.', 'Free', 39, 'The target of Massage Therapy gains temporary HP equal to your DEX modifier. In addition, you may now target other trainers with Massage Therapy.');
INSERT INTO pokemondata2.trainer_features VALUES (514, 'Limber', '--', 0, '--', 'Static', 39, 'You are immune to Paralysis.');
INSERT INTO pokemondata2.trainer_features VALUES (515, 'Muscle Therapy', '--', 2, 'You use Massage Therapy.', 'Free', 39, 'The target of Massage Therapy gains the ability "Limber" for the next encounter that day.');
INSERT INTO pokemondata2.trainer_features VALUES (516, 'Nerve Strike', 'Pokemon or Trainers.', 1, '--', 'Free', 39, 'Use an Unarmed Arms Attack. On hit, you paralyze the target.');
INSERT INTO pokemondata2.trainer_features VALUES (520, 'Alacrity', '--', 0, 'Acrobatic stunt.', 'Static', 40, 'Add half of your DEX modifier to your Movement Speeds as a trainer. You may treat Rough Terrain as Normal Terrain. You may run on vertical surfaces for up to your DEX modifier in meters before jumping off. You may also move silently without making checks.');
INSERT INTO pokemondata2.trainer_features VALUES (521, 'Poisonpowder', 'Pokemon or Trainers.', 2, '--', 'Trainer', 40, 'Use the Move Poison Powder. You may choose to use it as a Melee move without the Blast keyword.');
INSERT INTO pokemondata2.trainer_features VALUES (522, 'Aerial Assault', 'Pokemon or Trainers.', 3, '--', 'Trainer', 40, 'Use the Move Aerial Ace. Use your DEX modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (523, 'Ally Switch', 'An ally whom you have line of sight to.', 1, '--', 'Trainer', 40, 'Use the Move Ally Switch.');
INSERT INTO pokemondata2.trainer_features VALUES (524, 'Antidotes Master', 'Any Poisoned Target.', 0, '--', 'Trainer', 40, 'Roll 1d20 and add your DEX modifier. If the total is 13 or higher, the target is cured of their Poisoning. This effect succeeds automatically if you inflicted the poison.');
INSERT INTO pokemondata2.trainer_features VALUES (525, 'Blur', 'Self.', 1, '--', 'Free', 40, 'Attacks and Moves targeting you that don''t require an Accuracy Check now require one, as though they had an Accuracy Check of 2.');
INSERT INTO pokemondata2.trainer_features VALUES (526, 'Caltrops', 'Any spot on the battlefield.', 3, '--', 'Trainer', 40, 'Use the Move Spikes or Poison Spikes.');
INSERT INTO pokemondata2.trainer_features VALUES (527, 'Deadly Poisons', '--', 1, 'You Poison a target.', 'Free', 40, 'The target is Badly Poisoned instead.');
INSERT INTO pokemondata2.trainer_features VALUES (528, 'Double Team', 'Self.', 1, '--', 'Trainer', 40, 'Use the Move Double Team.');
INSERT INTO pokemondata2.trainer_features VALUES (529, 'Poison Jab', 'Pokemon or Trainers.', 2, '--', 'Trainer', 40, 'Use the Move Poison Jab. Use your DEX modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (530, 'Sleep Powder', 'Pokemon or Trainers.', 2, '--', 'Trainer', 40, 'Use the Move Sleep Powder as a Melee Attack. Sleep Powder does not have the Blast keyword while used this way.');
INSERT INTO pokemondata2.trainer_features VALUES (531, 'Smoke Bomb', '--', 2, '--', 'Trainer', 40, 'Use the move Smokescreen, then immediately use the move Teleport. Your Accuracy is never modified by a Smokescreen.');
INSERT INTO pokemondata2.trainer_features VALUES (532, 'Spike Drop', '--', 0, 'You Shift.', 'Free', 40, 'You may expend a use of the Feature Caltrops to place one square meter of Spikes or Toxic Spikes in the path you took during your Shift Action per square meter of movement. If you choose to place more than 10 Square Meters of Hazard in this way, subtract another use of the relevant Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (533, 'Vanish', '--', 0, '--', 'Static', 40, 'You may blend with your surrounding objects. You are invisible to others as long as you stay still, If you move, it takes 5 seconds to regain the camouflage with surroundings. In order to remain still you must make a stealth check every 6 seconds, or round during an encounter, to remain still. The check is 16 on 1d20 added to your DEX modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (534, 'Venoshock', '--', 1, '--', 'Trainer', 40, 'Use the Move Venoshock. Use your DEX modifier as your SP. ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (535, 'Vile Coating', '--', 0, '--', 'Static', 40, 'You are treated as if you have the ability Poison Touch.');
INSERT INTO pokemondata2.trainer_features VALUES (536, 'Master''s Expertise', '--', 0, '--', 'Static', 41, 'The base Accuracy Check for any Weapon of Choice is AC 2. This does not apply to Weapon of Choice (Unarmed).');
INSERT INTO pokemondata2.trainer_features VALUES (537, 'Power Attack', '--', 2, 'You hit with an Arms Attack.', 'Free', 41, 'Raise the Damage Base of your Arms Attack with your Weapon of Choice by +2.');
INSERT INTO pokemondata2.trainer_features VALUES (538, 'Barrage', '--', 2, 'You declare an Arms Attack with a weapon.', 'Free', 41, 'You must be wielding a ranged weapon to use this Feature. Your next arms attack gains the Blast keyword. The blast radius in meters is equal to half of your STR modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (539, 'Kiai Focus', '--', 0, '--', 'Trainer', 41, 'Use the Move Focus Energy.');
INSERT INTO pokemondata2.trainer_features VALUES (540, 'Master''s Aegis', '--', 0, '--', 'Static', 41, 'While holding a weapon you gain 5 damage reduction.');
INSERT INTO pokemondata2.trainer_features VALUES (541, 'Passing Blade', '--', 2, 'You declare an Arms Attack with a weapon.', 'Free', 41, 'When using a melee weapon, you grant your attack the Pass keyword. If you are wielding a Ranged weapon, the attack is instead a column 1 meter wide, and 15 meters long.');
INSERT INTO pokemondata2.trainer_features VALUES (542, 'Piercing Shot', '--', 2, 'You roll 16-20 with an Arms Feature with a weapon.', 'Free', 41, 'Reduce the arm attack''s target''s defense and special defense combat stages by 1, or lower their damage reduction by 5 until the end of the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (543, 'Quake Hammer', 'Pokemon or Trainers.', 1, '--', 'Trainer', 41, 'You must be wielding a melee weapon to use this Feature. Use the Move Earthquake, centered around yourself, dealing damage of the same type as your weapon. This attack may not hit flying types or pokemon with Levitate, even if its element is not Ground. Use your STR modifier as your ATK stat.');
INSERT INTO pokemondata2.trainer_features VALUES (544, 'Sword of Sun and Moon', '--', 1, 'You declare an Arms Attack with a weapon.', 'Free', 41, 'Your next Arms Attack cannot miss, and deals Special damage rather than Physical damage.');
INSERT INTO pokemondata2.trainer_features VALUES (545, 'Razor Gash', '--', 1, 'You roll 16-20 with an Arms Feature with a weapon.', 'Free', 41, 'You score a critical hit.');
INSERT INTO pokemondata2.trainer_features VALUES (546, 'Reaper''s Maneuver', '--', 1, 'You roll 16-20 with an Arms Feature with a weapon.', 'Free', 41, 'The target is Confused.');
INSERT INTO pokemondata2.trainer_features VALUES (547, 'Weapons Dance', 'Self.', 0, '--', 'Static', 41, 'Whenever you roll 16-20 on Arms Attack with your Weapon of Choice, you get a temporary +1 bonus to your STR modifier, up to a maximum bonus of +6. The Bonuses dissapear at the end of the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (548, 'Channel', 'A Pokemon.', 0, '--', 'Trainer', 42, 'Make a Link Check, then subtract your Wisdom or Strength Stat from your roll. If it is successful, the Pokemon is being Channeled. The Pokemon is considered Helpful. Until this ally is attacked or severely distracted, it will listen to the Mysticâs suggestions and follow the Mystic until they are leaving the Pokemonâs home. You have knowledge of its Pokemonâs Move List, Abilities and Capabilities. You have knowledge of what happened in the Pokemonâs past hour. You and the Channeled Pokemon can communicate telepathically. Any attempt at attacking or capturing the Channeled Pokemon results in the Pokemon fleeing without fail. The Channeled Pokemon will not attack on your command. However, if the Channeled Pokemon is yours, treat it as usual, except it is being âChanneledâ. You may only have one Pokemon Channeled at a time. If a Pokemon is more than X meters from you, it is no longer Channeled. X is twice the sum of your STR modifier plus your WIS modifier.\nLink Checks are made as if they are Capture Rolls. If your roll is less than the Pokemonâs Capture rate, you have successfully Channeled the Pokemon.\nThis feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (549, 'Borrow', 'A Pokemon you are Channeling.', 1, '--', 'Free', 42, 'Choose a Move on the Channeled Pokemonâs Move List. You may perform this Move, once, as a Trainer Action during the next 24 hours. Use your STR modifier for your Attack stat and your WIS modifier for your Special Attack stat.');
INSERT INTO pokemondata2.trainer_features VALUES (550, 'Ancient Pulse', 'Non-electronic, inorganic Items.', 0, '--', 'Static', 42, 'You can identify the abilities of any non-electronic, inorganic Items and know how to activate their abiliites and use them.');
INSERT INTO pokemondata2.trainer_features VALUES (551, 'Channel Friend', '--', 0, '--', 'Static', 42, 'Whenever you target a loyal Pokemon you own with Channel, treat your Possession Check as if you rolled 0.');
INSERT INTO pokemondata2.trainer_features VALUES (552, 'Channel Friend +', '--', 0, '--', 'Static', 42, 'Whenever you target a loyal Pokemon you own with Channel, treat your Possession Check as if you rolled 0 and do not lose any HP in order to use Channel. Whenever you target a loyal Pokemon an ally owns with Channel and their permission, treat your Possession Check as if you rolled 0. You may also channel up to two Pokemon at a time. This Feature replaces Channel Friend.');
INSERT INTO pokemondata2.trainer_features VALUES (553, 'Channel Mind', '--', 0, '--', 'Static', 42, 'All Channeled Pokemon are treated as if their Intelligence Capability is as high as the highest Intelligence Capability among all Channeled Pokemon, or equal to your WIS Modifier -1. A Pokemonâs Intelligence Capability cannot be higher than 7. A Pokemonâs Intelligence can only be raised up to 6 as a result of your WIS modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (554, 'Experience Shared', '--', 0, '--', 'Static', 42, 'You may see through the eyes of any Channeled Pokemon. You may hear anything a Channeled Pokemon can hear. If you are Channeling more than one Pokemon, you may only chnage between which Pokemon you are sharing senses with once per round of combat.');
INSERT INTO pokemondata2.trainer_features VALUES (555, 'Mystic Veil', '--', 0, '--', 'Static', 42, 'Add your WIS modifier added to your STR modifier multiplied by 3 to your total HP. This only applies to your human body.');
INSERT INTO pokemondata2.trainer_features VALUES (556, 'Perfect Vessel', '--', 0, '--', 'Static', 42, 'You may Channel up to three Pokemon at the same time. If you have Channel Friend +, instead you may Channel up to five Pokemon at the same time.');
INSERT INTO pokemondata2.trainer_features VALUES (557, 'Prophet', '--', 0, '--', 'Static', 42, 'You know lore relating to any local Legendary Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (558, 'Sponge', '--', 0, '--', 'Static', 42, 'You may Borrow up to 3 Moves at a time when using Borrow or Possession Borrow. This does not allow you to use Borrow or Possession Borrow multiple times a day - instead you may choose to Borrow multiple moves at once from the same Pokemon during your Daily use of either Feature. The total number of Moves Borrowed a day may not exceed 3. You may not Borrow multiple copies of the same Move in one day.');
INSERT INTO pokemondata2.trainer_features VALUES (559, 'Tree Hugger', '--', 0, '--', 'Static', 42, 'You can speak to plants that are at least 20 years old, and with a limited reponse they can inform you of anything that may have touched them in the past 24 hours, any Berries that may grow on them, or any Pokemon who live nearby and commonly visit.');
INSERT INTO pokemondata2.trainer_features VALUES (560, 'Voodoo Shuffle', '--', 0, '--', 'Static', 42, 'You may make two Channel attempts as one Trainer Action.');
INSERT INTO pokemondata2.trainer_features VALUES (561, 'Zoopathy', 'Adjacent Pokemon.', 0, '--', 'Trainer', 42, 'You can talk to the Pokemon in its language for 4 hours. This feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (562, 'Imposter', 'A Trainer.', 0, '--', 'Trainer', 43, 'Roll 1d20 and add your WIS modifier. If your roll exceeds the targetâs Wisdom or Constitution score, whichever is lowest, you successfully Imitate the target. While Imitating a target, your physical body changes to look exactly like the target. Your voice, fingerprints, height, and weight all match the targetâs exactly. You have a natural insight as to their general demeanor, ways of talking, ect. and can match them near perfectly. Your aura, however, remains as your own. For the next 24 hours, or until you sleep or become unconscious, you have access to that Imitation. You may freely switch between your own form and the form of any imitation to which you have access as a trainer action. For every time you use this feature per day past the first use on any day, lower your Max HP by 10 as long as you maintain access to that Imitation. You may, during your turn, give up access to any Imitation as a free action.\nThis feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (563, 'Talent Theft', '--', 1, 'You Imitate a Trainer.', 'Free', 43, 'Choose a Feature on the Trainerâs Feature List. This is considered a Borrowed Feature. For the next 24 hours, as long as you maintain access to their Imitation and are physically in their form, you may perform this feature at its normal frequency, or gain its benefits if it is a static feature. You may only Borrow a single feature from any one single source at a time. You may not use Talent Theft to borrow a One-Time-Use feature.');
INSERT INTO pokemondata2.trainer_features VALUES (564, 'A Little Like You', '--', 2, 'You Imitate a Trainer.', 'Free', 43, 'When you Imitate a Trainer, you may use A Little Like You. Choose a Trainer Stat. If the person you are Imitating has a higher Modifier than you in that Stat, your Stat Modifier of the Stat you chose is equal to the Possessed personâs Stat Modifier - 1 as long as you maintain access to their Imitation. This does not change the value of your Stats, only Stat Modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (565, 'Generic Form', '--', 0, '--', 'Trainer', 43, 'You are able to change the appearance your entire body at a whim. You change to the gender, hair-color, height, weight, build, and skin tone of your choice. However, you are unable to significantly specify body features and facial structure, with the end result always looking somewhat generic. You are not able to transform to look like anyone in particular, and any attempts to do so will usually be recognizably and unusually off.');
INSERT INTO pokemondata2.trainer_features VALUES (566, 'I Like Your Bod', 'A Trainer whose Imitation you have had access to for at least 72 hours.', 0, '--', 'Free', 43, 'You create a Body Link link with that trainer. You may give up a Body Link during your turn as a free action. As long as you have acces to a Body Link, you may attempt to Imitate that target, regardless of distance or line of sight. You may only have one Body Link at a time, plus one more for every 25 trainer levels gained. In addition, you may use Here In Spirit on a trainer with whom you have a Body Link, regardless of distance.');
INSERT INTO pokemondata2.trainer_features VALUES (567, 'It''s Still Mine', '--', 0, '--', 'Trainer', 43, 'Choose a feature you are currently Borrowing. For the next 10 minutes, no one may use that Feature if they are within 10m of you, except yourself. At the end of this time, you stop Borrowing the feature and lose further access to it.');
INSERT INTO pokemondata2.trainer_features VALUES (568, 'Just a Little Longer', '--', 0, '--', 'Static', 43, 'You no longer lose access to an Imitation due to sleep or unconsciousness. You still lose access to an Imitation after 24 hours are up, unless you lower your Max HP by 10 for as long as you choose to maintain access. If you do, you maintain access to that Imitation for another 24 hours. Maintaining access to an Imitation does not count as performing an Imitation, meaning you may not perform features that trigger upon Imitating a target.');
INSERT INTO pokemondata2.trainer_features VALUES (569, 'Morphic Control', '--', 0, '--', 'Static', 43, 'When you use Imposter to Imitate a target, you may retain your current form if you wish to, instead of taking the target''s form. The Imitation is in all other ways normal, and you still gain access to the Imitation for later use.');
INSERT INTO pokemondata2.trainer_features VALUES (570, 'Perfect Imposter', '--', 0, '--', 'Static', 43, 'When you Imitate a target, you are able to successfully visually replicate gear and clothing. These are not illusions; these are actual physical replicas However, these replicas do not have any special features that the actual gear or clothing may have, and all useable items do not actually work. For example, you may replicate a potion around their belt, but the potion would have no effect if used. When imitating a target, you are able to successfully mask your aura to appear to be the same as your targetâs.');
INSERT INTO pokemondata2.trainer_features VALUES (645, 'Airy Anthem', '--', 0, '--', 'Trainer', 49, 'Using Airy Anthem ends your turn. If this is the third time you used Airy Anthem in a row, use the Move Whirlwind before ending your turn and you may not use Airy Anthem on your next turn during the next round.');
INSERT INTO pokemondata2.trainer_features VALUES (571, 'Resonance', '--', 0, '--', 'Static', 43, 'Whenever you target an Allied Trainer with Imposter, you automatically pass your check, and you do not lose any HP in order to use Imposter. Additionally, you may access up to three Imitations per day before you must lower your maximum HP.');
INSERT INTO pokemondata2.trainer_features VALUES (572, 'Talent Mixer', '--', 0, '--', 'Static', 43, 'When in your own form or any Imitated form, you may use and apply any Borrowed Features to which you currently have access.');
INSERT INTO pokemondata2.trainer_features VALUES (573, 'Talent Sponge', '--', 0, '--', 'Static', 43, 'You may use Talent Theft up to three times per day. You may still only Borrow a single feature from any one single source at a time.');
INSERT INTO pokemondata2.trainer_features VALUES (574, 'Voice Snatcher', '--', 0, 'You Imitate a Trainer.', 'Free', 43, 'You make a vocal imprint of the targetâs voice. Once you have this imprint, at anytime while\nyou are in your own form or the form of any Imitation, you may use the personâs voice. You may collect as many voices as youâd like with Voice Snatcher. This feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (575, 'Acupressure', 'Self.', 3, '--', 'Trainer', 44, 'Use Acupressure.');
INSERT INTO pokemondata2.trainer_features VALUES (576, 'Empower', 'A Pokemon.', 0, '--', 'Trainer', 44, 'Lower all of your Combat Stages to zero. For each Combat Stage you lowered, raise the target''s corresponding Combat Stage by one.');
INSERT INTO pokemondata2.trainer_features VALUES (577, 'Agility', 'Self.', 3, '--', 'Trainer', 44, 'Use Agility.');
INSERT INTO pokemondata2.trainer_features VALUES (578, 'Amnesia', 'Self.', 3, '--', 'Trainer', 44, 'Use Amnesia.');
INSERT INTO pokemondata2.trainer_features VALUES (579, 'Berry Booster', 'A Berry.', 0, '--', 'Trainer', 44, 'The targeted Berry gains the ability of a Liechi Berry, Ganlon Berry, Petaya Berry, Apicot Berry, or Salac Berry and loses all other abilities. The flavor and appearance of the Berry do not change, but the Berry counts as a Liechi Berry, Ganlon Berry, Petaya Berry, Apicot Berry, or Salac Berry for the purposes of Berry Eater. This feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (580, 'Berry Eater', '--', 0, '--', 'Static', 44, 'If you eat a Liechi Berry, Ganlon Berry, Petaya Berry, Apicot Berry, or Salac Berry you are raised 2 Combat Stages instead of 1 when the Berry''s effect is activated.');
INSERT INTO pokemondata2.trainer_features VALUES (581, 'Buffering', '--', 2, '--', 'Trainer', 44, 'You may use two different, other Buffet Features that raise Combat Stages. This does not count towards the uses of those Buffet Features per day.');
INSERT INTO pokemondata2.trainer_features VALUES (582, 'Bulk Up', 'Self.', 3, '--', 'Trainer', 44, 'Use Bulk Up.');
INSERT INTO pokemondata2.trainer_features VALUES (583, 'Calm Mind', 'Self.', 3, '--', 'Trainer', 44, 'Use Calm Mind.');
INSERT INTO pokemondata2.trainer_features VALUES (584, 'Cosmic Power', 'Self.', 3, '--', 'Trainer', 44, 'Use Cosmic Power.');
INSERT INTO pokemondata2.trainer_features VALUES (585, 'Iron Defense', 'Self.', 3, '--', 'Trainer', 44, 'Use Iron Defense.');
INSERT INTO pokemondata2.trainer_features VALUES (586, 'Nasty Plot', 'Self.', 3, '--', 'Trainer', 44, 'Use Nasty Plot.');
INSERT INTO pokemondata2.trainer_features VALUES (587, 'Swords Dance', 'Self.', 3, '--', 'Trainer', 44, 'Use Swords Dance.');
INSERT INTO pokemondata2.trainer_features VALUES (588, 'Supreme Presence', '--', 0, '--', 'Static', 44, 'Whenever you use your Buffet features or Empower to raise ally Pokemonâs stats by a total of 6 combat stages, all Channeled Pokemon raise a Combat Stage of your choice by 1. Supreme Presenceâs Combat Stage boost does not count for the purposes of triggering Supreme Presence.');
INSERT INTO pokemondata2.trainer_features VALUES (589, 'Supreme Intimidation', '--', 0, '--', 'Static', 44, 'Whenever you have a total of 10 Combat Stages raised, or more, all foes within 10m of you are treated as if a Combat Stage of your choice is lowered by 1.');
INSERT INTO pokemondata2.trainer_features VALUES (590, 'Legendary Cry', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Hyper Voice. Each previously Channeled Legendary Pokemon has 100 HP drained per use of this Feature. For every 100 HP drained in order to use Hyper Voice, roll an additional 2d10 for damage while using Hyper Voice. Use your STR modifier multiplied by 5 as your SP. ATK stat. You may not use Legendary Cry for 2 days after using Legendary Cry.');
INSERT INTO pokemondata2.trainer_features VALUES (591, 'Spotcheck', '--', 3, '--', 'Free', 45, 'For five minutes, you can see from the point of view of any of the Legenedary Pokemon you have ever possessed. You also know how far each of those Legendaries are from you and which direction they are from wherever you are.');
INSERT INTO pokemondata2.trainer_features VALUES (592, 'Cold Snap', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Sheer Cold. Each previously Channeled Legendary Pokemon has 100 HP drained per use of this Feature. For every 200 HP drained in order to use Sheer Cold, subtract 1 from Sheer Coldâs Accuracy Check. You may not use Cold Snap for 5 days after using Cold Snap. After using Cold Snap, you may not use Features, Issue Commands or Shift for 1 minute, or 6 rounds.');
INSERT INTO pokemondata2.trainer_features VALUES (593, 'Flare', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Overheat. Each previously Channeled Legendary Pokemon has 25 HP drained per use of this Feature. Use your STR modifier multiplied by 5 as your SP. ATK stat. You may not use Flare for 2 days after using Flare.');
INSERT INTO pokemondata2.trainer_features VALUES (594, 'God Shield', 'Pokemon or Trainer.', 3, '--', 'Trainer', 45, 'Use the Move Protect.');
INSERT INTO pokemondata2.trainer_features VALUES (595, 'Kneel', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Mean Look. The target may also not Shift for 5 Rounds. The target also may not damage you for 5 Rounds. If the target attacks you or does something that would damage you, you take no damage.');
INSERT INTO pokemondata2.trainer_features VALUES (596, 'Life Beam', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Hyper Beam. Each previously Channeled Legendary Pokemon has 100 HP drained per use of the Feature. For every 100 HP drained in order to use Hyper Beam, roll an additional 2d12 for damage while using Hyper Beam. Use your STR modifier multiplied by 5 as your SP. ATK stat. You may not use Life Beam for 4 days after using Life Beam. After using Life Beam, you may not use Features, Issue Commands or Shift for 1 minute, or 6 rounds.');
INSERT INTO pokemondata2.trainer_features VALUES (597, 'Outburst', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Outrage. Each previously Channeled Legendary Pokemon has 25 HP drained per use of this Feature. Use your STR modifier multiplied by 5 as your ATK stat. When you use Outrage with Outburst, ignore the effects of Outrage. You may not use Outburst for 3 days after using Outburst.');
INSERT INTO pokemondata2.trainer_features VALUES (598, 'Parasitic Embrace', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Giga Drain. Each previously Channeled Legendary Pokemon has 25 HP drained per use of this Feature. Use your STR modifier multiplied by 5 as your SP. ATK stat. The HP drained from Legendary Pokemon when this Feature is used counts towards the HP you regain as a result of Giga Drainâs Effect. You may not use Parasitic Embrace for 2 days after using Parasitic Embrace.');
INSERT INTO pokemondata2.trainer_features VALUES (599, 'Power Mimicry', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Mirror Move. Use your STR modifier multiplied by 5 as your SP. ATK or ATK stat, depending on whatever Stat the Move uses.');
INSERT INTO pokemondata2.trainer_features VALUES (600, 'Praise Me', 'Channeled Pokemon.', 0, '--', 'Static', 45, 'Channeled Pokemon have and may use the Move Helping Hand to target you. Each Pokemon who uses Helping Hand in this way may not benefit from Praise Me for 24 hours.');
INSERT INTO pokemondata2.trainer_features VALUES (601, 'Tremor', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Earthquake. Each previously Channeled Legendary Pokemon has 25 HP drained per use of this Feature. Use your STR modifier multiplied by 5 as your ATK stat. Instead of Earthquake having the keyword Burst, it instead has the keyword Blast when used with Tremor. You may not use Tremor for 3 days after using Tremor.');
INSERT INTO pokemondata2.trainer_features VALUES (602, 'Thunder Call', 'Pokemon or Trainer.', 1, '--', 'Trainer', 45, 'Use the Move Zap Cannon. Each previously Channeled Legendary Pokemon has 25 HP drained per use of this Feature. Use your STR modifier multiplied by 5 as your SP. ATK stat. You may not use Thunder Call for 3 days after using Thunder Call.');
INSERT INTO pokemondata2.trainer_features VALUES (603, 'Light Screen', 'Self.', 3, '--', 'Trainer', 46, 'Use the Move Light Screen.');
INSERT INTO pokemondata2.trainer_features VALUES (604, 'Reflect', 'Self.', 3, '--', 'Trainer', 46, 'Use the Move Reflect.');
INSERT INTO pokemondata2.trainer_features VALUES (605, 'Distraction! Distraction!', 'Pokemon or Trainer.', 0, '--', 'Free', 46, 'If the target use a Move or Feature that has a Damage Dice Roll on their next turn, they must target you. This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (606, 'Enough!', 'Self.', 2, '--', 'Trainer', 46, 'Use the Move Counter.');
INSERT INTO pokemondata2.trainer_features VALUES (607, 'For The Team', '--', 2, '--', 'Free', 46, 'You may Shift twice as an Interrupt, and Shift between an attacking foe and an allied Trainer or allied Pokemon in order to become the target of a successful Move. You take any damage and effects of the attack as if you were the original target. If you have already Shifted during this round of combat, before using For The Team, you may not Shift during the next round of combat.');
INSERT INTO pokemondata2.trainer_features VALUES (608, 'Guardian''s Blessing', 'Self, Trainers, or Pokemon.', 0, '--', 'Static', 46, 'You may use the Guardian Features Light Screen, Reflect or Safeguard as a Coat that affects only the target, instead of a wall, and lasts until the end of the encounter or the target is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (609, 'Not So Fast!', '--', 0, '--', 'Static', 46, 'You may use the Guardian Features Light Screen, Reflect, Safeguard, or Substitute as an Interrupt.');
INSERT INTO pokemondata2.trainer_features VALUES (610, 'Reflective Resonance', '--', 2, 'You or a Channeled Pokemon are hit by a super-effective attack.', 'Free', 46, 'If any Channeled Pokemon resists or is immune to the elemental Type of the Move with a Damage Dice Roll, you or your pokemon instead take damage as if the attack were neutral.');
INSERT INTO pokemondata2.trainer_features VALUES (611, 'Repel!', 'Self.', 2, '--', 'Trainer', 46, 'Use the Move Mirror Coat.');
INSERT INTO pokemondata2.trainer_features VALUES (612, 'Safeguard', 'Self.', 3, '--', 'Trainer', 46, 'Use the Move Safeguard.');
INSERT INTO pokemondata2.trainer_features VALUES (613, 'Savior''s Plight', 'Self.', 1, '--', 'Free', 46, 'You may use any Feature that targets only yourself as a Free action.');
INSERT INTO pokemondata2.trainer_features VALUES (614, 'Shared Struggle', '--', 0, 'An adjacent ally trainer or Pokemon is hit by a damaging Move.', 'Free', 46, 'You take half of the damage that would have been done to your ally. Your ally takes half of the damage it was supposed to take. Pokemon may not apply Defense or Special Defense to damage taken, and trainers, including yourself, may not apply any damage reduction modifiers.');
INSERT INTO pokemondata2.trainer_features VALUES (615, 'Substitute', 'Self.', 2, '--', 'Trainer', 46, 'Once per encounter, you may use the Move Substitute.');
INSERT INTO pokemondata2.trainer_features VALUES (616, 'War of Attrition', '--', 1, 'You use For The Team or Shared Struggle.', 'Free', 46, 'Subtract your Strength Stat from the damage you would take. Ignore Shared Struggle''s clause about Trainers not being allowed to apply damage reduction, exclusively for War of Attrition.');
INSERT INTO pokemondata2.trainer_features VALUES (617, 'Calling Chord', '--', 1, '--', 'Trainer', 47, 'Roll 1d20 and add your WIS modifier. If the roll exceeds 10, an Unown appears within 5 yards of you. If the roll exceeds 20, you may choose the Unownâs letter. It is not immediately hostile. Furthermore, each different Unown symbol counts as a different pokemon for the purposes of determining Pokemon owned.');
INSERT INTO pokemondata2.trainer_features VALUES (618, 'Letter Press', 'An Unown.', 0, '--', 'Trainer', 47, 'You may combine up a total of seven separate Unowns into one Pokemon. Combined Unowns retain all different instances of Hidden Power. When using Letter Press on Unown, for each instance of Hidden Power, choose whether it will operate on Attack stat or Special Attack stat. This choice is permanent. When combining Unowns, pick a Unown to be the Prime Unown of that combination. Whenever you add a Unown to a Prime Unown, add 3 points to any one of the Prime Unownâs Base stats. Unowns combined with Letter Press can be kept in a single Poke Ball. Once combined with Letter Press, Unowns cannot be separated.');
INSERT INTO pokemondata2.trainer_features VALUES (619, 'Banish', 'Pokemon or Trainer.', 2, '--', 'Trainer', 47, 'You must have 8 Unown with you to use this Feature. Roll 1d20 and add your WIS modifier. If the total exceeds 15, the target is removed from the encounter and placed into a pocket dimension known as Unown Space for until the end of your next turn. At that time, the target returns to the exact same spot it was, when it was Banished. The target does not feel any time lost during the it spends in Unown Space as a result of being hit by Banish. You may use Banish only once per encounter on any single target, but you may expend any number of uses of Banish at once to increase the duration of the banishment by 1 round for each use.');
INSERT INTO pokemondata2.trainer_features VALUES (620, 'Borrow Power', 'A Pokemon you are Channeling.', 3, '--', 'Trainer', 47, 'Choose an instance of Hidden Power Move on the Channeled Pokemonâs Move List. You may perform this move immediately as a Trainer Action. Use your STR mod as your Attack stat and your WIS mod as your Special Attack stat.');
INSERT INTO pokemondata2.trainer_features VALUES (621, 'Dimension Gate', 'An adjacent area, with nothing occupying the targeted area.', 1, '--', 'Trainer', 47, 'You must have 14 Unown with you to use this Feature. Choose an area you have visited in the past year. In the targeted area a magic door opens that, when stepped through, acts as a one-way door, which teleports you to the area you chose. The door teleports you into an open space that is not occupied by anything, or the nearest available area that isnât occupied by anything.');
INSERT INTO pokemondata2.trainer_features VALUES (622, 'Explosive Runes', '--', 1, '--', 'Trainer', 47, 'Expend a use of Borrow Power, and pick an instance of Hidden Power you could have selected with it. You write a sigil of power in Unown script. When a condition, as decided by you, has been met, the sigil explodes in a burst, dealing damage as if you had activated Borrow Power. When a sigil is activated, you become instantly aware of the fact. Only one sigil within 5 meters may detonate at a time; if multiple sigils are triggered, you are still alerted for each one, however. You may have up to X sigils of power active, where X is your Wisdom modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (623, 'Extra Eyes', '--', 0, '--', 'Static', 47, 'Any time you or a Channeled Pokemon would be targeted by an attack, add one to the target''s Evasion Bonus for each other Channeled Pokemon who is facing the attacker.');
INSERT INTO pokemondata2.trainer_features VALUES (624, 'Hidden Strength', '--', 0, '--', 'Static', 47, 'When you or any of your Prime Unown uses one of its Hidden Powers, you may choose to, instead of it acting as a Burst, have it act as a Column 1-meter wide, 15 meters long. Whenever your Prime Unown use Hidden Power, they always add +1/2 STAB to their damage roll, regardless of their typing.');
INSERT INTO pokemondata2.trainer_features VALUES (625, 'Rewrite', 'A Prime Unown.', 1, '--', 'Trainer', 47, 'Choose one of the target''s instances of Hidden Power. You may then choose to reroll the Type for this instance of Hidden Power, or the base damage for this instnace of Hidden Power.');
INSERT INTO pokemondata2.trainer_features VALUES (626, 'Ruin', 'A Pokemon or Trainer.', 1, '--', 'Trainer', 47, 'You must have 14 Unown with you to use this Feature. Make up to three AC5 attack rolls against the same target, each time picking one of Paralyzed, Burned, Poisoned, Asleep, or Confused. If an attack hits, the target is inflicted with the appropriate status.');
INSERT INTO pokemondata2.trainer_features VALUES (671, 'Trick Room', '--', 0, '--', 'Trainer', 50, 'Use the Move Trick Room. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (627, 'Sentry Runes', '--', 1, '--', 'Trainer', 47, 'You write a sigil of warding in Unown script. You may, at any time, close your eyes to channel the sigil. While channeling the sigil, you may and look and listen through it, and project your voice through it. The sigil may be of any size, but your ability to perceive and communicate through it are proportional to the size of the sigil; tiny writing will allow for a view only as big as a keyhole, for example. If a sigil of warding is destroyed or damaged, you are instantly aware of the fact. You may have up to X sigils of warding active, where X is your Wisdom modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (628, 'Unown Arms', 'A Prime Unown.', 1, '--', 'Trainer', 47, 'The Prime Unown turns into a weapon of your choice. When used with an Arms Feature, an Unown Weapon deals additional damage equal to the Prime Unownâs STAB value. Unown Weapons can be used to block incoming attacks, causing the Prime Unown to take the damage in your stead. This effect lasts up to 24 hours, or until the Prime Unown is knocked out or recalled. Prime Unown cannot use moves or special capabilities while in this state.');
INSERT INTO pokemondata2.trainer_features VALUES (629, 'Wordsmith', '--', 0, '--', 'Static', 47, 'You understand all written language. You know the meaning of any word you can read, and can fluenty read and understand any written passage, even if you cannot speak it.');
INSERT INTO pokemondata2.trainer_features VALUES (630, 'Possession', 'A Pokemon.', 0, '--', 'Trainer', 48, 'Roll a Link Check, subtract half of your Wisdom stat from the result. If you Channel the Pokemon, it is Possessed.\nWhile Possessed, you are in complete control of the Pokemon. You may act during an Encounter as any normal Pokemon would. You have access to the Pokemonâs Move List, Abilities and Capabilities. You may leave a Possessed Pokemon during your turn as a Trainer Action. If you are Possessing a Pokemon and you are captured, you are trapped until the Pokemon is sent out of its Poke Ball, at which point you may remove yourself from the Pokemon. You may use Trainer Features while Possessing a Pokemon, unless the Feature specifically says that you cannot. While Possessing a Pokemon, using a Move counts as your Trainer Action. If the Pokemon you are possessing faints, you may immediately return to your body. If you are Possessing a Pokemon and they are die, you die as well. While you are Possessing a Pokemon, your Body is left unconscious. It cannot make checks and it may not act on its own accord. You may Channel multiple Pokemon with Mystic Features, but you may only Possess one Pokemon at a time.\nA Shaman who is possessing a Pokemon can still make a Trainer Action, can still Issue a Command and may still Shift. To Shift they must use the Possessed Pokemonâs Speed Capabilities. If during your Trainer Action you use a Feat that enables you to use a Pokemon Move, you use the Possessed Pokemonâs appropriate stats instead of your own. Your Command works as normal.\nThis Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (631, 'Possession Borrow', '--', 1, 'You leave a Pokemon you were Possessing.', 'Free', 48, 'Choose a Move on the Pokemonâs Move List, whom you are leaving after Possessing them. This is considered a\nBorrowed Move. You may perform the Borrowed Move, once, as a Trainer Action during the next 24 hours. Use your STR modifier as your attack stat, and your WIS modifier as your special attack stat.');
INSERT INTO pokemondata2.trainer_features VALUES (632, 'Channel Strength', '--', 0, '--', 'Static', 48, 'Whenever a Channeled Pokemon use a Move that damages a target while you are Possessing a Pokemon, add 1d6 to the Damage Dice Roll for each other Channeled Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (633, 'Commune With Nature', '--', 0, '--', 'Free', 48, 'Whenever a Pokemon gains experience while you are Possessing them you may sacrifice 5 HP of your Trainer HP. If you do, the Pokemon gains +50% the amount of experience they would gain. You may only apply this Commune With Nature once per encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (634, 'Dominant Trait', '--', 2, '--', 'Free', 48, 'Your mental connection to Pokemon you are Possessing is strengthened; their minds are more difficult to influence. When a Pokemon you are Possessing is afflicted with Infatuation, Confusion or Sleep, you may activate Dominant Trait. Roll 1d20 and add your WIS modifier. If the total exceeds 10 Dominant Trait clears the Status Affliction.');
INSERT INTO pokemondata2.trainer_features VALUES (635, 'Fangs', '--', 1, 'You hit with a Melee Range Move (this can also be while Possessing a Pokemon).', 'Free', 48, 'Gain HP equal to half the damage dealt with the attack.');
INSERT INTO pokemondata2.trainer_features VALUES (636, 'Ferocious Embodiment', '--', 0, '--', 'Static', 48, 'Whenever a Pokemon you are possessing uses a Move that deals damage to a target, add your WIS modifier to the Damage Dice Roll.');
INSERT INTO pokemondata2.trainer_features VALUES (637, 'Loan Shark', '--', 0, '--', 'Static', 48, 'You may perform Borrowed Moves and Possession Borrowed Moves while Possessing a Pokemon, even if it''s not the Pokemon you Borrowed the Move from.');
INSERT INTO pokemondata2.trainer_features VALUES (638, 'Natural Selection', '--', 3, '--', 'Free', 48, 'When you are leaving the body of a Possessed Pokemon, you may use Natural Selection. Choose one of the following Capabilities. If the Pokemon you are possessing has this Capability, gain that Capability for the next 24 hours: Alluring, Aura, Chilled, Dream Smoke, Firestarter, Fountain, Freezer, Gilled, Glow, Groundshaper, Guster, Heater, Icestep, Inflatable, Magnetic, Materializer, Mind Lock, Pack Mon, Shrinkable, Sprouter, Stealth, Threaded, Tracker, Zapper. Your physical human form changes appropriately per Capability.');
INSERT INTO pokemondata2.trainer_features VALUES (639, 'Nature Skin', '--', 0, '--', 'Static', 48, 'Add your WIS modifier added to your STR modifier multiplied by 5 to your total HP. This only applies to your human body. This Feature replaces Mystic Veil.');
INSERT INTO pokemondata2.trainer_features VALUES (640, 'Primal Surge', '--', 0, '--', 'Static', 48, 'The Pokemon you are Possessing has its Speed related Capabiliites increased by X where X is half your WIS modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (641, 'Share With Nature', '--', 0, '--', 'Static', 48, 'When you target a loyal Pokemon you own with Possession, you automatically pass your Link Check.');
INSERT INTO pokemondata2.trainer_features VALUES (642, 'Survival of the Fittest', '--', 1, '--', 'Free', 48, 'While Possessing a Pokemon, Survival of the Fittest allows you to use any Move on the Possessed Pokemonâs Level Up Move List list that could be learned by level X. X is the sum of the Possessed Pokemonâs level and your Level.');
INSERT INTO pokemondata2.trainer_features VALUES (643, 'Soothing Song', 'Legendary Pokemon within line of sight.', 1, '--', 'Trainer', 49, 'The target gains 100 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (644, 'Tired Tune', '--', 0, '--', 'Trainer', 49, 'Using Tired Tune ends your turn. If this is the third time you used Tired Tune in a row, use the Move Sing before ending your turn.\nThe Touched uses musical instruments to play music. Touched characters may not issue commands, unless they have a means to communicate with their Pokemon while playing music (Pokemon may, with Intelligence 4 or greater for example, be able to understand musical cues to use moves, or if you can communicate telepathically, you could also get by this need to play music). The way their Features work depend on your playing music for a set amount of time, then activating the Features actual effects after some set time. You may not use more then one Touched Feature per turn. You may not use the same Touched Feature more than once per turn, either. If you are using a Touched Feature, that says that you may use an effect if youâve performed the Touched Feature during previous turns, they may be activated multiple turns in a row (Meaning a Touched Feature that activates on its third turn of use, it will also activate on a fourth, fifth or sixth turn afterwards, etc.).');
INSERT INTO pokemondata2.trainer_features VALUES (646, 'Able Aria', '--', 0, '--', 'Trainer', 49, 'Using Able Aria ends your turn. If this is the third time you used Able Aria in a row, use the Move Aromatherapy before ending your turn.');
INSERT INTO pokemondata2.trainer_features VALUES (647, 'Cardinal Concert', 'Pokemon or Trainer.', 1, '--', 'Trainer', 49, 'Roll 1d20 and add your STR modifier. If the total exceeds 10, the target heals 100 HP.');
INSERT INTO pokemondata2.trainer_features VALUES (648, 'Climate Carol', '--', 0, '--', 'Trainer', 49, 'Using Climate Carol ends your turn. If this is the fourth time you used Climate Carol in a row, use the Move Sunny Day, Rain Dance, Sandstorm, or Hail before ending your turn.');
INSERT INTO pokemondata2.trainer_features VALUES (649, 'Carrying Chorus', '--', 0, '--', 'Trainer', 49, 'If you used Tired Tune, Able Aria, Climate Carol, Daunting Descant, Exhausted Expression, Heroic Hymn, Nauseous Number, Odd Opera, or Perish Piece, during your last turn you may use Carrying Chorus. Carrying Chorus ends your turn. Using Carrying Chorus makes all future uses of any of the listed Touched Features count all previously used Touched Features and Carrying Chorus as the next listed Touched Feature you use. This means, that if you used Tired Tune, then Carrying Chorus, then Climate Carol it would count as you using Climate Carol for three turns.');
INSERT INTO pokemondata2.trainer_features VALUES (650, 'Daunting Descant', '--', 0, '--', 'Trainer', 49, 'Using Daunting Descant ends your turn. If this is the second time you used Daunting Descant in a row, use the Move Mean Look before ending your turn.');
INSERT INTO pokemondata2.trainer_features VALUES (651, 'Exhausted Expression', 'A Pokemon.', 0, '--', 'Trainer', 49, 'Using Exhausted Expression ends your turn. If this is the second time you used Exhausted Expression in a row, target Pokemon is lowered 1 Combat Stage for the Stat of your choice other than HP before ending your turn.');
INSERT INTO pokemondata2.trainer_features VALUES (652, 'Harmonious Harbringer', '--', 0, '--', 'Static', 49, 'Divide your STR modifier in half. Subtract this number from the number of turns needed to have a Touched Feature activate its effect. For example, if you are using Heroic Hymn, which activates on the seventh use, and you have a 4 STR modifier, subtract two from the seven turns it takes to activate Heroic Hymnâs power, making it activate in five turns and read as âIf this is the fifth time you used Heroic Hymn in a row...â No activation can be lowered to less than two, meaning a Featureâs activate time cannot read âIf this is the first time you used Touched Feature X...â It must always at least read, âIf this is the second time you used Touched Feature X in a row,...â');
INSERT INTO pokemondata2.trainer_features VALUES (653, 'Heroic Hymn', '--', 0, '--', 'Trainer', 49, 'Using Heroic Hymn ends your turn. If this is the seventh time you used Heroic Hymn in a row, all adjacent allies gain 2 Combat Stages for any Stat, per ally before ending your turn and you may not use Heroic Hymn on your next three turns during the next three rounds.');
INSERT INTO pokemondata2.trainer_features VALUES (654, 'Nauseous Number', '--', 0, '--', 'Trainer', 49, 'Using Nauseous Number ends your turn. If this is the third time you used Nauseous Number in a row, use the Move Teeter Dance before ending your turn and you may not use Nauseous Number on your next turn during the next round.');
INSERT INTO pokemondata2.trainer_features VALUES (655, 'Odd Opera', '--', 0, '--', 'Trainer', 49, 'Using Odd Opera ends your turn. If this is the fourth time you used Odd Opera in a row, use the Move Trick Room, Magic Room, or Gravity before ending your turn.');
INSERT INTO pokemondata2.trainer_features VALUES (656, 'Perish Piece', '--', 0, '--', 'Trainer', 49, 'Using Perish Piece ends your turn. If this is the foruth time you used Perish Piece in a row, use the Move Perish Song before ending your turn.');
INSERT INTO pokemondata2.trainer_features VALUES (657, 'Telekinesis', 'Any object that you may lift.', 0, '--', 'Trainer', 50, 'Add your INT and CON modifiers and multiply the total by 5 pounds. This represents the weight you may lift and items you may target with Telekinesis. Multiply your INT and CON modifiers then multiply that product by 3-meters. This is how far the target can be. You may not move that target more than the range of your Telekinesis. You need a line of sight to target the object. You can Shift the target up to X meters/spaces per turn where X is your INT or CON modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (658, 'Telepathy', 'Any other human.', 0, '--', 'Free', 50, 'You may read the surface thoughts of other humans, as well as project your surface thoughts to other humans. You may also project telepathic message to your Pokemon, but may not read your Pokemonâs minds.');
INSERT INTO pokemondata2.trainer_features VALUES (659, 'Extrasensory', 'A human or Pokemon.', 0, '--', 'Trainer', 50, 'Use the Move Extrasensory. Use your Constitution Stat as your SP. ATK stat. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (660, 'Gravity', '--', 0, '--', 'Trainer', 50, 'Use the Move Gravity. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (661, 'Light Screen', '--', 0, '--', 'Trainer', 50, 'Use the Move Light Screen. This Feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (662, 'Magic Room', 'A human or Pokemon.', 0, '--', 'Trainer', 50, 'Use the Move Magic Room. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (663, 'Phasing', 'Self.', 0, '--', 'Trainer', 50, 'Your CON modifier is X. You may move through solid objects for X seconds. Moves will miss and pass through you if you are Phasing. If you are still in a solid object after X seconds, you must reactivate Phasing to prevent death. If you run out of HP and are still in a solid object, you die. You may not make a death savings throw if you die while Phasing. You may take up to X people with you while Phasing. If you stop Phasing, they stop Phasing. If you stop Phasing someone you are Phasing, you stop Phasing as well. If you place a person into an object, and then stop Phasing them while they are still in that object, they may make a Savings throw of 7 on 1d20 to continue Phasing for X seconds, at which point they will stop Phasing. As a Free Action, anyone (Trainer or Pokemon) may resist Phasing. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (664, 'Probability Control', 'Any roll.', 0, '--', 'Trainer', 50, 'You may reroll any die, or have any ally reroll any die. For every time you use this ability per day, past the first use on any day, your GM gets one Murphyâs Law point. They may use this point to have you reroll any die that you havenât targeted with Probability Control, the GM may only target your dice rolls with Murphyâs Law Points. This Feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (665, 'Psychic Finder', 'A human or Pokemon.', 0, '--', 'Free', 50, 'You can identify if a psychic has affected someoneâs mind and identify the meddler, human and Pokemon alike by recognizing Psychic Residue. Also, as a free action, you may also roll 1d20 when using a Feature which leaves Psychic Residue. If your roll plus your INT modifier is higher then 15, you leave no psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (666, 'Psychic Force', 'Pokemon or Trainers.', 0, '--', 'Trainer', 50, 'Use the Move Psychic. Use your Constitution Stat as your SP. ATK stat. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (667, 'Psychokinesis', 'Any object that you may lift.', 0, '--', 'Trainer', 50, 'You may target objects you know of, but cannot see, with Telekinesis. You do not need a line of sight to move those objects.');
INSERT INTO pokemondata2.trainer_features VALUES (668, 'Reflect', '--', 0, '--', 'Trainer', 50, 'Use the Move Reflect. This Feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (669, 'Reflect Type', 'Self.', 0, '--', 'Trainer', 50, 'Use the Move Reflect Type. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (670, 'Teleport', 'Self.', 0, '--', 'Trainer', 50, 'Use the Move Teleport. This Feature drains 15 HP per use but only if the teleport succeeds (rolld > 7 on d20).');
INSERT INTO pokemondata2.trainer_features VALUES (672, 'Aerokinesis', '--', 0, '--', 'Trainer', 51, 'You may target air up to X meters away with Telekinesis to produce short, but powerful, bursts of air. You can move air rapidly and produce a steady flow of wind that blows at X miles per hour. X is your CON modifier multiplied by 5.');
INSERT INTO pokemondata2.trainer_features VALUES (673, 'Electrokinesis', '--', 0, '--', 'Trainer', 51, 'You may target electricity up to X meters away with Telekinesis and redirect it. X is your CON modifier multiplied by 5. You can also generate electricity in the air with Telekinesis to produce short, but powerful, bursts of electricity.');
INSERT INTO pokemondata2.trainer_features VALUES (674, 'Aerodynamics', '--', 0, '--', 'Static', 51, 'While the weather is Clear, you are treated as if your DEX was one point higher than the trainer immediately before you in action order, but only for the purposes of who acts first, not for evasion or features.');
INSERT INTO pokemondata2.trainer_features VALUES (675, 'Air Slash', 'Trainer or Pokemon.', 0, '--', 'Trainer', 51, 'Use the Move Air Slash. Use your Constitution Stat as your SP. ATK stat. This Feature drains 15 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (676, 'Charge', 'Self.', 0, '--', 'Trainer', 51, 'Use the Move Charge. This Feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (677, 'Defog', '--', 0, '--', 'Trainer', 51, 'Use the Move Defog. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (678, 'Discharge', 'Trainer or Pokemon.', 0, '--', 'Trainer', 51, 'Use the Move Discharge. Use your Constitution Stat as your SP. ATK stat. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (679, 'Flight', '--', 0, '--', 'Static', 51, 'You are treated as if you have a Sky Speed, using your CON modifier as the value. This Feature costs 2 HP for every round of use in combat, or 5 HP for every minute of use when not in combat.');
INSERT INTO pokemondata2.trainer_features VALUES (680, 'Hurricane', 'Trainer or Pokemon.', 0, '--', 'Trainer', 51, 'Use the Move Hurricane. Use your Constitution Stat as your SP. ATK stat. This Feature drains 25 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (681, 'Magnetic', '--', 0, '--', 'Static', 51, 'You are treated as if you have the Magnetic capability.');
INSERT INTO pokemondata2.trainer_features VALUES (682, 'Mass Levitation', 'Willing Trainers or Pokemon.', 0, '--', 'Trainer', 51, 'While using Flight, once per round, you may decrease your maximum Speed Capability by an amount that is at least 1 and at most your CON modifier minus 1, and divide that amount however you want between all targets. This feature costs 10 HP per use. For every round this Feature is in effect, you must pay 5 additional HP.');
INSERT INTO pokemondata2.trainer_features VALUES (683, 'Tailwind', 'Area.', 0, '--', 'Trainer', 51, 'Use the Move Tailwind. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (684, 'Thunderbolt', 'Trainer or Pokemon.', 0, '--', 'Trainer', 51, 'Use the Move Thunderbolt. Use your Constitution Stat as your SP. ATK stat. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (685, 'Thunder Wave', 'Trainer or Pokemon.', 0, '--', 'Trainer', 51, 'Use the Move Thunder Wave. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (686, 'Hour''s Past', 'An item, or the exact location you are at.', 0, '--', 'Trainer', 52, 'You can view a psychic panel summary of what has happened to that item or area in the past hour. The images are jumbled and might not be in chronological order.');
INSERT INTO pokemondata2.trainer_features VALUES (687, 'Image Tailing', 'An image seen while reading an object''s past.', 2, '--', 'Trainer', 52, 'Roll 1d20 and add your INT modifier. If the total exceeds 15, you can follow a part of the objectâs past. You may follow a ghostly image, seen only by yourself, of a person, pokemon or other object that came into contact with the object you were reading and left. The ghostly image can only be followed for up to a mile from the spot you began to read.');
INSERT INTO pokemondata2.trainer_features VALUES (688, 'Clairaudience', '--', 0, '--', 'Static', 52, 'You can hear sounds that occurred while using Hour''s Past, Day''s Past, and Item''s Past. You also can tell when a person is lying to you, unless they beleive what they are saying to be true.');
INSERT INTO pokemondata2.trainer_features VALUES (689, 'Clairvoyance', '--', 0, '--', 'Static', 52, 'When making an attack, subtract 5 from any Accuracy Checks you make. You can see through illusions.');
INSERT INTO pokemondata2.trainer_features VALUES (690, 'Day''s Past', 'An item, or the exact location you are at.', 2, '--', 'Trainer', 52, 'You can view a psychic panel summary of what has happened to that item or area in the past 24 hours. The images are jumbled and might not be in chronological order.');
INSERT INTO pokemondata2.trainer_features VALUES (691, 'Dispel Illusion', 'An illusion.', 1, '--', 'Trainer', 52, 'You can eliminate an illusion by touching the area it is projected upon. You can see through illusions and disguises but you cannot dispel them for other people and Pokemon to see more then once per day. Although you can see through disguises, you cannot phsycailly force the disguise to be reverted. An example of a disguise would be a Dittoâs transformation. An example of illusions would be a a Double Team or some other source of magical illusion.');
INSERT INTO pokemondata2.trainer_features VALUES (692, 'Itemfinder', 'The exact location you are at.', 3, '--', 'Trainer', 52, 'Roll 1d20 and add your INT modifier. If the total exceeds 20, you will be guided to a nearby dropped item. The item found will depend on your location.');
INSERT INTO pokemondata2.trainer_features VALUES (693, 'Item''s Past', 'An item, or the exact location you are at.', 2, '--', 'Trainer', 52, 'You can view a psychic panel summary of what has happened to that item or area in the past week. If the item or place has historical significance within the past decade, you are aware of it, but exactly what happened isnât necessarily clear. This Feature replaces Dayâs Past.');
INSERT INTO pokemondata2.trainer_features VALUES (694, 'Personfinder', 'A person you have met and physically touched before.', 1, '--', 'Trainer', 52, 'Roll 1d20 and add your INT modifier. If the total exceeds 15, you know the direction of the target.');
INSERT INTO pokemondata2.trainer_features VALUES (695, 'Personfinder +', 'A person you have met and physically touched before.', 2, '--', 'Trainer', 52, 'Roll 1d20 and add your INT modifier. If the total exceeds 15, you know the direction of the target and an estimated distance between the target and yourself. This Feature replaces Personfinder.');
INSERT INTO pokemondata2.trainer_features VALUES (696, 'Psychometry', 'An item.', 0, '--', 'Trainer', 52, 'You know the purpose of any non-living thing that you touch. You know of any special abilities the item grants. You also know how to activate any item.');
INSERT INTO pokemondata2.trainer_features VALUES (697, 'Botanokinesis', '--', 0, '--', 'Trainer', 53, 'When targeting any type of plant with Telekinesis, multiply your INT and CON modifierâs sum by 10 pounds instead of 5 pounds. You can rapidly grow any plant you can lift 5 ft per round by subtracting 10 HP from yourself.');
INSERT INTO pokemondata2.trainer_features VALUES (698, 'Terrakinesis', '--', 0, '--', 'Trainer', 53, 'When targeting any type of rock or piece of ground with Telekinesis, multiply your INT and CON modifierâs sum by 10 pounds instead of 5 pounds. You can mold earth into rock and break up rock into dirt. As long as you are conscious, you and your non-Pokemon allies within 10 meters do not take damage from Sandstorm.');
INSERT INTO pokemondata2.trainer_features VALUES (699, 'Aromatherapy', 'Trainer or Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Aromatherapy. This Feature drains 15 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (700, 'Cotton Spore', 'A Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Cotton Spore. This Feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (701, 'Digger', '--', 0, '--', 'Static', 53, 'You are treated as if you have a Burrow Speed, using your CON modifier as the value. This Feature costs 2 HP for every round of use in combat, or 5 HP for every minute of use when not in combat.');
INSERT INTO pokemondata2.trainer_features VALUES (702, 'Earth Vision', '--', 0, '--', 'Static', 53, 'You may now see through rock, dirt, ground, sand, etc. as if it were not there, for a distance of up to X meters, where X is your CON modifier plus your INT modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (703, 'Giga Drain', 'Trainer or Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Giga Drain. Use your Constitution Stat as your SP. ATK stat. This Feature drains 15 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (704, 'Leaf Storm', 'Trainer or Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Leaf Storm. Use your Constitution Stat as your SP. ATK stat. This Feature drains 25 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (705, 'Materializer', '--', 0, '--', 'Static', 53, 'You are treated as if you have the Materializer capability.');
INSERT INTO pokemondata2.trainer_features VALUES (706, 'Rock Slide', 'Trainer or Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Rock Slide. Use your Constitution Stat as your ATK stat. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (707, 'Sandstorm', '--', 0, '--', 'Trainer', 53, 'Use the Move Sandstorm. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (708, 'Sand Tomb', 'Trainer or Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Sand Tomb. Use your Constitution Stat as your SP. ATK stat. This Feature drains 7 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (709, 'Sand-Attack', 'Trainer or Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Sand-Attack. This Feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (710, 'Stone Edge', 'Trainer or Pokemon.', 0, '--', 'Trainer', 53, 'Use the Move Stone Edge. Use your Constitution Stat as your ATK stat. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (711, 'Calming Vibe', 'Pokemon or Trainers.', 0, '--', 'Trainer', 54, 'You calm the target, curing it of Confusion. Calming Vibe can calm rages, focus a distorted mind, or neutralize a paranoid panic. In order to use Calming Vibe, the Trainer must be in a calm state of mind. Using this on a target leaves discoverable psychic residue. This Feature drains 7 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (712, 'Light Healing Power', 'Pokemon or Trainers.', 3, '--', 'Trainer', 54, 'Roll 1d12+6 and add twice your INT modifier. The target heals that many Hit Points. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (713, 'Bonds', '--', 0, '--', 'Static', 54, 'While you are unconscious, your Pokemon can act on their accord as if you are not unconscious. You may only have as many Pokemon acting per round of an encounter as if you were conscious.');
INSERT INTO pokemondata2.trainer_features VALUES (714, 'Connection', 'Your Pokemon.', 0, '--', 'Static', 54, 'You understand any owned Pokemon''s thoughts.');
INSERT INTO pokemondata2.trainer_features VALUES (715, 'Digging', 'Pokemon or Trainers.', 0, '--', 'Static', 54, 'You may read thoughts from the past four hours in a mind with Telepathy. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (716, 'Healing Power', 'Pokemon or Trainers.', 2, '--', 'Trainer', 54, 'Roll 2d12+12 and add twice your INT modifier. The target heals that many Hit Points. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (717, 'Heal the Body', 'Pokemon or Trainers.', 3, '--', 'Trainer', 54, 'Cures the target of Burn and Poison. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (718, 'Mend the Mind', 'Pokemon or Trainers.', 3, '--', 'Trainer', 54, 'Cures the target of Paralysis and Sleep. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (719, 'Major Healing Power', 'Pokemon or Trainers.', 2, '--', 'Trainer', 54, 'Roll 3d12+18 and add your INT stat. The target heals that many Hit Points. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (720, 'Natural Connection', 'Pokemon.', 0, '--', 'Static', 54, 'You understand Pokemon''s thoughts. This Feature replaces Connection.');
INSERT INTO pokemondata2.trainer_features VALUES (721, 'Serious Healing Power', 'Pokemon or Trainers.', 2, '--', 'Trainer', 54, 'Roll 4d12+24 and add your INT stat. The target heals that many Hit Points. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (722, 'Pain Share', 'A Pokemon or Trainer taking damage.', 0, '--', 'Free', 54, 'You may half the damage the target takes. If you do, subtract the amount of damage you prevent from your HP, then subtract another 5 HP from your HP for each time youâve used Pain Share during that day before this instance.');
INSERT INTO pokemondata2.trainer_features VALUES (723, 'Pain Split', 'Pokemon or Trainers.', 1, '--', 'Trainer', 54, 'Use the Move Pain Split. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (724, 'Rest', 'Self.', 1, '--', 'Trainer', 54, 'After a ten-minute break you recover your full HP.');
INSERT INTO pokemondata2.trainer_features VALUES (725, 'Trying On Shoes', 'Pokemon or Trainers.', 0, '--', 'Trainer', 54, 'You may read thoughts from the past day in a mind with Telepathy. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (726, 'Wish', 'Pokemon or Trainers.', 1, '--', 'Trainer', 54, 'Use the Move Wish. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (727, 'Photokinesis', '--', 0, '--', 'Trainer', 55, 'You may target light with Telekinesis and produce more light or take it away. You may remove light from an area completely or spontaneously generate light. Photokinesis has a maximum range of X, where X is your CON modifier multiplied by your INT modifier multiplied by 3 meters. If either modifier is negative or zero, use 1 as that modifier instead.');
INSERT INTO pokemondata2.trainer_features VALUES (728, 'Pyrokinesis', '--', 0, '--', 'Trainer', 55, 'You may target fire up to X meters away with Telekinesis and redirect it. X is your CON modifier multiplied by 5. You can also generate fire in the air with Telekinesis to produce short, but powerful, bursts of fire.');
INSERT INTO pokemondata2.trainer_features VALUES (729, 'Double Team', '--', 0, '--', 'Trainer', 55, 'Use the Move Double Team. You may not have more than three copies of yourself at any time. The copies fade after 10 minutes. This Feature drains 25 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (730, 'Fire Blast', 'Trainer or Pokemon.', 0, '--', 'Trainer', 55, 'Use the Move Fire Blast. Use your CON stat as your SP. ATK stat. This Feature drains 25 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (731, 'Fire Spin', 'Trainer or Pokemon.', 0, '--', 'Trainer', 55, 'Use the Move Fire Spin. Use your CON stat as your SP. ATK stat. This Feature drains 7 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (732, 'Flash', 'Trainer or Pokemon.', 0, '--', 'Trainer', 55, 'Use the Move Flash. This Feature drains 5 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (733, 'Heat Seeker', '--', 0, '--', 'Static', 55, 'You can see in the infrared spectrum, allowing you to easily view sources of heat.');
INSERT INTO pokemondata2.trainer_features VALUES (734, 'Lava Plume', 'Trainer or Pokemon.', 0, '--', 'Trainer', 55, 'Use the Move Lava Plume. Use your CON stat as your SP. ATK stat. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (735, 'Mirage', '--', 0, '--', 'Trainer', 55, 'You create a visual illusion. You must remain within 10 meters of the Mirage and concentrate to maintain and control the illusion. No one dimension of the illusion may exceed X meters, and the illusion persists for Y minutes. At the end of this time, you may continue to maintain the illusion by paying Mirageâs activation cost again. X is your CON modifier halved. Y is your CON modifier. You may only have one Mirage active at any given time. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (736, 'Night Daze', 'Trainer or Pokemon.', 0, '--', 'Trainer', 55, 'Use the Move Night Daze. Use your CON stat as your SP. ATK stat. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (737, 'Shadow Ball', 'Trainer or Pokemon.', 0, '--', 'Trainer', 55, 'Use the Move Shadow Ball. Use your CON stat as your SP. ATK stat. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (738, 'Shimmering Shroud', '--', 0, '--', 'Static', 55, 'When a Move that you use via Fire Breather Features modifies accuracy checks, it modifies the check by one more than it would have.');
INSERT INTO pokemondata2.trainer_features VALUES (739, 'Shadow Walker', '--', 0, '--', 'Static', 55, 'You gain the Invisibility capability. Activating the capability costs 15 HP per use. You may not use any Features that do damage or allow you to use Pokemon Moves while Invisible.');
INSERT INTO pokemondata2.trainer_features VALUES (740, 'Sunny Day', '--', 0, '--', 'Trainer', 55, 'Use the Move Sunny Day. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (741, 'Glare', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Glare. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (742, 'Hypnosis', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Hypnosis. This Feature Drains 10 HP per use. This Feature only Drains 10 of the userâs HP if it misses.');
INSERT INTO pokemondata2.trainer_features VALUES (743, 'Captivate', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Captivate, ignoring genders. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (744, 'Confuse Ray', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Confuse Ray. Using this on a target leaves discoverable psychic residue. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (745, 'Curse', 'Pokemon or Trainers.', 2, '--', 'Trainer', 56, 'Use the Move Curse as if you are Ghost Type. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (746, 'Dream Eater', 'Sleeping Pokemon or Trainers.', 2, '--', 'Trainer', 56, 'Use the Move Dream Eater. Use your Intelligence Stat as your SP. ATK stat. Using this on a target leaves discoverable psychic residue.');
INSERT INTO pokemondata2.trainer_features VALUES (747, 'Fake Tears', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Fake Tears. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (748, 'Featherdance', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Featherdance. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (749, 'Fumble', 'Pokemon or Trainers.', 0, '--', 'Free', 56, 'Force the target to reroll any successful check. Using this on a target leaves discoverable psychic residue. For every time you use this ability per day, past the first use on any day, your GM gets one Murphyâs Law point. They may use this point to have you reroll any die you did not target with Fumble, the GM may only target your dice rolls with Murphyâs Law Points. This Feature drains 25 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (750, 'Hex', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Hex. Use your Intelligence Stat as your SP. ATK stat. This Feature drains 15 HP per use');
INSERT INTO pokemondata2.trainer_features VALUES (751, 'Poison Gas', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Poison Gas. This Feature drains 15 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (752, 'Scary Face', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Scary Face. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (753, 'Screech', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Screech. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (754, 'Will-O-Wisp', 'Pokemon or Trainers.', 0, '--', 'Trainer', 56, 'Use the Move Will-O-Wisp. This Feature drains 15 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (755, 'Mental Suggestion', 'Pokemon or Trainers.', 2, '--', 'Trainer', 57, 'Roll 1d20 and add your INT modifier. If the total exceeds 20, you may place a suggestion into the targetâs mind. The target doesnât need to act on it, nor do they immediately know why they thought of it.');
INSERT INTO pokemondata2.trainer_features VALUES (756, 'Now to Act', 'Pokemon or Trainers.', 0, '--', 'Trainer', 57, 'Roll 1d20 and add your INT modifier. If the total exceeds 15, the target will act on a suggestion on their mind. If the suggestion is entirely contradictory to their regular behavior, they will be hesitant throughout the execution of the suggestion. If it isnât possible to execute the suggestion, they will fail trying. Using this on a target leaves discoverable psychic residue. This Feature drains 25 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (757, 'Attitude Adjustment', 'A Pokemon', 1, '--', 'Trainer', 57, 'Roll 1d20 and add your INT modifier. If the result is higher than 15, choose 5 different Natures and assign each to the numbers 2, 3, 4, 5, 6. Roll 1d6; on a result of 1, Attitude Adjustment fails; on a result of 2-6, give the target the assigned Nature.');
INSERT INTO pokemondata2.trainer_features VALUES (758, 'Attitude Adjustment +', 'A Pokemon', 1, '--', 'Trainer', 57, 'Roll 1d20 and add your INT modifier. If the result is higher than 15, choose a Nature and give the target the assigned Nature. This Feature replaces Attitude Adjustment.');
INSERT INTO pokemondata2.trainer_features VALUES (759, 'Dream Eater', 'Pokemon or Trainers', 0, '--', 'Trainer', 57, 'Use the Move Dream Eater. Use your Intelligence Stat as your SP. ATK stat. Using this on a target leaves discoverable psychic residue. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (760, 'Fear', 'Pokemon or Trainers', 0, '--', 'Trainer', 57, 'Roll 1d20 and add your INT modifier. If the result exceeds 15, the target becomes Fearful for 10 minutes. When targeting a Fearful target, rolls need -2 to hit. While Fearful you must roll +2 to hit with anything. Wild targets will try to flee while Fearful. Using this on a target leaves discoverable psychic residue. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (761, 'Imposed Caution', 'Pokemon or Trainers', 0, '--', 'Trainer', 57, 'For 10 minutes, the target needs -3 to hit with any type of attack. For 10 minutes, the targetâs Speed is halved. Using this on a target leaves discoverable psychic residue. This Feature drains 7 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (762, 'Imposed Focus', 'Pokemon or Trainers', 0, '--', 'Trainer', 57, 'For 10 minutes, the target needs -3 to hit with any type of attack. Using this on a target leaves discoverable psychic residue. This Feature drains 17 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (763, 'Memory Lapse', 'Pokemon or Trainers', 0, '--', 'Trainer', 57, 'Roll 1d20 and add your INT modifier. If the result exceeds 15, the target will forget a memory of your choice for 10 minutes. If the result exceeds 20, the target will forget a memory of your choice for 1 hour. This can include a Move, Ability or Feature. Using this on a target leaves discoverable psychic residue. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (764, 'Mind Control', 'Pokemon or Trainers', 0, '--', 'Trainer', 57, 'You have control of the target entirely. You know what they know and can have them do\nanything they are capable of doing. If you use mind control for more then 30 seconds at a time, you drain 40 HP every 6 seconds. Anyone may try to break out from Mind Control by making a Will check. The Check is to roll equal to or greater than the difference between the Mind Controllerâs Intelligence and the targetâs Intelligence on 1d20, adding the targetâs INT modifier. If the check is successful, the Mind  Controller does not lose the 25, or 40, HP they would have if they were successful in Mind Controlling the target. The target may attempt the Will check once per round. Using this on a target leaves discoverable psychic residue. This Feature drains 25 HP per use, every 6 seconds.');
INSERT INTO pokemondata2.trainer_features VALUES (765, 'Nightmare', 'Pokemon or Trainers', 0, '--', 'Trainer', 57, 'Use the Move Nightmare. Using this on a target leaves discoverable psychic residue. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (766, 'Stop', 'Pokemon or Trainers', 1, '--', 'Trainer', 57, 'Roll 1d20 and add your INT modifier. If the result exceeds 15, the target becomes immobile for 30 seconds. Using this on a target leaves discoverable psychic residue. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (767, 'Cryokinesis', '--', 0, '--', 'Trainer', 58, 'When targeting any type of frozen water with Telekinesis, multiply your INT and CON modifierâs sum by 10 pounds instead of 5 pounds. You can mold ice into other forms of ice and freeze water by thought. As long as you are conscious, you and your non-Pokemon allies within 10 meters do not take damage from Hail.');
INSERT INTO pokemondata2.trainer_features VALUES (768, 'Hydrokinesis', '--', 0, '--', 'Trainer', 58, 'When targeting any type of water with Telekinesis, multiply your INT and CON modifierâs sum by 10 pounds instead of 5 pounds. You can mold water into other forms of water and produce small quantities of water from the air by thought.');
INSERT INTO pokemondata2.trainer_features VALUES (769, 'Blizzard', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Blizzard. Use your Constitution Stat as your SP. ATK stat. This Feature drains 25 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (770, 'Cool Running', '--', 0, '--', 'Static', 58, 'You gain the Icestep capability. In addition, you may cross still or slow-moving water by walking on the surface.');
INSERT INTO pokemondata2.trainer_features VALUES (771, 'Hail', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Hail. Use your Constitution Stat as your SP. ATK stat. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (772, 'Haze', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Haze. Use your Constitution Stat as your SP. ATK stat. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (773, 'Icicle Crash', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Icicle Crash. Use your Constitution Stat as your SP. ATK stat. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (774, 'Mist', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Mist. Use your Constitution Stat as your SP. ATK stat. This Feature drains 8 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (775, 'Rain Dance', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Rain Dance. Use your Constitution Stat as your SP. ATK stat. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (776, 'Rainy Mood', '--', 0, '--', 'Static', 58, 'As long as either you are near a large body of water such as a lake or ocean or the weather is Rain or Hail, you may have water and ice typed Pokemon Moves you use via Rain Waker Features originate at significant sources of water nearby. Significant sources of water are at least enough to submerge a Small sized Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (777, 'Splash Damage', 'Pokemon or Trainers', 0, 'You use an Ice or Water Typed Move', 'Trainer', 58, 'The Move you use hits an additional adjacent target. If the Move you use already hits an area, instead choose an additional target adjacent to any edge of the area of effect. Activate Splash Damage only once per Move. Splash Damage drains only 5 HP if you are using a Water Typed Move and Rain is active or if you are using an Ice Typed Move and Hail is active. This Feature drains 10 HP per use');
INSERT INTO pokemondata2.trainer_features VALUES (778, 'Surf', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Surf. Use your Constitution Stat as your SP. ATK stat. This Feature drains 20 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (779, 'Swimmer', '--', 0, '--', 'Static', 58, 'You are treated as if you have Surface and Underwater Speeds, adding your CON modifier to the value of your Overland Speed. You may breathe underwater for X mins per hour, were X is your Constitution stat in minutes.');
INSERT INTO pokemondata2.trainer_features VALUES (780, 'Waterfall', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Waterfall. Use your Constitution Stat as your SP. ATK stat. This Feature drains 10 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (781, 'Whirlpool', 'Pokemon or Trainers', 0, '--', 'Trainer', 58, 'Use the Move Whirlpool. Use your Constitution Stat as your SP. ATK stat. This Feature drains 7 HP per use.');
INSERT INTO pokemondata2.trainer_features VALUES (782, 'Befriend', 'A Restrained Pokemon', 0, '--', 'Trainer', 59, 'Give the Pokemon the Helpful title. This ally will remain under the Rangerâs guidance until it is hit by an attack, severely distracted, or has helped the Ranger in a significant manner once, such as by making an attack. You do not get a list of any capabilities or moves you cannot deduce yourself, and it cannot be taken from the area you found it in or it will run away. You may only give the Helpful title to one Pokemon at a time.');
INSERT INTO pokemondata2.trainer_features VALUES (783, 'Companion', 'A previously wild, Restrained Pokemon.', 0, '--', 'Trainer', 59, 'Give the Pokemon the Companion title. You may only have one Companion at a time. If you give a new Pokemon the Companion title, you free your previous Companion and replace it with your new one. This process starts the Companion at Loyalty 2 at least and obedient towards the\nRanger, regardless of circumstances before being Restrained. The Companion gains experience and levels exactly like a Captured Pokemon, as well as counting as Owned for the purposes of levels and features, but cannot participate in official battles or contests (doing so is fraud). The Pokemon cannot be returned to a Poke Ball, and Pokemon Centers may charge more for healing a Companion. Companions are considered Helpful, but act in combat as if they were owned.');
INSERT INTO pokemondata2.trainer_features VALUES (784, 'Authority Figure', '--', 0, '--', 'Static', 59, 'You take on the responsibilities of a ranking Ranger officer. You may give orders to Rangers and police officers. A police chief may overrule your orders to police, but none may overrule your orders to Rangers. When requesting assistance from a local Ranger station on an important issue, you are obligated to receive help in some form except for in extraordinary circumstances.');
INSERT INTO pokemondata2.trainer_features VALUES (785, 'Befriender', '--', 0, '--', 'Static', 59, 'You may subtract an additional 10 from your Restrain rolls, and you may give the Helpful title to two additional Pokemon. You may take this feature up to two times, for a total of -30 on Restrain Rolls and 5 Helpful Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (786, 'Dizzy', 'A Pokemon or Trainer.', 3, '--', 'Trainer', 59, 'Roll 1d20 and add your DEX or CHA modifier. If the total is 15 or higher, the Target is Confused. Use of this feature requires your Capture Styler.');
INSERT INTO pokemondata2.trainer_features VALUES (787, 'Dragonite Bus', '--', 0, '--', 'Trainer', 59, 'You may call the Dragonite Bus to schedule transportation from any major city to any other major city, provided there are no major bodies of water between the cities. You must make plans at least 24 hours ahead of time.');
INSERT INTO pokemondata2.trainer_features VALUES (788, 'Part of the Team', 'Your Companion that has been with you for at least a month.', 0, '--', 'Trainer', 59, 'Spend one hour talking and negotiating with the target and roll 1d100, subtracting half of your Charisma stat from the roll. If you roll under the Pokemonâs Loyalty multiplied by 10, then the target will agree to being captured by you. After capturing, the Pokemon is still considered your Companion for the purposes of features. You may designate a new Companion as if the previous one had been released without removing the Companion title from the target. If Part of The Team fails, its use is not depleted.');
INSERT INTO pokemondata2.trainer_features VALUES (789, 'Perfect Practice', 'A Restrain Roll', 3, '--', 'Free', 59, 'When Restraining a Pokemon, subtract your DEX or CHA modifier multiplied by 3 from your Restrain roll. This may only be used once per restrain roll. If you successfully restrain a Pokemon when using this feature, you are given a partial list of moves known by the Pokemon, and know of all available capabilities');
INSERT INTO pokemondata2.trainer_features VALUES (815, 'Master Befriender', '--', 0, '--', 'Static', 61, 'You may give the Helpful title to two additional Pokemon. Upon taking this Feature you now can control up to 7 Helpful Pokemon. You may still have your Companion in addition to the 7 Helpful Pokemon you may Restrain.');
INSERT INTO pokemondata2.trainer_features VALUES (790, 'Poke-Assist', 'Your Companion or a Helpful Pokemon.', 1, '--', 'Free', 59, 'For a number of rounds equal to half of either your DEX or CHA modifiers, the target acts on its own in combat, attacking opponents of its own free will without requiring orders. The GM controls Pokemon under the effect of this feature. The target does not flee or retreat if injured while under the effects of this feature. Only one Pokemon may be under the effects of this feature at any given time. This feature may not be active while its user is currently using Dual Wielding.');
INSERT INTO pokemondata2.trainer_features VALUES (791, 'Resources', 'Self', 0, '--', 'Trainer', 59, 'You call in support from at least one Ranger in the area. This Ranger will go directly to you and meet you as soon as possible, and assist you with any pressing business, but will not leave the area or otherwise completely abandon their current task unless ordered otherwise by an authority above both of you.');
INSERT INTO pokemondata2.trainer_features VALUES (792, 'Safe Passage', 'A Route', 2, '--', 'Trainer', 59, 'Roll 1d20 and add your DEX and CHA modifiers. If the total exceeds 20, you can make it across the target route without any hostile encounters from any routine wild Pokemon for the day.');
INSERT INTO pokemondata2.trainer_features VALUES (793, 'Specialist Befriender', 'Any Route, Town, City, Mountain, etc.', 2, '--', 'Trainer', 59, 'Chose one of the following capabilities: Alluring, Amorphous, Chilled, Firestarter, Fountain, Freezer, Gilled, Glow, Groundshaper, Guster, Heater, Icestep, Inflatable, Magnetic, Shrinkable, Sinker, Sprouter, Threaded. Roll 1d20 and add your CHA modifier, if the total is higher then 17 a Pokemon with your chosen Capability appears nearby. Any attempt at attacking or capturing the Pokemon results in the Pokemon fleeing without fail. The Pokemon must still be made Helpful or Companion to use. You must take this Feature again for a different capability.');
INSERT INTO pokemondata2.trainer_features VALUES (794, 'Styler Master', 'An Owned Pokemon', 2, '--', 'Trainer', 59, 'Make a Restrain Check. You may target the owned Pokemon with Befriend. Owned Pokemon will not attack their own trainer unless they are Loyalty 2 or lower. Pokemon of Loyalty 3 or higher will not attack allies of their trainer. Owned Pokemon are Helpful until having been returned by their trainer, or until they have attacked a valid target. Attempting to force a high loyalty Pokemon to attack  their allies will negate the restrain. You do not learn the Pokemonâs Loyalty value upon restraining.');
INSERT INTO pokemondata2.trainer_features VALUES (795, 'Ward', '--', 2, 'You successfully restrain a wild Pokemon.', 'Trainer', 59, 'The wild Pokemon flees without fail. Roll 1d20 and add your DEX and CHA modifiers, if the total is higher then 20, the restrained Pokemon and any wild Pokemon of a lower level than the target who are its allies flee without fail');
INSERT INTO pokemondata2.trainer_features VALUES (796, 'Faster', 'One of your Active Pokemon', 3, '--', 'Free', 60, 'Your targeted Pokemonâs Speed related Capabilities are increased by X where X is your CHA modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (797, 'Stronger', 'One of your Active Pokemon', 3, '--', 'Free', 60, 'For one Round, or one minute out of combat, your targeted Pokemonâs Power Capability is increased by X where X is half your CHA modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (798, 'Better', 'One of your active Pokemon, under the effect of Smarter.', 2, '--', 'Free', 60, 'For one Round, your targeted Pokemonâs Special Attack or Special Defense is increased by one Combat Stage. You may use this Feature multiple times at once, but only to a maximum of 2 Combat Stages in each stat.');
INSERT INTO pokemondata2.trainer_features VALUES (799, 'Harder', 'One of your active Pokemon, under the effect of Tougher.', 2, '--', 'Free', 60, 'For one Round, your targeted Pokemonâs Attack or Defense is increased by one Combat Stage. You may use this Feature multiple times at once, but only to a maximum of 2 Combat Stages in each stat.');
INSERT INTO pokemondata2.trainer_features VALUES (800, 'Higher', 'One of your Active Pokemon', 3, '--', 'Free', 60, 'For one Round, or one minute out of combat, your targeted Pokemonâs Jump Capability is increased by X where X is half your CHA modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (801, 'Make Us Stronger', 'One of your Pokemon who felled a Pokemon or trainer during the past 3 rounds of combat.', 1, '--', 'Free', 60, 'For one Round, add half of your CHA modifier to your Pokemonâs highest stat. This Feature\nmay grant temporary HP.');
INSERT INTO pokemondata2.trainer_features VALUES (802, 'More Than Ever', 'One of your Active Pokemon', 1, '--', 'Trainer', 60, 'For one Round, the Coach Features: Better, Harder and Quicker, may be used up to 3 times in one round on the same Pokemon instead of being limtied to 2 Combat Stages. For one Round, Coach Features that increase Capabilities double their bonuses.');
INSERT INTO pokemondata2.trainer_features VALUES (803, 'Never Over', 'One of your Active Pokemon', 0, '--', 'Static', 60, 'If the Pokemonâs HP is lowered to 0 or less, it may still act and shift but may not use Moves. If they are lowered to -50% HP, they make a Death Saving Throw and this Featureâs effect is cancelled.');
INSERT INTO pokemondata2.trainer_features VALUES (804, 'Quicker', 'One of your active Pokemon under the effect of Faster.', 2, '--', 'Free', 60, 'For one Round, your targeted Pokemonâs Speed is increased by one Combat Stage. You may use this Feature multiple times at once, but only to a maximum of 2 Combat Stages per stat.');
INSERT INTO pokemondata2.trainer_features VALUES (805, 'Smarter', 'One of your Active Pokemon', 3, '--', 'Free', 60, 'For one Round, or one minute out of combat, your targeted Pokemon may ignore the penalties for Rough or Icy Terrain, and may move through a space occupied by a hostile Pokemon or Trainers freely.');
INSERT INTO pokemondata2.trainer_features VALUES (806, 'Tougher', 'One of your Active Pokemon', 3, '--', 'Free', 60, 'For one Round, your targeted Pokemon may ignore any lowered Stats or Combat Stages from Status Effects.');
INSERT INTO pokemondata2.trainer_features VALUES (807, 'Work It', 'One of your Active Pokemon', 2, '--', 'Free', 60, 'For one Round, all your Pokemonâs Moves with a Damage Dice Roll gain the Push keyword, and Push any targets a number of meters equal to the Pokemonâs Power Capability if the Move uses Attack, or Intelligence Capability if the Move uses Special Attack.');
INSERT INTO pokemondata2.trainer_features VALUES (808, 'Commander''s Demeanor', '--', 0, '--', 'Static', 61, 'Your experiences under heavy stress and crises situations has made you a natural leader. Whenever you make a Charisma check, add +5 to your roll.');
INSERT INTO pokemondata2.trainer_features VALUES (809, 'Encourage', 'An Allied Trainer', 2, '--', 'Free', 61, 'If the target successfully deals damage to an enemy on their next turn and you dealt damage to that same enemy on your last turn, they deal additional damage equal to your Charisma modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (810, 'At My Signal', 'An Allied Trainer', 2, '--', 'Free', 61, 'Use immediately after dealing damage to an enemy. If the target makes an accuracy roll on their next turn, they add half of your CHA modifier to their Accuracy Roll.');
INSERT INTO pokemondata2.trainer_features VALUES (811, 'Commander''s Rally', '--', 1, '--', 'Trainer', 61, 'All allied trainers within sight or hearing range of you gain +3 to all of their modifiers for a\nnumber of rounds equal to your CHA modifier. This Feature may only be in effect once at any given\ntime.');
INSERT INTO pokemondata2.trainer_features VALUES (812, 'Herder', '--', 0, '--', 'Static', 61, 'You may make two Restraint attempts as one Trainer Action. You must target two, adjacent Pokemon when using Herder.');
INSERT INTO pokemondata2.trainer_features VALUES (813, 'Inspiring Prescence', 'An Allied Trainer', 1, '--', 'Free', 61, 'Use immediately after dealing damage to an enemy. The target gains Temporary HP equal to twice your CHA modifier until the end of the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (814, 'Leader''s Guidance', 'An Allied Trainer', 3, '--', 'Trainer', 61, 'Target allied Trainer may immediately perform any trainer action or feature that has a frequency of At-Will.');
INSERT INTO pokemondata2.trainer_features VALUES (816, 'Pull Through!', 'An Ally makes a roll due to a status condition.', 2, '--', 'Free', 61, 'The Triggering Ally gets a +X Bonus on any rolls made due to Paralysis, Sleep, Frozen, Confusion, or Infatuation that turn, where X is your CHA modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (817, 'Requested Assitance', 'Any Route, Town, City, Mountain, etc.', 1, '--', 'Trainer', 61, 'Roll 1d20 and add your CHA modifier, if the total is higher then 13 you locate a Pokemon who has a Capability of your choice, if choosing a capability with a value, the value may not be higher than 6. If choosing a speed capability, it may not be any higher than 12. If the total is higher than 18, you may pick another capability that the Pokemon will have. Any attempt at attacking or capturing the Pokemon results in the Pokemon fleeing without fail. The Pokemon must still be made Helpful or Companion to use.');
INSERT INTO pokemondata2.trainer_features VALUES (818, 'Stand Up!', 'An Ally Trainer with over 1HP is reduced to 0HP or lower', 1, '--', 'Trainer', 61, 'That Allyâs HP is reduced to 1 instead. This ability may be used as intercept, and only one per encounter on a single target.');
INSERT INTO pokemondata2.trainer_features VALUES (819, 'Tactician', 'An Allied Trainer', 1, '--', 'Trainer', 61, 'Choose two of Encourage, At My Signal!, Inspiring Presence, or Leaderâs Guidance. The target gains the effects of both of the chosen features. Use of Tactician depletes a daily use of Tactician as well as each of the chosen features.');
INSERT INTO pokemondata2.trainer_features VALUES (820, 'Conspiracy Beater', '--', 0, '--', 'Static', 62, 'When in an encounter or facing any criminal or criminal suspect, all of your Stat modifiers are raised by 1.');
INSERT INTO pokemondata2.trainer_features VALUES (821, 'Intuition''s Arsenal', '--', 0, '--', 'Static', 62, 'When you activate this Feature, choose and gain one of the following Abilities permanently: Forewarn, Frisk, Infiltrator, Insomnia, Inner Focus, Keen Eye, Pickpocket, Unaware, or  nnerve.');
INSERT INTO pokemondata2.trainer_features VALUES (822, 'Disguise', '--', 0, '--', '10 Minutes', 62, 'You can disguise yourself as other people and be unrecognizable to the naked eye of everyone around you. It takes 10 minutes to prepare a disguise.');
INSERT INTO pokemondata2.trainer_features VALUES (823, 'Detective Training', 'Your Pokemon or Companion with Loyalty 3 or higher', 0, '--', 'Trainer', 62, 'Mark your Pokemon as an âInvestigatorâ. Your Pokemon with Investigator gain +1 Intelligence or have their Intelligence increased to 4, whichever is higher. Additionally, the target gains one of the following capabilities: Stealth, Tracker, or Mind Lock.');
INSERT INTO pokemondata2.trainer_features VALUES (824, 'Intuition Training', 'Your Pokemon marked as Investigator', 0, '--', 'Trainer', 62, 'The target gains a Pokemon ability that you have gained through Intuitionâs Arsenal, in addition to the abilities they already have. If the Pokemon already has the chosen ability, this feature has no effect. This effect ends when the Pokemon is recalled.');
INSERT INTO pokemondata2.trainer_features VALUES (825, 'Evidence Search', 'A crime scene, suspectâs home or office, or any area that may contain material relevant to your current situation or otherwise incriminating.', 2, '--', 'Trainer', 62, 'Roll 1d20 and add your CHA modifier to the roll. If you roll 20 or higher, you find a piece of evidence, if available, related to what you are looking for, even if its relevance is not immediately \nobvious.');
INSERT INTO pokemondata2.trainer_features VALUES (826, 'Lie Detector', 'A person that you suspect may be willing to lie.', 0, '--', 'Free', 62, 'When you declare the use of this feature, specify a statement made by the target and you will immediately know whether or not it is completely truthful. This feature may be used on recorded information. If the target is saying something that they believe is true, then they do not appear to be lying.');
INSERT INTO pokemondata2.trainer_features VALUES (827, 'Master of Disguise', '--', 0, '--', 'Static', 62, 'You can disguise yourself as other people, pokemon or even inanimate objects of your size and be unrecognizable as a fake to the eyes of everyone around you. It takes 10 minutes to prepare a disguise. You may pick two disguises to have on hand, and you may switch between these disguised as a Trainer Action. This Feature replaces Disguise.');
INSERT INTO pokemondata2.trainer_features VALUES (828, 'Partner''s Aid', 'A Pokemon marked as âInvestigatorâ.', 2, '--', 'Free', 62, 'Using this feature gives up your Command Action for the round. You command your Pokemon to aid you in your current actions, giving you a +3 Bonus to any rolls made when using a Detective Feature. If Conspiracy Beater is currently applicable, it may target any roll. Your Pokemon marked as âInvestigatorâ must be able to act and nearby.');
INSERT INTO pokemondata2.trainer_features VALUES (829, 'Smooth Talker', '--', 0, '--', 'Static', 62, 'Whenever you make a Charisma check, or make a roll that requires you to add your CHA modifier, add 5 to your roll.');
INSERT INTO pokemondata2.trainer_features VALUES (830, 'Stop Right There!', 'You are pursuing a fleeing target or in an encounter with an enemy you have been searching for.', 1, '--', 'Free', 62, 'Add half your CHA modifier to your DEX modifier for 5 minutes.');
INSERT INTO pokemondata2.trainer_features VALUES (831, 'What''s That Over There', 'A person not in combat and not hostile to you, or unaware of your presence.', 2, '--', 'Trainer', 62, 'Roll 1d20 and add your CHA modifier. If you roll above the targetâs INT or WIS stat, you are successfully able to distract them with a trick or a menial chore for a number of minutes equal to the difference between their chosen stat and your rollâs result. If they have more pressing business or are otherwise alerted, they will stop whatever it is they were doing earlier than normal, if not immediately.');
INSERT INTO pokemondata2.trainer_features VALUES (832, 'Stick To It', '--', 0, '--', 'Static', 63, 'You automatically succeed on all checks to remain on your mount caused by attacks and status conditions. You can ride your mounts on their side, while hanging upside down from them, while standing on them or any other odd way of staying on your mount as if you are riding the mount as normal.');
INSERT INTO pokemondata2.trainer_features VALUES (833, 'Battle Capable Riding', '--', 3, 'You are hit by an attack while riding a pokemon', 'Free', 63, 'Your mount is hit by the attack instead of yourself. If you would have both been hit, your mount may take both sets of damage.');
INSERT INTO pokemondata2.trainer_features VALUES (834, 'All-Terrain Mount', '--', 0, '--', 'Static', 63, 'While mounted, the target may ignore the effects of Rough Terrain and is treated as if it has the Icestep Capability.');
INSERT INTO pokemondata2.trainer_features VALUES (835, 'Charge!', '--', 1, '--', 'Trainer', 63, 'If you are mounted, for the rest of the round, all attacks you make that deal Physical Damage have the Dash keyword, and do additional damage equal to your Mountâs relevant movement capability.');
INSERT INTO pokemondata2.trainer_features VALUES (836, 'Just Going for a Ride', '--', 0, '--', 'Static', 63, 'When making a Wild appear through use of a Ranger Feature or any Advanced Feature, you may choose to specify that the Wild is capable of being ridden.');
INSERT INTO pokemondata2.trainer_features VALUES (837, 'Lightriding', '--', 0, '--', 'Static', 63, 'While you are mounted, if you are the only person on your mount, your mount does not suffer the usual penalties to Movement Capabilities and Speed Combat Stages. Additionally, while you are mounted, your mount may carry one more person than it usually could regardless of its Power score or body shape.');
INSERT INTO pokemondata2.trainer_features VALUES (838, 'Mental Crop', '--', 0, '--', 'Static', 63, 'While you are mounted, your mount gains a +X Bonus to their Movement Capabilities, and a +1 Bonus to its Jump Capability. X is equal to your DEX modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (839, 'Mobility', '--', 0, '--', 'static', 63, 'Instead of using your DEX Stat to determine your Initiative during trainer turns, you may choose to use your mountâs Speed Stat. You still act during trainer turns as normal.');
INSERT INTO pokemondata2.trainer_features VALUES (840, 'Mounted Quick Switch', '--', 0, '--', 'Static', 63, 'You can switch out Pokemon you are mounted on to another Pokemon from your Poke Balls without dismounting, even if your mount is in motion. You may even switch the type of mount while it is moving.');
INSERT INTO pokemondata2.trainer_features VALUES (841, 'Pure Speed', '--', 0, '--', 'static', 63, 'Your mount, that you are currently riding, has its Speed stat raised by two Combat Stages.');
INSERT INTO pokemondata2.trainer_features VALUES (842, 'Qualified Ride', '--', 3, '--', 'Free', 63, 'You may mount a willing Pokemon as a Free Action during your turn, and doing so does not forfeit the Pokemonâs Shift Action or Move Action that round.');
INSERT INTO pokemondata2.trainer_features VALUES (843, 'Watch and Learn', 'An allied trainer who is mounted. You may not target a Rider.', 0, '--', 'Trainer', 63, 'The target may benefit from up to two Rider Features you have with Static Frequencies while within 3 meters of you. Only one ally may benefit from Watch and Learn at a time. These benefits last until the ally is no longer in range, is no longer mounted, or receives different benefits.');
INSERT INTO pokemondata2.trainer_features VALUES (844, 'Guardian Sign', '--', 6, 'You take damage from a Move.', 'Trainer', 64, 'When taking damage, you are considered the same type as whichever Patronâs Crest you are using.');
INSERT INTO pokemondata2.trainer_features VALUES (845, 'Healing Sign', 'Pokemon or Trainer', 3, '--', 'Trainer', 64, 'Roll 2d20 and add your DEX modifier. The target heals that many Hit Points.');
INSERT INTO pokemondata2.trainer_features VALUES (846, 'Courage Sign', 'A Helpful Pokemon who is about to leave.', 1, '--', 'Trainer', 64, 'The target may perform one additional At-Will Frequency Move immediately.');
INSERT INTO pokemondata2.trainer_features VALUES (847, 'Divine Sign', 'Companion who has been with you for at least 2 weeks', 2, '--', 'Trainer', 64, 'Choose one of your Crests. The Companion uses a Move that the Patron knows, which is not a Signature Move, as chosen by your GM (The GM should choose an appropriate Move for the situation). This counts as Issuing a Command. This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (848, 'God Sign', 'Companion who has been with you for at least 1 month', 1, '--', 'Trainer', 64, 'Choose one of your Crests. The Companion uses a Signature Move, chosen by your GM, which the Patron knows. A Signature Move being a Move which is known almost exclusively by that Patron. This counts as Issuing a Command.');
INSERT INTO pokemondata2.trainer_features VALUES (849, 'Grand Sign', 'A Helpful Pokemon.', 2, '--', 'Trainer', 64, 'Add your CHA modifier and your DEX modifier together. Add that total to the Helpful Pokemonâs next damage-dealing Move. This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (850, 'Restoring Sign', 'Pokemon or Trainer', 1, '--', 'Trainer', 64, 'Roll 3d20 and add three times your DEX modifier . The target heals that many Hit Points.');
INSERT INTO pokemondata2.trainer_features VALUES (851, 'Revealing Sign', '--', 4, 'You successfully Restrain a Pokemon.', 'Trainer', 64, 'The Restrained âHelpfulâ Pokemon has four Moves revealed to you by your GM that the Restrained Pokemon knows. If the Pokemon knows less than four Moves, each Move is revealed.');
INSERT INTO pokemondata2.trainer_features VALUES (852, 'Righteous Sign', 'Self', 1, '--', 'Trainer', 64, 'All allies with line of sight to you may pick one Stat, other than HP, and raise its Combat Stage twice.');
INSERT INTO pokemondata2.trainer_features VALUES (853, 'Smite Sign', '--', 0, '--', 'static', 64, 'While attacking with a Trainer Attack, you may activate a Crest. When activated, choose one of the Patronâs Elemental Types and treat your attack as that Elemental Type. Apply Weaknesses, Resistances and Immunities.');
INSERT INTO pokemondata2.trainer_features VALUES (854, 'Summoning Sign', 'An Adjucent empty space', 0, '--', 'Trainer', 64, 'Choose a Crest, you may not use your Styler for the remainder of the encounter. Next to you a miniature, astral form of your Patron appears. It is medium sized. It has HP equal to your DEX stat multiplied by 5. It is identical to the Legendary in every other way including Capabilities, Abilities and Moves. Your GM will determine its stats. It is considered Helpful until it performs 10 tasks that would  usually dismiss other Helpful Pokemon. If the astral Patron is attacked it does not counts as something that would otherwise dismiss a Helpful Pokemon for the count of 10 tasks before the astral Patron disappears.');
INSERT INTO pokemondata2.trainer_features VALUES (855, 'Swift Sign', 'Helpful Pokemon', 1, '--', 'Free', 64, 'You may immediately issue a command to the target, even if you have commanded another Pokemon during that round of an encounter. The Helpful Pokemon is dismissed as usual afterwards.');
INSERT INTO pokemondata2.trainer_features VALUES (856, 'Food Scavenger', 'Anywhere on a Route', 2, '--', 'Trainer', 66, 'Roll 1d20 and add your DEX modifier. If the total exceeds 12, you find enough food and water for a whole day for up to seven humans and/or Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (857, 'Internalized Senses', '--', 0, '--', 'Static', 66, 'At anytime you can discern the direction you are facing. You know a complete forecast of the dayâs natural weather. You know a rough estimate of the time of day, to the nearest quarter of an hour.');
INSERT INTO pokemondata2.trainer_features VALUES (858, 'Acid Rain', 'A Pokemon using a Move with the Weather keyword.', 1, '--', 'Trainer', 66, 'When the Pokemon uses a Move with the Weather keyword, instead of replacing a Weather effect already on the field, both Weather effects simultaneously exist on the field. If a new Weather effect is placed on the field after the two that are out, both are replaced by the third.');
INSERT INTO pokemondata2.trainer_features VALUES (859, 'Bring HIm Down!', '--', 2, 'You declare an Arms attack with a ranged weapon.', 'Free', 66, 'On a successful hit, you paralyze the target. If you roll higher than 15 on the AC, this attack Flinches the target as well.');
INSERT INTO pokemondata2.trainer_features VALUES (860, 'Forecast', 'Any Route, Town, City, Mountain, etc.', 2, '--', 'Trainer', 66, 'Roll 1d20 and add your DEX modifier, if the total is higher then 18 you locate a Pokemon who can perform one of the following moves of your choice: Sunny Day, Rain Dance, Hail, Sandstorm or Defog. Any attempt at attacking or capturing the Pokemon results in the Pokemon fleeing without fail. The Pokemon must still be made Helpful or Companion to use.');
INSERT INTO pokemondata2.trainer_features VALUES (861, 'Huntsman', '--', 0, '--', 'Static', 66, 'Targets of your ranged arms attacks gain no speed evasion bonus, gain no bonuses from Moves\nor effects that say âyou must roll +X during Accuracy Checks,â and no evasion bonuses from terrain or\nweather. In addition, as long as you are not a Martial Artist, or an Advanced Class with a Martial Artist\npreprequisite, your ranged arms attacks deal additional damage and range, equal to half your Dexterity.');
INSERT INTO pokemondata2.trainer_features VALUES (862, 'Master Gyver', 'Wood, Bone, Plastic, and any other workable material with a knife', 0, '--', 'Trainer', 66, 'Roll 1d20 and add your DEX and CHA modifiers, if the total is higher than 22, you can create any non-electronic tool/gadget/etc. within reason. You are a master of ingenuity and can create one time use contraptions to solve your various problems. You can also create partially hidden shelter from the surrounding area large enough for 5 people and/or Pokemon, which will last X days, X being your DEX modifier. More than 2 shelters close together become easy to see by any passing Pokemon or human.');
INSERT INTO pokemondata2.trainer_features VALUES (863, 'Pacifism', 'A Restrain Roll', 2, '--', 'Free', 66, 'If you successfully restrain the Pokemon, you may not use the Helpful Pokemon to attack anything, but you have -15 added to your restrain roll.');
INSERT INTO pokemondata2.trainer_features VALUES (864, 'Surviving the Mountains', '--', 2, 'You hit with a Trainer Attack that is unmodified by a Feature that would give it an Elemental Type.', 'Free', 66, 'Your Trainer Attack is Super Effective against Rock and Steel Type Pokemon. You may only take two Surviving the X, Features. (Mountains, Forests, Skies, Swamps) This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (865, 'Surviving the Forests', '--', 2, 'You hit with a Trainer Attack that is unmodified by a Feature that would give it an Elemental Type.', 'Free', 66, 'Your Trainer Attack is Super Effective against Grass and Ground Type Pokemon. You may only take two Surviving the X, Features. (Mountains, Forests, Skies, Swamps) This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (866, 'Survivng the Skies', '--', 2, 'You hit with a Trainer Attack that is unmodified by a Feature that would give it an Elemental Type.', 'Free', 66, 'Your Trainer Attack is Super Effective against Bug and Flying Type Pokemon. You may only take two Surviving the X, Features. (Mountains, Forests, Skies, Swamps) This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (867, 'Suriving the Swamps', '--', 2, 'You hit with a Trainer Attack that is unmodified by a Feature that would give it an Elemental Type.', 'Free', 66, 'Your Trainer Attack is Super Effective against Poison and Water Type Pokemon. You may only take two Surviving the X, Features. (Mountains, Forests, Skies, Swamps) This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (868, 'Watch the Sky', '--', 2, 'There is a weather in effect.', 'Trainer', 66, 'Roll 1d20 and add your DEX modifier, if the total is higher than 10 you temporarily gain the Overcoat Pokemon Ability. If the result is higher than 16, you and all your Pokemon, may temporarily gain the Overcoat Pokemon Ability. If the result is higher than 22, you, all your Pokemon, your allies and their Pokemon, may temporarily gain the Overcoat Pokemon Ability. If the weather changes, or Acid Rain is used, the protection fails and must be reapplied as a trainer action, with no additional roll needed during that encounter. Overcoat may need to temporarily replace a Pokemonâs Ability.');
INSERT INTO pokemondata2.trainer_features VALUES (869, 'Frantic Research', 'Any Pokemon', 3, '--', 'Trainer', 67, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher then 15, you learn what level the pokemon is. If you roll higher then 20, you identify how much HP the target currently has.');
INSERT INTO pokemondata2.trainer_features VALUES (870, 'Walking Encyclopedia', 'Anything related to knowledge you are allowed to look up', 0, '--', 'Static', 67, 'You know pokemon data, relating to pokemon in your pokedex, about move sets, type, type advantage, evolution methods, abilities, height, weight, and location. You have access to all information a pokedex would grant, immediately.');
INSERT INTO pokemondata2.trainer_features VALUES (871, 'Did the Homework', 'Location, Trainer, Pokemon, Object', 1, '--', '1 Hour or Free (See Effect)', 67, 'Spend an hour doing research about the target. Every 12 levels gained, you may research an additional target during this hour. The GM gives you X Insight Points for the target that last until the end of the day, where X is half of your INT modifier. While in the vicinity of the target and taking actions related to that target for the rest of the day, you spend an Insight Point once per round as a free action to treat either your WIS or INT mod as 3 higher for the duration of that round. When you spend an Insight Point, your GM gives you a fact about the target that aids in your current action.');
INSERT INTO pokemondata2.trainer_features VALUES (872, 'Field Commander', '--', 0, '--', 'Static', 67, 'You may issue commands to pokemon who has not already acted on a round of an encounter. There must be understood consent from the trainer unless they are unconscious. Pokemon may only act once per round of an encounter. You still may only issue one command per round unless you have Dual Wielding.');
INSERT INTO pokemondata2.trainer_features VALUES (873, 'Frantic Research+', 'Any Pokemon', 4, '--', 'Trainer', 67, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher then 15, you learn what level the pokemon is and at least 6 of its attacks that a standard one of its species would not naturally have at its level. If it has fewer than 6 attacks meeting this criterion, you learn all of them. If you roll higher then 20, you identify how much HP the target currently has. This Feature replaces Frantic Research.');
INSERT INTO pokemondata2.trainer_features VALUES (874, 'Game Plan', 'Your allyâs pokemon.', 2, '--', 'Trainer', 67, 'Shift the target up to X meters where X is your INT modifier or your WIS modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (875, 'Game Plan +', 'Your allies and their pokemon.', 2, '--', 'Trainer', 67, 'Shift all allies and their pokemon up to X meters where X is your INT modifier or your WIS modifier. Game Plan + does not replace Game Plan.');
INSERT INTO pokemondata2.trainer_features VALUES (876, 'Read the Manual', 'An item.', 0, '--', 'Free', 67, 'You know the function of any machine. Additionally, you know the function of the item if it is a standard item with an effect given in the Player Handbook. You know of any defects that might change the way the item normally functions.');
INSERT INTO pokemondata2.trainer_features VALUES (877, 'Repel Crafting', 'Items', 0, '--', 'Trainer', 67, 'Create a Repel (200). Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (878, 'Strategic Targeting', 'Allied Pokemon', 2, '--', 'Trainer', 67, 'Add half your WIS modifier to the targetâs accuracy roll when they make an attack this turn.');
INSERT INTO pokemondata2.trainer_features VALUES (879, 'Tactical Response', 'Your Pokemon', 1, '--', 'Trainer', 67, 'Choose one Move of any kind and one No Damage - Self Move known by the target. For the rest of the day when your targeted pokemon is active and a foe uses the first Move chosen, it may immediately use the chosen No Damage - Self Move as an interrupt one time. This does not consume your command for the turn.');
INSERT INTO pokemondata2.trainer_features VALUES (880, 'Trait Theory', 'Any Pokemon', 0, '--', 'Trainer', 67, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher then 10, you identify what Nature the pokemon has. If you roll higher than 15, you also identify what Abilities the pokemon has. You may only attempt this check twice per encounter, once per target.');
INSERT INTO pokemondata2.trainer_features VALUES (881, 'Trait Theory +', 'Any Pokemon', 0, '--', 'Trainer', 67, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher then 10, you identify what Nature the pokemon has. If you roll higher than 15, you also identify what Abilities the pokemon has. If the target is Wild and you rolled higher then 20, you may pick the targetâs Nature. This Feature Replaces Trait Theory. You may only attempt this check twice per encounter, once per target.');
INSERT INTO pokemondata2.trainer_features VALUES (882, 'Praise', 'A Legendary Pokemon', 2, '--', 'Trainer', 68, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher then 15, the target favors you and will hesitate to attack you and your pokemon. You are also given points determined by your GM towards allying with the target.');
INSERT INTO pokemondata2.trainer_features VALUES (883, 'Walking Mythos', 'Anything related to knowledge you are allowed to look up.', 0, '--', 'Static', 68, 'You know pokemon data, relating to pokemon in your pokedex, about move sets, type, type advantage, evolution methods, abilities, height, weight, and location. Restricted to legendary Pokemon you have encountered.');
INSERT INTO pokemondata2.trainer_features VALUES (884, 'Beckon', 'A Legendary Pokemonâs habitat of a Legendary youâve met.', 2, '--', 'Trainer', 68, 'Roll 1d20 and add your WIS modifier. If the total exceeds 20, a Legendary pokemon will appear. It will not necessarily appear near you, but you will be able to see it, or evidence of its presence.');
INSERT INTO pokemondata2.trainer_features VALUES (885, 'Blessing', 'A pokemon or Trainer.', 2, '--', 'Trainer', 68, 'Roll 1d20 and add your WIS modifier doubled. The target recovers HP equal to the total rolled. You may not use Blessing if you are no longer allied with any Legendary Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (951, 'Energy Brewer', 'Items', 6, '--', 'Trainer', 73, 'Create an Ether. It costs 80 to use Energy Brewer. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (886, 'Channel Divinity', 'A Loyal Pokemon', 0, '--', 'Free', 68, 'The target may perform a Move that is known by a Legendary Pokemon you are Linked to. This counts as Issuing a Command. This may only be used once per turn.');
INSERT INTO pokemondata2.trainer_features VALUES (887, 'God Speak', '--', 0, '--', 'Static', 68, 'You can speak to and understand all Legendary Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (888, 'Guardian Link', 'A Legendary Pokemon', 1, '--', 'Free', 68, 'You may only target Legendary Pokemon with Guardian Link if you are allied with them. The Legendary becomes Linked. While a Linked Legendary is in danger, regardless of where you are in the world, you will know. This greatly increases your GMâs points towards allying the target.');
INSERT INTO pokemondata2.trainer_features VALUES (889, 'Legendary Blessing', 'A pokemon or Trainer', 1, '--', 'Trainer', 68, 'Roll 2d20 and add your WIS modifier tripled. The target recovers HP equal to the total rolled. You may not use Legendary Blessing if you are no longer allied with any Legendary Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (890, 'Link Summon', 'A Linked Legendary, disregarding any line of sight.', 0, '--', 'Trainer', 68, 'You may summon the allied, Linked Legendary Pokemon. You ignore how often youâve summoned it in the past, it will appear.');
INSERT INTO pokemondata2.trainer_features VALUES (891, 'Miracle', 'Allied Trainer or Allied Pokemon fails a Death Savings Throw.', 0, '--', 'Trainer', 68, 'The target may re-roll that Death Savings throw and subtract 5 from their roll if you target a trainer or subtract 25 if you target a pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (892, 'Morale Blessing', 'Allied pokemon.', 3, '--', 'Trainer', 68, 'Pick either Attack, Defense, Special Attack, Special Defense or Speed and raise the chosen stat of each of your allyâs pokemonâs within X meters of you by 1 Combat Stage until the end of the encounter. X is your WIS modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (893, 'Omen', 'Anywhere on a route.', 0, '--', 'Free', 68, 'Roll 1d20 and add your WIS modifier. If the total exceeds 10, you learn of the last time a Legendary pokemon has been around the area.');
INSERT INTO pokemondata2.trainer_features VALUES (894, 'Soul Searching', 'A Linked Legendary, disregarding any line of sight', 1, '--', 'Trainer', 68, 'Roll 1d20 and add your WIS modifier. If the total exceeds 13, you are pointed in the direction of the target. If the total exceeds 17, you learn of the distance between the Linked Legendary and yourself.');
INSERT INTO pokemondata2.trainer_features VALUES (895, 'Portable Dream Machine', '--', 0, '--', 'Static', 69, 'You have a Dream Machine, comparable in size to a laptop. When used on a sleeping pokemon, this machine will allow you to look into their dreams through a viewing window for up to 8 hours, after which, the pokemon will wake up. During this time, the Pokemon is considered to be in the Dream World. If the pokemon is disturbed during its dream, it must roll a normal sleep check as if it was Asleep. Dreams will show any subconscious desires or wishes the pokemon has, although the dreamâs true meaning may be obscure. A pokemon may only be observed by the Dream Machine once per three days.');
INSERT INTO pokemondata2.trainer_features VALUES (896, 'Dream Smoke Materializer', 'A Pokemon who has been asleep in the Dream World for 4 hours.', 0, '--', 'Free', 69, 'Roll 1d20 plus your WIS modifier. On a roll of 18 or above, the pokemon will find an item in their dream world and hold onto it, and then immediately wake up. The pokemon will awake holding the item they dreamed about. Pokemon can only dream about a specific item if they have held it before. The dreamt item is chosen by the GM');
INSERT INTO pokemondata2.trainer_features VALUES (897, 'Dream Training Montage', 'A Pokemon who has been asleep in the Dream World for 7 hours.', 1, '--', 'Trainer', 69, 'Roll 1d20 and add your WIS modifier. On a result of 20 or better, you may take X amount of points from one of the pokemonâs base stats and apply it to a different base stat. X is equal  to your WIS modifier halved. If this changes the Base Relation, you must place points where appropriate while leveling in order to right the Base Relation as soon as possible. Dream Training Montage may not target a Pokemon who has been successfully targeted by Dream Training Montage before.');
INSERT INTO pokemondata2.trainer_features VALUES (898, 'Lucid Dreams', '--', 0, '--', 'Static', 69, 'Add 3 to any check while using a Feature on a Pokemon in the Dream World.');
INSERT INTO pokemondata2.trainer_features VALUES (899, 'Naptime', 'Dreaming Pokemon in the Dream Machine.', 0, '--', 'Static', 69, 'The amount of time required for features requiring a specific amount of time asleep is reduced\nby 1/4th, rounding up.');
INSERT INTO pokemondata2.trainer_features VALUES (900, 'Naptime +', 'Dreaming Pokemon in the Dream Machine.', 0, '--', 'Static', 69, 'The amount of time required for features requiring a specific amount of time asleep is reduced by 1/3rd, rounding up. This feature replaces Naptime.');
INSERT INTO pokemondata2.trainer_features VALUES (901, 'Pokewalker', 'A pokemon in the Dream World.', 0, '--', 'Static', 69, 'At any time a Pokemon is in the Dream World, you may place your Pokewalker, an item about the same size as a pedometer, into a port on the Dream Machine. You may place the Pokemonâs subconscious dream into the Pokewalker and immediately return a Pokemon to its Poke Ball. While a Pokemonâs subconscious is in the Pokewalker, it gains 500 experience points per 24 hours it remains in the Pokewalker with you and its Poke Ball. These experience points are given to the Pokemon when they are sent out of their Poke Ball, next to your Dream Machine with the Pokewalker in its Dream Machine port. You may target the subconscious of the Pokemon in the Pokewalker with Dream Doctor Features within the eight hours of your putting a Pokemon into the Pokewalker. If a Pokemon whose subconscious is in the Pokewalker is sent out of its Poke Ball without the Pokewalker and Dream Machine ready, the subconscious disappears from the Pokewalker and no experience points are rewarded to the Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (902, 'Psychotherapy', 'A pokemon in the Dream World.', 3, '--', 'Trainer', 69, 'Roll 1d20 plus WIS modifier. IF the total exceeds 19, you can understand why a pokemon is upset, what the source of the unhappiness is, and what needs to be done in the real world to fix it. You may ask questions to the sleeping Pokemon and the Dream Machine will accurately reveal answers to the best of the pokemonâs ability.');
INSERT INTO pokemondata2.trainer_features VALUES (903, 'Subtle Suggestion', 'Dreaming Pokemon while using Dream Smoke Materializer.', 1, '--', 'Trainer', 69, 'Declare the name of an item the Dreaming pokemon has seen and used before, roll 1d20 and add WIS modifier. On a result of 18 or better, the pokemon will dream about that item and it will materialize if the Dream Smoke Materializer is successful');
INSERT INTO pokemondata2.trainer_features VALUES (904, 'Temporary Ability', 'A Pokemon who has been in the Dream World in the past week.', 1, '--', 'Trainer', 69, 'Randomly choose an Ability the target has, the target loses that Ability for 1 hour. Randomly assign an Ability from the targetâs Ability list, the target gains that Ability for 1 hour. The Randomly assigned Ability can potentially grant the same Ability that the Pokemon just lost for 1 hour, changing nothing.');
INSERT INTO pokemondata2.trainer_features VALUES (905, 'Total Recall', '--', 0, '--', 'Static', 69, 'Ignore the lines âA pokemon may not have more than two Abilities after using True Ability. If the targeted Pokemon already has two Abilities when using True Ability, on a successful roll, replace one of the Abilities,â while using True Ability. This means that a Pokemon can have 3 Abilities after using True ability successfully.');
INSERT INTO pokemondata2.trainer_features VALUES (926, 'Examine', '--', 3, 'You use Snapshot on a Pokemon or Trainer', 'Free', 71, 'You may use the move Foresight on Snapshotâs Target as a free action. Alternatively, you may, as a Trainer Action, study a Photo you have already taken to use Foresight on the photoâs target. If you do, the Photo is destroyed.');
INSERT INTO pokemondata2.trainer_features VALUES (906, 'True Ability', 'A Pokemon who has been asleep in the Dream World for 8 hours.', 1, '--', 'Trainer', 69, 'Roll 1d20 plus your WIS modifier. On a result of 18 or better, assign an additional Ability to the Pokemon from the Pokemonâs Basic Abilities. On a result of 21 or better, assign any additional Ability to the Pokemon from the Pokemonâs High Abilities. A pokemon may not have more than two Abilities after using True Ability. If the targeted Pokemon already has two Abilities when using True Ability, on a successful roll, replace one of the Abilities. True Ability may not target a Pokemon who has been successfully targeted by True Ability before.');
INSERT INTO pokemondata2.trainer_features VALUES (907, 'Digging for the Past', 'Anywhere on a Route.', 2, '--', '30 minutes', 70, 'Roll 1d20 and add your INT modifier. If you roll higher than 20, you either find clues to fossils that are nearby or evidence of the areas history. If you roll higher than 28 you choose to find either a piece of the areas history or a fossil, both are chosen by your GM after you specify. For every use of the feature that exceeds 20 but not 28, add 5 to the roll during the next use of the feature on the same route. You may expend a use of the feature without rolling to add 3 to the roll. This feature requires thirty minutes of time while you search.');
INSERT INTO pokemondata2.trainer_features VALUES (908, 'Stone Search', 'Anywhere on a Route.', 2, '--', '30 minutes', 70, 'Roll 1d20 and add your INT modifier. If you roll higher than 22, you find an Evolutionary stone chosen by your GM. This feature requires thirty minutes of time while you search.');
INSERT INTO pokemondata2.trainer_features VALUES (909, 'Adventuring Archeologist', '--', 0, '--', 'Static', 70, 'You have begun to dabble in exploring ruins as well as caves. You know your regions history at a college level. You are able to sell or donate any pieces of history you find while Digging for the Past for X, where X is 1d20+INT mod times 30.');
INSERT INTO pokemondata2.trainer_features VALUES (910, 'Call Me Hori Taizo', 'Anywhere on a Route.', 2, '--', 'Trainer', 70, 'Over the course of five minutes you dig a 5 meter wide and 2 meter tall pit. The pit trap is covered by camouflage that Pokemon or Trainers canât distinguish from the surroundings. You can either choose to activate the trap from nearby or to have it activate when 100 pounds of pressure is put onto the camouflage.');
INSERT INTO pokemondata2.trainer_features VALUES (911, 'How to Ruin a Gneiss Day', 'Anywhere on a Route.', 1, '--', 'Trainer', 70, 'You place a trip-line 5 meters wide on the ground. Anyone walking through this trip-line activates a Rock Slide Move from the direction that you specify when placing the trap. Use your INT modifier for ATK. You roll the AC on the rock slide as normal.');
INSERT INTO pokemondata2.trainer_features VALUES (912, 'Elemental Trapping', 'A pit trap you have dug', 1, '--', 'Trainer', 70, 'You place an Evolution Stone into the Pit Trap. When the trap is activated everyone inside is hit with 2d12+21+INT modifier damage that is the same type as the Evolution Stone. If the stone has been energized with Stone Energizer, the damage is instead 4d12+17+INT modifier. Fire Stones deal Fire Type Damage, Leaf Stones do Grass, Thunder Stone do Electric, Water Stones do Water, and Stones created through Stone Polishing do damage of their assigned type. The Stone is destroyed after use.');
INSERT INTO pokemondata2.trainer_features VALUES (913, 'Flour Flourish', 'Anywhere on a Route.', 2, '--', 'Trainer', 70, 'You plant a small trap on the ground along with a 4 meter wide tripwire. When a Pokemon or Trainer passes through the tripwire, the flour is released in a 2 meter blast. Any hit targets need to roll 2 higher during AC checks until the end of combat, and lose resistances to fire until the first time they are hit with a fire or water attack');
INSERT INTO pokemondata2.trainer_features VALUES (914, 'Movie Magic Quicksand', 'A flour trap you have dug', 2, '--', 'Trainer', 70, 'Instead of being on the ground, the trap is now a 4 meter wide pit filled with a mixture of silt, water, and flour. Trainers and Pokemon falling into the pit are trapped for 2d4+1 rounds. Pokemon with a surface speed or burrow speed of 5 or more instead act as if it is rough terrain.');
INSERT INTO pokemondata2.trainer_features VALUES (915, 'Reanimator', 'A fossil being reanimated', 1, '--', 'Trainer', 70, 'When you make a check to Reanimate a fossilized Pokemon add 3 to the roll. Reanimators can reanimate fossils anywhere with a steady power supply with their reanimation kit and do not need to visit a specialized lab.');
INSERT INTO pokemondata2.trainer_features VALUES (916, 'Slated for Renovation', 'Any underground cave.', 2, '--', 'Trainer', 70, 'While underground you set off a controlled explosion that opens up new caverns. You may set off the explosion from up to 30 meters away. The explosion does not damage anyone inside the cavern it is being set off in, but an effect may. Roll 1d10 to determine additional effects from the detonation. 1: Cave in - Everyone in the cavern is automatically hit with the move Rock Tomb. 2: Natural Deterrent - The cave network is partially blocked off by the appropriate natural event, underground spring, sand cave in, lava, or Pokemon interaction. 3: Wanton Destruction - Any items, fossils, or Pokemon are destroyed or scared off from the entire cave network. 4-9: Successful demolition 10: Discovery! - You find a buried site, details are left up to your GM.');
INSERT INTO pokemondata2.trainer_features VALUES (917, 'Spelunking is the Schist', '--', 0, '--', 'Static', 70, 'While underground you know if there are other viable exits to the surface or geologically unstable areas. You may also find areas that grant a +3 bonus to your Digging for the Past and Stone Search Feature rolls.');
INSERT INTO pokemondata2.trainer_features VALUES (918, 'Stone Energizer', 'Evolution Stone', 0, '--', 'Trainer', 70, 'The stone gains a second use before being destroyed. You may not use Stone Energizer on the same stone twice.');
INSERT INTO pokemondata2.trainer_features VALUES (919, 'Stone Polish', 'An ordinary rock.', 0, '--', 'Trainer', 70, 'You may turn that stone into an Evolution Stone. Choose one of the seventeen elemental types. When you touch a Pokemon with an Evolution Stone that matches one of their Elemental Types will forcefully evolve them if they meet the evolution level requirement but has not yet evolved.');
INSERT INTO pokemondata2.trainer_features VALUES (920, 'The Good Doctor', 'A Pokemon deceased within the last 24 hours.', 0, '--', 'Trainer', 70, 'Roll 1d20 and add your INT modifier. If you roll higher than 25 you create an artificial fossil from the corpse of the Pokemon. This fossil acts as a normal fossil. You may not target Legendary Pokemon with this feature.');
INSERT INTO pokemondata2.trainer_features VALUES (921, 'Snapshot', 'A Pokemon, Trainer, or Route.', 3, '--', 'Trainer', 71, 'Roll 1d20 and add your WIS modifier. Multiply the result by 20. This is the value of the photo. You may choose to sell this photograph anywhere.');
INSERT INTO pokemondata2.trainer_features VALUES (922, 'Action Photo', '--', 2, 'You or an ally are attacked by a Pokemon using a Move', 'Trainer', 71, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, you successfully obtain a photo of the Move. Roll 1d20 and add your WIS modifier. Multiply the total by 20. This it the value of the photo. You may choose to sell this photograph anywhere.');
INSERT INTO pokemondata2.trainer_features VALUES (923, 'Action Photo +', '--', 3, 'A Pokemon performs a move.', 'Trainer', 71, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, you successfully obtain a photo of the Move. You may choose to sell this photograph anywhere. If you do, roll 1d20 and add your WIS modifier. Multiply the total by 25. This it the value of the photo. This feature replaces Action Photo.');
INSERT INTO pokemondata2.trainer_features VALUES (924, 'Battle Study', '--', 0, '--', 'Static', 71, 'While you posses a photograph taken with Action Photo of a specific Move, any use of that Move will require +2 on an Accuracy Check to hit you or your Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (925, 'Camera Flash', '--', 0, '--', 'Free', 71, 'Use the Move Flash. You may use this feature as a Free Action when you use Snapshot or Action Photo, but must share the same target as that Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (927, 'Natural Shot', '--', 0, 'You use Snapshot on a Wild Pokemon', 'Static', 71, 'Instead of multiplying your Snapshot roll by 20, multiply the result by 80 minus the Pokemonâs species Capture Rate or 20, whichever is higher.');
INSERT INTO pokemondata2.trainer_features VALUES (928, 'Pester Ball A', 'A Pokemon', 2, '--', 'Trainer', 71, 'Roll 1d20 and add you WIS modifier. If the total exceeds 15 the target must attempt to attack its nearest enemy and may not flee. Additionally, the target target may only use Moves that can deal damage for the next 1d6 turns. Pester Ball A cannot target a Pokemon who has already been successfully hit with Pester Ball A during this encounter. It costs 50 to use this Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (929, 'Pester Ball B', 'A Pokemon', 2, '--', 'Trainer', 71, 'Roll 1d20 and add you WIS modifier. If the total exceeds 15, the target becomes Confused. Additionally, the target has its movement Capabilities reduced by X for 1d6 turns, where X is half your WIS modifier. Pester Ball B cannot target a Pokemon who has already been successfully hit with Pester Ball B during this encounter. It costs 50 to use this Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (930, 'Pester Ball C', 'A Pokemon', 2, '--', 'Trainer', 71, 'Roll 1d20 and add you WIS modifier. If the total exceeds 20, the target is Poisoned. Additionally, the target must roll +1 to hit during Accuracy Checks for the rest of the encounter.  Pester Ball C cannot target a Pokemon who has already been successfully hit with Pester Ball C during this encounter. It costs 90 to use this Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (931, 'Pester Ball D', 'A Pokemon', 2, '--', 'Trainer', 71, 'Roll 1d20 and add you WIS modifier. If the total exceeds 20, the target may not use any moves that target a foe on its next turn, though it may still use moves that target its allies or itself. Additionally, for the remainder of the encounter the targetâs Capture Rate is raised by 20. Pester Ball D cannot target a Pokemon who has already been successfully hit with Pester Ball D during this encounter. It costs 90 to use this Feature.');
INSERT INTO pokemondata2.trainer_features VALUES (932, 'Photo Research', '--', 3, '--', 'Trainer', 71, 'Select a Photo of a Pokemon, Trainer, or Route taken with Snapshot. You gain a single Insight Point of the Photoâs target, as if you had used Did The Homework. The Photo is Destroyed.');
INSERT INTO pokemondata2.trainer_features VALUES (933, 'Photo Tutor', 'A Pokemon', 2, '--', 'Trainer', 71, 'Select a Photo taken with Action Photo or Action Photo +, that is of a Move that the target can be learn by Level Up, TM or by Move Tutor. Roll 1d20 and add your WIS modifier. If the total exceeds 20, the target learns that Move. Regardless of success, the Photo is destroyed. Once you successfully use Photo Tutor on a pokemon, Photo Tutor may not target that pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (934, 'Tutor Mastery', '--', 0, '--', 'Static', 71, 'You may target your own Pokemon up to three times with Photo Tutor. If you later trade away your Pokemon, they forget all but one of the Tutored moves.');
INSERT INTO pokemondata2.trainer_features VALUES (935, 'Walking Doctorate', 'Anything related to knowledge you are allowed to look up.', 0, '--', 'Static', 72, 'You know pokemon data, relating to pokemon in your pokedex, about specific location and base stats. You may consult the GMâs Bestiary. Restricted to non-Legendary Pokemon.');
INSERT INTO pokemondata2.trainer_features VALUES (936, 'Flawless Classification', 'Any Pokemon', 2, '--', 'Trainer', 72, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher than 15, you know which stat is the highest for the targeted Pokemon and which stat is the lowest. If you roll higher than 20, you know the exact values for those stats.');
INSERT INTO pokemondata2.trainer_features VALUES (937, 'Critical Advice', 'Allies', 2, '--', 'Trainer', 72, 'During the next round of an encounter, all Moves and Trainer Attacks are Critical Hits on 16-20. The Critical Hit range may not be altered in any other way during the next round of combat.');
INSERT INTO pokemondata2.trainer_features VALUES (938, 'Demoralize', 'Foe Pokemon', 2, '--', 'Trainer', 72, 'Pick either Attack, Defense, Special Attack, Special Defense or Speed and lower the chosen stat of each enemy pokemonâs within X meters of by 1 Combat Stage. X is your INT modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (939, 'Efficiency Boost', 'Allies', 2, '--', 'Trainer', 72, 'During the next round of an encounter, any action that an ally performs that requires a d20 roll may add X to their roll where X is your INT modifier. Cannot be used with Moves that set targets to a certain HP.');
INSERT INTO pokemondata2.trainer_features VALUES (940, 'Fighting Read', 'Any Trainer', 3, '--', 'Trainer', 72, 'Roll d20 and add your INT and WIS modifiers to the roll. If you roll higher then 15, your GM must give to you 6 pokemon species of which 4 are owned by the target trainer. If the target does not own 4 pokemon, only two pokemon which are owned are revealed.');
INSERT INTO pokemondata2.trainer_features VALUES (941, 'Morale Boost', 'Allied pokemon.', 2, '--', 'Trainer', 72, 'Pick either Attack, Defense, Special Attack, Special Defense or Speed and raise the chosen stat of each of your allyâs pokemonâs within X meters of you by 1 Combat Stage until the end of the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (942, 'Morale Rally', 'Allied pokemon.', 1, '--', 'Trainer', 72, 'Pick either Attack, Defense, Special Attack, Special Defense or Speed and raise the chosen stat of each of your allyâs pokemonâs within X meters of you by X. X is your INT modifier. Morale Rally lasts until the end of the encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (943, 'Poke Linguist', '--', 0, '--', 'Static', 72, 'You can speak and understand a single species of Pokemon and all of the evolutions related to that Pokemon. You may take Poke Linguist more then once.');
INSERT INTO pokemondata2.trainer_features VALUES (944, 'Sabotage', 'Wild Pokemon', 1, '--', 'Trainer', 72, 'Roll 1d20 and add your INT modifier. If you rolled above 15, shift all wild foes up to X meters where X is your INT modifier or your WIS modifier.');
INSERT INTO pokemondata2.trainer_features VALUES (945, 'Tactical Maneuver', 'One of your pokemon who just succesfully used a Move.', 3, '--', 'Trainer', 72, 'Roll 1d20 and add your INT modifier. If you rolled above 15, an allied Trainerâs pokemon may perform an At-Will Move or EOT Move even if it has already used a Move during that round of the encounter. The target may shift an additional time. You must have line of sight to the Pokemon who is reciving your extra command.');
INSERT INTO pokemondata2.trainer_features VALUES (946, 'Tactical Strike', 'One of your pokemon who just succesfully used a Move.', 2, '--', 'Trainer', 72, 'Roll 1d20 and add your INT modifier. If you rolled above 15, an allied Trainerâs pokemon may perform an At-Will Move even if it has already used a Move during that round of the encounter. You must have line of sight to the Pokemon who is reciving your extra command.');
INSERT INTO pokemondata2.trainer_features VALUES (947, 'Potions Mastery', 'Items', 0, '--', 'Trainer', 73, 'Create either a Potion (100), a Super potion (175), or a Hyper Potion (225). Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (948, 'Repels Mastery', 'Items', 0, '--', 'Trainer', 73, 'Create a Repel (100), a Super Repel (150) or a Max Repel (200). Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (949, 'Body Pills', 'Items', 3, '--', 'Trainer', 73, 'Create a HP Up or Carbos. It costs 2450 to use Body Pills. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (950, 'Defense Pills', 'Items', 3, '--', 'Trainer', 73, 'Create an Iron or Zinc. It costs 2450 to use Defense Pills. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (952, 'Energy Mastery', 'Items', 6, '--', 'Trainer', 73, 'Create an Elixir. It costs 270 to use Energy Mastery. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (953, 'Offense Pills', 'Items', 3, '--', 'Trainer', 73, 'Create a Protein or Calcium. It costs 2450 to use Offense Pills. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (954, 'Performance Enhancers', 'Items', 2, '--', 'Trainer', 73, 'Roll 1d8. On a result of 1, you create a X Attack; on a result of 2, you create a X Defend; on a result of 3, you create a X Special; on a result of 4, you create a X Sp. Def; on a result of 5, you create a X Speed; on a result of 6, you create a X Accuracy; on a result of 7, you create a Dire Hit; on a result of 8, you create a Guard Spec. It costs 75 to use the Performance Enhancers Feature. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (955, 'Performance Enhancers Mastery', 'Items', 2, '--', 'Trainer', 73, 'Create either a X Attack, a X Defend, a X Special, a X Sp. Def, a X Speed, a X Accuracy, a Dire Hit or a Guard Spec. It costs 50 to use the Performance Enhancer Mastery Feature. This Feature replaces Performance Enhancers. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (956, 'Frequency Pills', 'Items', 1, '--', 'Trainer', 73, 'Create a PP Up. It costs 4900 to use Frequency Pills. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (957, 'Status Brewer', 'Items', 3, '--', 'Trainer', 73, 'Roll 1d6. On a result of 1, you create an Antidote; on a result of 2, you create an Awakening; on a result of 3, you create a Burn Heal; on a result of 4, you create an Ice Heal; on a result of 5, you create a Paralyze Heal; on a result of 6, you create a Full Heal. It costs 100 to use the Status Brewer Feature. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (958, 'Status Mastery', 'Items', 3, '--', 'Trainer', 73, 'Create an Antidote, Awakening, Burn Heal, Ice Heal or Paralyze Heal for 100 or create a Full Heal for 250 . This Feature replaces Status Brewer. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (959, 'Trait Suppressant', 'Items', 3, '--', 'Trainer', 73, 'Create an item with the same effect as a Pomeg, Kelpsy, Qualot, Hondew, Grepa or Tomato Berry. It costs 1250 to use Trait Suppressant. Name the concoction whatever youâd like out of whatever ingredients youâd like.');
INSERT INTO pokemondata2.trainer_features VALUES (960, 'Family Finder', 'Wild Pokemon', 2, '--', 'Trainer', 74, 'Roll 1d20 and add your INT and WIS modifiers. If the total exceeds 15, you track where this pokemon lives in the area. If there are other pokemon of the same species or evolution line in the area, you will either find them there or hints to where they may be. If the total exceeds 20, you locate food sources and other resources pokemon of this evolutionary line rely upon, which may include berry plants, vegetation, sources of water and other things depending on GM discretion.');
INSERT INTO pokemondata2.trainer_features VALUES (961, 'Close Watch', 'Wild Pokemon', 4, '--', 'Trainer', 74, 'Multiply your WIS modifier by 5m. This is the farthest you may move without alerting a Wildâs attention. You may approach a Wild Pokemon without alerting it to your presence, until you stop moving. The pokemon you approach is not instantly provoked but may be startled. You may attempt to befriend the Wild as long as you donât provoke it.');
INSERT INTO pokemondata2.trainer_features VALUES (962, 'Applied Psychology', 'A person that you suspect may be willing to lie.', 0, '--', 'Free', 74, 'When you declare the use of this feature, specify a statement made by the target and you will immediately know whether or not it is completely truthful. This feature may be used on recorded information. If the target is saying something that they believe is true, then they do not appear to be lying.');
INSERT INTO pokemondata2.trainer_features VALUES (963, 'Berrydex', 'Berries', 0, '--', 'Static', 74, 'You can identify any Berry its properties and what it yields in terms of Contest Stats. When you are making Berries into Poffins, Aprijuice or PokeBlocks, you get +2 to your rolls');
INSERT INTO pokemondata2.trainer_features VALUES (964, 'Discriminating Gaze', 'Pokemon', 3, '--', 'Trainer', 74, 'Roll 1d20 and add your WIS modifier. If the total exceeds 10, you identify whether the target pokemon has an elemental typing, ability, capability or move not natural to its species. If the total exceeds 20, you know all the specific differences between that pokemon and a normal member of its species.');
INSERT INTO pokemondata2.trainer_features VALUES (965, 'Improved Tracking', '--', 0, '--', 'Static', 74, 'Whenever your Pokemon roll to use the Tracker capability, add 5 to the roll.');
INSERT INTO pokemondata2.trainer_features VALUES (966, 'Odor Sleuth Tutor', 'A pokemon who is leveling up to a level evenly divisible by 5.', 2, '--', 'Trainer', 74, 'Roll 1d20 and add your WIS modifier. If the total exceeds 15, the pokemon learns the Move, Odor Sleuth. Once you successfully use Odor Sleuth Tutor on a pokemon, Odor Sleuth Tutor may not target that pokemon ever again.');
INSERT INTO pokemondata2.trainer_features VALUES (967, 'Quick Draw', '--', 0, '--', 'Static', 74, 'You are a master sketch artist. It takes you less than a minute to sketch anything you see.');
INSERT INTO pokemondata2.trainer_features VALUES (968, 'Shiny Hunt', 'Anywhere on a route.', 1, '--', 'Trainer', 74, 'Roll 1d100. If you rolled under you WIS modifier multiplied by 3, a shiny pokemon will appear in the next wild encounter.');
INSERT INTO pokemondata2.trainer_features VALUES (969, 'Silent Study', '--', 0, '--', 'Static', 74, 'If you use Close Watch, you donât alert the pokemonâs attention unless you want to after approaching with Close Watch. As long as you do not make it obvious you are there, the Wild will not know you are there.');
INSERT INTO pokemondata2.trainer_features VALUES (970, 'Treacherous Research', 'An area, trainer or organization ', 1, '--', '15 minutes', 74, 'Spend at least 15 minutes studying research material about or watching the target. Choose up to three Moves. For the rest of the day, you may use the move Spite one time as a trainer action against the target trainer or a pokemon or trainer from or owned by the target as if their last used Move was one of the chosen Moves. You may only use Treacherous Research once per target per day.');
INSERT INTO pokemondata2.trainer_features VALUES (971, 'Type Finder', 'Wild Pokemon', 2, '--', 'Trainer', 74, 'Roll 1d20 and add your WIS modifier. If the total exceeds 13, you find hints that indicate what other pokemon of the same Type live in the area. You must still use other means to find these pokemon. If the total exceeds 20, you locate food sources and other resources pokemon of this Type commonly rely upon, which may include berry plants, vegetation, sources of water and other things depending on GM discretion.');
INSERT INTO pokemondata2.trainer_features VALUES (972, 'Watchful Tactician', 'You start an encounter with wild pokemon', 2, '--', 'Free', 74, 'You may, as a free action, use Game Plan, Game Plan+, or Sabotage at the beginning of this encounter before any other trainers or pokemon take actions. You must have the corresponding Feature to use it via Watchful Tactician. Using a Feature in such a way depletes both a use of that Feature and of Watchful Tactician. You may only activate Watchful Tactician once per trigger.');
INSERT INTO pokemondata2.trainer_features VALUES (973, 'Watchful Tactician +', 'You start an encounter of any sort', 2, '--', 'Free', 74, 'You may, as a free action, use Game Plan, Game Plan+, or Sabotage at the beginning of this encounter before any other trainers or pokemon take actions. You must have the corresponding Feature to use it via Watchful Tactician+. Using a Feature in such a way depletes both a use of that Feature and of Watchful Tactician+. You may only activate Watchful Tactician+ once per trigger. Watchful Tactician+ replaces Watchful Tactician.');


--
-- Data for Name: user_messages; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Data for Name: user_permission_definitions; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--

INSERT INTO pokemondata2.user_permission_definitions VALUES (1, 'Admin', 'User has full access to the application.');
INSERT INTO pokemondata2.user_permission_definitions VALUES (2, 'GM', 'User can edit content for the assigned campaign.');
INSERT INTO pokemondata2.user_permission_definitions VALUES (3, 'Loyalty', 'User can view the Loyalty of Pokemon.');


--
-- Data for Name: user_permissions; Type: TABLE DATA; Schema: pokemondata2; Owner: postgres
--



--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.accounts_id_seq', 1, false);


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.campaigns_id_seq', 1, true);


--
-- Name: contest_move_abilities_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.contest_move_abilities_id_seq', 26, true);


--
-- Name: player_pokemon_abilities_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_pokemon_abilities_id_seq', 1, true);


--
-- Name: player_pokemon_capabilities_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_pokemon_capabilities_id_seq', 1, true);


--
-- Name: player_pokemon_data_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_pokemon_data_id_seq', 1, true);


--
-- Name: player_pokemon_moves_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_pokemon_moves_id_seq', 1, true);


--
-- Name: player_pokemon_stats_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_pokemon_stats_id_seq', 1, true);


--
-- Name: player_trainer_classes_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_trainer_classes_id_seq', 1, true);


--
-- Name: player_trainer_features_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_trainer_features_id_seq', 1, true);


--
-- Name: player_trainers_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.player_trainers_id_seq', 1, true);


--
-- Name: pokemon_abilities_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.pokemon_abilities_id_seq', 273, true);


--
-- Name: pokemon_capabilities_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.pokemon_capabilities_id_seq', 49, true);


--
-- Name: pokemon_held_items_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.pokemon_held_items_id_seq', 76, true);


--
-- Name: pokemon_moves_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.pokemon_moves_id_seq', 581, true);


--
-- Name: pokemon_natures_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.pokemon_natures_id_seq', 35, true);


--
-- Name: pokemon_types_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.pokemon_types_id_seq', 18, true);


--
-- Name: ptu_pokemon_moves_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.ptu_pokemon_moves_id_seq', 556, true);


--
-- Name: trainer_classes_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.trainer_classes_id_seq', 74, true);


--
-- Name: trainer_features_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.trainer_features_id_seq', 973, true);


--
-- Name: user_messages_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.user_messages_id_seq', 1, true);


--
-- Name: user_permission_definitions_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.user_permission_definitions_id_seq', 3, true);


--
-- Name: user_permissions_id_seq; Type: SEQUENCE SET; Schema: pokemondata2; Owner: postgres
--

SELECT pg_catalog.setval('pokemondata2.user_permissions_id_seq', 1, true);


--
-- Name: campaigns idx_25731_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.campaigns
    ADD CONSTRAINT idx_25731_primary PRIMARY KEY (id);


--
-- Name: contest_move_abilities idx_25740_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.contest_move_abilities
    ADD CONSTRAINT idx_25740_primary PRIMARY KEY (id);


--
-- Name: player_pokemon_abilities idx_25752_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_abilities
    ADD CONSTRAINT idx_25752_primary PRIMARY KEY (id);


--
-- Name: player_pokemon_capabilities idx_25758_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_capabilities
    ADD CONSTRAINT idx_25758_primary PRIMARY KEY (id);


--
-- Name: player_pokemon_data idx_25764_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_data
    ADD CONSTRAINT idx_25764_primary PRIMARY KEY (id);


--
-- Name: player_pokemon_moves idx_25773_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_moves
    ADD CONSTRAINT idx_25773_primary PRIMARY KEY (id);


--
-- Name: player_pokemon_stats idx_25779_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_pokemon_stats
    ADD CONSTRAINT idx_25779_primary PRIMARY KEY (id);


--
-- Name: player_trainers idx_25785_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_trainers
    ADD CONSTRAINT idx_25785_primary PRIMARY KEY (id);


--
-- Name: player_trainer_classes idx_25791_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_trainer_classes
    ADD CONSTRAINT idx_25791_primary PRIMARY KEY (id);


--
-- Name: player_trainer_features idx_25797_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.player_trainer_features
    ADD CONSTRAINT idx_25797_primary PRIMARY KEY (id);


--
-- Name: pokemon_abilities idx_25803_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_abilities
    ADD CONSTRAINT idx_25803_primary PRIMARY KEY (id);


--
-- Name: pokemon_capabilities idx_25812_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_capabilities
    ADD CONSTRAINT idx_25812_primary PRIMARY KEY (id);


--
-- Name: pokemon_held_items idx_25821_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_held_items
    ADD CONSTRAINT idx_25821_primary PRIMARY KEY (id);


--
-- Name: pokemon_moves idx_25830_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_moves
    ADD CONSTRAINT idx_25830_primary PRIMARY KEY (id);


--
-- Name: pokemon_natures idx_25839_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_natures
    ADD CONSTRAINT idx_25839_primary PRIMARY KEY (id);


--
-- Name: pokemon_types idx_25848_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.pokemon_types
    ADD CONSTRAINT idx_25848_primary PRIMARY KEY (id);


--
-- Name: ptu_pokemon_moves idx_25863_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.ptu_pokemon_moves
    ADD CONSTRAINT idx_25863_primary PRIMARY KEY (id);


--
-- Name: trainer_classes idx_25872_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.trainer_classes
    ADD CONSTRAINT idx_25872_primary PRIMARY KEY (id);


--
-- Name: trainer_features idx_25878_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.trainer_features
    ADD CONSTRAINT idx_25878_primary PRIMARY KEY (id);


--
-- Name: user_messages idx_25887_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.user_messages
    ADD CONSTRAINT idx_25887_primary PRIMARY KEY (id);


--
-- Name: user_permissions idx_25896_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.user_permissions
    ADD CONSTRAINT idx_25896_primary PRIMARY KEY (id);


--
-- Name: user_permission_definitions idx_25902_primary; Type: CONSTRAINT; Schema: pokemondata2; Owner: postgres
--

ALTER TABLE ONLY pokemondata2.user_permission_definitions
    ADD CONSTRAINT idx_25902_primary PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

