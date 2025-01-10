<?php
// Configuración de conexión a la base de datos
$host = "localhost"; // Cambiar si es necesario
$user = "root"; // Usuario de la base de datos
$password = ""; // Contraseña de la base de datos
$dbname = "facultad"; // Nombre de la base de datos

// Crear conexión
$conn = new mysqli($host, $user, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Verificar si los datos vienen del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $correo = $_POST['correo'];
    $materia = $_POST['materia'];
    $carrera = $_POST['carrera'];
    $semestre = $_POST['semestre'];
    $grupo = $_POST['grupo'];
    $horario = $_POST['horario'];
    $alumnos = $_POST['alumnos'];
    $programas = $_POST['programas'];

    // Consulta para insertar datos en la tabla
    $sql = "INSERT INTO docentes (nombre, correo, materia, carrera, semestre, grupo, horario, alumnos, programas)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Preparar la consulta
    $stmt = $conn->prepare($sql);
    if ($stmt) {
        // Asignar los valores
        $stmt->bind_param("ssssissis", $nombre, $correo, $materia, $carrera, $semestre, $grupo, $horario, $alumnos, $programas);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            echo "El docente se ha registrado correctamente.";
        } else {
            echo "Error al registrar el docente: " . $stmt->error;
        }

        // Cerrar el statement
        $stmt->close();
    } else {
        echo "Error al preparar la consulta: " . $conn->error;
    }
}

echo "<p><a href='index.html'><button type='button'>Volver al inicio</button></a></p>";
?>