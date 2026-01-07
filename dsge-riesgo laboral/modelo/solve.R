u <- function(c) {
  ifelse(c > 0,
         (c^(1 - gamma) - 1) / (1 - gamma),
         -1e10)  # penalización fuerte si c <= 0
}

n_a <- length(a_grid)   # número de puntos en activos
n_y <- length(y)        # número de estados laborales

V <- matrix(0, nrow = n_a, ncol = n_y)        # función valor
V_new <- matrix(0, nrow = n_a, ncol = n_y)    # función valor actualizada

policy_a <- matrix(0, nrow = n_a, ncol = n_y) # política de activos
policy_c <- matrix(0, nrow = n_a, ncol = n_y) # política de consumo

max_iter <- 1000
tol <- 1e-6

for (iter in 1:max_iter) {

  for (iy in 1:n_y) {       
    for (ia in 1:n_a) {      

      a <- a_grid[ia]
      y_i <- y[iy]

      resources <- y_i + (1 + r) * a

      # Consumo implícito para cada a'
      c <- resources - a_grid

      # Utilidad actual
      u_c <- u(c)

      # Valor esperado futuro
      EV <- as.numeric(V %*% Pi[iy, ])

      # Función objetivo
      value <- u_c + beta * EV

      # Maximización
      opt_index <- which.max(value)

      V_new[ia, iy] <- value[opt_index]
      policy_a[ia, iy] <- a_grid[opt_index]
      policy_c[ia, iy] <- c[opt_index]
    }
  }


  #convergencia

    diff <- max(abs(V_new - V))
  V <- V_new

  if (diff < tol) {
    cat("Convergencia alcanzada en la iteración", iter, "\n")
    break
  }

  if (iter == max_iter) {
    warning("El algoritmo no convergió")
  }
}
