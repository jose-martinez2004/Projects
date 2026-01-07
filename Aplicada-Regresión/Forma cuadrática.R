forma_cuadratica <- function(A, B, x) {

  if (!is.matrix(A) || !is.matrix(B))
    stop("A y B deben ser matrices")

  if (!is.numeric(A) || !is.numeric(B))
    stop("A y B deben ser numéricas")

  if (!all(dim(A) == dim(B)))
    stop("A y B deben tener la misma dimensión")

  if (!isSymmetric(A) || !isSymmetric(B))
    stop("A y B deben ser simétricas")

  if (!is.vector(x) || !is.numeric(x))
    stop("x debe ser un vector numérico")

  if (length(x) != nrow(A))
    stop("Dimensiones incompatibles entre A y x")

  if (all(x == 0))
    stop("El vector x no puede ser nulo")

  valor <- as.numeric(t(x) %*% A %*% x / (t(x) %*% B %*% x))
  return(valor)
}
