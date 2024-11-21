-- Заполнение таблицы genres (жанры)
INSERT INTO genres (genre_name) VALUES 
('Rock'), 
('Pop'), 
('Hip-Hop');

-- Заполнение таблицы artists (исполнители)
INSERT INTO artists (artist_name) VALUES 
('The Rolling Stones'), 
('Taylor Swift'), 
('Kanye West'), 
('Ariana Grande');

-- Заполнение таблицы artist_genre (связь исполнителей и жанров)
INSERT INTO artist_genre (artist_id, genre_id) VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 2);

-- Заполнение таблицы albums (альбомы)
INSERT INTO albums (album_title, release_year) VALUES 
('Sticky Fingers', 1971), 
('1989', 2014), 
('Donda', 2021);

-- Заполнение таблицы artist_album (связь исполнителей и альбомов)
INSERT INTO artist_album (artist_id, album_id) VALUES 
(1, 1), 
(2, 2), 
(3, 3);

-- Заполнение таблицы tracks (треки)
INSERT INTO tracks (track_title, duration, album_id) VALUES 
('Brown Sugar', '00:03:50', 1), 
('Wild Horses', '00:04:50', 1), 
('Shake It Off', '00:03:39', 2), 
('Blank Space', '00:03:50', 2), 
('Jail', '00:04:57', 3), 
('Hurricane', '00:04:03', 3);

-- Заполнение таблицы collections (сборники)
INSERT INTO collections (collection_title, release_year) VALUES 
('Best of Rock', 2018), 
('Pop Hits', 2019), 
('Hip-Hop Legends', 2020), 
('Summer Vibes', 2021);

-- Заполнение таблицы collection_track (связь сборников и треков)
INSERT INTO collection_track (collection_id, track_id) VALUES 
(1, 1), 
(1, 2), 
(2, 3), 
(2, 4), 
(3, 5), 
(4, 6);
