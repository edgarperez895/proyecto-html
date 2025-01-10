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

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['buscar_centro'])) {
    // Buscar un centro de computo
    $nombre = trim($_GET['buscar_centro']);

    if (!empty($nombre)) {
        $sql = "SELECT * FROM registrocentro WHERE numero_centro LIKE ?";
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
                echo "Numero_centro: " . htmlspecialchars($row['numero_centro'], ENT_QUOTES) . "<br>";
                echo "Compytadoras: " . htmlspecialchars($row['computadoras'], ENT_QUOTES) . "<br>";
                echo "<button type='submit'>Eliminar</button>";
                echo "</form>";
                echo "<hr>";
            }
        } else {
            $mensaje = "No se encontró ningún centro de computo.";
        }
        $stmt->close();
    } else {
        $mensaje = "Por favor, ingresa un centro de computo para buscar.";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_docente'])) {
    // Eliminar un docente por ID
    $id_docente = intval($_POST['id_docente']);

    if ($id_docente > 0) {
        $sql = "DELETE FROM registrocentro WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $id_docente);

        if ($stmt->execute()) {
            $mensaje = "El centro de computo ha sido eliminado exitosamente.";
        } else {
            $mensaje = "Hubo un error al intentar eliminar el centro de computo.";
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
