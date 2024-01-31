-- Afficher recettes qui nécessitent au moins 30min

SELECT nom_recette 
FROM recette 
WHERE temp_preparation >= 30;