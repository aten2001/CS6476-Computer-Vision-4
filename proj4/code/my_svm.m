function predicted_categories = my_svm(train_image_feats, train_labels, test_image_feats)

global X K Y

categories = unique(train_labels); 
num_categories = length(categories);
no_train = size(train_image_feats);
no_test = size(test_image_feats);
n_train = no_train(1);
n_test = no_test(1);

lambda = 0.00001;

X = train_image_feats;
hp.type = 'rbf';
hp.sig = 1;
K = compute_kernel(train_image_feats,train_image_feats, 1:n_train, 1:n_train, hp);

W = [];
B = [];
for i=1:num_categories
    label_logical = strcmp(categories(i),train_labels);
    Y = ones(size(label_logical)) .* -1;
    Y(label_logical) = 1;
    %modified svm
    [w,b] = primal_svm(0, Y, lambda);
    W(i,:) = w;
    B(i,:) = b;
end

K_test = compute_kernel(test_image_feats,train_image_feats, 1:n_test, 1:n_test, hp);

for i = 1:size(test_image_feats)
    conf = [];
    for j=1:num_categories 
        conf(j,:) = dot(W(j,:), K_test(i,:)) + B(j,:); 
    end    
    [~,index] = max(conf);
    predicted_categories(i) = categories(index);
end

predicted_categories = predicted_categories';

end