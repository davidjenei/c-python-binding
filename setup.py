from distutils.core import setup
from distutils.extension import Extension

from Cython.Build import cythonize

setup(
    name="Build pyfoo module with Cython using pure Python syntax",
    ext_modules=cythonize([Extension(
        name="cyfoo",
        sources=["pyfoo.py"],
        language='c++',
        libraries=["foo"],
        library_dirs=["."],
    )
    ])
)

setup(
    name="Build pyHello module with Cython using cdef syntax",
    ext_modules=cythonize([Extension(
        name="pyhello",
        sources=["pyhello.pyx"],
        language='c++',
        libraries=["foo"],
        library_dirs=["."],
    )
    ])
)

setup(
    name='Build pyfoo module with Swig',
    ext_modules=[Extension('_swigfoo',
                           sources=["foo.i"],
                           swig_opts=['-c++'],
                           libraries=["foo"],
                           library_dirs=["."],
                           )
                 ]
)
