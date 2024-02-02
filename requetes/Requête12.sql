-- 12 Afficher le nombre de recettes par catégorie 

SELECT categorie.nom_categorie, COUNT(*) AS nombreRecette
FROM recette 
INNER JOIN categorie ON recette.id_categorie = categorie.id_categorie
GROUP BY categorie.id_categorie