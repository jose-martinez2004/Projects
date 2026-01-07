import numpy as np

def euler(f, k0, t, params):
    k = np.zeros(len(t))
    k[0] = k0
    h = t[1] - t[0]

    for i in range(len(t) - 1):
        k[i+1] = k[i] + h * f(k[i], *params)

    return k


def rk4(f, k0, t, params):
    k = np.zeros(len(t))
    k[0] = k0
    h = t[1] - t[0]

    for i in range(len(t) - 1):
        K1 = f(k[i], *params)
        K2 = f(k[i] + h/2 * K1, *params)
        K3 = f(k[i] + h/2 * K2, *params)
        K4 = f(k[i] + h * K3, *params)

        k[i+1] = k[i] + h/6 * (K1 + 2*K2 + 2*K3 + K4)

    return k
