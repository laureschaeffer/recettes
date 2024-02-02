-- 16 Afficher recettes les plus rapides à préparer

SELECT id_recette, nom_recette, temp_preparation
FROM recette
WHERE temp_preparation = (SELECT MIN(temp_preparation) FROM recette);

-- sous-requête