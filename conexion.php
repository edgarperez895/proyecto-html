<?php
// conexion.php
$host = "localhost";
$dbname = "facultad";
$username = "root";
$password = "";

try {
    // Conexión a la base de datos
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Obtener todos los registros (materias y estudiantes)
    $stmt = $pdo->query("SELECT * FROM docentes");
    $docentes = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}
?>