-- =====================================================================
-- Seed complementario: coordenadas de los 52 municipios que aparecen en
-- el registro UPME y no estaban en el seed original.
-- Se ejecuta DESPUÉS de seed_geografia.sql.
--
-- Estrategia: INSERT OR IGNORE asegura que si el municipio ya existe
-- (con o sin coordenadas) no se duplique. Luego un UPDATE rellena las
-- coordenadas en los casos donde quedaron en NULL.
-- =====================================================================

INSERT OR IGNORE INTO municipios (nombre, id_departamento, latitud, longitud)
SELECT 'FRONTINO',             id_departamento, 6.7758,  -76.1314 FROM departamentos WHERE nombre='ANTIOQUIA'
UNION ALL SELECT 'HISPANIA',              id_departamento, 5.7995,  -75.9061 FROM departamentos WHERE nombre='ANTIOQUIA'
UNION ALL SELECT 'JERICO',                id_departamento, 5.7910,  -75.7878 FROM departamentos WHERE nombre='ANTIOQUIA'
UNION ALL SELECT 'SONSON',                id_departamento, 5.7100,  -75.3105 FROM departamentos WHERE nombre='ANTIOQUIA'
UNION ALL SELECT 'YONDO',                 id_departamento, 7.0067,  -73.9111 FROM departamentos WHERE nombre='ANTIOQUIA'
UNION ALL SELECT 'TAME',                  id_departamento, 6.4582,  -71.7392 FROM departamentos WHERE nombre='ARAUCA'
UNION ALL SELECT 'TUBARA',                id_departamento,10.8769,  -74.9777 FROM departamentos WHERE nombre='ATLANTICO'
UNION ALL SELECT 'EL CARMEN DE BOLIVAR',  id_departamento, 9.7167,  -75.1167 FROM departamentos WHERE nombre='BOLIVAR'
UNION ALL SELECT 'MAGANGUE',              id_departamento, 9.2418,  -74.7531 FROM departamentos WHERE nombre='BOLIVAR'
UNION ALL SELECT 'SANTA CATALINA',        id_departamento,10.6056,  -75.2858 FROM departamentos WHERE nombre='BOLIVAR'
UNION ALL SELECT 'SANTA ROSA',            id_departamento,10.4458,  -75.3697 FROM departamentos WHERE nombre='BOLIVAR'
UNION ALL SELECT 'CHIQUINQUIRA',          id_departamento, 5.6175,  -73.8181 FROM departamentos WHERE nombre='BOYACA'
UNION ALL SELECT 'MIRAFLORES',            id_departamento, 5.1942,  -73.1450 FROM departamentos WHERE nombre='BOYACA'
UNION ALL SELECT 'PAEZ',                  id_departamento, 5.0958,  -72.1581 FROM departamentos WHERE nombre='BOYACA'
UNION ALL SELECT 'PUERTO BOYACA',         id_departamento, 5.9756,  -74.5867 FROM departamentos WHERE nombre='BOYACA'
UNION ALL SELECT 'AGUADAS',               id_departamento, 5.6133,  -75.4575 FROM departamentos WHERE nombre='CALDAS'
UNION ALL SELECT 'LA DORADA',             id_departamento, 5.4500,  -74.6622 FROM departamentos WHERE nombre='CALDAS'
UNION ALL SELECT 'AGUACHICA',             id_departamento, 8.3094,  -73.6125 FROM departamentos WHERE nombre='CESAR'
UNION ALL SELECT 'BOSCONIA',              id_departamento, 9.9764,  -73.8908 FROM departamentos WHERE nombre='CESAR'
UNION ALL SELECT 'EL PASO',               id_departamento, 9.6603,  -73.7472 FROM departamentos WHERE nombre='CESAR'
UNION ALL SELECT 'LA JAGUA DE IBIRICO',   id_departamento, 9.5614,  -73.3328 FROM departamentos WHERE nombre='CESAR'
UNION ALL SELECT 'CHINU',                 id_departamento, 9.1058,  -75.4019 FROM departamentos WHERE nombre='CORDOBA'
UNION ALL SELECT 'CIENAGA DE ORO',        id_departamento, 8.8786,  -75.6217 FROM departamentos WHERE nombre='CORDOBA'
UNION ALL SELECT 'MONTELIBANO',           id_departamento, 7.9803,  -75.4197 FROM departamentos WHERE nombre='CORDOBA'
UNION ALL SELECT 'SAHAGUN',               id_departamento, 8.9442,  -75.4458 FROM departamentos WHERE nombre='CORDOBA'
UNION ALL SELECT 'SAN CARLOS',            id_departamento, 8.7975,  -75.7008 FROM departamentos WHERE nombre='CORDOBA'
UNION ALL SELECT 'GUACHETA',              id_departamento, 5.3850,  -73.6864 FROM departamentos WHERE nombre='CUNDINAMARCA'
UNION ALL SELECT 'ALTAMIRA',              id_departamento, 2.0664,  -75.7869 FROM departamentos WHERE nombre='HUILA'
UNION ALL SELECT 'HOBO',                  id_departamento, 2.5836,  -75.4517 FROM departamentos WHERE nombre='HUILA'
UNION ALL SELECT 'PALERMO',               id_departamento, 2.8932,  -75.4347 FROM departamentos WHERE nombre='HUILA'
UNION ALL SELECT 'SAN JUAN DEL CESAR',    id_departamento,10.7714,  -73.0014 FROM departamentos WHERE nombre='LA GUAJIRA'
UNION ALL SELECT 'ARACATACA',             id_departamento,10.5919,  -74.1881 FROM departamentos WHERE nombre='MAGDALENA'
UNION ALL SELECT 'FUNDACION',             id_departamento,10.5169,  -74.1856 FROM departamentos WHERE nombre='MAGDALENA'
UNION ALL SELECT 'SITIONUEVO',            id_departamento,10.7747,  -74.7203 FROM departamentos WHERE nombre='MAGDALENA'
UNION ALL SELECT 'LA ESPERANZA',          id_departamento, 7.6394,  -73.3325 FROM departamentos WHERE nombre='NORTE DE SANTANDER'
UNION ALL SELECT 'LA VIRGINIA',           id_departamento, 4.8975,  -75.8839 FROM departamentos WHERE nombre='RISARALDA'
UNION ALL SELECT 'PUEBLO RICO',           id_departamento, 5.2228,  -76.0314 FROM departamentos WHERE nombre='RISARALDA'
UNION ALL SELECT 'BOGOTA, D.C.',          id_departamento, 4.7110,  -74.0721 FROM departamentos WHERE nombre='SANTAFE DE BOGOTA D.C.'
UNION ALL SELECT 'BARRANCABERMEJA',       id_departamento, 7.0653,  -73.8547 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'BETULIA',               id_departamento, 6.9000,  -73.2833 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'CIMITARRA',             id_departamento, 6.3169,  -73.9522 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'GIRON',                 id_departamento, 7.0700,  -73.1733 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'LOS SANTOS',            id_departamento, 6.7544,  -73.1031 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'PUENTE NACIONAL',       id_departamento, 5.8772,  -73.6789 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'PUERTO WILCHES',        id_departamento, 7.3489,  -73.9000 FROM departamentos WHERE nombre='SANTANDER'
UNION ALL SELECT 'COROZAL',               id_departamento, 9.3203,  -75.2922 FROM departamentos WHERE nombre='SUCRE'
UNION ALL SELECT 'TOLUVIEJO',             id_departamento, 9.4514,  -75.4378 FROM departamentos WHERE nombre='SUCRE'
UNION ALL SELECT 'ARMERO',                id_departamento, 4.9728,  -74.8908 FROM departamentos WHERE nombre='TOLIMA'
UNION ALL SELECT 'CHAPARRAL',             id_departamento, 3.7239,  -75.4831 FROM departamentos WHERE nombre='TOLIMA'
UNION ALL SELECT 'FLANDES',               id_departamento, 4.2792,  -74.8181 FROM departamentos WHERE nombre='TOLIMA'
UNION ALL SELECT 'LIBANO',                id_departamento, 4.9211,  -75.0625 FROM departamentos WHERE nombre='TOLIMA'
UNION ALL SELECT 'MARIQUITA',             id_departamento, 5.1981,  -74.8919 FROM departamentos WHERE nombre='TOLIMA';

-- Rellenar coordenadas en municipios que ya existían pero quedaron con NULL
-- (caso típico: corrida previa de cargar_upme.py antes de tener este seed)
UPDATE municipios
SET latitud  = (SELECT latitud  FROM (SELECT 6.7758 AS latitud, -76.1314 AS longitud) WHERE municipios.nombre='FRONTINO')
WHERE latitud IS NULL AND nombre='FRONTINO';
-- (En la práctica conviene re-correr crear_db.py --reset; los datos UPME se vuelven a cargar)
