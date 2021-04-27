%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                  Ditmar Halla                         %%%%%%%%%%%%%%%%%%%%%%%%%%%%               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                   Report 1                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%                                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%                            Assignment number: NM_6                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%                        Course: Numerical Mathematics                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%                              Hochschule Mittweida                     %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task 1 Plot the graph

x = 0:0.3:20;                       %define "x". This will determine how fine the graph looks
y = log10(x)+cos(x)-1;              %This is the function we have to plot
plot(x,y,'r-o')                     %ploting the function. Use "r" for red and "-o" for line type
title('f(x) = log(x)+cos(x)-1'),    %adding a title
xlabel('value of x')                %labeling the axis
ylabel('value of y')
grid on                             %adding a grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Taks 2 Calculate the root using the integrated "fzero" function

hold on                                             %This is used to make the plot function wait for other ploting

f = @(x) log10(x)+cos(x)-1;                         %Function. We use @(x) to make the function usable without defining "x"
r1_fzero = fzero(f,6);                              %Evaluating using fzero. We do this for 3 roots
r2_fzero = fzero(f,8);                              %The function "fzero" need a function f and a starting point to work
r3_fzero = fzero(f,10);
fprintf('The root using the "fzero" function are:  1: %.10f    2: %.10f    3: %.10f \n',r1_fzero,r2_fzero,r3_fzero);
                                                    %We display the results using fprintf and ".10f" to show the results
                                    
plot(r1_fzero,0,'bo')                               %We show the roots we found in the graph using "fzero"
plot(r2_fzero,0,'bo')                               %by using the plot. Because we used hold this will be
plot(r3_fzero,0,'bo')                               %ploted in the same plot as task 1

text(r1_fzero+0.3,0.02,'\leftarrow root')           %Add an arrow to make the root more visible in the graph
text(r2_fzero+0.3,0.02,'\leftarrow root')
text(r3_fzero+0.3,0.02,'\leftarrow root')
legend('f(x) = log(x)+cos(x)-1','root')             %Adding the legend

hold off                                            %Turning off hold we used in line 18

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task3 Calculate the root using the "Bisection" method

x1_bisection = 1;                                   %Creating the variable x1 and x2. This is the interval in which we are
x2_bisection = 6;                                   %going to look for the root
epsilon = 1e-7;                                     %This is the epsilon that we will use for all the methods. We create the 
                                                    %variable here only. This is the precision we require from the algorithm
minTime = Inf;                                      %This variable is needed to calculate the time it takes the method to run
if f(x1_bisection)*f(x2_bisection)>0                %This is to make sure that we dont make a mistake when entering 
    disp('This is not possible')                    %x1 and x2 and its not possible to find the root
else
    r_bisection = 1;                                %We initiate the variable root
    err = 1;                                        %We initiate the variable error
    i_bisection = 0;                                %This variable is to mesure the number of iterations it takes to solve using the method
    while err > epsilon                             %We start a while loop. The loop will not brake untill we reach our required precision
        t_bisection = tic;                          %Start "TIME"
        i_bisection = i_bisection+1;                %Increas by one each time we go throw the loop(50). This will show the iterations
   if f(x1_bisection)*f(r_bisection)<0              %If we have f(x)*f(r)<0 that means that the root is not in the interval r to x2 so 
       x2_bisection = r_bisection;                  %we asign the new value we found, which in our case is r, to x2.
   else                                             %If that is not the case that means that the root is in the interval r to x2 so
       x1_bisection = r_bisection;                  %we assign r to x1
   end
    r_bisection = (x1_bisection + x2_bisection)/2;  %The formual used to calculate using the bisection method
   err = abs(f(r_bisection));                       %To calculate the error and when the err is lower then the precision thats when the
    end                                             %precision is met. This ends the while loop. Then we print the last value of 
end                                                 %"r_bisection". That is our root.
t_bisection_end = toc(t_bisection);                 %End "TIME"
fprintf('The root using the "Bisection Method" is [%.10f] and it takes [%.7f s] to calculate. \n',r_bisection,t_bisection_end); %Printing our results using fprintf


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task4  Calculate the root using the "False Position" method
x1_false = 1;                                       %The interval in which we are goint to search
x2_false = 6;                                       %this are the variables x1 and x2 that make that inteval

if f(x1_false)*f(x2_false)>0                        %As above we check that the interval is allowed to be used
    disp('This is not possible')
else
    r_false = 1;                                    %Initate the root variable
    error = abs(f(r_false));                        %We initiate the root "r" and also the error
    i_false = 0;                                    %Count the number of iterations needed
