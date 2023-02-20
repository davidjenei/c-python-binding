#include <stdio.h>
#include <iostream>

#include "foo.h"

void hello(const char *name) {
    printf("hello %s\n", name);
}

using namespace std;

Hello::Hello () {}

Hello::Hello(int start){
    num=start;
}
void Hello::add(int x){
    num=num+x;
}
void Hello::sub(int x){
    num=num-x;
}
void Hello::display(){
    cout<<"Num is "<<num<<endl;
}
