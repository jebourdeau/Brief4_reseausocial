-- DROP TABLE IF EXISTS user cascade;


CREATE TABLE users (
   id SERIAL PRIMARY KEY,
   surname VARCHAR (50) NOT NULL,
   firstname VARCHAR (50) NOT NULL,
   genre VARCHAR(10) NOT NULL,
   mail VARCHAR (100) NOT NULL,
   password VARCHAR(30) NOT NULL,
   birthday VARCHAR(30) NOT NULL,
   notification BOOL NOT NULL DEFAULT true
   );


CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    users_id INT, 
    content VARCHAR (800) NOT NULL,
    create_at TIMESTAMP
   );

CREATE TABLE comment (
    id SERIAL,
    users_id INT,
    post_id INT,
    content VARCHAR (500),
    create_at TIMESTAMP
);

CREATE TABLE likes (
    id SERIAL,
    PRIMARY KEY (id),
    users_id INT REFERENCES users(id),
    post_id INT REFERENCES post(id)
);

CREATE TABLE follow (
    id SERIAL,
    follower_id INT,
    followed_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_follower
        FOREIGN KEY(follower_id)
        REFERENCES users(id),
    CONSTRAINT fk_followed
        FOREIGN KEY (followed_id)
        REFERENCES users(id)
);

----groupe de partage------
CREATE TABLE GroupePartage(
    id SERIAL PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    visibility VARCHAR (100) DEFAULT 'private',
    description VARCHAR (500) NOT NULL
);

CREATE TABLE users_groupe(
    role VARCHAR(100) NOT NULL DEFAULT 'Visitor',
    users_id INT REFERENCES users(id),
    GroupePartage_id INT REFERENCES GroupePartage(id),
    PRIMARY KEY (users_id, GroupePartage_id)
);
