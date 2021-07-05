
function [I]=Gauss_quad(f,a,b) 
format long;

% Seven-point integration scheme so zeta_1 to zeta_7
zeta=[-0.9491079123; -0.7415311855; -0.4058451513; 0.0;
0.4058451513; 0.7415311855; 0.9491079123];
% Weighting coefficients
w=[0.1294849661; 0.2797053914; 0.3818300505; 0.4179591836;
0.3818300505; 0.2797053914; 0.1294849661];
% Index for the seven points
Index=1:7;
% Gauss Integration
I=(b-a)/2*sum(w(Index).*f((b-a).*(zeta(Index)+1)/2+a));
