<?php
try
{
	$mysqlClient = new PDO('mysql:host=localhost;dbname=recettes_laure;charset=utf8', 'root', '');
	[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]; // pour afficher les erreurs

}
catch (Exception $e)
{
    die('Erreur : ' . $e->getMessage());
}

// requete SQL
$sqlQuery= "SELECT *
FROM RECETTE r
INNER JOIN CATEGORIE c ON r.id_categorie = c.id_categorie
INNER JOIN ETAPE e ON r.id_recette = e.id_recette
INNER JOIN INGREDIENT i ON e.id_ingredient = i.id_ingredient";
$recetteStatement = $mysqlClient->prepare($sqlQuery);
$recetteStatement->execute();
$row = $recetteStatement->fetch(PDO::FETCH_ASSOC);

var_dump($row);

// echo $row['nom_recette'];
// echo $row['nom_categorie'];
// echo $row['temp_preparation'];
// echo $row['instructions'];

$sqlQuery2= "SELECT i.nom_ingredient
FROM etape e
INNER JOIN ingredient i ON e.id_ingredient = i.id_ingredient
GROUP BY i.nom_ingredient";
$recetteStatement2 = $mysqlClient->prepare($sqlQuery2);
$recetteStatement2->execute();
$row2 = $recetteStatement2->fetchAll();

var_dump($row2);
