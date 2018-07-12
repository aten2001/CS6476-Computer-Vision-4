% RANSAC Stencil Code
% CS 4476 / 6476: Computer Vision, Georgia Tech
% Written by Henry Hu

% Find the best fundamental matrix using RANSAC on potentially matching
% points

% 'matches_a' and 'matches_b' are the Nx2 coordinates of the possibly
% matching points from pic_a and pic_b. Each row is a correspondence (e.g.
% row 42 of matches_a is a point that corresponds to row 42 of matches_b.

% 'Best_Fmatrix' is the 3x3 fundamental matrix
% 'inliers_a' and 'inliers_b' are the Mx2 corresponding points (some subset
% of 'matches_a' and 'matches_b') that are inliers with respect to
% Best_Fmatrix.

% For this section, use RANSAC to find the best fundamental matrix by
% randomly sample interest points. You would reuse
% estimate_fundamental_matrix() from part 2 of this assignment.

% If you are trying to produce an uncluttered visualization of epipolar
% lines, you may want to return no more than 30 points for either left or
% right images.

function [ Best_Fmatrix, inliers_a, inliers_b] = ransac_fundamental_matrix(matches_a, matches_b)


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

iterations = 3500;
rows = size(matches_a,1);
err_threshold = 0.005;
best = 0;
for i=1:iterations
    update = 0;
    rand_index = randsample(rows,8);
    rand_a = matches_a(rand_index,:); 
    rand_b = matches_b(rand_index,:); 
    F_matrix = estimate_fundamental_matrix(rand_a,rand_b);
    %F_matrix = normalized_fundamental_matrix(rand_a, rand_b);
    
    a_inliers = []; 
    b_inliers = [];
    for j=1:rows 
        err = [matches_a(j,:) 1]*transpose(F_matrix)*transpose([matches_b(j,:),1]);
        abs_error = abs(err); 
        if abs_error < err_threshold 
            a_inliers(end+1,:) = matches_a(j,:); 
            b_inliers(end+1,:) = matches_b(j,:); 
            update = update+1; 
        end
    end 
    if update > best
        best = update; 
        Best_Fmatrix = F_matrix;
        inliers_a = a_inliers; 
        inliers_b = b_inliers; 
    end 
end 
inlier_a_rows = size(inliers_a,1); 
if inlier_a_rows > 30 
    rand_index = randsample(inlier_a_rows,30); 
    inliers_a = inliers_a(rand_index,:); 
    inliers_b = inliers_b(rand_index,:); 
end

% Your ransac loop should contain a call to 'estimate_fundamental_matrix()'
% that you wrote for part II.

%placeholders, you can delete all of this
%Best_Fmatrix = estimate_fundamental_matrix(matches_a(1:10,:), matches_b(1:10,:));
%inliers_a = matches_a(1:30,:);
%inliers_b = matches_b(1:30,:);

end

