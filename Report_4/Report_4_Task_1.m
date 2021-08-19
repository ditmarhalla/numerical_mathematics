clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1 = 1.0; b1 = 0.1;
a2 = 0.5; b2 = 0.02; 

%Lotka-Volterra equation
f = @(x) [(a1-b1*x(2))*x(1); (-a2+b2*x(1))*x(2)];

%Values
x = [10;2];
time = 0;
h = 0.05;

%Euler method of the loop
for i = 1:1000
    slope = f(x);
    x = x + h * slope;
    time = time + h;
    result(i,1) = x(1);
    result(i,2) = x(2);
end

%Now we visualize the data
plot(result(:,1),result(:,2),'LineWidth',1.3)
xlabel('x')
ylabel('y')
title('Lotka-Volterra for a = 1.0, b = 0.1, c = 0.02, d = 0.5','fontweight','bold')
grid on   