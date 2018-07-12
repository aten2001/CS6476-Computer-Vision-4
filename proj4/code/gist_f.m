function image_feats = gist_f(image_paths)

for i=1:length(image_paths)
    img = imread(image_paths{i});
    clear param
    param.imageSize = [256 256];
    param.orientationsPerScale = [8 8 8 8];
    param.numberBlocks = 4;
    param.fc_prefilt = 4;
    [gist2, param] = LMgist(img, '', param);
    %image_feats(i,:)=reshape(gist2,[1,256]);
    image_feats(i,:) = gist2;
    
    
    
end







end