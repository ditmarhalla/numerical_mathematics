clear
clc
x = 0:0.1:25;
y = log10(x)+cos(x)-1;
plot(x,y,'r')
title('Plot of the fucntion f(x)'),
xlabel('value of x')
ylabel('value of y')
grid on

hold on

f = @(x) log10(x)+cos(x)-1;
r = fzero(f,3);
disp(['The root is: ', num2str(r)])
p=[0,4.2493];
plot(4.2493,0,'bo')
text(4.4,0.05,'\leftarrow root')
legend('f(x) = log(x)+cos(x)-1','root')

x = [0.3 0.5];
y = [0.6 0.5];
%annotation('textarrow',x,y,'b','String','root ')
hold off