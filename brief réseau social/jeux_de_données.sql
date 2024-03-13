 --------------------------------Insertion table USERS-------------------
INSERT INTO users(surname, firstname, genre, mail, password, birthday) VALUES('Parrot','Henri','male','HenriParrot@armyspy.com','Uroo3aeji','1/31/1985'),
('Du Trieux','Pinabel','male','PinabelDuTrieux@superrito.com','epooxai4H','7/12/1975'),
('Barrette','Louis','male','LouisBarrette@rhyta.com','miZ1wee9Qu','4/22/1976'),
('Beauchemin','Fifine','female','FifineBeauchemin@fleckens.hu','uu7IeThah','11/7/1974'),
('Guernon','Amorette','female','AmoretteGuernon@fleckens.hu','muv4AhngaaTh','8/9/1970'),
('Arpin','Pinabel','male','PinabelArpin@armyspy.com','Baijae1oh','7/27/1967'),
('Veronneau','Théophile','male','TheophileVeronneau@rhyta.com','Ul5hahzeigh','4/4/1997'),
('Sansouci','Beltane','male','BeltaneSansouci@rhyta.com','ieyeew2Tho','1/27/1971'),
('Généreux','Marveille','female','MarveilleGenereux@gustr.com','thoo4SiPiyae','11/5/1984'),
('Sicard','Varden','male','VardenSicard@cuvox.de','Owee7aijaa7','12/25/2000');

----------------------------------Insertion table post-----------
INSERT INTO post (users_id, content, create_at) VALUES(1, 'SIMPLON POWER', '01/01/1998 10:02:30'),
(2, 'coucou', '09/10/1995 23:32:03'),
(3, 'salut', '01/02/2010 10:12:32'),
(4, 'bondour', '21/11/2006 06:43:05'),
(4, 'oh des nems', '18/08/2020 12:42:04'),
(7, 'JsonX', '13/12/2001 00:08:40'),
(6, 'JOYEUX NOËL', '25/12/2021 16:48:30'),
(2, 'Bonne Année', '01/01/2016 00:01:02'),
(1, 'SIMPLON forever', '29/01/2024 08:45:30'),
(1, 'MAIF nous voilà', '01/02/2024 09:00:00');

-----------------------------------Insertion table likes---------------------
INSERT INTO likes (post_id, users_id) VALUES
(1, 2),
(2, 1), 
(3, 1), 
(2, 5), 
(4, 4), 
(1, 6),
(1, 7);

-------------------------------------Insertion table comment-----------------
INSERT INTO comment(users_id, content) VALUES( 1, 'bravo'), (2, 'merci'), (3, 'test');

----------------------------------------------------------------------------------------

---------------------------------- insertion nouveau user---------------------
INSERT INTO users (surname, firstname, genre, mail, password, birthday) VALUES (:surname, :firstname, :genre, :mail, :password, :birthday);

-- ---------------------------------insertion nouveau post--------------------
INSERT INTO post ( content, users) VALUES (:content, :users);

--------------------------------insertion d'un nouveau commentaire ------------------
INSERT INTO comment (content, post) VALUES (:content, :post);

-- ---------------------------insertion commentaire ou image ou photo----------------

INSERT INTO comment (content, users_id) VALUES ('C:/Workspaces/brief réseau social/maif.png', '1');
INSERT INTO comment (content, users_id) VALUES ('https://simplon.co/', '3');

----------------------------------------insertion likes--------------------------
INSERT INTO likes (users_id, post_id) VALUES(:users_id, :post_id);

----------------------------------------------------------------------------------------
                    --------------------------SUIVIE-----------------------------

----------------------------------------suivre utilisateur------------------------------
INSERT INTO follow (followed_id, follower_id) VALUES (1, 2);


-------------------------------------------------------------------------------------------
--------------------------------------insertion groupe de partage-------------------

INSERT INTO GroupePartage (name, description, visibility) VALUES ('Groupe1', 'Chasse & Pêche', 'public');
INSERT INTO GroupePartage (name, description) VALUES ('Groupe2', 'cuir moustache');
INSERT INTO GroupePartage (name, description) VALUES ('Group3', 'mode');


INSERT INTO users_groupe (users_id, GroupePartage_id) VALUES (1, 1);
INSERT INTO users_groupe (users_id, GroupePartage_id, role) VALUES (6, 2, 'Super Admin');
INSERT INTO users_groupe (GroupePartage_id, users_id, role) VALUES (3, 1,'Super Admin'), 
(2, 3, 'Admin'), 
(1, 4, 'Membre'), 
(3, 5, 'Visitor');

------------------------------------------------------------------------------------------

