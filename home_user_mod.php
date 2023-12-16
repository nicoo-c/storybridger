<?php
session_start();
//si usu_tipo no es 2, redirigir a denegado.html
if ($_SESSION['usu_tipo'] != 2) {
    header("Location: denegado.html");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Story Bridger (mod)</title>
    <link rel="stylesheet" href="home.css"> 
</head>
<body>
    <!-- Barra -->
    <header>
        <div class="logo">
            <img src="IMG/logo.png" alt="Enterprise Logo">
        </div>
        <div>Hola, <?php echo $_SESSION['usu_nom']; ?>!</div>
        <h1 class="site-title">Story Bridger</h1> <!-- Moved the "Story Bridger" title outside of the nav -->
        <nav>
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Peliculas</a></li>
                <li><a href="#">Juegos</a></li>
                <li><a href="#">Series</a></li>
                <li><a href="#">Libros</a></li>
            </ul>
        </nav>
        <div class="header-right">
            <div class="user">
                <a href="#">Sugerencias</a> |<a href="user.html">Mi Perfil </a> | <a href="#">Sugerencia</a> | <a href="logout.php">Cerrar Sesión</a>
            </div>
            <section class="search-bar">    
                <form action="busqueda_obra.php" method="post">
                    <input type="text" name="palabra_clave" placeholder="ingrese la obra a buscar">
                    <button type="submit">buscar</button>
                </form>
            </section>
        </div>
    </header>
    

    <!-- Contenido al centro de la pagina -->
    <main>

        <section class="content">
            <!-- Obras a mostrar -->
            <?php

            error_reporting(E_ALL);
            ini_set('display_errors', 1);
            include "config.php";

            //Realizar consulta para obtener obras desde la base de datos
            $query = "SELECT * FROM OBRA";
            $result = $conn->query($query);

            while ($row = $result->fetch_assoc()) {
                echo '<div class="item">';
                echo '<a href="#">';
                echo '<h2>' . $row['OBRA_NOM'] . '</h2>';
                echo '<img src="' . $row['OBRA_IMG'] . '" alt="' . $row['OBRA_TIPO'] . '">';
                echo '</a>';
                echo '</div>';
            }

            //Cerrar conexión a la base de datos
            $conn->close();
            ?>
            <!--agregables -->
        </section>
    </main>

    <!-- pie de pagina -->
    <footer>
        <p>&copy; 2023 Story Bridger </p> 
    </footer>
</body>
</html>
