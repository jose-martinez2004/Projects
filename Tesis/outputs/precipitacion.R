
# ============================================================
# El Niño Costero 2017: precipitación acumulada y variación
# Fuente: PISCOp daily precipitation
# Periodos: Dic. 2013-May. 2014 vs. Dic. 2016-May. 2017
# ============================================================

library(terra)
library(geodata)

# ------------------------------------------------------------
# 0. Rutas del proyecto
# ------------------------------------------------------------

data_dir <- "data"
output_dir <- "outputs"

dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

pisco_file <- file.path(data_dir, "PISCOp_d.nc")

if (!file.exists(pisco_file)) {
  stop(
    "No se encuentra PISCOp_d.nc. ",
    "Coloca el archivo en la carpeta data/."
  )
}

# ------------------------------------------------------------
# 1. Abrir PISCO y asignar fechas
# ------------------------------------------------------------

pisco <- rast(pisco_file)

fechas <- seq(
  as.Date("1981-01-01"),
  by = "day",
  length.out = nlyr(pisco)
)

time(pisco) <- fechas

# ------------------------------------------------------------
# 2. Acumular precipitación por periodo
# ------------------------------------------------------------

acumular <- function(inicio, fin) {
  idx <- which(
    fechas >= as.Date(inicio) &
    fechas <= as.Date(fin)
  )

  if (length(idx) == 0) {
    stop("No existen capas para el periodo solicitado.")
  }

  sum(pisco[[idx]], na.rm = TRUE)
}

pisco_2017 <- acumular("2016-12-01", "2017-05-31")
pisco_2014 <- acumular("2013-12-01", "2014-05-31")

# ------------------------------------------------------------
# 3. Delimitación de Perú
# ------------------------------------------------------------

peru <- gadm(
  country = "PER",
  level = 0,
  path = data_dir
)

peru <- project(peru, crs(pisco_2017))

pisco_2017 <- mask(crop(pisco_2017, peru), peru)
pisco_2014 <- mask(crop(pisco_2014, peru), peru)

compareGeom(
  pisco_2017,
  pisco_2014,
  stopOnError = TRUE
)

# ------------------------------------------------------------
# 4. Mapas de precipitación acumulada
# ------------------------------------------------------------

max_lluvia <- max(
  global(pisco_2017, "max", na.rm = TRUE)[1, 1],
  global(pisco_2014, "max", na.rm = TRUE)[1, 1]
)

mapa_lluvia <- function(r, archivo, titulo) {
  png(
    filename = archivo,
    width = 1600,
    height = 2000,
    res = 200
  )

  plot(
    r,
    main = titulo,
    plg = list(title = "mm"),
    range = c(0, max_lluvia),
    mar = c(3.1, 3.1, 5.1, 7.1)
  )

  lines(peru, lwd = 1)
  dev.off()
}

mapa_lluvia(
  pisco_2017,
  file.path(output_dir, "precipitacion_2017.png"),
  "Precipitación acumulada (PISCOp)\nDiciembre 2016 - Mayo 2017"
)

mapa_lluvia(
  pisco_2014,
  file.path(output_dir, "precipitacion_2014.png"),
  "Precipitación acumulada (PISCOp)\nDiciembre 2013 - Mayo 2014"
)

# ------------------------------------------------------------
# 5. Variación porcentual por celda
# ------------------------------------------------------------

umbral <- 1  # mm de precipitación acumulada en el periodo base

var_pct <- ifel(
  pisco_2014 > umbral,
  100 * (pisco_2017 - pisco_2014) / pisco_2014,
  NA
)

names(var_pct) <- "variacion_pct"

vals <- values(var_pct, mat = FALSE)
vals <- vals[is.finite(vals)]

if (length(vals) == 0) {
  stop("No hay valores válidos para calcular la variación.")
}

lim <- as.numeric(
  quantile(abs(vals), 0.98, na.rm = TRUE)
)

if (!is.finite(lim) || lim == 0) {
  lim <- max(abs(vals))
}

var_plot <- clamp(
  var_pct,
  lower = -lim,
  upper = lim,
  values = TRUE
)

png(
  file.path(output_dir, "variacion_pct_2014_2017.png"),
  width = 2000,
  height = 1800,
  res = 250
)

plot(
  var_plot,
  main = paste(
    "Variación porcentual de precipitación acumulada",
    "Dic. 2016-May. 2017 vs. Dic. 2013-May. 2014",
    sep = "\n"
  ),
  col = hcl.colors(100, "RdYlBu"),
  range = c(-lim, lim),
  plg = list(title = "%"),
  mar = c(3.1, 3.1, 5.1, 7.1)
)

lines(peru, lwd = 1)
dev.off()

# ------------------------------------------------------------
# 6. Resumen estadístico
# ------------------------------------------------------------

print(
  global(
    var_pct,
    c("min", "mean", "max"),
    na.rm = TRUE
  )
)

message("Mapas guardados en: ", output_dir)
message("Escala visual truncada en +/- ", round(lim, 2), "%")
