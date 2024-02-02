-- 15 afficher les recettes qui ne nécessitent pas d'ingrédiets coutant plus de 2€ chacun

SELECT ingredient.prix, ingredient.nom_ingredient, recette.nom_recette
FROM ingredient
INNER JOIN recette ON ingredient.id_ingredient = recette.id_recette
WHERE prix <= 2