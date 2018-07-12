% Local Feature Stencil Code
% CS 4476 / 6476: Computer Vision, Georgia Tech
% Written by James Hays

% Returns a set of interest points for the input image

% 'image' can be grayscale or color, your choice.
% 'feature_width', in pixels, is the local feature width. It might be
%   useful in this function in order to (a) suppress boundary interest
%   points (where a feature wouldn't fit entirely in the image, anyway)
%   or (b) scale the image filters being used. Or you can ignore it.

% 'x' and 'y' are nx1 vectors of x and y coordinates of interest points.
% 'confidence' is an nx1 vector indicating the strength of the interest
%   point. You might use this later or not.
% 'scale' and 'orientation' are nx1 vectors indicating the scale and
%   orientation of each interest point. These are OPTIONAL. By default you
%   do not need to make scale and orientation invariant local features.
function [x, y, confidence, scale, orientation] = get_interest_points(image, feature_width)

% Implement the Harris corner detector (See Szeliski 4.1.1) to start with.
% You can create additional interest point detector functions (e.g. MSER)
% for extra credit.

% If you're finding spurious interest point detections near the boundaries,
% it is safe to simply suppress the gradients / corners near the edges of
% the image.

% The lecture slides and textbook are a bit vague on how to do the
% non-maximum suppression once you've thresholded the cornerness score.
% You are free to experiment. Here are some helpful functions:
%  BWLABEL and the newer BWCONNCOMP will find connected components in 
% thresholded binary image. You could, for instance, take the maximum value
% within each component.
%  COLFILT can be used to run a max() operator on each sliding window. You
% could use this to ensure that every interest point is at a local maximum
% of cornerness.

Small_Gaussian=fspecial('gaussian',3,1);
Large_Gaussian=fspecial('gaussian',9,2);

%derivatives of Gaussian
[gx,gy]=gradient(Small_Gaussian);

%horizontal and vertical derivatives of the image Ix and Iy by convolving the original image with derivatives of Gaussian
Ix=imfilter(image,gx);
Iy=imfilter(image,gy);

%computing Ixx, Iyy, IxIy
Ixx=Ix.*Ix;
Iyy=Iy.*Iy;
Ixy=Ix.*Iy;

%convolving each image with a larger Gaussian
G_Ixx=imfilter(Ixx,Large_Gaussian);
G_Iyy=imfilter(Iyy,Large_Gaussian);
G_IxIy=imfilter(Ixy,Large_Gaussian);

%harris detector = g(Ix2)g(Iy2)-[g(IxIy)]^2-alpha[g(Ix2)+g(Iy2)]^2
alpha=0.09;
det=(G_Ixx.*G_Iyy)-(G_IxIy.*G_IxIy);
%det=(G_Ixx.*G_Iyy)-(G_IxIy.^2);
trace=G_Ixx+G_Iyy;
har=det-alpha.*(trace.*trace);

R=har;
R(1:feature_width,:)=0;
R(end-feature_width:end,:)=0;
R(:,1:feature_width)=0;
R(:,end-feature_width:end)=0;
 
Max=max(max(R));
threshold=R>(Max/1000);
%threshold=0.01;
R=R.*threshold;
max_R=colfilt(R,[feature_width/2 feature_width/2],'sliding',@max);
R=R.*(R==max_R); % only keep max
 
[y,x]=find(R>0);
confidence=R(R>0);

% Placeholder that you can delete -- random points
%x = ceil(rand(500,1) * size(image,2));
%y = ceil(rand(500,1) * size(image,1));

end

