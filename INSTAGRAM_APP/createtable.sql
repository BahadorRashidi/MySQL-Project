-- source C:/Users/Bahador/Desktop/GoogleDrive/MySQL Course/Priliminaries Code/MySQL-Project/INSTAGRAM_APP/createtable.sql;
DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
-- USE ig_clone;


CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_At TIMESTAMP DEFAULT NOW()
);

-- INSERT INTO users (username) VALUES
--     ('bluethecat'),
--     ('charliebrown'),
--     ('bahadorrashidi');


CREATE TABLE photos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- INSERT INTO photos(image_url, user_id) VALUES
-- ('/asghjdaf442',1),
-- ('/asghjdaf442',2),
-- ('/asdjaf442',2),
-- ('/aasddaf442',1),
-- ('/ashjdaf442',2);

SELECT image_url, username FROM photos 
    JOIN users ON users.id = photos.user_id;



CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(255) NOT NULL,
    user_id INT NOT NULL, 
    photo_id INT NOT NULL,
    Created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- INSERT INTO comments (comment, user_id, photo_id) VALUES
--     ('MEOW', 1, 2),
--     ('Amazing shot!', 3, 2),
--     ('I<3 This', 2, 1);


-- when we dont want to refere to an entity later you dont put any primary id for it
-- ID we want to have a unique combination of the user and photo not duplicate we add the last line
CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT Null,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    PRIMARY KEY(user_id, photo_id)
);

-- INSERT INTO likes (user_id, photo_id) VALUES
--     (1,1),
--     (2,1),
--     (1,2),
--     (3,3),
--     (1,3);

-- wont work because of the primary constarint
-- INSERT INTO likes (user_id, photo_id) VALUES (1,1)


CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

-- INSERT INTO follows (follower_id, followee_id) VALUES
-- (1,2),
-- (1,3),
-- (2,1),
-- (3,1);


CREATE TABLE tags(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);


INSERT INTO tags(tag_name) VALUES
('adorable'),
('nice'),
('amazing');

-- INSERT INTO photo_tags (photo_id, tag_id) VALUES
-- (1,1),
-- (1,2),
-- (3,1),
-- (2,1);












