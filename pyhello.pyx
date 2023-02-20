# distutils: language = c++

from pyfoo cimport Hello

# Create a Cython extension type which holds a C++ instance
# as an attribute and create a bunch of forwarding methods
# Python extension type.
# https://cython.readthedocs.io/en/latest/src/userguide/wrapping_CPlusPlus.html

cdef class PyHello:
    cdef Hello c_hello  # Hold a C++ instance which we're wrapping

    def __init__(self, int x):
        self.c_hello = Hello(x)

    def get(self):
        return self.c_hello.num

    def add(self, int x):
        return self.c_hello.add(x)

    def sub(self, int x):
        return self.c_hello.sub(x)

    def display(self) -> None:
        return self.c_hello.display()

    # Attribute access
    @property
    def num(self):
        return self.c_hello.num
