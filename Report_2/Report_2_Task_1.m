clear
clc
clear all

%CAUTION!!!     Because of the way matlab works Task 1.1 is at the end of the script%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1 = -5;  x2 = 5;               %This are the domain points
y1 = -5;  y2 = 5;               %from [-5,5]x[-5,5]
f=@(x,y) x+cos(y)-1;            %This is our function to calculate our z value
Q11 = f(x1,y1);  Q12 = f(x1,y2);%Calculating the function values
Q21 = f(x2,y1);  Q22 = f(x2,y2);%for the courner points

a = -5; b = 5;                  %Define a matric [9x2] composed of random integers to use as
rr = (b-a).*rand(10,2) + a;     %our 9 random points
r = [(rr(:,1)),(rr(:,2))];
hold on                     
for i = 1:9                     %Create a loop to go through the random numbers
    
    P = bilinear(r(i,1),r(i,2));%Solve for the random values using the bilinear interpolation
    fprintf('For the %d point:  x1: %.2f    x2: %.2f    y: %.2f \n',i,r(i,1),r(i,2),P)
    plot3(r(i,1),r(i,2),P,'or') %Plot the interpolated points
end
plot3(x1,y1,Q11,'ob')           %Plot the corner points
plot3(x1,y2,Q12,'ob')
plot3(x2,y1,Q21,'ob')
plot3(x2,y2,Q22,'ob')

grid on
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1.3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\nThe diference between the function and interpolation is:\n')
for i = 1:9                                             %Create a loop to go through the random numbers  
    fy = f((r(i,1)),(r(i,2)));                          %Solve z for the random numbers

    P = bilinear(r(i,1),r(i,2));                        %Solve z using bilinear interpolation
    
    result = fy - P;                                    %Calcluate the diference of the two results
    result = abs(result);
    fprintf('For the %d point: %.2f \n',i,result)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1.4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[x,y] = meshgrid(-5:0.5:5,-5:0.5:5);        %Define a mash
f = x+cos(y)-1;                             %Define the function to help plot the original function

hold on                                     %Needed to plot everything together
for i = 1:9                                 %Create a loop to go through the random numbers  
    P = bilinear(r(i,1),r(i,2));            %Solve using our function for bilinear interpolation
    plot3(r(i,1),r(i,2),P,'*r')             %Each loop a point is printed on the plot
end

surf(x,y,f, 'FaceAlpha',0.5)                %Plot the function in 3D
xlabel('X axis')                            %Label the axis
ylabel('Y axis')
zlabel('Z axis')
grid on
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function P = bilinear(x,y)                  %The defined function
    x1 = -5;  x2 = 5;                       %This are the domain points
    y1 = -5;  y2 = 5;                       %from [-5,5]x[-5,5]
    
    f =@(x,y) x+cos(y)-1;                   %This is our function to calculate
                                            %our z value
    Q11 = f(x1,y1);  Q12 = f(x1,y2);        %Calculating the function values
    Q21 = f(x2,y1);  Q22 = f(x2,y2);        %for the courner points
      
    %Linear interpolation in the x-direction
    R1 = ((x2 - x)/(x2 - x1))*Q11 + ((x - x1)/(x2 - x1))*Q21;
    R2 = ((x2 - x)/(x2 - x1))*Q12 + ((x - x1)/(x2 - x1))*Q22;
    
    %Linear interpolation in the y-direction
    P = ((y2 - y)/(y2 - y1))*R1 + ((y - y1)/(y2 - y1))*R2;
end