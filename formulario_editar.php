<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Docente</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Editar Datos del Docente</h1>

    <form action="guardar_registro.php" method="POST">
        <!-- Campo oculto para pasar el ID del docente -->
        <input type="hidden" id="id_docente" name="id_docente" value="<?= htmlspecialchars($docente['id'], ENT_QUOTES) ?>">

        <div class="mb-3">
            <label for="nombre">Nombre completo:</label>
            <input type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($docente['nombre'], ENT_QUOTES) ?>" required>
        </div>

        <div class="mb-3">
            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" value="<?= htmlspecialchars($docente['correo'], ENT_QUOTES) ?>" required>
        </div>

        <div class="mb-3">
            <label for="materia">Materia:</label>
            <input type="text" id="materia" name="materia" value="<?= htmlspecialchars($docente['materia'], ENT_QUOTES) ?>" required>
        </div>

        <div class="mb-3">
            <label for="carrera">Carrera:</label>
            <select id="carrera" name="carrera" required>
                <option value="administracion" <?= $docente['carrera'] === 'administracion' ? 'selected' : '' ?>>Administración</option>
                <option value="contaduria" <?= $docente['carrera'] === 'contaduria' ? 'selected' : '' ?>>Contaduría</option>
                <option value="economia" <?= $docente['carrera'] === 'economia' ? 'selected' : '' ?>>Economía</option>
                <option value="informatica" <?= $docente['carrera'] === 'informatica' ? 'selected' : '' ?>>Informática</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="semestre">Semestre:</label>
            <select id="semestre" name="semestre" required>
                <?php for ($i = 1; $i <= 13; $i++): ?>
                    <option value="<?= $i ?>" <?= $docente['semestre'] == $i ? 'selected' : '' ?>><?= $i ?>° semestre</option>
                <?php endfor; ?>
            </select>
        </div>

        <div class="mb-3">
            <label for="grupo">Grupo:</label>
            <select id="grupo" name="grupo" required>
                <option value="A" <?= $docente['grupo'] === 'A' ? 'selected' : '' ?>>A</option>
                <option value="B" <?= $docente['grupo'] === 'B' ? 'selected' : '' ?>>B</option>
                <option value="C" <?= $docente['grupo'] === 'C' ? 'selected' : '' ?>>C</option>
                <option value="U" <?= $docente['grupo'] === 'U' ? 'selected' : '' ?>>U</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="horario">Horario:</label>
            <select id="horario" name="horario" required>
                <?php 
                $horarios = [
                    '1' => '7:30-8:20am',
                    '2' => '8:25-9:35am',
                    '3' => '9:35-10:30am',
                    '4' => '10:30-11:25am',
                    '5' => '11:25-12:20pm',
                    '6' => '12:20-1:30pm',
                    '7' => '1:30-2:20pm',
                    '8' => '2:30-3:20pm',
                    '9' => '3:25-4:15pm',
                    '10' => '4:35-5:25pm',
                    '11' => '5:30-6:20pm',
                    '12' => '6:25-7:15pm',
                    '13' => '7:20-8:10pm'
                ];
                foreach ($horarios as $key => $value): ?>
                    <option value="<?= $key ?>" <?= $docente['horario'] == $key ? 'selected' : '' ?>><?= $value ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="mb-3">
            <label for="alumnos">Número de Alumnos:</label>
            <input type="number" id="alumnos" name="alumnos" value="<?= htmlspecialchars($docente['alumnos'], ENT_QUOTES) ?>" required>
        </div>

        <div class="mb-3">
            <label for="programas">Programas:</label>
            <input type="text" id="programas" name="programas" value="<?= htmlspecialchars($docente['programas'], ENT_QUOTES) ?>" required>
        </div>

        <button type="submit">Guardar Cambios</button>
    </form>

    <a href="index.html">Volver al inicio</a>
</body>
</html>