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
    $stmt = $pdo->query("SELECT * FROM registros");
    $registros = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}

// Definir los parámetros del algoritmo genético
$poblacionSize = 100;
$maxGeneraciones = 50;
$tasaMutacion = 0.1;

// Definir los centros de cómputo
$centrosComputo = [
    1 => ['carreras' => ['administracion', 'contaduria', 'economia']],
    2 => ['carreras' => ['administracion', 'contaduria', 'economia']],
    3 => ['carreras' => ['informatica']],
    4 => ['carreras' => ['informatica']],
    5 => ['carreras' => ['informatica']],
];

// Función para generar una población inicial
function generarPoblacionInicial($registros, $centrosComputo, $poblacionSize) {
    $poblacion = [];

    for ($i = 0; $i < $poblacionSize; $i++) {
        $individuo = [];
        foreach ($registros as $registro) {
            $centrosDisponibles = array_filter(array_keys($centrosComputo), function ($centro) use ($registro, $centrosComputo) {
                return in_array($registro['carrera'], $centrosComputo[$centro]['carreras']);
            });

            $centroAsignado = $centrosDisponibles[array_rand($centrosDisponibles)];
            $individuo[] = [
                'nombre' => $registro['nombre'],
                'materia' => $registro['materia'],
                'carrera' => $registro['carrera'],
                'centro' => $centroAsignado,
                'hora' => rand(7, 20) . ':00', // Asignación aleatoria de hora
            ];
        }
        $poblacion[] = $individuo;
    }

    return $poblacion;
}

// Función de evaluación del fitness
function evaluarFitness($individuo) {
    $conflictos = 0;

    // Verificar conflictos por horas y centros de cómputo
    $horarios = [];
    foreach ($individuo as $asignacion) {
        $clave = $asignacion['centro'] . '-' . $asignacion['hora'];
        if (isset($horarios[$clave])) {
            $conflictos++;
        } else {
            $horarios[$clave] = true;
        }
    }

    return 1 / (1 + $conflictos); // Mejor fitness cuanto menos conflictos
}

// Función para realizar la selección por torneo
function seleccionPorTorneo($poblacion, $fitness) {
    $torneo = array_rand($poblacion, 2);
    return $fitness[$torneo[0]] > $fitness[$torneo[1]] ? $poblacion[$torneo[0]] : $poblacion[$torneo[1]];
}

// Función de cruce
function cruce($padre1, $padre2) {
    $puntoCorte = rand(0, count($padre1) - 1);
    return array_merge(array_slice($padre1, 0, $puntoCorte), array_slice($padre2, $puntoCorte));
}

// Función de mutación
function mutar($individuo, $centrosComputo) {
    foreach ($individuo as &$asignacion) {
        if (rand() / getrandmax() < 0.1) {
            $centrosDisponibles = array_filter(array_keys($centrosComputo), function ($centro) use ($asignacion, $centrosComputo) {
                return in_array($asignacion['carrera'], $centrosComputo[$centro]['carreras']);
            });
            $asignacion['centro'] = $centrosDisponibles[array_rand($centrosDisponibles)];
        }
    }
    return $individuo;
}

// Algoritmo genético principal
$poblacion = generarPoblacionInicial($registros, $centrosComputo, $poblacionSize);

for ($generacion = 0; $generacion < $maxGeneraciones; $generacion++) {
    $fitness = array_map('evaluarFitness', $poblacion);
    $nuevaPoblacion = [];

    while (count($nuevaPoblacion) < $poblacionSize) {
        $padre1 = seleccionPorTorneo($poblacion, $fitness);
        $padre2 = seleccionPorTorneo($poblacion, $fitness);

        $hijo = cruce($padre1, $padre2);
        $hijo1 = mutar($hijo, $centrosComputo);

        $nuevaPoblacion[] = $hijo1;
    }

    $poblacion = $nuevaPoblacion;
}

// Seleccionar el mejor individuo
$fitness = array_map('evaluarFitness', $poblacion);
$mejorHorario = $poblacion[array_search(max($fitness), $fitness)];

// Mostrar el horario generado
header('Content-Type: application/json');
echo json_encode($mejorHorario);

?>