from distutils.core import setup
from distutils.extension import Extension

from Cython.Build import cythonize

examples_extension = Extension(
    name="cyfoo",
    sources=["pyfoo.py"],
    language='c++',
    libraries=["foo"],
    library_dirs=["."],
)

setup(
    name="Build pyfoo module with Cython",
    ext_modules=cythonize([examples_extension])
)

ext_modules = Extension('_swigfoo',
    sources=["foo.i"],
    swig_opts=['-c++'],
    libraries=["foo"],
    library_dirs=["."],
)

setup(
    name='Build pyfoo module with Swig',
    ext_modules=[ext_modules])
