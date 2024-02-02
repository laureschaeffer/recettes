-- 17 Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau chaude qui consiste à verser de l’eau chaude dans une tasse)

SELECT recette.nom_recette, etape.id_ingredient
FROM etape
INNER JOIN recette ON etape.id_recette = recette.id_recette
WHERE id_ingredient IS NULL  