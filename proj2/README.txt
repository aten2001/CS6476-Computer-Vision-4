#README

Project 2: Local Feature Matching
Name: Nidhi N. Menon
GT username: nmenon34

****************************************************************************************************************************************************************************************
1. What is included in my submission?

The folder 'code' contains the output images and many matlab files as per the given template.
The matlab files modified by me include:
a] get_interest_points.m : My implementation of the function that detects interest points
b] get_features.m : My mplementation of a SIFT-like local feature
c] match_features.m : The code for feature matching using nearest neighbor distance ratio test
d] proj2.m : The code for running the entire project of local feature matching

***Bells and Whistles implementation***
e] match_features_kdtree.m : Used kd-tree, a space partitioning data structure to accelerate matching
f] pca_match_features.m : Used PCA to create a lower dimensional descriptor that is accurate enough

The folder 'html' contains all elements necessary for the html report, including images.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. How does the code work?

a] Part-1 of the assignment is in get_interest_points.m which is called from proj2.m
b] Part-2 of the assignment is in get_features.m which is called from proj2.m
c] Part-3 of the assignment is in match_features.m which is called from proj2.m

***Bells and Whistles implementation***
d] Part-3 of the assignment is modified in match_features_kdtree.m and it can be run from proj2.m by commenting line no. 74 and uncommenting line no. 76 which calls the match_features_kdtree() function
e] Part-3 of the assignment is modified in pca_match_features.m and it can be run from proj2.m by commenting line no. 74 and uncommenting line no. 75 which calls the pca_match_features() function
f] Distance measures may be changed as 1 out of the 4: euclidean, minkowski, chebychev and cityblock.

(The code is currently set to run the Notre-Dame pair of images and the generic match_features() function for 'euclidean' distance measure.)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. What extra work have I done (Bells and Whistles implementation)?

a] The match_features() function uses a built-in MATLAB method, pdist2() to calculate pairwise distance between the two feature vectors. I have modifies the same in the match_features_kdtree() function by using a kd-tree for features2 and then implementing the knn-search between the 2 feature vectors. I tried using 4 different distance measures in this implementation: euclidean, chebychev, cityblock, minkowski. Each distance measure gives a different result. The results are included in the html file.
b] The pca_match_features() function generates a 64 dimension descriptor instead of the 128 dimension descriptor, without compromising much on accuracy. I then tried using 4 different distance measures in this implementation: euclidean, chebychev, cityblock, minkowski. Each distance measure gives a different result. The results are included in the html file.