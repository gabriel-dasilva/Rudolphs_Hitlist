INSERT INTO lookup_murder_method (method_description)
VALUES ('Hang them'),
('Stab them'),
('Freeze them alive'),
('Burn them at the stake'),
('Pull them apart with horses'),
('Shoot them'),
('Bury them alive');

INSERT INTO lookup_body_disposal_method (disposal_method_description)
VALUES ('Bury them in the woods under a dead animal'),
('Burn the remains'),
('Chop up the remains and dispose of the parts in different dumpsters'),
('Bury them under another graduate house'),
('Destroy their identifying markers and sink in a lake'),
('Serve them to your enemies');

INSERT INTO hangouts (hangout_name,hangout_latitude,hangout_longitude)
VALUES ('Rosebank Starbucks',-26.14526211458126, 28.041881395067303),
('Northgate ice-rink',-26.059325548292307, 27.947624092256508),
('Jolly Rogers',-26.14299366442897, 28.01689112671815),
('Curzon Mayfair',51.506499767901246, -0.14797470611884386),
('Independence Brewery',18.57107961619239, 73.77552680714254);

INSERT INTO grad_information (name,surname,home_location_latitude,home_location_longitude)
VALUES ('Johnathan','McDeadalready',51.5064997679012, -0.147974706118810),
('Ivan','von Staden',-29.879482980439796, 30.921251458040075),
('Graduate','Graduateface',18.4889393939,73.7111111123);

INSERT INTO frequent_hangouts (hangout_id,hangout_day,hangout_time,grad_id)
VALUES (4,'Monday','18:00:00',1),
(3,'Tuesday','19:00',2),
(1,'Friday','07:00',2),
(5,'Wednesday','19:00',3),
(2,'Sunday','21:00',2);

INSERT INTO hitlist (grad_id,murder_method_id,body_disposal_method_id,hit_completion_status)
VALUES (1,6,3,'1'),
(2,5,2,'0'),
(3,7,5,'0');