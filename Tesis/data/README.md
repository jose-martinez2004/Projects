# Datos de precipitación PISCOp

Este proyecto utiliza datos diarios de precipitación grillada del producto PISCOp, desarrollado por el Servicio Nacional de Meteorología e Hidrología del Perú (SENAMHI).

## Fuente de datos

- **Producto:** PISCOp v3.0.
- **Periodo disponible:** 1981–2025.
- **Formato:** NetCDF (`.nc`).
- **Fuente oficial:** [Dataset PISCOp v3.0 en Figshare](https://figshare.com/articles/dataset/High-resolution_grids_of_rainfall_for_Peru_-_PISCOp_v3_0_dataset/32411886).
- **Documentación:** [Publicación del SENAMHI sobre PISCOp v3.0](https://www.gob.pe/institucion/senamhi/noticias/1398654-piscop-v3-0-la-nueva-referencia-de-datos-de-precipitacion-para-la-gestion-hidrica-y-el-monitoreo-climatico-en-el-peru).

## Instrucciones de uso

1. Acceder a la fuente oficial y descargar el archivo de precipitación diaria correspondiente.
2. Colocar el archivo `PISCOp_d.nc` en esta carpeta (`data/`).
3. Ejecutar el script `precipitacion_nino_costero.R` desde la raíz del repositorio.

**Importante:** el archivo NetCDF original no está incluido en este repositorio debido a su tamaño. Consulta la fuente oficial para obtener los datos y sus condiciones de uso.

## Uso en la investigación

Los datos se utilizan para calcular la precipitación acumulada entre diciembre y mayo en dos periodos: 2013–2014 y 2016–2017. Posteriormente, se calcula la variación porcentual espacial para comparar ambos periodos en el territorio peruano.
Para una siguiente entrega, se evaluará ampliar el periodo de revisión de los datos climáticos a 1990–2019, sujeto al análisis necesario para reconocer efectos fijos. Este primer intervalo se utilizaría exclusivamente para caracterizar y observar el comportamiento histórico del fenómeno de El Niño, y no necesariamente como periodo de estimación del efecto sobre la informalidad laboral.
