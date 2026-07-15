-- =====================================================================
-- Proyecto: Análisis del Potencial de Energía Solar en Colombia
-- Base de datos: SQLite
-- Versión: 1.0  (Primer avance)
-- =====================================================================
-- Modelo relacional que integra:
--   * Datos diarios de irradiancia y clima de la NASA POWER
--   * Registro de proyectos solares fotovoltaicos de la UPME
--   * Catálogo geográfico de Colombia (departamentos / municipios)
-- =====================================================================

PRAGMA foreign_keys = ON;

-- =====================================================================
-- 1. Catálogo geográfico
-- =====================================================================

CREATE TABLE IF NOT EXISTS departamentos (
    id_departamento   INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre            TEXT    NOT NULL UNIQUE,
    region_natural    TEXT    NOT NULL
        CHECK (region_natural IN ('Caribe','Andina','Pacifica','Orinoquia','Amazonia','Insular')),
    codigo_dane       TEXT    UNIQUE
);

CREATE TABLE IF NOT EXISTS municipios (
    id_municipio      INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre            TEXT    NOT NULL,
    id_departamento   INTEGER NOT NULL,
    latitud           REAL,
    longitud          REAL,
    codigo_dane       TEXT    UNIQUE,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento),
    UNIQUE (nombre, id_departamento)
);

-- =====================================================================
-- 2. Mediciones NASA POWER
--    Granularidad: 1 fila = 1 municipio × 1 día
--    Columnas alineadas con el archivo datos_nasa_<Municipio>_<YYYYMMDD>.xlsx
-- =====================================================================

CREATE TABLE IF NOT EXISTS mediciones_nasa (
    id_medicion         INTEGER PRIMARY KEY AUTOINCREMENT,
    id_municipio        INTEGER NOT NULL,
    fecha               DATE    NOT NULL,
    -- Irradiancia global horizontal (all-sky) en kWh/m^2/día
    irradiancia_global  REAL,
    -- Temperatura a 2 m (°C)
    temperatura_2m      REAL,
    -- Humedad relativa a 2 m (%)
    humedad_relativa    REAL,
    -- Velocidad del viento a 2 m (m/s)
    velocidad_viento    REAL,
    -- Precipitación corregida (mm/día)
    precipitacion       REAL,
    FOREIGN KEY (id_municipio) REFERENCES municipios(id_municipio),
    UNIQUE (id_municipio, fecha)
);

CREATE INDEX IF NOT EXISTS idx_mediciones_municipio_fecha
    ON mediciones_nasa(id_municipio, fecha);
CREATE INDEX IF NOT EXISTS idx_mediciones_fecha
    ON mediciones_nasa(fecha);

-- =====================================================================
-- 3. Catálogos de la UPME
-- =====================================================================

CREATE TABLE IF NOT EXISTS recursos (
    id_recurso   INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre       TEXT    NOT NULL UNIQUE   -- SOLAR, HIDRÁULICO, EÓLICO, TÉRMICO
);

CREATE TABLE IF NOT EXISTS tecnologias (
    id_tecnologia INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre        TEXT    NOT NULL,        -- FOTOVOLTAICO, FILO DE AGUA, COSTA ADENTRO, ...
    id_recurso    INTEGER NOT NULL,
    FOREIGN KEY (id_recurso) REFERENCES recursos(id_recurso),
    UNIQUE (nombre, id_recurso)
);

CREATE TABLE IF NOT EXISTS estados_proyecto (
    id_estado    INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre       TEXT    NOT NULL UNIQUE   -- FASE 1, FASE 2, FASE 3
);

-- =====================================================================
-- 4. Proyectos UPME
-- =====================================================================

CREATE TABLE IF NOT EXISTS proyectos_upme (
    codigo_proyecto             INTEGER PRIMARY KEY,
    nombre                      TEXT    NOT NULL,
    marco_normativo             TEXT,
    fecha_inscripcion           DATE,
    fecha_validez               DATE,
    id_estado                   INTEGER,
    id_recurso                  INTEGER,
    id_tecnologia               INTEGER,
    capacidad_mw                REAL,
    id_municipio                INTEGER,
    fecha_inicio_construccion   DATE,
    fecha_entrada_operacion     DATE,
    FOREIGN KEY (id_estado)      REFERENCES estados_proyecto(id_estado),
    FOREIGN KEY (id_recurso)     REFERENCES recursos(id_recurso),
    FOREIGN KEY (id_tecnologia)  REFERENCES tecnologias(id_tecnologia),
    FOREIGN KEY (id_municipio)   REFERENCES municipios(id_municipio)
);

CREATE INDEX IF NOT EXISTS idx_proyectos_municipio
    ON proyectos_upme(id_municipio);
CREATE INDEX IF NOT EXISTS idx_proyectos_recurso
    ON proyectos_upme(id_recurso);

-- =====================================================================
-- 5. Vistas auxiliares para análisis
-- =====================================================================

-- Irradiancia promedio mensual por municipio
CREATE VIEW IF NOT EXISTS v_irradiancia_mensual AS
SELECT
    m.id_municipio,
    m.nombre                                AS municipio,
    d.nombre                                AS departamento,
    d.region_natural,
    strftime('%Y', n.fecha)                 AS anio,
    strftime('%m', n.fecha)                 AS mes,
    AVG(n.irradiancia_global)               AS irradiancia_prom,
    AVG(n.temperatura_2m)                   AS temperatura_prom,
    AVG(n.humedad_relativa)                 AS humedad_prom,
    COUNT(*)                                AS dias_con_dato
FROM mediciones_nasa n
JOIN municipios m       ON m.id_municipio    = n.id_municipio
JOIN departamentos d    ON d.id_departamento = m.id_departamento
GROUP BY m.id_municipio, anio, mes;

-- Capacidad solar instalada por departamento (de proyectos UPME)
CREATE VIEW IF NOT EXISTS v_capacidad_solar_departamento AS
SELECT
    d.id_departamento,
    d.nombre                AS departamento,
    d.region_natural,
    COUNT(p.codigo_proyecto) AS n_proyectos,
    SUM(p.capacidad_mw)      AS capacidad_total_mw
FROM departamentos d
LEFT JOIN municipios m      ON m.id_departamento = d.id_departamento
LEFT JOIN proyectos_upme p  ON p.id_municipio    = m.id_municipio
LEFT JOIN recursos r        ON r.id_recurso      = p.id_recurso
WHERE r.nombre = 'SOLAR' OR r.nombre IS NULL
GROUP BY d.id_departamento;
