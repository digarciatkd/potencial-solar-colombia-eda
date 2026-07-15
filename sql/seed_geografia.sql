-- =====================================================================
-- Seed: 32 departamentos de Colombia + capitales (latitud/longitud)
-- =====================================================================

INSERT OR IGNORE INTO departamentos (nombre, region_natural, codigo_dane) VALUES
    ('AMAZONAS',              'Amazonia',  '91'),
    ('ANTIOQUIA',             'Andina',    '05'),
    ('ARAUCA',                'Orinoquia', '81'),
    ('ATLANTICO',             'Caribe',    '08'),
    ('BOLIVAR',               'Caribe',    '13'),
    ('BOYACA',                'Andina',    '15'),
    ('CALDAS',                'Andina',    '17'),
    ('CAQUETA',               'Amazonia',  '18'),
    ('CASANARE',              'Orinoquia', '85'),
    ('CAUCA',                 'Andina',    '19'),
    ('CESAR',                 'Caribe',    '20'),
    ('CHOCO',                 'Pacifica',  '27'),
    ('CORDOBA',               'Caribe',    '23'),
    ('CUNDINAMARCA',          'Andina',    '25'),
    ('GUAINIA',               'Amazonia',  '94'),
    ('GUAVIARE',              'Amazonia',  '95'),
    ('HUILA',                 'Andina',    '41'),
    ('LA GUAJIRA',            'Caribe',    '44'),
    ('MAGDALENA',             'Caribe',    '47'),
    ('META',                  'Orinoquia', '50'),
    ('NARINO',                'Andina',    '52'),
    ('NORTE DE SANTANDER',    'Andina',    '54'),
    ('PUTUMAYO',              'Amazonia',  '86'),
    ('QUINDIO',               'Andina',    '63'),
    ('RISARALDA',             'Andina',    '66'),
    ('SAN ANDRES Y PROVIDENCIA','Insular', '88'),
    ('SANTANDER',             'Andina',    '68'),
    ('SUCRE',                 'Caribe',    '70'),
    ('TOLIMA',                'Andina',    '73'),
    ('VALLE DEL CAUCA',       'Pacifica',  '76'),
    ('VAUPES',                'Amazonia',  '97'),
    ('VICHADA',               'Orinoquia', '99'),
    ('SANTAFE DE BOGOTA D.C.','Andina',    '11');

