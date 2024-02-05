<!-- ------------------------------------------  Fichier de temporisation de sortie ----------------------------- -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Recettes</title>
</head>
<body>
    <nav>
        <a href="PDO-Recette.php">Liste de toutes les recettes</a>
        <a href="PDO-Ingredient.php">Detail recette poulet rôti</a>
    </nav>
    <h1>
        <?=$title ?>
    </h1>

    <div id="wrapper">
        <?= $content //ici le contenu propre a chaque page ?>
    </div>
</body>
</html>