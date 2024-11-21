--Количество исполнителей в каждом жанре:
SELECT g.genre_name, COUNT(ag.artist_id) AS artist_count 
FROM genres g
JOIN artist_genre ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов:
SELECT COUNT(t.track_id) AS track_count 
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому:
SELECT a.album_title, AVG(t.duration) AS avg_duration 
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_title;

--Все исполнители, которые не выпустили альбомы в 2020 году:
SELECT DISTINCT ar.artist_name 
FROM artists ar
LEFT JOIN artist_album aa ON ar.artist_id = aa.artist_id
LEFT JOIN albums al ON aa.album_id = al.album_id
WHERE al.release_year != 2020 OR al.release_year IS NULL;

--Названия сборников, в которых присутствует конкретный исполнитель (Kanye West):
SELECT DISTINCT c.collection_title 
FROM collections c
JOIN collection_track ct ON c.collection_id = ct.collection_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN artist_album aa ON a.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.artist_name = 'Kanye West';