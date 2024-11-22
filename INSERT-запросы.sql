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
('Shake It Off', '00:03:28', 2), 
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

-- Добавляем сборники в таблицу collections для 2019 и 2020 годов
INSERT INTO collections (collection_title, release_year)
VALUES
    ('Rock & Pop Hits 2019', 2019), -- Сборник, выпущенный в 2019 году
    ('Top Tracks 2020', 2020);      -- Сборник, выпущенный в 2020 году

-- Добавляем треки в эти сборники
INSERT INTO collection_track (collection_id, track_id)
VALUES
    (5, 1), -- 'Brown Sugar' в сборнике'Rock & Pop Hits 2019'
    (5, 3), -- 'Shake It Off' в сборник 'Rock & Pop Hits 2019'
    (6, 2), -- 'Wild Horses' в сборник 'Top Tracks 2020'
    (6, 5); -- 'Jail' в сборник 'Top Tracks 2020'
    
-- Добавляеи исполнителей с односложным именем
INSERT INTO artists (artist_name)
VALUES
    ('Eminem'), -- Жанр: Hip-Hop
    ('Adele');  -- Жанр: Pop

-- Связываем исполнителей с их жанрами в таблице artist_genre
INSERT INTO artist_genre (artist_id, genre_id)
VALUES
    ((SELECT artist_id FROM artists WHERE artist_name = 'Eminem'), 3), -- Hip-Hop
    ((SELECT artist_id FROM artists WHERE artist_name = 'Adele'), 2);  -- Pop

-- Добавляем альбомы
INSERT INTO albums (album_title, release_year)
VALUES
    ('Music to Be Murdered By', 2020), -- Альбом Eminem
    ('30', 2019);                     -- Альбом Adele

-- Связываем исполнителей с их альбомами в таблице artist_album
INSERT INTO artist_album (artist_id, album_id)
VALUES
    ((SELECT artist_id FROM artists WHERE artist_name = 'Eminem'), 
     (SELECT album_id FROM albums WHERE album_title = 'Music to Be Murdered By')),
    ((SELECT artist_id FROM artists WHERE artist_name = 'Adele'), 
     (SELECT album_id FROM albums WHERE album_title = '30'));

-- Добавляем треки Eminem
INSERT INTO tracks (track_title, duration, album_id)
VALUES
    ('My Shadows', '00:03:45', (SELECT album_id FROM albums WHERE album_title = 'Music to Be Murdered By')),
    ('Godzilla', '00:03:30', (SELECT album_id FROM albums WHERE album_title = 'Music to Be Murdered By'));

-- Добавляем треки Adele
INSERT INTO tracks (track_title, duration, album_id)
VALUES
    ('My Heart Will Go On', '00:04:20', (SELECT album_id FROM albums WHERE album_title = '30')),
    ('Rolling in the Deep', '00:03:50', (SELECT album_id FROM albums WHERE album_title = '30'));