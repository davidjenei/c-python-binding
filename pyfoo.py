import cython
from cython.cimports.pyfoo import hello as c_hello

def pyhello(name: str) -> None:
    c_hello(name.encode())
