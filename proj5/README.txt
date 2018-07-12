#README

Project 5: Face Detection with a Sliding Window
Name: Nidhi N. Menon

****************************************************************************************************************************************************************************************
1. What is included in my submission?

The folder 'code' contains many matlab files as per the given template.
The matlab files modified by me include:
a] proj5.m : The main file of Project 5 to be run
b] get_positive_features.m : The code to generate tiny image features
c] get_random_negative_features.m : The code to generate bags of SIFT features
d] run_detector.m : The code for nearest_neighbor classifier

***Graduate Extra Credits***
e] get_hard_negative_features.m : The code for hard negative mining, as discussed in Dalal and Triggs
f] augmented_positive_features.m : The code for augmented positive features
	
The folder 'html' contains all elements necessary for the final html report, including images and relevant folders with html reports.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. How does the code work?

a] Part-1 of the assignment is in get_positive_features.m
b] Part-2 of the assignment is in get_random_negative_features.m
c] Part-3 of the assignment is in proj4.m (creating and training the SVM using vl_svmtrain())
d] Part-4 of the assignment is in run_detector.m

***Graduate Extra Credits***
e] Hard negative mining : get_hard_negative_features.m
	This code is supplemented by the code in proj5.m in the MATLAB section titled "step 4. (optional extra credit) Mine hard negatives". To run get_hard_negative_features.m, we will have to uncomment lines 142 to 154.
	
f] Different features : implementing vl_hog() with the Dalal-Triggs variant requires appending " 'variant', 'dalaltriggs' " as parameters to the function call and changing the numeric value of 31 in dimensionality calculation to 36.
	In proj5.m, uncomment lines 120 and 122. Comment out lines  119 and 121.
	In get_positive_features.m, uncomment line 42. Comment out line 41.
	In get_random_negative_features.m, uncomment lines 42 and 64. Comment out lines 41 and 63.
	In run_detector.m, uncomment lines 131 and 134. Comment out lines 130 and 133.
	
g] Alternative positive training data :
	(1) Replacing the provided positive training data
		In proj5.m, uncomment line 48. Comment out line 47.
		In get_positive_features.m, uncomment lines 35 and 48. Comment out line 34.
		
	(2) Augmenting the provided positive training data
		This code is supplemented by the code in augmented_positive_features.m
		In proj5.m, uncomment line 65. Comment out line 64.
		In augmented_positive_features.m make following changes:
			i) Flipping : Uncomment line 52
			ii) Smoothening : Uncomment line 53
			iii) Sharpening : Uncomment line 54

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. What extra work have I done?

a] Implement hard negative mining : upto 10 points
b] Use different features : upto 10 points
c] Alternative/Augmented positive training data: upto 10 points
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------