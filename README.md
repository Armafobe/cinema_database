-- Techniques pour permettre une meilleure sécurité et une meilleure sauvegarde d'une base de données

1. La première technique évidente est de faire un backup régulier de notre base de données, idéalement journalier, au minimum hebodmadaire. 

2. Dans le cas plus probable où notre site doit manipuler des données sensibles (cartes de crédits, mots de passe, addresse postale, ...), régulariser le site sous proxy HTTPS permet de crypter ces données et donc de les protéger.

3. Si on choisit d'accueillir notre base sur un serveur web, éviter au maximum un serveur gratuit. Privilégier un hôte payant en s'assurant que celui-ci n'ai jamais eu de souci de brêche de sécurité et de perte de données.

4. En corrélation avec le 3., Utiliser le même serveur pour notre site et notre bdd risque un accès trop facile aux données, alors qu'en utilisant un serveur différent, cela permet à la bdd d'être moins soumise aux attaques et brêches.

5. En complément du 2., s'assurer de crypter toutes les données sauvegardées et envoyées afin d'éviter une lecture des données en cas de cyber-attaque.
