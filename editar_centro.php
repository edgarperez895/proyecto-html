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
// Buscar un docente
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['buscar_centro'])) {
    $centros = $_GET['buscar_centro'];

    $sql = "SELECT * FROM registrocentro WHERE numero_centro LIKE ?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $nombre_param = "%" . $centros . "%";
        $stmt->bind_param("s", $nombre_param);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            echo "<h2>Resultados de la búsqueda:</h2>";
            while ($row = $result->fetch_assoc()) {
                // Mostrar el formulario prellenado
                echo "<form action='' method='POST'>";
                echo "<input type='hidden' name='id_docente' value='" . htmlspecialchars($row['id'], ENT_QUOTES) . "'>";

                echo "numero_centro: <input type='number' name='numero_centro' value='" . htmlspecialchars($row['numero_centro'], ENT_QUOTES) . "'><br>";
                echo "computadoras: <input type='number' name='computadoras' value='" . htmlspecialchars($row['computadoras'], ENT_QUOTES) . "'><br>";
// Añadir los campos de fecha para inicio y fin del semestre
                echo "Inicio del semestre: <input type='date' name='inicio_semestre' value='" . htmlspecialchars($row['inicio_semestre'], ENT_QUOTES) . "'><br>";
                echo "Fin del semestre: <input type='date' name='fin_semestre' value='" . htmlspecialchars($row['fin_semestre'], ENT_QUOTES) . "'><br>";

                echo "<button type='submit'>Guardar Cambios</button>";
                echo "</form>";
            }
        } else {
            echo "No se encontraron resultados.";
        }

        $stmt->close();
    } else {
        echo "Error al preparar la consulta: " . $conn->error;
    }
}

// Actualizar centro de computo
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_docente'])) {
    // Recuperar los datos del formulario
    $id_docente = intval($_POST['id_docente']);
    $numero_centro = $_POST['numero_centro'];
    $computadoras = $_POST['computadoras'];
    $inicio_semestre = $_POST['inicio_semestre'];
    $fin_semestre = $_POST['fin_semestre'];

    // Consulta de actualización
    $sql = "UPDATE registrocentro 
            SET numero_centro = ?, computadoras = ?, inicio_semestre = ?, fin_semestre = ?
            WHERE id = ?";

    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Vincular parámetros
        $stmt->bind_param(
                "iisss", // Se agregan los tipos de datos para las fechas (s = string)
                $numero_centro,
                $computadoras,
                $inicio_semestre,
                $fin_semestre,
                $id_docente
        );

        // Ejecutar la consulta
        if ($stmt->execute()) {
            echo "El Centro de cómputo se ha actualizado correctamente.";
        } else {
            echo "Error al actualizar el centro de cómputo: " . $stmt->error;
        }

        $stmt->close();
    } else {
        echo "Error al preparar la consulta: " . $conn->error;
    }
}

echo "<p><a href='index.html'><button type='button'>Volver al inicio</button></a></p>";
$conn->close();
?>