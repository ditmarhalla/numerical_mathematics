clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fun = @(x) 1/6*x.^3+1/2*x.^-1;      %Define the function
%z = 1:0.1:2                        
%h = z(1)-z(2);
h = 0.1;                            %Define the step count


dFun = @(x) Fun(x+h)-Fun(x-h)/2*h;  %Diferenciate the function using the forward diferente scheme

S =@(x) sqrt(1 + dFun(x).^2);       %Define the way to calculate the length along the curve

GQ = Gauss_quad(S,1,2);             %Use the function Gauss_quad to integrate numericaly

dFun2 = @(x) x.^2/2 - 1./(2*x.^2);  %Define the derivative of the function
S2 =@(x) sqrt(1 + dFun2(x).^2);     %Calculate the length of te curve with the derivative

inte = integral(S2,1,2);            %Integrated function


difference = round(((100*GQ)/inte),4);

fprintf('\nThe diference between the integrated function and our iteration is: %d \n',difference)

