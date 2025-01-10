<?php
$host = "localhost";
$user = "root";
$password = "";
$dbname = "facultad";

$conn = new mysqli($host, $user, $password, $dbname);

// Verificar si la conexión es exitosa
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
$mensaje = ''; // Variable para mensajes en el frontend

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['buscar_nombre'])) {
    // Buscar un docente por nombre
    $nombre = trim($_GET['buscar_nombre']);

    if (!empty($nombre)) {
        $sql = "SELECT * FROM docentes WHERE nombre LIKE ?";
        $stmt = $conn->prepare($sql);
        $nombre_param = '%' . $nombre . '%';
        $stmt->bind_param('s', $nombre_param);
        $stmt->execute();
        $resultado = $stmt->get_result();

        if ($resultado->num_rows > 0) {
            echo "<h2>Resultados de la búsqueda:</h2>";
            while ($row = $resultado->fetch_assoc()) {
                echo "<form action='' method='POST'>";
                echo "<input type='hidden' name='id_docente' value='" . htmlspecialchars($row['id'], ENT_QUOTES) . "'>";
                echo "ID: " . $row['id'] . "<br>";
                echo "Nombre: " . htmlspecialchars($row['nombre'], ENT_QUOTES) . "<br>";
                echo "Correo: " . htmlspecialchars($row['correo'], ENT_QUOTES) . "<br>";
                echo "Materia: " . htmlspecialchars($row['materia'], ENT_QUOTES) . "<br>";
                echo "Carrera: " . htmlspecialchars($row['carrera'], ENT_QUOTES) . "<br>";
                echo "Semestre: " . htmlspecialchars($row['semestre'], ENT_QUOTES) . "<br>";
                echo "Grupo: " . htmlspecialchars($row['grupo'], ENT_QUOTES) . "<br>";
                echo "Horario: " . htmlspecialchars($row['horario'], ENT_QUOTES) . "<br>";
                echo "<button type='submit'>Eliminar</button>";
                echo "</form>";
                echo "<hr>";
            }
        } else {
            $mensaje = "No se encontró ningún docente con ese nombre.";
        }
        $stmt->close();
    } else {
        $mensaje = "Por favor, ingresa un nombre para buscar.";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_docente'])) {
    // Eliminar un docente por ID
    $id_docente = intval($_POST['id_docente']);

    if ($id_docente > 0) {
        $sql = "DELETE FROM docentes WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $id_docente);

        if ($stmt->execute()) {
            $mensaje = "El docente ha sido eliminado exitosamente.";
        } else {
            $mensaje = "Hubo un error al intentar eliminar al docente.";
        }

        $stmt->close();
    } else {
        $mensaje = "ID inválido. No se puede eliminar.";
    }
    
}

// Cerrar la conexión
$conn->close();

// Mostrar mensaje
if (!empty($mensaje)) {
    echo "<p>$mensaje</p>";
}
// Botón para volver al index.html
echo "<p><a href='index.html'><button type='button'>Volver al inicio</button></a></p>";
?>
