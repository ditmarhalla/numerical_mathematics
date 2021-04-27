clear
clc
x = 0:0.3:20;
y = log10(x)+cos(x)-1;
plot(x,y,'r-o')
title('f(x) = log(x)+cos(x)-1'),
xlabel('value of x')
ylabel('value of y')
grid on