-- 2 afficher nombre d'ingrédients par recette

SELECT recette.nom_recette, COUNT(etape.id_ingredient) AS total_ingredients
FROM RECETTE
INNER JOIN ETAPE ON recette.id_recette = etape.id_recette
GROUP BY recette.nom_recette
ORDER BY temp_preparation DESC;