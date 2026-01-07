source("parameters.R")

a_grid <- seq(
  from = a_min,
  to   = a_max,
  length.out = n_a
)
# Estados laborales
# 1 = empleado, 0 = desempleado
z_grid <- c(0, 1)

# Ingreso por estado
y_grid <- c(b, w)

# Número de estados
n_z <- length(z_grid)
