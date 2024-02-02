-- 18 Trouver les ingrédients qui sont utilisés dans au moins 3 recettes

SELECT id_ingredient
FROM etape
GROUP BY id_ingredient
HAVING COUNT(*) >= 3;
