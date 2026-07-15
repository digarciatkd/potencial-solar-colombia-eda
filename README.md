# Potencial Solar en Colombia vs. Proyectos UPME — Ingesta de datos y EDA

Análisis exploratorio del recurso solar en Colombia (2024–2026) cruzando datos
climatológicos satelitales de la **NASA POWER API** con el registro oficial de
proyectos de generación fotovoltaica de la **UPME** (Unidad de Planeación Minero
Energética).

Este repositorio cubre el flujo completo **desde el cargue de las fuentes de datos
hasta el análisis exploratorio (EDA)**.

**Pregunta de investigación:** ¿Existe correlación entre las zonas con mayor
irradiancia solar histórica y la distribución de proyectos fotovoltaicos
registrados en la UPME? ¿Qué regiones muestran la mayor brecha entre recurso
disponible y planificación actual?

---

## Fuentes de datos

| Fuente | Descripción | Variables / contenido |
|--------|-------------|-----------------------|
| **NASA POWER API** | Series temporales diarias satelitales (2024-01-01 → 2026-05-09) para 88 municipios de las regiones naturales de Colombia. | `ALLSKY_SFC_SW_DWN` (irradiancia), `T2M` (temperatura), `RH2M` (humedad), `WS2M` (viento), `PRECTOTCORR` (precipitación) |
| **UPME** | Informe oficial de registros activos de proyectos de generación eléctrica (marzo 2026). | 98 proyectos, capacidad en MW, estado, tecnología, ubicación |

---

## Estructura del repositorio

```
potencial-solar-colombia-eda/
├── data/                      # Fuentes crudas y base de datos ya poblada
│   ├── datos_nasa_*.xlsx      # 89 archivos NASA POWER (uno por municipio)
│   ├── Informe_registros_activos_..._marzo_2026.xlsx   # Informe UPME
│   └── potencial_solar.db     # SQLite ya construida (ver conteos abajo)
├── sql/
│   ├── schema.sql             # Definición de tablas
│   ├── seed_geografia.sql     # Departamentos + municipios georreferenciados
│   └── seed_municipios_upme.sql
├── scripts/
│   ├── crear_db.py            # 1. Crea la BD y ejecuta schema + seeds
│   ├── extraer_nasa.py        # 2. Descarga NASA POWER → Excel por municipio
│   ├── cargar_nasa.py         # 3. Carga los Excel NASA a la BD
│   ├── cargar_upme.py         # 4. Carga el informe UPME a la BD
│   └── EDA.ipynb             # 5. Análisis exploratorio completo
├── docs/figuras/             # Figuras generadas por el EDA (PNG + HTML interactivos)
├── requirements.txt
└── README.md
```

---

## Modelo de datos (`potencial_solar.db`)

Base SQLite relacional. Conteos actuales:

| Tabla | Registros | Rol |
|-------|-----------|-----|
| `departamentos` | 33 | Catálogo geográfico (código DANE, región natural) |
| `municipios` | 88 | Municipios georreferenciados (lat/lon) |
| `mediciones_nasa` | 74 984 | Mediciones diarias NASA POWER |
| `proyectos_upme` | 98 | Proyectos fotovoltaicos registrados |
| `recursos`, `tecnologias`, `estados_proyecto` | 4 / 5 / 3 | Catálogos de clasificación UPME |

---

## Reproducir el pipeline

Requiere Python 3.10+.

```bash
pip install -r requirements.txt
```

La base `data/potencial_solar.db` ya viene poblada, así que puedes abrir
directamente `scripts/EDA.ipynb`. Para reconstruir todo desde cero:

```bash
# 1. Crear la BD y cargar geografía + catálogos
python scripts/crear_db.py --reset

# 2. (Opcional) Re-descargar los datos NASA POWER desde la API
python scripts/extraer_nasa.py

# 3. Cargar los Excel NASA a la BD
python scripts/cargar_nasa.py

# 4. Cargar el informe UPME a la BD
python scripts/cargar_upme.py

# 5. Ejecutar el análisis exploratorio
jupyter notebook scripts/EDA.ipynb
```

---

## Análisis exploratorio (EDA)

`scripts/EDA.ipynb` desarrolla, entre otros:

- Distribuciones de irradiancia por región natural y ranking municipal.
- Estacionalidad del recurso solar y correlaciones entre variables NASA.
- Capacidad UPME por región, fases de proyectos y línea de tiempo.
- **Brecha recurso–planificación:** cruce entre irradiancia disponible y capacidad
  registrada para identificar regiones subaprovechadas.
- Perfil climático de los municipios con proyectos y análisis PCA.

Las figuras resultantes están en `docs/figuras/` (PNG estáticos y HTML interactivos
de Plotly).

## Notas
- Los datos NASA POWER son de dominio público (NASA Langley Research Center, POWER Project).
- El informe de proyectos es de acceso público de la UPME.
- La API NASA POWER agrega por celdas de 0.5°, por lo que las coordenadas se
  redondean a la celda correspondiente.
---
## Herramientas
`Python` · `Streamlit` · `pandas` · `requests` (API) · `plotly`/`matplotlib` `SQL`


## Autora
Diana García — Economista · [LinkedIn](https://linkedin.com/in/diana-sirley-garcia-quintero-economia)




