<!DOCTYPE html>
<html>
<head>
    <title>Resultados de búsqueda</title>
    <style>
        .item {
            margin-bottom: 20px;
        }
        h2 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        img {
            width: 150px;
            height: 200px;
        }
    </style>
</head>
<body>
    <h1>Resultados de búsqueda</h1>
    <div id="resultados">
    <?php

    require_once 'config.php';

    // Obtener la palabra clave del formulario HTML
    $palabraClave = isset($_POST['palabra_clave']) ? $_POST['palabra_clave'] : '';

    // Verificar la conexión
    if (!$conn) {
        die("Error al conectar a la base de datos: " . mysqli_connect_error());
    }

    // Preparar la consulta SQL
    if (!empty($palabraClave)) {
        $query = "SELECT * FROM OBRA WHERE OBRA_NOM LIKE '%$palabraClave%'";
        $result = $conn->query($query);

        while ($row = $result->fetch_assoc()) {
            echo '<div class="item">';
            echo '<a href="#">';
            echo '<h2>' . $row['OBRA_NOM'] . '</h2>';
            echo '<img src="' . $row['OBRA_IMG'] . '" alt="' . $row['OBRA_TIPO'] . '">';
            echo '</a>';
            echo '</div>';
        }
    }

    ?>

    </div>
</body>
</html>


