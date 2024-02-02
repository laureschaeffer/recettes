-- 2 afficher nombre d'ingrédients par recette

SELECT nom_recette, id_categorie, temp_preparation, 
FROM recette,
ORDER BY temp_preparation DESC; 
LEFT JOIN etape ON recette.id_etape = etape.id_etape;