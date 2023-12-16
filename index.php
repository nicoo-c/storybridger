<?php
    session_start();

    // Verificar si hay una sesión existente
    if (!isset($_SESSION['usu_id'])) {
        $_SESSION['usu_id'] = NULL;
        $_SESSION['usu_tipo'] = 4;
        $_SESSION['usu_nom'] = "Invitado";
    } 


    // Definir las páginas de inicio correspondientes a cada tipo de usuario
    $redirecciones = array("home_user_admin.php","home_user_mod.php","home_user.php","home.php");
    // Agrega más tipos de usuarios según sea necesario



    $tipoUsuario = $_SESSION['usu_tipo'] - 1;
    if (array_key_exists($tipoUsuario, $redirecciones)) {
        // Redireccionar a la página de inicio correspondiente
        header("Location: " . $redirecciones[$tipoUsuario]);
        exit();
    } else {
        // Manejar el caso en que el tipo de usuario no es válido
        echo "Tipo de usuario no válido.";
        // Puedes redirigir a una página predeterminada o mostrar un mensaje de error, según tus necesidades.
    }

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redirección</title>
</head>
<body>
    <!-- Contenido HTML si es necesario -->
</body>
</html>
