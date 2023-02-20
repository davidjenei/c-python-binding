cdef extern from "foo.h":
    void hello(const char *name)

    cdef cppclass Hello:
        Hello() except +
        Hello(int) except +
        int num
        void add(int x);
        void sub(int x);
        void display();


