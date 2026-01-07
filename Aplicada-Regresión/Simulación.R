simular_regresion <- function(A, B, N = 1000) {

  x <- runif(N, 5, 10)
  y <- runif(N, 5, 10)
  z <- runif(N, 5, 10)

  regresores <- data.frame(x = x, y = y, z = z)

  output <- numeric(N)
  for (i in 1:N) {
    xi <- as.numeric(regresores[i, ])
    output[i] <- forma_cuadratica(A, B, xi)
  }

  df <- cbind(regresores, output = output, constante = -1)

  modelo <- lm(output ~ x + y + z + constante, data = df)

  return(list(
    data = df,
    model = modelo,
    betas = coef(modelo)[2:4]
  ))
}
