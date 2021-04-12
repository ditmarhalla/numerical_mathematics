clear
clc
x = 0:0.5:25;
y = log(x)+cos(x)-1;
plot(x,y,'r')
title('Plot of the fucntion f(x)'),
xlabel('value of x')
ylabel('value of y')
grid on

f = @f;
a = 1;
b = 10;

if f(a)*f(b)>0 
    disp('This is not possible')
else
    r = (a + b)/2;
    err = abs(f(r));
    while err > 1e-7
   if f(a)*f(r)<0 
       b = r;
   else
       a = r;          
   end
    r = (a + b)/2; 
   err = abs(f(r));
    end
end

fprintf('The root is:  %.2f ',p);