clear
clc
clear all

[R1,R2,P] = bilinear(1,0)                %Call the function that we defined

function [R1,R2,P] = bilinear(x,y)       %The defined function
    x1 = -5;                                %This are the domain points
    x2 = 5;                                 %from [-5,5]x[-5,5]
    y1 = -5;
    y2 = 5;
    f =@(x,y) x+cos(y)-1;                   %This is our function to calculate
                                            %our z
    Q11 = f(x1,y1);                         %Calculating the function values
    Q12 = f(x1,y2);                         %for the courner points
    Q21 = f(x2,y1);
    Q22 = f(x2,y2);
    
    %Linear interpolation in the x-direction
    R1 = ((x2 - x)/(x2 - x1))*Q11 + ((x - x1)/(x2 - x1))*Q21;
    R2 = ((x2 - x)/(x2 - x1))*Q12 + ((x - x1)/(x2 - x1))*Q22;
    
    %Linear interpolation in the y-direction
    P = ((y2 - y)/(y2 - y1))*R1 + ((y - y1)/(y2 - y1))*R2;
end