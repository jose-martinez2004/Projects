import matplotlib.pyplot as plt

def plot_dynamics(t, k_euler, k_rk4, k_star, save_path=None):
    plt.figure(figsize=(8, 5))

    plt.plot(t, k_euler, '--', label="Euler", linewidth=2)
    plt.plot(t, k_rk4, '-', label="RK4", linewidth=2)
    plt.axhline(k_star, linestyle=':', label=f"SS k* = {k_star:.2f}")

    plt.xlabel("Tiempo")
    plt.ylabel("Capital per capita")
    plt.title("Solow Model")
    plt.legend()
    plt.grid(True)

    if save_path:
        plt.savefig(save_path, dpi=300, bbox_inches="tight")

    plt.show()
