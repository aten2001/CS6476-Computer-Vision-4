% Fundamental Matrix Stencil Code
% CS 4476 / 6476: Computer Vision, Georgia Tech
% Written by Henry Hu

% Returns the camera center matrix for a given projection matrix

% 'Points_a' is nx2 matrix of 2D coordinate of points on Image A
% 'Points_b' is nx2 matrix of 2D coordinate of points on Image B
% 'F_matrix' is 3x3 fundamental matrix

% Try to implement this function as efficiently as possible. It will be
% called repeatly for part III of the project

function [ F_matrix ] = normalized_fundamental_matrix(Points_a,Points_b)

%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

%Pic A
a_rows=size(Points_a,1); 
a_cu=mean(Points_a(:,1)); 
a_cv=mean(Points_a(:,2));
s=a_rows/sum(((Points_a(:,1)-a_cu).^2 + (Points_a(:,2)-a_cv).^2).^(1/2));
ScaleMatrix_a=[s,0,0;0,s,0;0,0,1];
OffsetMatrix_a=[1 0 -a_cu; 0 1 -a_cv; 0 0 1];
Ta=ScaleMatrix_a*OffsetMatrix_a; 

%Pic B
b_rows=size(Points_b,1);
b_cu=mean(Points_b(:,1)); 
b_cv=mean(Points_b(:,2));
s=b_rows/sum(((Points_b(:,1)-b_cu).^2 + (Points_b(:,2)-b_cv).^2).^(1/2));
ScaleMatrix_b=[s,0,0;0,s,0;0,0,1];
OffsetMatrix_b=[1,0,-b_cu;0,1,-b_cv;0,0,1];
Tb = ScaleMatrix_b*OffsetMatrix_b;

Points_a = transpose(Ta*transpose([Points_a ones(size(Points_a,1),1)])); 
Points_b = transpose(Tb*transpose([Points_b ones(size(Points_b,1),1)])); 

matrix=[];
for i=1:a_rows 
    u=Points_a(i,1);
    u_prime=Points_b(i,1); 
    v=Points_a(i,2); 
    v_prime=Points_b(i,2); 
    matrix(end+1,:)=[u*u_prime,v*u_prime,u_prime,u*v_prime,v*v_prime,v_prime,u,v]; 
end

[U,S,V]=svd(transpose(transpose(Ta)*(reshape([-1*matrix\(ones(a_rows,1));1],[],3))*Tb)); 
if S(3,3)~=0
    S(3,3)=0; 
end 
F_matrix=U*S*transpose(V);

%This is an intentionally incorrect Fundamental matrix placeholder
% F_matrix = [0  0     -.0004; ...
%             0  0      .0032; ...
%             0 -0.0044 .1034];
        
end