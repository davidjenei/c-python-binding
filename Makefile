# pip install cython
# yum install swig python3-devel

#  (.venv) davidjenei at home in ~/cpp-py
#  $ python
#  Python 3.6.8 (default, Sep 10 2021, 09:13:53)
#  [GCC 8.5.0 20210514 (Red Hat 8.5.0-3)] on linux
#  Type "help", "copyright", "credits" or "license" for more information.
#  >>> import cyfoo
#  >>> cyfoo.pyhello('world!')
#  hello world!
#  >>> import swigfoo
#  >>> swigfoo.hello('world!')
#  hello world!

default: modules

libfoo.a: foo.o
	$(AR) rcs $@ $^

foo.o: foo.cpp foo.h
	$(CXX) -fPIC -c $<

modules: setup.py pyfoo.py libfoo.a foo.i
	python setup.py build_ext --inplace

.PHONY: clean-swig
clean-swig:
	$(RM) foo_wrap.cpp swigfoo.py

.PHONY: clean-cython
clean-cython:
	$(RM) pyhello.cpp pyfoo.cpp

.PHONY: clean
clean: clean-swig clean-cython
	$(RM) -r *.o *.a *.so build/ __pycache__
