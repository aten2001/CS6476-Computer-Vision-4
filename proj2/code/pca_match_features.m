function [matches, confidences] = pca_match_features(features1, features2)

reduce_count=64;
C=vertcat(features1,features2); 
%returns reconstructed observations (the approximation to C obtained by retaining its first num_feats principal components)
%residuals has reduced dimensions data: https://www.mathworks.com/matlabcentral/answers/74272-how-to-use-principal-component-analysis-to-reduce-feature-vector-size
[~,reconstructed] = pcares(C,reduce_count);
features1=reconstructed(1:size(features1,1),1:reduce_count); 
features2=reconstructed(size(features1,1)+1:end,1:reduce_count);

% Same as match_features.m
Dist=pdist2(features1,features2,'cityblock');
[B,I] = sort(Dist,2); 
NN1=B(:,1);
NN2=B(:,2);
confidences=NN1./NN2;                
i=find(confidences);
s=size(i);
matches=zeros(s(1),2);
matches(:,1)=i; 
matches(:,2)=I(i);
confidences=1./confidences(i);
[confidences,ind]=sort(confidences,'descend');
matches=matches(ind,:);
matches=matches(1:100,:); 
end