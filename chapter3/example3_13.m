syms x u t;
int((x+sin(x))/(1+cos(x)))  		%�󲻶����� 

int(cos(x)*exp(x),0,1)      		%�󶨻��� 

int(u*sin(x),x,1,sin(t))

f=[u*x^2,t*sin(x);2*x,x*exp(x)];
int(f)
