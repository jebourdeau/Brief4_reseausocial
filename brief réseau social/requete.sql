----- users; post, comment, likes-------
SELECT * FROM users;
SELECT * FROM post;
SELECT * FROM comment;
SELECT * FROM likes;
SELECT * FROM groupepartage;
SELECT * FROM users_groupe;

-- token = clé externe  google ou discord --

ALTER TABLE users
ADD token VARCHAR(255);


----------filtrer les données par date
 SELECT content FROM post ORDER BY create_at ASC;

----------filtrer les données par auteur

SELECT content FROM post ORDER BY users_id DESC;
--------2eme méthode
SELECT content, u.surname
FROM post p 
JOIN users u 
ON p.users_id = u.id
ORDER BY u.surname ASC;


---------Recherche post par mot clé.........
SELECT * FROM post WHERE content LIKE '%:mot-clé%';
---------Recherche utilisateur par mot clé.........
SELECT * FROM users WHERE LOWER(surname) LIKE LOWER ('%:mot-clé%') OR LOWER (firstname) LIKE LOWER ('%:mot-clé%'); 
SELECT * FROM users WHERE LOWER(surname) LIKE LOWER ('%le%') OR LOWER (firstname) LIKE LOWER ('%le%'); ----exemple


---- nombre de like par post----
SELECT post_id, count(users_id) FROM likes GROUP BY post_id ORDER BY count DESC;
---- nombre de like par post rename----
SELECT post_id, count(users_id) AS likez FROM likes GROUP BY post_id ORDER BY likez DESC;


----------------------------------------modification du role --------------------------

UPDATE users_groupe SET role = 'Membre' WHERE users_id = 2 AND GroupePartage_id = 3;



-------------------remake like, post et informations 
SELECT  p.* ,count(l.users_id) 
FROM likes l
JOIN post p
ON p.id = l.users_id
GROUP BY p.id
ORDER BY count DESC;