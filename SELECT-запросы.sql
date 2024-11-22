-- Получить название и продолжительность самого длинного трека
SELECT track_title, duration 
FROM tracks 
ORDER BY duration DESC 
LIMIT 1;

-- Получить названия треков, которые длятся 3,5 минуты и дольше
SELECT track_title 
FROM tracks 
WHERE duration >= '00:03:30';

-- Получить названия сборников, выпущенных с 2018 по 2020 год
SELECT collection_title 
FROM collections 
WHERE release_year BETWEEN 2018 AND 2020;

-- Найти исполнителей, чьё имя состоит из одного слова
SELECT artist_name 
FROM artists 
WHERE artist_name NOT LIKE '% %';

-- Получить названия треков, содержащих слово "мой" или "my" (регистр не учитывается)
SELECT track_title 
FROM tracks 
WHERE track_title ILIKE '%мой%' OR track_title ILIKE '%my%';

-- Подсчитать количество исполнителей в каждом жанре
SELECT g.genre_name, COUNT(ag.artist_id) AS artist_count 
FROM genres g
JOIN artist_genre ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name;

-- Подсчитать количество треков из альбомов, выпущенных в 2019–2020 годах
SELECT COUNT(t.track_id) AS track_count 
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Вычислить среднюю продолжительность треков для каждого альбома
SELECT a.album_title, AVG(t.duration) AS avg_duration 
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_title;

-- Найти исполнителей, которые не выпустили альбомы в 2020 году
SELECT ar.artist_name 
FROM artists ar
WHERE ar.artist_id NOT IN (
    SELECT aa.artist_id 
    FROM artist_album aa
    JOIN albums al ON aa.album_id = al.album_id
    WHERE al.release_year = 2020
);

-- Получить названия сборников, в которые входят треки определенного исполнителя
SELECT DISTINCT c.collection_title 
FROM collections c
JOIN collection_track ct ON c.collection_id = ct.collection_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN artist_album aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_name = 'Taylor Swift';