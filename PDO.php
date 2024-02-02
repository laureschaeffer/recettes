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

// -----------------------première requete SQL

$sqlQuery= "SELECT *
FROM RECETTE r
INNER JOIN CATEGORIE c ON r.id_categorie = c.id_categorie
INNER JOIN ETAPE e ON r.id_recette = e.id_recette
INNER JOIN INGREDIENT i ON e.id_ingredient = i.id_ingredient";
$recetteStatement = $mysqlClient->prepare($sqlQuery);
$recetteStatement->execute();
$row = $recetteStatement->fetch(PDO::FETCH_ASSOC);
$recipes = $recetteStatement->fetchAll(); 

// Afficher première requête SQL

// foreach ($recipes as $recipe) {

// 	echo $recipe['nom_recette']." <br>";
//     echo $recipe['nom_categorie']." <br>";
//     echo $recipe['instructions']." <br>"; 
//     echo $recipe['temp_preparation']." <br>";
// }

// --------------------------deuxième requête SQL

echo $recipes[0]['nom_recette'];
$sqlQuery2= "SELECT i.nom_ingredient, i.prix, i.unite_mesure
FROM etape e
INNER JOIN ingredient i ON e.id_ingredient = i.id_ingredient
WHERE e.id_recette=8";
$recetteStatement2 = $mysqlClient->prepare($sqlQuery2);
$recetteStatement2->execute();

while (($row = $recetteStatement2->fetch(PDO::FETCH_ASSOC)) !== false) {
    echo $row['nom_ingredient']." ";
    echo $row['prix']." ";
    echo $row['unite_mesure']." ";

}