clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = -10:1:10;                           %Define an interva
x(1)=x(2);                              %This is in order to take care of the
l = length(x);                          %derivative in the boundary condition
x(end)=x(l-1);                          %we change the values of the first and last element
h = x(3)-x(2);                          %Define the step h

y = @(x) sin(x)+cos(x);                 %The function

dy_fd = @(x) (y(x+h)-y(x-h))/(2*h);     %Diferenciate the function using the forard diference scheme

solution = [];                          %Create an empty matrix
for i=1:length(x)                       %Start a loop from 1 to number of elements in x
    solution(i) = fzero(dy_fd,x(i));    %find where the function becomes 0
end

variable = unique(solution);            %Clean the matrix of solution from duplicates


dy_hd = @(x) y(x+h)-2*y(x)+y(x-h)./h^2; %Equation for higher differentiation. In our case for second order

minima = [];                            %Define two matrix to later append the values of minima
maxima = [];                            %and maxima
for i = 1:length(variable)              %Start a loop from 1 to the number of variables
    
    if dy_hd(variable(i))>0             %Find the derivative using the method for higher differentiating.
        sol = variable(i);              %If this value is bigger then 0 then we have a minima
        minima =[minima,sol];           %If the value is a minima we append it to the minima matrix
    end
    if dy_hd(variable(i))<0             %Find the derivative using the method for higher differentiating.
        sol1 = variable(i);             %If this value is smaller then 0 then we have a maxima
        maxima = [maxima,sol1];         %If the value is a maxima we appendit to the maxima matrix
    end
end

%Use the integrated function to find the minima and maxima
X = -10:0.0001:10;
fun = sin(X)+cos(X);
MAX = islocalmax(fun);
MIN = islocalmin(fun);



%To see the diferences we then plot everything
fplot(y,'k','LineWidth',1.5)
hold on
fplot(dy_fd,'-')
fplot(dy_hd,'-.')
plot(X(MAX),fun(MAX),'.',X(MIN),fun(MIN),'.','MarkerSize',15)
plot(variable,y(variable),'o','MarkerSize',8,'LineWidth',1.2)
grid on
legend({'y',"y'","y''",'islocalmax','islocalmin','own function'},'NumColumns',2)
title('sin(x)+cos(x)')
xlabel('x');
ylabel('y');

