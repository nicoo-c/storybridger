<?php

session_start();

if(isset($_SESSION['usu_id'])) {
    header("Location: index.php");
    exit();
}

include "config.php";   

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $entered_username = $_POST['username'];
    $entered_password = $_POST['password'];

    echo "Usuario: " . $entered_username . "<br>";
    echo "Contraseña: " . $entered_password . "<br>";

    // Consulta preparada para evitar inyección SQL
    $sql = "SELECT USUARIO_ID, USUARIO_CLAVE, USUARIO_TIPO FROM USUARIO WHERE USUARIO_NOM = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $entered_username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $stored_hash = $row['USUARIO_CLAVE'];
        $type = $row['USUARIO_TIPO'];

        if (password_verify($entered_password, $stored_hash)) {
            // Contraseña válida, permitir acceso
            echo "Inicio de sesión exitoso";
            $_SESSION['usu_id'] = $row['USUARIO_ID'];
            $_SESSION['usu_nom'] = $entered_username;
            $_SESSION['usu_tipo'] = $type;
            header("Location: index.php");
            exit;
            // Redirigir a la página de éxito o mostrar contenido protegido
        } else {
            // Contraseña inválida, mostrar mensaje de error
            echo "Nombre de usuario o contraseña incorrectos";
        }
    } else {
        // Usuario no encontrado, mostrar mensaje de error
        echo "Nombre de usuario o contraseña incorrectos";
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login_style.css">
</head>
<body>
    <div class="login">
        <h1>Story Bridger</h1>
        <form method="post" action="login.php">
            <div class="username">
                <input type="text" placeholder="Nombre de usuario" name="username" required>
            </div>
            <div class="username">
                <input type="password" placeholder="Contraseña" name="password" required>
            </div>
            <div class="recordar">
                <a href="recuperar.html">Olvido su contraseña?</a>    
            </div>
            <input type="submit" value="Iniciar sesión">
            
            <div class="registrarse">
            <label>Nuevo en Story Bridger?</label> <a href="auto_registro.html"> registrarse</a>
            </div>
        </form>
    </div>
</body>
</html>