-- Recherche des séances pour un jour donné pour tous les cinémas (un même horaire proposant toujours le même film, même dans deux cinémas différents)
-- La requête filtrant les noms du cinéma, du film ainsi que la séance, juste en changeant le filtre à la ligne 11 on peut recueillir les séances pour
-- un seul cinéma par exemple, ou bien pour rechercher un film donné sur toutes les séances, comme déccrit après

SELECT movie_theater.name 'Cinéma', CONCAT(movie_session.date, ' ', movie_session.time) 'Séance', movie.name 'Film'
FROM movie_room_session
JOIN movie_session ON movie_room_session.movie_session_id = movie_session.id
JOIN movie ON movie_session.movie_id = movie.id
JOIN movie_room ON movie_room_session.movie_room_id = movie_room.id
JOIN movie_theater ON movie_room.movie_theater_id = movie_theater.id
WHERE movie_session.date = '2022-06-20'  || WHERE movie_theater.name = "Olympia" -- Pour filtrer toutes les séances du cinéma Olympia || WHERE movie.name = "Zootopie" -- Pour rechercher toutes les séances de Zootopie dans tous les cinémas
ORDER BY time;

-- Recherche des réservations effectuées par les clients en fonction de leur type (sur place ou en ligne), la date de paiement et la séance correspondante

SELECT CONCAT(customer.lastname, ' ', customer.firstname) 'Client', payment_type 'Payé', payment_date 'Date de paiement', CONCAT(movie_session.date, ' ', movie_session.time) 'Séance réservée' from booking
JOIN movie_session ON booking.movie_session_id_booking = movie_session.id
JOIN customer ON booking.customer_id = customer.id
ORDER BY date;

-- Vérification du nombre de place restantes pour chaque séance en fonction du cinéma, du film et du numéro de salle

SELECT 
	movie_theater.name 'Cinéma',
	movie.name 'Film',
	movie_room.movie_room_number 'Numéro de salle',
    concat(movie_session.date, ' ', movie_session.time) 'Séance',
	movie_room.seats 'Places au total',
	count(booking.movie_session_id_booking) 'Réservations',
	movie_room.seats - count(booking.movie_session_id_booking) 'Places restantes'
FROM booking
JOIN movie_room_session
JOIN movie_session ON movie_room_session.movie_session_id = movie_session.id
JOIN movie ON movie_session.movie_id = movie.id
JOIN movie_room ON movie_room_session.movie_room_id = movie_room.id
JOIN movie_theater ON movie_room.movie_theater_id = movie_theater.id
GROUP BY movie_session_id
ORDER BY date;
