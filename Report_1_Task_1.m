clear
clc
x = 0:0.5:50;
y = log(x)+cos(x)-1;
plot(x,y,'r-o')
title('f(x) = log(x)+cos(x)-1'),
xlabel('value of x')
ylabel('value of y')
grid on