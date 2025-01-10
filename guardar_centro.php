<?php

// Configuración de la conexión a la base de datos
$host = "localhost";
$dbname = "facultad"; // Nombre de la base de datos
$username = "root";          // Usuario de la base de datos
$password = "";              // Contraseña del usuario

try {
    // Crear conexión a la base de datos
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Comprobar si se enviaron los datos desde el formulario
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $numero_centro = $_POST['numero_centro'];
        $computadoras = $_POST['computadoras'];
        $inicio_semestre = $_POST['inicio_semestre'];
        $fin_semestre = $_POST['fin_semestre'];

        // Validar datos recibidos
        if (is_numeric($numero_centro) && $numero_centro >= 1 && $numero_centro <= 7 && is_numeric($computadoras) && $computadoras > 0) {
            // Insertar los datos en la tabla
            $stmt = $pdo->prepare("INSERT INTO registrocentro (numero_centro, computadoras, inicio_semestre, fin_semestre) 
                                   VALUES (:numero_centro, :computadoras, :inicio_semestre, :fin_semestre)");
            $stmt->bindParam(':numero_centro', $numero_centro, PDO::PARAM_INT);
            $stmt->bindParam(':computadoras', $computadoras, PDO::PARAM_INT);
            $stmt->bindParam(':inicio_semestre', $inicio_semestre, PDO::PARAM_STR);
            $stmt->bindParam(':fin_semestre', $fin_semestre, PDO::PARAM_STR);
            $stmt->execute();

            echo "Registro guardado exitosamente.";
        } else {
            echo "Por favor, ingresa datos válidos.";
        }
    }
} catch (PDOException $e) {
    echo "Error en la conexión o en la consulta: " . $e->getMessage();
}
echo "<p><a href='index.html'><button type='button'>Volver al inicio</button></a></p>";
?>