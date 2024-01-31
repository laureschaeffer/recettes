-- 1 afficher recettes disponibles (nom, catégorie avec 1= entree, 2=plat et 3=dessert, puis temps de préparation en min)

SELECT nom_recette, id_categorie, temp_preparation
FROM recette
ORDER BY temp_preparation DESC; 
