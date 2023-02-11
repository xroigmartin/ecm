INSERT INTO ecm."domain" (code,code_definition,active,create_on,modify_on) VALUES
	 ('LANG_APP','Languages of application',true,now(),now()),
	 ('DOMAIN','Word for references any concept of domains',true,now(),now());


INSERT INTO ecm.domain_member (member_code,member_definition,active,id_domain,create_on,modify_on) VALUES
	 ('EN','English language',true,(SELECT id FROM ecm.domain WHERE code = 'LANG_APP'),now(),now()),
	 ('ES','Spanish language',true,(SELECT id FROM ecm.domain WHERE code = 'LANG_APP'),now(),now()),
	 ('DOM','Domain',true,(SELECT id FROM ecm.domain WHERE code = 'DOMAIN'),now(),now()),
	 ('DOM_MEM','Domain member',true,(SELECT id FROM ecm.domain WHERE code = 'DOMAIN'),now(),now()),
	 ('DOM_MEM_TEXT','Text the member of domain',true,(SELECT id FROM ecm.domain WHERE code = 'DOMAIN'),now(),now());


INSERT INTO ecm.domain_member_text (id_domain_member,idiom,member_text,create_on,modify_on) VALUES
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'EN' and id_domain = (SELECT id from ecm.domain WHERE code = 'LANG_APP')),'EN','English',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'EN' and id_domain = (SELECT id from ecm.domain WHERE code = 'LANG_APP')),'ES','Ingles',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'ES' and id_domain = (SELECT id from ecm.domain WHERE code = 'LANG_APP')),'EN','Spanish',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'ES' and id_domain = (SELECT id from ecm.domain WHERE code = 'LANG_APP')),'ES','Español',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'DOM' and id_domain = (SELECT id from ecm.domain WHERE code = 'DOMAIN')),'EN','Domain of information',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'DOM' and id_domain = (SELECT id from ecm.domain WHERE code = 'DOMAIN')),'ES','Dominio de información',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'DOM_MEM' and id_domain = (SELECT id from ecm.domain WHERE code = 'DOMAIN')),'EN','Member of domain',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'DOM_MEM' and id_domain = (SELECT id from ecm.domain WHERE code = 'DOMAIN')),'ES','Miembro del dominio',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'DOM_MEM_TEXT' and id_domain = (SELECT id from ecm.domain WHERE code = 'DOMAIN')),'EN','Text',now(),now()),
	 ((SELECT id FROM ecm.domain_member WHERE member_code = 'DOM_MEM_TEXT' and id_domain = (SELECT id from ecm.domain WHERE code = 'DOMAIN')),'ES','Texto',now(),now());
