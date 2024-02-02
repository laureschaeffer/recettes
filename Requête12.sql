-- 12 Afficher le nombre de recettes par catégorie 

SELECT categorie.nom_categorie, COUNT(*) AS nombreRecette
FROM recette 
INNER JOIN categorie ON recette.id_categorie = categorie.id_categorie
WHERE recette.id_categorie IN (1, 2, 3)
GROUP BY recette.id_categorie, categorie.nom_categorie