-- 1 afficher recettes disponibles (nom, catégorie avec 1= entree, 2=plat et 3=dessert, puis temps de préparation en min)

SELECT recette.nom_recette, recette.instructions, recette.temp_preparation, categorie.nom_categorie
FROM recette
INNER JOIN categorie ON recette.id_categorie = categorie.id_categorie
ORDER BY temp_preparation DESC;
