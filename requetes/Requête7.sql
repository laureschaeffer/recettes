-- 7 supprimer recette 2 (tomates farcies)
-- DELETE FROM etape
-- WHERE id_recette = 2;  d'abord supprimer les endroits où recette 2 existent à étape, car il y a une contrainte de clés étrangères

DELETE FROM recette WHERE id_recette=2;