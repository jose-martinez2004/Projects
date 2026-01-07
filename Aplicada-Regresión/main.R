rm(list = ls())
set.seed(123)

source("R/forma_cuadratica.R")
source("R/simulacion.R")

# Matrices
A <- diag(3)
B <- matrix(c(2,0,0, 0,3,0, 0,0,4), nrow = 3)

# Simulaciones
S <- 1000
betas <- matrix(NA, nrow = S, ncol = 3)

for (s in 1:S) {
  resultado <- simular_regresion(A, B)
  betas[s, ] <- resultado$betas
}

colnames(betas) <- c("beta_x", "beta_y", "beta_z")

#Resultados
write.csv(betas, "output/tables/betas.csv", row.names = FALSE)

png("output/figures/hist_beta_x.png")
hist(betas[,1], main = "Distribución de beta_x", xlab = "beta_x")
dev.off()
