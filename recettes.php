<?php
ob_start(); // en lien avec la temporisation de sortie

require_once "bdd-connect.php";

// ------------------------------REQUETE SQL POUR TOUTES LES INFO DE TOUTES LES RECETTES--------------------------------------
$sqlQuery= "SELECT r.nom_recette, r.temp_preparation, r.instructions, c.nom_categorie
FROM RECETTE r
INNER JOIN CATEGORIE c ON r.id_categorie = c.id_categorie";
$recetteStatement = $mysqlClient->prepare($sqlQuery);
$recetteStatement->execute();


// ----------------------------------------Afficher plusieurs infos pour chaque recette------------------------------


// $recipes = $recetteStatement->fetchAll(); 
// foreach ($recipes as $recipe) {

while ($recipe = $recetteStatement->fetch(PDO::FETCH_ASSOC)) {
    // Affichage de tous les éléments
    ?>
    <div class="recette">
        <h2><?php echo $recipe['nom_recette']; ?> </h2>
        <h3><?php echo $recipe['nom_categorie']; ?> </h3>
        <p><?php echo $recipe['temp_preparation']; ?> minutes de préparation <p>
        <p><?php echo $recipe['instructions']; ?> <p>
    </div>

    <?php
}


//éléments pour la temporisation de sortie
$title = "Liste de toutes les recettes";
$content= ob_get_clean();

require_once "PDO-template.php";



    