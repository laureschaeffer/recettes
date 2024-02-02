-- 13 Afficher les recettes qui contiennent lingredient Poulet

SELECT recette.nom_recette, etape.id_ingredient
FROM etape
INNER JOIN recette ON etape.id_recette = recette.id_recette
WHERE etape.id_ingredient=1