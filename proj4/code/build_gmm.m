function stats = build_gmm(image_paths, vocab_size )

data = [];
for i = 1 : size(image_paths)
    img = imread(char(image_paths(i)));
    [~, SIFT_features] = vl_dsift(single(img), 'fast', 'step', 10, 'size', 8);
    data = horzcat(data, SIFT_features);
end
[means, covariances, priors] = vl_gmm(single(data), vocab_size);
stats = [means' covariances' priors];

end