% Starter code prepared by James Hays for CS 4476, Georgia Tech
% This function should return all positive training examples (faces) from
% 36x36 images in 'train_path_pos'. Each face should be converted into a
% HoG template according to 'feature_params'. For improved performance, try
% mirroring or warping the positive training examples to augment your
% training data.

function features_pos = augment_positive_features(train_path_pos, feature_params)
% 'train_path_pos' is a string. This directory contains 36x36 images of
%   faces
% 'feature_params' is a struct, with fields
%   feature_params.template_size (default 36), the number of pixels
%      spanned by each train / test template and
%   feature_params.hog_cell_size (default 6), the number of pixels in each
%      HoG cell. template size should be evenly divisible by hog_cell_size.
%      Smaller HoG cell sizes tend to work better, but they make things
%      slower because the feature dimensionality increases and more
%      importantly the step size of the classifier decreases at test time.
%      (although you don't have to make the detector step size equal a
%      single HoG cell).


% 'features_pos' is N by D matrix where N is the number of faces and D
% is the template dimensionality, which would be
%   (feature_params.template_size / feature_params.hog_cell_size)^2 * 31
% if you're using the default vl_hog parameters

% Useful functions:
% vl_hog, HOG = VL_HOG(IM, CELLSIZE)
%  http://www.vlfeat.org/matlab/vl_hog.html  (API)
%  http://www.vlfeat.org/overview/hog.html   (Tutorial)
% rgb2gray

image_files = dir( fullfile( train_path_pos, '*.jpg') ); %Caltech Faces stored as .jpg
num_images = length(image_files);

%placeholder to be deleted. 100 random features.
%features_pos = rand(100, (feature_params.template_size / feature_params.hog_cell_size)^2 * 31);

features_pos = zeros(num_images, (feature_params.template_size / feature_params.hog_cell_size)^2 * 31);
%features_pos = zeros(num_images, (feature_params.template_size / feature_params.hog_cell_size)^2 * 36);

for i= 1:num_images
    name = image_files(i).name;
    path = strcat(train_path_pos,'/', name);
    image = imread(path);
    img = single(image);
    
%     rotate_image = imrotate(img, 90, 'bilinear', 'crop');
%     feat1 = vl_hog(rotate_image, feature_params.hog_cell_size);

%     img = flipud(img);
%     img = imgaussfilt(img, 2);
    img = imsharpen(img);
    
    f = feature_params.hog_cell_size;
%     feat = vl_hog(img, f, 'variant', 'dalaltriggs');
    feat = vl_hog(img, f);
    
%     feat = [feat1; feat2];
    features_pos(i,:) = reshape(feat, 1,[]);
end

end

