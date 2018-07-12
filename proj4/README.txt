#README

Project 4: Scene Recognition with Bag of Words
Name: Nidhi N. Menon

****************************************************************************************************************************************************
1. What is included in my submission?

The folder 'code' contains many matlab files as per the given template.
The matlab files modified by me include:
a] proj4.m : The main file of Project 4 to be run
b] get_tiny_images.m : The code to generate tiny image features
c] get_bags_of_sifts.m : The code to generate bags of SIFT features
d] nearest_neighbor_classify.m : The code for nearest_neighbor classifier
e] svm_classify.m : The code for Support Vector Machine(SVM) classifier
f] build_vocabulary.m : The code to generate the visual word vocabulary that will be stored in .mat files

***Graduate Extra Credits***
g] gist_f.m : The code for normalized Fundamental Matrix
	It has accompanying code in LMgist.m and imresizecrop.m
h] my_svm.m : The code for modified SVM in which I have implemented RBF kernel
	It has accompanying code in compute_kernel.m and primal_svm.m
i] get_fisher_encoding.m : The code for fisher encoding implementation
	It had accompanying code in build_gmm.m
	
***Other***
1. vocab_200.mat : The vocab file with vocab_size=200 used to implement the main 3 sections of the project
2. vocab_100.mat : The vocab file with vocab_size=100 used to implement the extra credits sections of the project
3. vocab.mat : The vocab file generated for varying vocab_sizes, used in the experimentation with vocab_size as part of extra credits
4. stats.mat : The vocab file generated during fisher encoding, in the extra credits sections of the project

The appropriate vocab files will have to be uncommented when running the code, since I have included my version of .mat files for vocab_size=100 and vocab_size=200.
	
The folder 'html' contains all elements necessary for the final html report, including images and relevant folders with html reports.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. How does the code work?

a] Part-1 of the assignment is in get_tiny_images.m and nearest_neighbor_classify.m and it can be run by uncommenting lines 19 and 25 in proj4.m and comment out the remaining features and classifiers
b] Part-2 of the assignment is in get_bags_of_sifts.m and nearest_neighbor_classify.m and it can be run by uncommenting lines 20 and 25 in proj4.m and comment out the remaining features and classifiers
c] Part-3 of the assignment is in get_bags_of_sifts.m and svm_classify.m and it can be run by uncommenting lines 20 and 27 in proj4.m and comment out the remaining features and classifiers

***Graduate Extra Credits***
d] Scaling: Uncomment the lines in get_bags_of_sifts.m
e] GIST: Uncomment line 22 and comment out the remaining features
f] Fisher encoding:  Uncomment line 21 and comment out the remaining features
g] RBF kernel: Uncomment line 27 and comment out the remaining classifiers
h] Vocab size: A new vocab.mat is generated everytime to observe results

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. What extra work have I done?

a] Scaling features using impyramid() and a combination of imgaussfilt() and imresize()	:	3 points
b] GIST descriptors were computed and was sent to classifier for classification	:	5 points
c] Fisher encoding using vl_gmm() and vl_fisher()	:	5 points
d] RBF kernel implementation	:	3 points
e] Experimenting with vocab sizes	:	3 points

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------