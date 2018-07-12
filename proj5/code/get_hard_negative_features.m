function features_hard_neg = get_hard_negative_features(non_face_scn_path, classifier, feature_params, detection_params)

[bboxes, confidences, image_ids] = run_detector(non_face_scn_path, classifier, feature_params, detection_params);

bboxes = round(bboxes);

template_size = feature_params.template_size;
hog_cell_size = feature_params.hog_cell_size;

D = (template_size / hog_cell_size)^2 * 31;

num_negative = length(confidences);

features_hard_neg = zeros(num_negative, D);

for i = 1:num_negative
    x_small = bboxes(i,1);
    y_small = bboxes(i,2);
    x_big = bboxes(i,3);
    y_big = bboxes(i,4);
    
    img_i = image_ids{i};
    image_file = fullfile(non_face_scn_path, img_i);
    image = imread(image_file);
    img_full = rgb2gray(image);
    
    if x_small < 1 || y_small < 1 || x_big > size(img_full, 2) || y_big > size(img_full, 1)
        continue;
    end
    
    image_new = img_full(y_small:y_big, x_small:x_big);
    patch = imresize(image_new,[template_size, template_size]);
    patch = im2single(patch);
    patch = patch/255;
   
    vl_output = vl_hog(patch, hog_cell_size);
    features_hard_neg(i,:) = vl_output(:);
end

end



