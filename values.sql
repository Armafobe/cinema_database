INSERT INTO admin (username, password) VALUES 
('lsewill0', '$2y$10$4A3LYXJ39OSZK96BnUx07uQXmhG98GB3sbEyWxWQOmuxOFsJ5Eed.'),
('zblaylock1', '$2y$10$LUDtIo/Lk34XXPQGxAYn0OloHabgkydgGaY54gMFjCZFNdA8tF83i'),
('rdovermann2', '$2y$10$FnmJKZYVMo11OWmm48gb3OWzaqLLeiS9fn2rnusv1a3mvszdlEWUu'),
('rdabels3', '$2y$10$MMeKx8tzdOBoSsJXBVyXU.64/ixpwdnR8l/A8Qslq0azb16R15Z86'),
('gstoller4', '$2y$10$PBXadQd7Ss6xpsRMN3zg1epCzwzBmpVyWJeoEtCSHKkYRz2jIKGNu');

INSERT INTO user (username, password) VALUES 
('bgiabuzzi0', '$2y$10$bPqmyAQ/EtuPPUSsfq5wFeV.nBbauAq6K/.6lYH1g/A7d6PCdh/hi'),
('fmcteague1', '$2y$10$ciR0vo5YzQOa4lVFHnCcHOoyCQ9UkiuzHNxcNRvuTGMpEOL3YvsoK'),
('kfoddy2', '$2y$10$K5GdJIexEJgY3wxfm8FHH.WCZ7VWCOEHW.LewzJuOuy3eNnF9qrUm'),
('nbechley3', '$2y$10$EfU1BU3wC2deLT9B78dXl.zA.6WEBpeXkJYcvWcDsfRVd8lYXStNa'),
('deilhart4', '$2y$10$Mopa7UkmF5LvS1O1J/8eMOmJ6iSctHl8zjh0SP51BT5kI3RzfeIU.');

INSERT INTO movie_theater (name, city, address, zipcode, user_id) VALUES
('Cinémarine', 'Saint-Gilles-Croix-de-Vie', 'Rue de la Félicite', 85800, 1),
('Gaumont', 'Nantes', '12 Place du Commerce', 44000, 2),
('Le Royal', 'Biarritz', '8 Avenue du Maréchal Foch', 64200, 3),
('Pathé', 'Annecy', '7 Avenue de Brogny', 74000, 3),
('Olympia', 'Cannes', '5 Rue de la Pompe', 06400, 4),
('UGC Ciné Cité Bercy', 'Paris', '2 Cour Saint-Emilion', 75012, 5),
('UGC Ciné Cité Strasbourg Etoile', 'Strasbourg', '25 Avenue du Rhin', 67100, 5);
