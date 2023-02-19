# pip install cython
# yum install swig python3-devel

#  (.venv) davidjenei at home in ~/cpp-py
#  $ python
#  Python 3.6.8 (default, Sep 10 2021, 09:13:53)
#  [GCC 8.5.0 20210514 (Red Hat 8.5.0-3)] on linux
#  Type "help", "copyright", "credits" or "license" for more information.
#  >>> import cyfoo
#  >>> cyfoo.my_hello('world!')
#  hello world!
#  >>> import swigfoo
#  >>> swigfoo.hello('world!')
#  hello world!

default: modules

libfoo.a: foo.o
	$(AR) rcs $@ $^

foo.o: foo.cpp foo.h
	$(CXX) -fPIC -c $<

modules: setup.py pyfoo.py libfoo.a
	python setup.py build_ext --inplace

clean:
	$(RM) -rf *.o *.a *.so build/ foo_wrap.c pyfoo.c swigfoo.py __pycache__
