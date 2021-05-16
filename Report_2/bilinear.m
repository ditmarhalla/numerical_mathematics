function [R1,R2,P] = bilinear(x,y)
    x1 = -5;
    x2 = 5;
    y1 = -5;
    y2 = 5;
    f =@(x,y) x+cos(y)-1;

    Q11 = f(x1,y1);
    Q12 = f(x1,y2);
    Q21 = f(x2,y1);
    Q22 = f(x2,y2);
    
    %Linear interpolation in the x-direction
    R1 = ((x2 - x)/(x2 - x1))*Q11 + ((x - x1)/(x2 - x1))*Q21;
    R2 = ((x2 - x)/(x2 - x1))*Q12 + ((x - x1)/(x2 - x1))*Q22;
    
    %Linear interpolation in the x-direction
    P = ((y2 - y)/(y2 - y1))*R1 + ((y - y1)/(y2 - y1))*R2;
end