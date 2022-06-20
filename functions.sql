-- Recherche des séances pour un jour donné pour tous les cinémas (un même horaire proposant toujours le même film, même dans deux cinémas différents)
-- La requête filtrant les noms du cinéma, du film ainsi que la séance, juste en changeant le filtre aux lignes 11 et 12 on peut recueillir les séances pour
-- un seul cinéma par exemple, ou bien pour rechercher un film donné sur toutes les séances

SELECT movie_theater.name 'Cinéma', CONCAT(movie_session.date, ' ', movie_session.time) 'Séance', movie.name 'Film'
FROM movie_room_session
JOIN movie_session ON movie_room_session.movie_session_id = movie_session.id
JOIN movie ON movie_session.movie_id = movie.id
JOIN movie_room ON movie_room_session.movie_room_id = movie_room.id
JOIN movie_theater ON movie_room.movie_theater_id = movie_theater.id
WHERE movie_session.date = '2022-06-20'  || WHERE movie_theater.name = "Olympia" -- Pour filtrer toutes les séances du cinéma Olympia ainsi que le film || WHERE movie.name = "Zootopie" -- Pour rechercher toutes les séances de Zootopie dans tous les cinémas
ORDER BY time;

