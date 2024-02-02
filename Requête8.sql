-- 8 afficher le prix total de la recette 5


SELECT SUM(quantite * prix) 
FROM etape
INNER JOIN ingredient ON etape.id_ingredient = ingredient.id_ingredient
WHERE id_recette=5;

