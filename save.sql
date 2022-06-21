-- Sauvegarder la base de données

mysqldump -u [root|username] -p [root|database] > save.sql

-- Restaurer la base de données

mysql -h localhost:8889 -u [root|username] -p [root|database] cinema_booking < save.sql
