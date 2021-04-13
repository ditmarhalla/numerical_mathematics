clear
clc

f = @f;
x0 = 1;
x1 = 10;
error=abs(x1-x0);
epsilon = 1e-7;

if abs(f(x0)*f(x1)) > 0 
    disp('This is not possible')
else
    while error > 1e-2
    x2=x0-((f(x0)*(x0-x1))/(f(x0)-f(x1)));
        x0 = x2;
        x1 = x0;
        error = abs(x1-x0);
        root = x2;
    end
end

fprintf('The root is:  %.2f ',root);
