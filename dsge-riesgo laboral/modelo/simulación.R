T <- 500
set.seed(123)

a_sim <- numeric(T)
c_sim <- numeric(T)
y_sim <- integer(T)

a_sim[1] <- 0                 # activos iniciales
y_sim[1] <- 1                 # empieza empleado (1=E, 2=U)


draw_state <- function(current_state, Pi) {
  sample(
    x = 1:2,
    size = 1,
    prob = Pi[current_state, ]
  )
}

for (t in 1:(T - 1)) {
  # Estado laboral siguiente
  y_sim[t + 1] <- draw_state(y_sim[t], Pi)
  # Índice del activo actual en la malla
  ia <- which.min(abs(a_grid - a_sim[t]))
  # Activo óptimo elegido
  a_sim[t + 1] <- policy_a[ia, y_sim[t]]
  # Consumo
  c_sim[t] <- y[y_sim[t]] + (1 + r) * a_sim[t] - a_sim[t + 1]
}
# Consumo del último período
c_sim[T] <- y[y_sim[T]] + (1 + r) * a_sim[T] - a_sim[T]
