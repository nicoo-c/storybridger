<?php
// Conexión a la base de datos (suponiendo que estás usando XAMPP localmente)
include "config.php";

session_start();
if (isset($_SESSION['usu_id'])) {
    header("Location: index.php");
    exit();
}

// Procesamiento del formulario de registro
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username']; // Nombre de usuario enviado desde el formulario
    $email = $_POST['email']; // Correo electrónico enviado desde el formulario
    $password = $_POST['password']; // Contraseña enviada desde el formulario 
    $password2 = $_POST['password2'];
    
    if($password != $password2) {
        die('Passwords do not match');
    } else {
        // Aplica el hash a la contraseña
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        

        // Inserta los datos en la base de datos
        $sql = "INSERT INTO USUARIO (USUARIO_NOM, USUARIO_CORREO, USUARIO_CLAVE, USUARIO_FECHANAC, USUARIO_TIPO) VALUES ('$username', '$email', '$hashed_password', NULL, 3)";

        if ($conn->query($sql) === TRUE) {
            echo "Registro exitoso";
            $_SESSION['usu_id'] = $conn->insert_id;
            $_SESSION['usu_nom'] = $username;
            $_SESSION['usu_tipo'] = 3;
        
            header('Location: home_user.php');
            exit;
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <link rel="stylesheet" href="register_style.css">
</head>
<body>
    <div class="register">
        <h1>Registro</h1>
        <form method="post" action="auto_registro.php">
            <div class="input-group">
                <label for="username">Nombre de usuario</label>
                <input type="text" name="username" placeholder="Nombre de usuario" required>
            </div>
            <div class="input-group">
                <label for="email">Correo electrónico</label>
                <input type="email" name="email" placeholder="Correo electrónico" required>
            </div>
            <div class="input-group">
                <label for="password1">Contraseña</label>
                <input type="password" name="password" placeholder="Contraseña" required>
            </div>
            <div class="input-group">
                <label for="password2">Confirmar contraseña</label>
                <input type="password" name="password2" placeholder="Contraseña" required>
            </div>
            <input type="submit" value="Registrarse">
        </form>
    </div>
</body>
</html>