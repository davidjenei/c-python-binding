#ifndef LIBFOO_H
#define LIBFOO_H

void hello(const char *name);

class Hello {
public:
  int num;
  Hello();
  Hello(int start);
  void add(int x);
  void sub(int x);
  void display();
};

#endif
