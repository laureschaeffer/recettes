-- 14 mettre à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes

UPDATE recette
SET temp_preparation = (temp_preparation -5)