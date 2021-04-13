clear
clc
x = 0:0.1:25;
y = log(x)+cos(x)-1;
plot(x,y,'r')
title('Plot of the fucntion f(x)'),
xlabel('value of x')
ylabel('value of y')
grid on

f = @f;
x1 = 1;
x2 = 10;

if f(x1)*f(x2)>0 
    disp('This is not possible')
else
    r = (x1 + x2)/2;
    err = abs(f(r));
    while err > 1e-7
   if f(x1)*f(r)<0 
       x2 = r;
   else
       x1 = r;          
   end
    r = (x1 + x2)/2; 
   err = abs(f(r));
    end
end

fprintf('The root is:  %.2f ',r);