-- 20 trouver la recette la plus couteuse de la base de données

SELECT round(SUM(quantite * prix), 2) AS prixPreparation
FROM etape
INNER JOIN ingredient ON etape.id_ingredient = ingredient.id_ingredient
WHERE (quantite * prix) = (SELECT MAX(quantite * prix) FROM ingredient);
