clear
clc

f = @f;
x = 2
y=x-(f(x)/(diff(f(x))));
root = abs(f(y));
epsilon = 1e-7;

while root > epsilon
    x1=x0-(f(x0)/(diff(f(x0))));
    x0 = x1;
    root = abs(f(x1));
    s = x1;
end

fprintf('The root is:  %.2f ',s)