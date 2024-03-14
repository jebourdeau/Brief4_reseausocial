----------------------------------- users; post, comment, likes-------------------------
SELECT * FROM users;
SELECT * FROM post;
SELECT * FROM comment;
SELECT * FROM likes;
SELECT * FROM groupepartage;
SELECT * FROM users_groupe;

-- ----------------------------------token = clé externe  google ou discord -------------------

ALTER TABLE users
ADD 'token' VARCHAR(255);


------------------------------------filtrer les données par date--------------
 SELECT content FROM post ORDER BY create_at ASC;

------------------------------------Trie par date----------------------------------
SELECT Content, create_at FROM post WHERE create_at >'01/01/1999 00:00:01' AND create_at <'24/12/2010 23:59:59';


------------------------------------filtrer les données par auteur avec pagination----------------------------
SELECT content FROM post ORDER BY users_id DESC LIMIT 3 OFFSET 2;
------------------------------------2eme méthode----------------------------
SELECT content, u.surname
FROM post p 
JOIN users u 
ON p.users_id = u.id
ORDER BY u.surname ASC
LIMIT 6 OFFSET 4;


-------------------------------------filtrer par popularité ( like par post)----
SELECT post_id, count(users_id) FROM likes GROUP BY post_id ORDER BY count DESC;
------------------------------------ nombre de like par post rename----
SELECT post_id, count(users_id) AS likez FROM likes GROUP BY post_id ORDER BY likez DESC;




-------------------------------------Recherche post par mot clé.........
SELECT * FROM post WHERE content LIKE '%:mot-clé%';
-------------------------------------Recherche utilisateur par mot clé.........
SELECT * FROM users WHERE LOWER(surname) LIKE LOWER ('%:mot-clé%') OR LOWER (firstname) LIKE LOWER ('%:mot-clé%'); 
SELECT * FROM users WHERE LOWER(surname) LIKE LOWER ('%le%') OR LOWER (firstname) LIKE LOWER ('%le%'); ----exemple


----------------------------------------modification du role --------------------------

UPDATE users_groupe SET role = 'Membre' WHERE users_id = 2 AND GroupePartage_id = 3;

--------------------------------------modification role dans le groupe-----------------
UPDATE groupepartage SET visibility = 'public' WHERE name = 'Group3';
UPDATE groupepartage SET visibility = 'private' WHERE name = 'Groupe1';
SELECT * FROM groupepartage;

--------------------------------------remake like, post et informations---------------------------- 
SELECT  p.* ,count(l.users_id) 
FROM likes l
JOIN post p
ON p.id = l.users_id
GROUP BY p.id
ORDER BY count DESC;

----------------------------------------update notification ---------------------------------
UPDATE users_id  SET notification = 'false'; 