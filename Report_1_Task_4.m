clear
clc

f = @(x) log10(x)+cos(x)-1;
x1 = 1;
x2 = 6;

if f(x1)*f(x2)>0 
    disp('This is not possible')
else
    r = x1-((x2 - x1)*f(x1))/(f(x2)-f(x1));
    error = abs(f(r));
while error > 1e-7
        if f(x1)*f(r)<0
            x2 = r;
        else
            x1 = r;
        end
        r = x1-((x2 - x1)*f(x1))/(f(x2)-f(x1));
   error = abs(f(r));
    end
end

fprintf('The root is:  %.2f ',r);