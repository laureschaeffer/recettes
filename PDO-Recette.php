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

// ------------------------------REQUETE SQL POUR TOUTES LES INFO DE TOUTES LES RECETTES--------------------------------------
$sqlQuery= "SELECT r.nom_recette, r.temp_preparation, r.instructions, c.nom_categorie
FROM RECETTE r
INNER JOIN CATEGORIE c ON r.id_categorie = c.id_categorie";
$recetteStatement = $mysqlClient->prepare($sqlQuery);
$recetteStatement->execute();

// ----------------------------------------Afficher première requête SQL------------------------------

while ($row = $recetteStatement->fetch(PDO::FETCH_ASSOC)) {
    // Affichage de tous les éléments
    ?>
    <h2><?php echo $row['nom_recette']; ?> </h2>
    <h4><?php echo $row['nom_categorie']; ?> </h4>
    <p><?php echo $row['temp_preparation']; ?> minutes de préparation <p>
    <p><?php echo $row['instructions']; ?> <p>
    <?php
}


//éléments pour la temporisation de sortie
$title = "Liste de toutes les recettes";
$content= ob_get_clean();

require_once "PDO-template.php";



    