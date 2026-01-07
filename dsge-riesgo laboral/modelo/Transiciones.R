#Cadena de Markov 2x2

# Estados:
# 1 = Empleado
# 2 = Desempleado

p_EE <- 0.95   # Prob. de seguir empleado
p_EU <- 0.05   # Prob. de perder el empleo

p_UE <- 0.30   # Prob. de encontrar empleo
p_UU <- 0.70   # Prob. de seguir desempleado

# Matriz de transición
Pi <- matrix(
  c(p_EE, p_EU,
    p_UE, p_UU),
  nrow = 2,
  byrow = TRUE
)

# Verificación: filas suman 1
stopifnot(all(abs(rowSums(Pi) - 1) < 1e-8))

# Ingreso por estado
y <- c(w, b)
