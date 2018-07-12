% Fundamental Matrix Stencil Code
% CS 4476 / 6476: Computer Vision, Georgia Tech
% Written by Henry Hu

% Returns the camera center matrix for a given projection matrix

% 'Points_a' is nx2 matrix of 2D coordinate of points on Image A
% 'Points_b' is nx2 matrix of 2D coordinate of points on Image B
% 'F_matrix' is 3x3 fundamental matrix

% Try to implement this function as efficiently as possible. It will be
% called repeatly for part III of the project

function [ F_matrix ] = estimate_fundamental_matrix(Points_a,Points_b)

%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

a_rows=size(Points_a,1); 
b_rows=size(Points_b,1);
vec=[1,1,1]; 

matrix1=horzcat(Points_a, ones(a_rows,1)); %Add a column of ones 
matrix2=horzcat(Points_b, ones(b_rows,1)); %Add a column of ones
matrix = horzcat(matrix1,matrix1,matrix1); 
M=kron(matrix2,vec).*matrix;          
[~,~,V]=svd(M);
last_col = size(V,2); 
F=transpose(reshape(V(:,last_col),3,3));
[FU,FS,FV]=svd(F);
if FS(3,3)~=0
    FS(3,3)=0;
end
F_matrix=FU*FS*transpose(FV);

%This is an intentionally incorrect Fundamental matrix placeholder
% F_matrix = [0  0     -.0004; ...
%             0  0      .0032; ...
%             0 -0.0044 .1034];
        
end

