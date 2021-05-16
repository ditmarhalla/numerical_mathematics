clear
clc
clear all

fun = @bilinear;     %The function defined in task 1 we call it here to use it again
r = randi(5,9,2);    %Define a matric [9x2] composed of random integers to use as
                     %our 9 random points
for i = 1:9             %Create a loop to go through the random numbers
    
    [R1,R2,P] = fun(r(i,1),r(i,2));  %Solve for the random values using the bilinear interpolation
    fprintf('For the %d point:  x1: %.2f x2: %.2f y: %.2f \n',i,R1,R2,P)
end