while error > epsilon                               %We start a loop that will continue untill the precision is not reached
        t_false = tic;                              %Start "TIME"
        i_false = i_false + 1;                      %Increas by one each time we go throw the loop (76)
        if f(x1_false)*f(r_false)<0                 %Same as in the bisection method we use if and else to see if the interval is
            x2_false = r_false;                     %between x1 and r or x2 and r. and we sobstitute x with r to make a new interval
        else                                        %The diference here is the formual we use to calculate the new point.
            x1_false = r_false;                     %As you can see the "if" and "else" statements are very similar
        end                                         
        r_false = x1_false-((x2_false - x1_false)*f(x1_false))/(f(x2_false)-f(x1_false));
   error = abs(f(r_false));                         %Same as in the Bisection when the precision is met we print the last value of
end                                                 %r_false as that is our root
end
t_false_end = toc(t_false);                         %End "TIME"

fprintf('The root using the "False Positin" method is [%.10f] and it takes [%.7f s] to calculate. \n',r_false,t_false_end);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task5  Calculate the root using the "Secant" method

x0_secant = 2;                                      %Initate the varable that are the interval in which we are searching for the root
x1_secant = 6;
x2_secant = 1;                                      %Initaite the x2 variable
r_secant = 1;                                       %Initiate the root variable

i_secant = 0;                                       %Initiate the variable to calculate the iterations it will take to solve
while r_secant > epsilon                            %Start the while loop and brake only when the precision is met
    t_secant = tic;                                  %Start "TIME"    
    i_secant = i_secant +1;                         %Increas by one each time we go throw the loop
    x2_secant=x1_secant-f(x1_secant).*((x1_secant-x0_secant)/(f(x1_secant)-f(x0_secant))); %formula used to calculate the next point x2
    x0_secant = x1_secant;                          %In order to drop the oldest point in which is x0 we reasign the values
    x1_secant = x2_secant;                          %So x1 is reasighned to x0 and x2 to x1. This way we drop the oldest point
    r_secant = abs(f(x2_secant));                   %and can use the new point in the formual again
    s_secant = x2_secant;                           %We calculate root "r_secant" untill its lower then the precision. When the precesion
end                                                 %is met we print the last value of x2 we found as that is our root
t_secant_end = toc(t_secant);                       %End "TIME"

fprintf('The root using the "Secant" method is [%.10f] and it takes [%.7f s] to calculate. \n',s_secant,t_secant_end)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task6  Calculate the root using the "Newton-Raphson" method
df =@(x) 1/(x*log(10)) - sin(x);                   %This is the first derivative of our function that we will use to calculate
x_newton = 6;                                       %This is the point we will use to calculate our root
%dif =@(x_newton) diff(f2);                         %I tried to use the diff integrated function but it did not work
r_newton = 1;                                       %We initiate the root variable

i_newton = 0;                                       %Initaite the iteration variable
while r_newton > epsilon                            %This while loop as in the previous method will continue untill the precision is met
    t_newton = tic;                                 %Start "TIME"
    i_newton = i_newton + 1;                        %Increas by one each time we go throw the loop
    x1_newton=x_newton-f(x_newton)/df(x_newton);    %Method used to calculate the new point
    x_newton = x1_newton;                           %Substitute the x so that we can run the loop again
    r_newton = abs(f(x1_newton));                   %Calculate the root to see if the precision is reached
    s_newton = x1_newton;                           %Asign the last x and print sicne that is our root
end
t_newton_end = toc(t_newton);                       %End "TIME"

fprintf('The root using the "Newton-Raphson" method is [%.10f] and it takes [%.7f s] to calculate. \n\n',s_newton,t_newton_end)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task7 Compare the root finding methods

fprintf('Number of iterations with "Bisection method" is:  %2d \n',i_bisection)
fprintf('Number of iterations with "False Position method" is:  %2d \n',i_false)
fprintf('Number of iterations with "Secant method" is:  %2d \n',i_secant)
fprintf('Number of iterations with "Newton-Raphson" is:  %2d \n\n',i_newton)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Task8 Compare the root finding methods to the integrated "fzero" function

accuracy_bisection = abs(r_bisection - r1_fzero);
fprintf('The diference with "fzero" and  "Bisection method" is:  %.10f \n',accuracy_bisection)

accuracy_false = abs(r_false - r1_fzero);
fprintf('The diference with "fzero" and "False Position method" is:  %.10f \n',accuracy_false)

accuracy_secant = abs(s_secant - r1_fzero);
fprintf('The diference with "fzero" and "Secant method" is:  %.10f \n',accuracy_secant)

accuracy_newton = abs(s_newton - r1_fzero);
fprintf('The diference with "fzero" and "Newton-Raphson method" is:  %.10f \n',accuracy_newton)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Visualize using a table to compare the results

Method = {'Bisection';'False Position';'Secant';'Newton-Raphson'};
Root = [r_bisection;r_false;s_secant;s_newton];
Iterations = [i_bisection;i_false;i_secant;i_newton];
Diference = [accuracy_bisection;accuracy_false;accuracy_secant;accuracy_newton];
Time = [t_bisection_end;t_false_end;t_secant_end;t_newton_end];
mltable = table(Root,Iterations,Diference,Time,'RowNames',Method)