-- Capitales departamentales (semilla mínima, se pueden agregar más con append)
INSERT OR IGNORE INTO municipios (nombre, id_departamento, latitud, longitud)
SELECT 'LETICIA',          id_departamento, -4.2153,  -69.9406 FROM departamentos WHERE nombre='AMAZONAS'
UNION ALL SELECT 'MEDELLIN',          id_departamento,  6.2476,  -75.5658 FROM departamentos WHERE nombre='ANTIOQUIA'
UNION ALL SELECT 'BELLO',             id_departamento,  6.3373,  -75.5582 FROM departamentos WHERE nombre='ANTIOQUIA'
UNION ALL SELECT 'ARAUCA',            id_departamento,  7.0903,  -70.7617 FROM departamentos WHERE nombre='ARAUCA'
UNION ALL SELECT 'BARRANQUILLA',      id_departamento, 10.9685,  -74.7813 FROM departamentos WHERE nombre='ATLANTICO'
UNION ALL SELECT 'CARTAGENA',         id_departamento, 10.3910,  -75.4794 FROM departamentos WHERE nombre='BOLIVAR'
UNION ALL SELECT 'TUNJA',             id_departamento,  5.5446,  -73.3573 FROM departamentos WHERE nombre='BOYACA'
UNION ALL SELECT 'SAN MIGUEL DE SEMA',id_departamento,  5.5167,  -73.7167 FROM departamentos WHERE nombre='BOYACA'
UNION ALL SELECT 'MANIZALES',         id_departamento,  5.0700,  -75.5138 FROM departamentos WHERE nombre='CALDAS'
UNION ALL SELECT 'FLORENCIA',         id_departamento,  1.6144,  -75.6062 FROM departamentos WHERE nombre='CAQUETA'
UNION ALL SELECT 'YOPAL',             id_departamento,  5.3378,  -72.3959 FROM departamentos WHERE nombre='CASANARE'
UNION ALL SELECT 'POPAYAN',           id_departamento,  2.4448,  -76.6147 FROM departamentos WHERE nombre='CAUCA'
UNION ALL SELECT 'VALLEDUPAR',        id_departamento, 10.4631,  -73.2532 FROM departamentos WHERE nombre='CESAR'
UNION ALL SELECT 'QUIBDO',            id_departamento,  5.6919,  -76.6583 FROM departamentos WHERE nombre='CHOCO'
UNION ALL SELECT 'MONTERIA',          id_departamento,  8.7479,  -75.8814 FROM departamentos WHERE nombre='CORDOBA'
UNION ALL SELECT 'PUEBLO NUEVO',      id_departamento,  8.5083,  -75.5083 FROM departamentos WHERE nombre='CORDOBA'
UNION ALL SELECT 'BOGOTA',            id_departamento,  4.7110,  -74.0721 FROM departamentos WHERE nombre='SANTAFE DE BOGOTA D.C.'
UNION ALL SELECT 'MOSQUERA',          id_departamento,  4.7064,  -74.2305 FROM departamentos WHERE nombre='CUNDINAMARCA'
UNION ALL SELECT 'INIRIDA',           id_departamento,  3.8653,  -67.9239 FROM departamentos WHERE nombre='GUAINIA'
UNION ALL SELECT 'SAN JOSE DEL GUAVIARE',id_departamento, 2.5728, -72.6411 FROM departamentos WHERE nombre='GUAVIARE'
UNION ALL SELECT 'NEIVA',             id_departamento,  2.9273,  -75.2819 FROM departamentos WHERE nombre='HUILA'
UNION ALL SELECT 'RIOHACHA',          id_departamento, 11.5444,  -72.9072 FROM departamentos WHERE nombre='LA GUAJIRA'
UNION ALL SELECT 'SANTA MARTA',       id_departamento, 11.2408,  -74.1990 FROM departamentos WHERE nombre='MAGDALENA'
UNION ALL SELECT 'VILLAVICENCIO',     id_departamento,  4.1420,  -73.6266 FROM departamentos WHERE nombre='META'
UNION ALL SELECT 'PASTO',             id_departamento,  1.2136,  -77.2811 FROM departamentos WHERE nombre='NARINO'
UNION ALL SELECT 'CUCUTA',            id_departamento,  7.8939,  -72.5078 FROM departamentos WHERE nombre='NORTE DE SANTANDER'
UNION ALL SELECT 'MOCOA',             id_departamento,  1.1486,  -76.6478 FROM departamentos WHERE nombre='PUTUMAYO'
UNION ALL SELECT 'ARMENIA',           id_departamento,  4.5339,  -75.6811 FROM departamentos WHERE nombre='QUINDIO'
UNION ALL SELECT 'PEREIRA',           id_departamento,  4.8133,  -75.6961 FROM departamentos WHERE nombre='RISARALDA'
UNION ALL SELECT 'SAN ANDRES',        id_departamento, 12.5847,  -81.7006 FROM departamentos WHERE nombre='SAN ANDRES Y PROVIDENCIA'
UNION ALL SELECT 'BUCARAMANGA',       id_departamento,  7.1254,  -73.1198 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'SINCELEJO',         id_departamento,  9.3047,  -75.3978 FROM departamentos WHERE nombre='SUCRE'
UNION ALL SELECT 'IBAGUE',            id_departamento,  4.4389,  -75.2322 FROM departamentos WHERE nombre='TOLIMA'
UNION ALL SELECT 'CALI',              id_departamento,  3.4516,  -76.5320 FROM departamentos WHERE nombre='VALLE DEL CAUCA'
UNION ALL SELECT 'MITU',              id_departamento,  1.2522,  -70.2336 FROM departamentos WHERE nombre='VAUPES'
UNION ALL SELECT 'PUERTO CARRENO',    id_departamento,  6.1890,  -67.4859 FROM departamentos WHERE nombre='VICHADA';

-- Catálogos UPME
INSERT OR IGNORE INTO recursos (nombre) VALUES
    ('SOLAR'),
    ('HIDRAULICO'),
    ('EOLICO'),
    ('TERMICO');

INSERT OR IGNORE INTO tecnologias (nombre, id_recurso) VALUES
    ('FOTOVOLTAICO',   (SELECT id_recurso FROM recursos WHERE nombre='SOLAR')),
    ('FILO DE AGUA',   (SELECT id_recurso FROM recursos WHERE nombre='HIDRAULICO')),
    ('COSTA ADENTRO',  (SELECT id_recurso FROM recursos WHERE nombre='EOLICO')),
    ('COSTA AFUERA',   (SELECT id_recurso FROM recursos WHERE nombre='EOLICO')),
    ('CICLO ABIERTO',  (SELECT id_recurso FROM recursos WHERE nombre='TERMICO'));

INSERT OR IGNORE INTO estados_proyecto (nombre) VALUES
    ('FASE 1'),
    ('FASE 2'),
    ('FASE 3');
