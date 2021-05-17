clear
clc
clear all
%CAUTION!!!     Because of the way matlab works Task 1.1 is at the end of the script%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = rand(5);                                        %Define a random matrix with size 5x5
[W,U] = qr(A);                                      %We use qr that is the integrated function to get
B_nomral = W*U                                      % W that is the orthogonal matrix and U that is the uper
                                                    %triangualr matix. B is matrix A we get %using the integraded functions

[Q,R] = gschmidt(A);                                %Run the defined function to get Q and R that are similar
B_qr = Q*R                                          %to W and U. B_qr is matrix A when we use our function


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = rand(5,1);

b=A\x;
inv(A)\b;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Task 1.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Q,R] =gschmidt(V)
    [m,n]=size(V);                                  %Get the size of the matrix
    R=zeros(n);                                     %Define a matrix with all zeros (0)
    R(1,1)=norm(V(:,1));                            %get ne nomrm on the first entry a11
    Q(:,1)=V(:,1)/R(1,1);                           %define a vector using the first colum of the matrix/the norm we defined line 21
    for k =2:n
        R(1:k-1,k)=Q(:,1:k-1)'*V(:,k);              %Using the lecture notes we define the following way to get Q the orthogonal matrix
        Q(:,k)=V(:,k)-Q(:,1:k-1)*R(1:k-1,k);        %and R the upper triangular matrix
        R(k,k)=norm(Q(:,k))                         %The loop exhanges all the rows and of the matrixes
        Q(:,k)=Q(:,k)/R(k,k)
    end
end