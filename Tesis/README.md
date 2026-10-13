# El Niño Costero e informalidad laboral en el Perú

## Descripción

Este proyecto analiza la relación entre la exposición a eventos climáticos extremos asociados a El Niño Costero y la informalidad laboral en el Perú, con especial atención al episodio de 2017.

La investigación busca evaluar en qué medida las diferencias territoriales en la exposición climática se relacionan con la probabilidad de que la población ocupada de entre 18 y 65 años tenga un empleo informal.

## Objetivos

- Caracterizar la distribución espacial de las precipitaciones durante el episodio de El Niño Costero de 2017.
- Comparar la precipitación acumulada entre distintos periodos climáticos.
- Construir indicadores territoriales de exposición climática.
- Evaluar la relación entre exposición climática e informalidad laboral utilizando información de la Encuesta Nacional de Hogares (ENAHO).

## Datos

### PISCOp

Se utiliza información diaria de precipitación grillada del producto PISCOp v3.0, desarrollado por el Servicio Nacional de Meteorología e Hidrología del Perú (SENAMHI).

- **Fuente:** [PISCOp v3.0 — Figshare](https://figshare.com/articles/dataset/High-resolution_grids_of_rainfall_for_Peru_-_PISCOp_v3_0_dataset/32411886)
- **Formato:** NetCDF (`.nc`).
- **Uso:** cálculo de precipitación acumulada y comparación espacial entre los periodos diciembre de 2013–mayo de 2014 y diciembre de 2016–mayo de 2017.

Los archivos originales no se incluyen en el repositorio debido a su tamaño. Las instrucciones para obtenerlos se encuentran en [`data/README.md`](data/README.md).

### ENAHO

La ENAHO proporciona información individual sobre empleo, características socioeconómicas y condiciones laborales. Se utiliza para estudiar la informalidad laboral en la población ocupada.

La selección de variables, la armonización entre años y la construcción de los indicadores laborales forman parte del procesamiento de datos de la investigación.

## Metodología

El análisis se organiza en dos componentes:

1. **Análisis climático:** cálculo de la precipitación acumulada por celda de la grilla y comparación espacial entre periodos.
2. **Análisis econométrico:** construcción de indicadores de exposición climática y evaluación de su relación con la probabilidad de empleo informal.

El periodo 1990–2019 se considera como una posible ventana de referencia para la caracterización histórica del fenómeno de El Niño, sujeto a la revisión de disponibilidad y consistencia de los datos. Este periodo de referencia climático no implica necesariamente que se utilice el mismo intervalo en la estimación econométrica.

La especificación empírica definitiva y los supuestos de identificación se documentarán conforme avance la investigación.

## Estructura del repositorio

```text
Projects/
├── data/
│   └── README.md
├── outputs/
├── precipitacion_nino_costero.R
├── .gitignore
└── README.md
```

- `data/`: instrucciones y referencias para obtener los datos originales.
- `outputs/`: mapas y resultados generados por los scripts.
- `precipitacion_nino_costero.R`: procesamiento de precipitaciones y generación de mapas.
- `.gitignore`: exclusión de datos pesados, resultados seleccionados y archivos temporales.

## Requisitos

- R
- `terra`
- `geodata`

Instalación de los paquetes:

```r
install.packages(c("terra", "geodata"))
```

## Reproducción del análisis climático

1. Clonar o descargar este repositorio.
2. Obtener los datos PISCOp desde la fuente indicada en `data/README.md`.
3. Colocar el archivo `PISCOp_d.nc` dentro de la carpeta `data/`.
4. Ejecutar `precipitacion_nino_costero.R` desde la raíz del proyecto.
5. Consultar los mapas generados en `outputs/`.

## Limitaciones

La comparación entre periodos de precipitación constituye una etapa descriptiva y exploratoria. Por sí sola, no identifica un efecto causal de El Niño Costero sobre la informalidad laboral.

La estrategia econométrica deberá distinguir entre la variabilidad climática, la exposición territorial y otros factores que pueden afectar los resultados laborales.

## Estado del proyecto

En desarrollo. La revisión de datos, la construcción de indicadores climáticos y la definición de la estrategia de identificación están sujetas a validación.

## Autores

Proyecto de investigación académica sobre El Niño Costero e informalidad laboral en el Perú.
