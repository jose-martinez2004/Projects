Este repositorio implementa y resuelve numéricamente el modelo de crecimiento de Solow en tiempo continuo,
utilizando una función de producción \( y = \sqrt{k} \).

La ecuación diferencial que describe la dinámica del capital per cápita es:

\[
\dot{k}(t) = s \sqrt{k(t)} - (\delta + n)\,k(t)
\]

donde:
- \( s \) es la tasa de ahorro,
- \( \delta \) es la tasa de depreciación,
- \( n \) es la tasa de crecimiento poblacional.

---

## Métodos numéricos

La ecuación diferencial se resuelve utilizando los siguientes métodos:
- **Método de Euler explícito** (orden 1)
- **Runge–Kutta de cuarto orden (RK4)**

El uso de ambos métodos permite comparar la precisión y estabilidad de las soluciones numéricas.
