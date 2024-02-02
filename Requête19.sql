-- 18 Trouver les ingrédients qui sont utilisés dans au moins 3 recettes

SELECT etape.id_ingredient, ingredient.nom_ingredient
FROM etape
INNER JOIN ingredient ON etape.id_ingredient = ingredient.id_ingredient
GROUP BY id_ingredient
HAVING COUNT(*) >= 3;