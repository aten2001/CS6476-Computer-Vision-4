function image_feats = get_fisher_encoding(image_paths)

load('stats.mat')
means = stats(:, 1:128);
means = means';
covariances = stats(:, 129:256);
covariances = covariances';
priors = stats(:, 257);

image_feats = [];
for i = 1 : size(image_paths)
    img = imread(char(image_paths(i)));
    [~, SIFT_features] = vl_dsift(single(img), 'fast', 'step', 5, 'size', 8);
    image_feats(i, :) = vl_fisher(single(SIFT_features), means, covariances, priors, 'Improved');
end

end