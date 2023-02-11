CREATE TABLE ecm."domain" (
	id serial4 NOT NULL,
	code varchar(10) NOT NULL,
	code_definition varchar(255) NULL,
	active bool NOT NULL DEFAULT true,
	create_on timestamp NOT NULL DEFAULT now(),
	modify_on timestamp NOT NULL DEFAULT now(),
	CONSTRAINT domain_code_key UNIQUE (code),
	CONSTRAINT domain_pkey PRIMARY KEY (id)
);
CREATE INDEX domain_code_idx ON ecm.domain USING btree (code);

ALTER TABLE ecm."domain" OWNER TO ecm;
GRANT ALL ON TABLE ecm."domain" TO ecm;

CREATE TABLE ecm.domain_member (
	id serial4 NOT NULL,
	member_code varchar(25) NOT NULL,
	member_definition varchar(255) NULL,
	active bool NOT NULL DEFAULT true,
	id_domain int4 NOT NULL,
	create_on timestamp NOT NULL DEFAULT now(),
	modify_on timestamp NOT NULL DEFAULT now(),
	CONSTRAINT domain_member_pkey PRIMARY KEY (id),
	CONSTRAINT domain_member_uk UNIQUE (member_code, id_domain),
	CONSTRAINT domain_member_domain_fk FOREIGN KEY (id_domain) REFERENCES ecm."domain"(id)
);
CREATE INDEX domain_member_value_domain_idx ON ecm.domain_member USING btree (member_code, id_domain);
CREATE INDEX domain_member_value_idx ON ecm.domain_member USING btree (member_code);

ALTER TABLE ecm.domain_member OWNER TO ecm;
GRANT ALL ON TABLE ecm.domain_member TO ecm;

CREATE TABLE ecm.domain_member_text (
	id_domain_member int4 NOT NULL,
	idiom varchar(2) NOT NULL,
	member_text varchar(255) NOT NULL,
	create_on timestamp NOT NULL DEFAULT now(),
	modify_on timestamp NOT NULL DEFAULT now(),
	CONSTRAINT domain_member_text_pk PRIMARY KEY (id_domain_member, idiom),
	CONSTRAINT domain_member_text_value_fk FOREIGN KEY (id_domain_member) REFERENCES ecm.domain_member(id)
);

CREATE OR REPLACE FUNCTION ecm.check_idiom_for_domain_member_text()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
	DECLARE 
		valid_idiom boolean;
	BEGIN
    	IF TG_OP='INSERT' or (TG_OP = 'UPDATE' AND old.IDIOM <> new.IDIOM) THEN
			SELECT CASE WHEN id IS NULL THEN FALSE ELSE TRUE END INTO valid_idiom FROM ecm.domain_member WHERE member_code = new.idiom;
			IF valid_idiom THEN
				return new;
			ELSE
				RAISE EXCEPTION 'Invalid idiom';
			END IF;
		END IF;
	END;
$function$
;

ALTER FUNCTION ecm.check_idiom_for_domain_member_text() OWNER TO ecm;
GRANT ALL ON FUNCTION ecm.check_idiom_for_domain_member_text() TO ecm;

create trigger check_idiom_for_domain_member_text_trigger before
insert or update
on
ecm.domain_member_text for each row execute function ecm.check_idiom_for_domain_member_text();

ALTER TABLE ecm.domain_member_text OWNER TO ecm;
GRANT ALL ON TABLE ecm.domain_member_text TO ecm;

