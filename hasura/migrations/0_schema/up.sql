CREATE TABLE public.blog_posts (
    id integer NOT NULL,
    title text NOT NULL,
    url text NOT NULL
);
CREATE SEQUENCE public.blog_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.blog_posts_id_seq OWNED BY public.blog_posts.id;

CREATE TABLE public.extensions (
    id integer NOT NULL,
    name text NOT NULL,
    type text,
    url text
);
CREATE SEQUENCE public.extensions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.extensions_id_seq OWNED BY public.extensions.id;

ALTER TABLE ONLY public.blog_posts ALTER COLUMN id SET DEFAULT nextval('public.blog_posts_id_seq'::regclass);
ALTER TABLE ONLY public.extensions ALTER COLUMN id SET DEFAULT nextval('public.extensions_id_seq'::regclass);

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_url_key UNIQUE (url);
ALTER TABLE ONLY public.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);



