clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task 1
x = 0:0.3:20;
y = log10(x)+cos(x)-1;
plot(x,y,'r-o')
title('f(x) = log(x)+cos(x)-1'),
xlabel('value of x')
ylabel('value of y')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Taks 2
hold on

f = @(x) log10(x)+cos(x)-1;    %%%Equation%%%%
r_fzero = fzero(f,6);
fprintf('The root using the "fzero" function is:  %.10f \n',r_fzero);
p=[0,r_fzero];
plot(r_fzero,0,'bo')
text(r_fzero+0.3,0.02,'\leftarrow root')
legend('f(x) = log(x)+cos(x)-1','root')

x = [0.3 0.5];
y = [0.6 0.5];
%annotation('textarrow',x,y,'b','String','root ')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task3

x1_bisection = 1;
x2_bisection = 6;
epsilon = 1e-7;

if f(x1_bisection)*f(x2_bisection)>0 
    disp('This is not possible')
else
    r_bisection = (x1_bisection + x2_bisection)/2;
    err = abs(f(r_bisection));
    while err > epsilon
   if f(x1_bisection)*f(r_bisection)<0 
       x2_bisection = r_bisection;
   else
       x1_bisection = r_bisection;          
   end
    r_bisection = (x1_bisection + x2_bisection)/2; 
   err = abs(f(r_bisection));
    end
end

fprintf('The root using the "Bisection Method" is:  %.10f \n',r_bisection);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task4
x1_false = 1;
x2_false = 6;

if f(x1_false)*f(x2_false)>0 
    disp('This is not possible')
else
    r_false = x1_false-((x2_false - x1_false)*f(x1_false))/(f(x2_false)-f(x1_false));
    error = abs(f(r_false));
while error > epsilon
        if f(x1_false)*f(r_false)<0
            x2_false = r_false;
        else
            x1_false = r_false;
        end
        r_false = x1_false-((x2_false - x1_false)*f(x1_false))/(f(x2_false)-f(x1_false));
   error = abs(f(r_false));
    end
end

fprintf('The root using the "False Positin" method is:  %.10f \n',r_false);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task5

x0_secant = 2;
x1_secant = 6;
x2_secant=x1_secant-f(x1_secant).*((x1_secant-x0_secant)/(f(x1_secant)-f(x0_secant)));
r_secant = abs(f(x2_secant));

while r_secant > epsilon
    x2_secant=x1_secant-f(x1_secant).*((x1_secant-x0_secant)/(f(x1_secant)-f(x0_secant)));
    x0_secant = x1_secant;
    x1_secant = x2_secant;
    r_secant = abs(f(x2_secant));
    s_secant = x2_secant;
end

fprintf('The root using the "Secant" method is:  %.10f \n',s_secant)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task6
df =@(x) 1/x*log(10)-sin(x);
x_newton = 6;
%dif =@(x_newton) diff(f2);
y= x_newton-f(x_newton)/df(x_newton);
r_newton = 1;

while r_newton > epsilon
    x1_newton=x_newton-f(x_newton)/df(x_newton);
    x_newton = x1_newton;
    r_newton = abs(f(x1_newton));
    s_newton = x1_newton;
end

fprintf('The root using the "Newton-Raphson" method is:  %.10f \n',s_newton)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task7

