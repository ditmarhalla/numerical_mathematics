clear
clc

f = @(x) log10(x)+cos(x)-1;
df =@(x) 1/x*log(10)-sin(x);
x = 7;
%dif =@(x) diff(f2);
y= x-f(x)/df(x);
root = 1;
epsilon = 1e-7; 

while root > epsilon
    x1=x-f(x)/df(x);
    x = x1;
    root = abs(x-x1);
    s = x1;
end

fprintf('The root is:  %.2f ',s)