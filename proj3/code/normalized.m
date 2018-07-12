% Fundamental Matrix Stencil Code
% CS 4476 / 6476: Computer Vision, Georgia Tech
% Written by Henry Hu

% Returns the camera center matrix for a given projection matrix

% 'Points_a' is nx2 matrix of 2D coordinate of points on Image A
% 'Points_b' is nx2 matrix of 2D coordinate of points on Image B
% 'F_matrix' is 3x3 fundamental matrix

% Try to implement this function as efficiently as possible. It will be
% called repeatly for part III of the project

function [ F_matrix ] = normalized(Points_a,Points_b)


numPoints = size(Points_a,1);
A = [];
B = -ones(numPoints,1);
%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

%Pic A
u_a = sum(Points_a(:,1))/numPoints;
v_a = sum(Points_a(:,2))/numPoints;
s = numPoints/sum(((Points_a(:,1)-u_a).^2 + (Points_a(:,2)-v_a).^2).^(1/2));
transA = [s 0 0; 0 s 0; 0 0 1]*[1 0 -u_a; 0 1 -v_a; 0 0 1];
Points_a = transA*[Points_a ones(numPoints,1)]';
Points_a = Points_a';

%Pic B
u_b = sum(Points_b(:,1))/numPoints;
v_b = sum(Points_b(:,2))/numPoints;
s = numPoints/sum(((Points_b(:,1)-u_b).^2 + (Points_b(:,2)-v_b).^2).^(1/2));
transB = [s 0 0; 0 s 0; 0 0 1]*[1 0 -u_b; 0 1 -v_b; 0 0 1];
Points_b = transB*[Points_b ones(numPoints,1)]';
Points_b = Points_b';

for n = 1:numPoints
    u1 = Points_a(n,1);
    v1 = Points_a(n,2);
    u2 = Points_b(n,1);
    v2 = Points_b(n,2);
    A(end+1,:) = [u1*u2 v1*u2 u2 u1*v2 v1*v2 v2 u1 v1];
end

F_matrix = A\B;
F_matrix = [F_matrix;1];
F_matrix = reshape(F_matrix,[],3);
F_matrix = transA'*F_matrix*transB;
F_matrix = F_matrix';
[U,S,V] = svd(F_matrix);
S(3,3) = 0;
F_matrix = U*S*V';

%This is an intentionally incorrect Fundamental matrix placeholder
% F_matrix = [0  0     -.0004; ...
%             0  0      .0032; ...
%             0 -0.0044 .1034];
        
end