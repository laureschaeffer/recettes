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

?>