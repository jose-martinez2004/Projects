import numpy as np

from modelo import solow_rhs, steady_state
from solvers import euler, rk4
from plots import plot_dynamics


def main():
    # Parametros
    s = 0.3
    delta = 0.05
    n = 0.02

    # Tiempo
    t_max = 50
    h = 0.1
    t = np.arange(0, t_max + h, h)

    k0 = 4.0

    # Solve model
    params = (s, delta, n)
    k_euler = euler(solow_rhs, k0, t, params)
    k_rk4 = rk4(solow_rhs, k0, t, params)

    # SS
    k_star = steady_state(s, delta, n)

    print(f"Valor Final (Euler): {k_euler[-1]:.4f}")
    print(f"Valor Final (RK4):   {k_rk4[-1]:.4f}")
    print(f"SS k*:     {k_star:.4f}")

    # Plot
    plot_dynamics(
        t, k_euler, k_rk4, k_star,
        save_path="../figures/solow_dinamico.png"
    )


if __name__ == "__main__":
    main()
