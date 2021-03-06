% Local Feature Stencil Code
% CS 4476 / 6476: Computer Vision, Georgia Tech
% Written by James Hays

% Returns a set of feature descriptors for a given set of interest points. 

% 'image' can be grayscale or color, your choice.
% 'x' and 'y' are nx1 vectors of x and y coordinates of interest points.
%   The local features should be centered at x and y.
% 'feature_width', in pixels, is the local feature width. You can assume
%   that feature_width will be a multiple of 4 (i.e. every cell of your
%   local SIFT-like feature will have an integer width and height).
% If you want to detect and describe features at multiple scales or
% particular orientations you can add input arguments.

% 'features' is the array of computed features. It should have the
%   following size: [length(x) x feature dimensionality] (e.g. 128 for
%   standard SIFT)

function [features] = get_features(image, x, y, feature_width)

% To start with, you might want to simply use normalized patches as your
% local feature. This is very simple to code and works OK. However, to get
% full credit you will need to implement the more effective SIFT descriptor
% (See Szeliski 4.1.2 or the original publications at
% http://www.cs.ubc.ca/~lowe/keypoints/)

% Your implementation does not need to exactly match the SIFT reference.
% Here are the key properties your (baseline) descriptor should have:
%  (1) a 4x4 grid of cells, each feature_width/4. 'cell' in this context
%    nothing to do with the Matlab data structue of cell(). It is simply
%    the terminology used in the feature literature to describe the spatial
%    bins where gradient distributions will be described.
%  (2) each cell should have a histogram of the local distribution of
%    gradients in 8 orientations. Appending these histograms together will
%    give you 4x4 x 8 = 128 dimensions.
%  (3) Each feature vector should be normalized to unit length
%
% You do not need to perform the interpolation in which each gradient
% measurement contributes to multiple orientation bins in multiple cells
% As described in Szeliski, a single gradient measurement creates a
% weighted contribution to the 4 nearest cells and the 2 nearest
% orientation bins within each cell, for 8 total contributions. This type
% of interpolation probably will help, though.

% You do not have to explicitly compute the gradient orientation at each
% pixel (although you are free to do so). You can instead filter with
% oriented filters (e.g. a filter that responds to edges with a specific
% orientation). All of your SIFT-like feature can be constructed entirely
% from filtering fairly quickly in this way.

% You do not need to do the normalize -> threshold -> normalize again
% operation as detailed in Szeliski and the SIFT paper. It can help, though.

% Another simple trick which can help is to raise each element of the final
% feature vector to some power that is less than one.

% Gaussian filter derivatives applied to image
fw=feature_width;
gf1=fspecial('gaussian',fw,1);
[Gx,Gy]=gradient(gf1);

im_x=imfilter(image,Gx);
Ix=double(im_x);
im_y=imfilter(image,Gy);
Iy=double(im_y);

% Calculate magnitude and direction
magnitude=sqrt((Ix.*Ix)+(Iy.*Iy));
direction=mod(round(atan2(Iy,Ix)/(pi/4)),8);

for int_pt=1:length(x)
    x_mid=x(int_pt);
	y_mid=y(int_pt);

	%Create margins for grid
	grid=fw/4;
	x_margin=x_mid-grid*2;
	y_margin=y_mid-grid*2;
 
	Mag=magnitude(y_margin:y_margin+fw-1,x_margin:x_margin+fw-1);
	Dir=direction(y_margin:y_margin+fw-1,x_margin:x_margin+fw-1);
    gf2=fspecial('gaussian',fw,fw/2);
	Mag=imfilter(Mag,gf2);

	for i=0:3
	    for j=0:3
	        new_Dir=Dir((grid*i+1):(grid*i+grid),(grid*j+1):(grid*j+grid));
	        new_Mag=Mag((grid*i+1):(grid*i+grid),(grid*j+1):(grid*j+grid));
	        for k=0:7
	            win=(new_Dir==k);
	            features(int_pt,(i*32+j*8)+k+1)=sum(sum(new_Mag(win)));
	        end
	    end
	end

	% Normalization as mentioned in Szeliski
	MagSum=sum(features(int_pt,:));
	features(int_pt,:)=features(int_pt,:)/MagSum;
end

%Placeholder that you can delete. Empty features.
%features = zeros(size(x,1), 128);

end
