-- Afficher les recettes qui contiennent le mot salade

SELECT nom_recette
FROM recette
WHERE nom_recette LIKE '%salade%';