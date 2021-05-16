clear
clc
clear all

[x,y] = meshgrid(-5:0.5:5,-5:0.1:5);                     %Define a mash
F = x+cos(y)-1;                                        %define the function to help plot the original function

fun = @bilinear;                                         %The function defined in task 1 we call it here to use it again
a = -5;
b = 5;
rr = (b-a).*rand(1000,1) + a;
r = [(rr(1:9)),(rr(11:19))]                                         %Define a matric [9x2] composed of random integers to use as                                                        %our 9 random points

f =@(x,y) x+cos(y)-1;                                    %our function to determin the value of z

disp('The diference between the function and interpolation is:')
hold on
for i = 1:9                                              %Create a loop to go through the random numbers  
    fy = f((r(i,1)),(r(i,2)));                           %Solve z for the random numbers
    %fprintf('For the %d point:  f = %.2f  \n',i,fy)

    [R1,R2,P] = fun(r(i,1),r(i,2));                      %Solve z using bilinear interpolation
    %fprintf('For the %d point:  x1 = %.2f, x2 = 
    %.2f, y = %.2f \n',i,R1,R2,P)
    plot3(R1,R2,P,'*b')
    result = fy - P;                                     %Calcluate the diference of the two results
    result = abs(result);
    fprintf('For the %d point: %.2f \n',i,result)
end

surf(x,y,F)
shading interp
xlabel('X axis')
ylabel('Y axis')
zlabel('Z axis')
grid on
hold off