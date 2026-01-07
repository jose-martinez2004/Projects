import numpy as np

def solow_rhs(k, s, delta, n):
    """
    RHS del modelo de Solow con y = sqrt(k).
    dk/dt = s*sqrt(k) - (delta + n)*k
    """
    return s * np.sqrt(k) - (delta + n) * k


def steady_state(s, delta, n):
    return (s / (delta + n))**2
