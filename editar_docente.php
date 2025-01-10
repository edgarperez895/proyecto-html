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
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['buscar_nombre'])) {
    $docente = $_GET['buscar_nombre'];

    $sql = "SELECT * FROM docentes WHERE nombre LIKE ?";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $nombre_param = "%" . $docente . "%";
        $stmt->bind_param("s", $nombre_param);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            echo "<h2>Resultados de la búsqueda:</h2>";
            while ($row = $result->fetch_assoc()) {
                // Mostrar el formulario prellenado
                echo "<form action='' method='POST'>";
                echo "<input type='hidden' name='id_docente' value='" . htmlspecialchars($row['id'], ENT_QUOTES) . "'>";
                echo "Nombre: <input type='text' name='nombre' value='" . htmlspecialchars($row['nombre'], ENT_QUOTES) . "'><br>";
                echo "Correo: <input type='email' name='correo' value='" . htmlspecialchars($row['correo'], ENT_QUOTES) . "'><br>";
                echo "Materia: <input type='text' name='materia' value='" . htmlspecialchars($row['materia'], ENT_QUOTES) . "'><br>";
                // Campo de selección para carrera
                echo "Carrera: <select name='carrera'>";
                $carreras = ["Administración", "Contaduría", "Economía", "Informática"];
                foreach ($carreras as $carrera) {
                    $selected = ($row['carrera'] == $carrera) ? "selected" : "";
                    echo "<option value='$carrera' $selected>$carrera</option>";
                }
                echo "</select><br>";

                echo "Semestre: <input type='number' name='semestre' value='" . htmlspecialchars($row['semestre'], ENT_QUOTES) . "'><br>";

                // Campo de selección para grupo
                echo "Grupo: <select name='grupo'>";
                $grupos = ["A", "B", "C", "U"];
                foreach ($grupos as $grupo) {
                    $selected = ($row['grupo'] == $grupo) ? "selected" : "";
                    echo "<option value='$grupo' $selected>$grupo</option>";
                }
                echo "</select><br>";

                echo "<label for='horario'>Horario: </label>
<select name='horario'>
    <option value='7:30-8:20am' " . ($row['horario'] == '7:30-8:20am' ? 'selected' : '') . ">7:30-8:20am</option>
    <option value='8:25-9:35am' " . ($row['horario'] == '8:25-9:35am' ? 'selected' : '') . ">8:25-9:35am</option>
    <option value='9:35-10:30am' " . ($row['horario'] == '9:35-10:30am' ? 'selected' : '') . ">9:35-10:30am</option>
    <option value='10:30-11:25am' " . ($row['horario'] == '10:30-11:25am' ? 'selected' : '') . ">10:30-11:25am</option>
    <option value='11:25-12:20pm' " . ($row['horario'] == '11:25-12:20pm' ? 'selected' : '') . ">11:25-12:20pm</option>
    <option value='12:20-1:30pm' " . ($row['horario'] == '12:20-1:30pm' ? 'selected' : '') . ">12:20-1:30pm</option>
    <option value='1:30-2:20pm' " . ($row['horario'] == '1:30-2:20pm' ? 'selected' : '') . ">1:30-2:20pm</option>
    <option value='2:30-3:20pm' " . ($row['horario'] == '2:30-3:20pm' ? 'selected' : '') . ">2:30-3:20pm</option>
    <option value='3:25-4:15pm' " . ($row['horario'] == '3:25-4:15pm' ? 'selected' : '') . ">3:25-4:15pm</option>
    <option value='4:35-5:25pm' " . ($row['horario'] == '4:35-5:25pm' ? 'selected' : '') . ">4:35-5:25pm</option>
    <option value='5:30-6:20pm' " . ($row['horario'] == '5:30-6:20pm' ? 'selected' : '') . ">5:30-6:20pm</option>
    <option value='6:25-7:15pm' " . ($row['horario'] == '6:25-7:15pm' ? 'selected' : '') . ">6:25-7:15pm</option>
    <option value='7:20-8:10pm' " . ($row['horario'] == '7:20-8:10pm' ? 'selected' : '') . ">7:20-8:10pm</option>
</select><br>";

                echo "Número de Alumnos: <input type='number' name='alumnos' value='" . htmlspecialchars($row['alumnos'], ENT_QUOTES) . "'><br>";
                echo "Programas: <input type='text' name='programas' value='" . htmlspecialchars($row['programas'], ENT_QUOTES) . "'><br>";
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

// Actualizar un docente
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_docente'])) {
    // Recuperar los datos del formulario
    $id_docente = intval($_POST['id_docente']);
    $nombre = $_POST['nombre'];
    $correo = $_POST['correo'];
    $materia = $_POST['materia'];
    $carrera = $_POST['carrera'];
    $semestre = $_POST['semestre'];
    $grupo = $_POST['grupo'];
    $horario = $_POST['horario'];
    $alumnos = $_POST['alumnos'];
    $programas = $_POST['programas'];

    // Consulta de actualización
    $sql = "UPDATE docentes 
            SET nombre = ?, correo = ?, materia = ?, carrera = ?, semestre = ?, grupo = ?, horario = ?, alumnos = ?, programas = ? 
            WHERE id = ?";

    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Vincular parámetros
        $stmt->bind_param(
                "ssssissisi",
                $nombre,
                $correo,
                $materia,
                $carrera,
                $semestre,
                $grupo,
                $horario,
                $alumnos,
                $programas,
                $id_docente
        );

        // Ejecutar la consulta
        if ($stmt->execute()) {
            echo "El docente se ha actualizado correctamente.";
        } else {
            echo "Error al actualizar el docente: " . $stmt->error;
        }

        $stmt->close();
    } else {
        echo "Error al preparar la consulta: " . $conn->error;
    }
}
echo "<p><a href='index.html'><button type='button'>Volver al inicio</button></a></p>";
$conn->close();
?>