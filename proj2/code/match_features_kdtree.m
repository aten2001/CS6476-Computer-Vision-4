function [matches, confidences] = match_features_kdtree(features1, features2)
Mdl=KDTreeSearcher(features2,'Distance','cityblock');  %(X,'Distance','minkowski')
%Mdl.Distance='minkowski';
%Idx = knnsearch(Mdl,Y,'K',2)
[I,B]=knnsearch(Mdl,features1,'K',2);

% Same as match_features.m
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

