-- 9 Afficer détail recette n°5 (liste ingredient, quantités, prix

SELECT ROUND(quantite * prix,2) AS prixTotal, etape.quantite, etape.id_ingredient, ingredient.nom_ingredient 
FROM etape
INNER JOIN ingredient ON etape.id_ingredient = ingredient.id_ingredient
WHERE id_recette=5;
