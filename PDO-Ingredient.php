<?php
ob_start(); // en lien avec la temporisation de sortie
try
{
	$mysqlClient = new PDO('mysql:host=localhost;dbname=recettes_laure;charset=utf8', 'root', '');
	[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]; // pour afficher les erreurs

}
catch (Exception $e)
{
    die('Erreur : ' . $e->getMessage());
} 

$sqlQuery= "SELECT i.nom_ingredient
FROM RECETTE r
INNER JOIN CATEGORIE c ON r.id_categorie = c.id_categorie
INNER JOIN ETAPE e ON r.id_recette = e.id_recette
INNER JOIN INGREDIENT i ON e.id_ingredient = i.id_ingredient
WHERE r.id_recette=7"; // id_recette=7 correspond à la recette poulet rôti

$recetteStatement = $mysqlClient->prepare($sqlQuery);
$recetteStatement->execute();
// Boucle pour récupérer tous les éléments contenus dans i.nom_ingredient
// fetch permet de ne récupérer qu'un seul élément seul sans boucle, qu'il met dans un tableau associatif en créant l'index au nom de cet élément


while ($row = $recetteStatement->fetch(PDO::FETCH_ASSOC)) {
    // Affichage de chaque nom d'ingrédient
    ?>
    <ul>
        <li><?php echo $row['nom_ingredient']; ?></li>
    </ul>
    <?php
}


$title = "Ingrédients pour la recette poulet rôti";
$content= ob_get_clean();
require_once "PDO-template.php";
?>