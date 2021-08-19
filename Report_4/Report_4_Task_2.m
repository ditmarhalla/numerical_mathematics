clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%define space
dx = 10;
x = 0:dx:1000;

% propogation speed
c = 2;

% time
dt = 2;

%Initial conditions
u = x.*(1-x);
u = [u;u];

for t = 2:1000
    u(t,1) = 0; %this is the 
    u(t,2) = 0; %boundry condition
    for n = 2: size(u,2)-1
        u(t+1,n) = 2*u(t,n) - u(t-1,n) + c*dt^2/(dx^2)*(u(t,n+t) - 2*u(t,n) + u(t,n-1));
    end
end

%Visualising and animation

fig = figure(1);
set(fig,'color','w');

for j=1:5:size(u,1)
    plot(x,u(j,:))
    axis([0,1000,-9000000 9000000])
    title(['one dimensional wave equation, t = ',num2str((j-1)*dt/1000,'%2.2f')])
    xlabel('x')
    ylabel('u')
    xticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0',})
    frame = getframe(1);
    image = frame2im(frame);
end

    
