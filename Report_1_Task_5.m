clear
clc

f = @(x) log10(x)+cos(x)-1;
x0 = 6;
x1 = 10;
x2=x1-f(x1).*((x1-x0)/(f(x1)-f(x0)));
root = abs(f(x2));
epsilon = 1e-7;

while root > epsilon
    x2=x1-f(x1).*((x1-x0)/(f(x1)-f(x0)));
    x0 = x1;
    x1 = x2;
    root = abs(f(x2));
    s = x2;
end

fprintf('The root using this method is:  %.2f ',s)
