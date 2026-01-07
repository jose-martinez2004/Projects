import matplotlib.pyplot as plt
import os

def plot_dynamics(t, k_euler, k_rk4, k_star, save_path=None):
    plt.figure(figsize=(8, 5))

    # Euler
    plt.plot(
        t, k_euler,
        label="Euler",
        linestyle="--",
        color="orange",
        linewidth=2,
        marker="o",
        markevery=50
    )

    # RK4
    plt.plot(
        t, k_rk4,
        label="RK4",
        linestyle="-",
        color="blue",
        linewidth=2
    )

    # SS
    plt.axhline(
        k_star,
        color="red",
        linestyle=":",
        linewidth=2,
        label=f"Estado estacionario k* ≈ {k_star:.2f}"
    )

    plt.xlabel("Tiempo t")
    plt.ylabel("Capital per cápita k(t)")
    plt.title("Evolución del capital per cápita: Euler vs RK4")
    plt.legend()
    plt.grid(True)

    if save_path is not None:
        os.makedirs(os.path.dirname(save_path), exist_ok=True)
        plt.savefig(save_path, dpi=300, bbox_inches="tight")

    plt.show()
