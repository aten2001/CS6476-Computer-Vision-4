#README

Project 3: Camera Calibration and Fundamental Matrix Estimation with RANSAC
Name: Nidhi N. Menon

****************************************************************************************************************************************************
1. What is included in my submission?

The folder 'code' contains an output image and many matlab files as per the given template.
The matlab files modified by me include:
a] calculate_projection_matrix.m : The code to generate the Camera Projection Matrix using non-homogeneous coordinates
b] compute_camera_center.m : The code to locate camera center
c] estimate_fundamental_matrix.m : The code for Fundamental Matrix estimation
d] ransac_fundamental_matrix.m : The code for Fundamental Matrix with RANSAC
e] projection_matrix.m : The code to generate the Camera Projection Matrix using homogeneous coordinates

***Graduate Extra Credits***
f] normalized_fundamental_matrix.m : The code for normalized Fundamental Matrix

The folder 'html' contains all elements necessary for the html report, including images.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. How does the code work?

a] Part-1 of the assignment is in proj3_part1.m which calls the calculate_projection_matrix() and compute_camera_center() functions
b] Part-2 of the assignment is in proj3_part2.m which calls the estimate_fundamental_matrix() which is in the same file
c] Part-3 of the assignment is in proj3_part3.m which calls the ransac_fundamental_matrix() which in turn calls estimate_fundamental_matrix()

***Graduate Extra Credits***
d] Parts 2 and 3 of the assignment are modified using normalized_fundamental_matrix.m
	It can be run for Part-2 from proj3_part2.m by commenting line no. 30 and uncommenting line no. 31 which calls the normalized_fundamental_matrix() function.
	It can be run for Part-3 from ransac_fundamental_matrix.m by commenting line no. 41 and uncommenting line no. 42 which calls the normalized_fundamental_matrix() function.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. What extra work have I done?

a] Experimented with both, homogeneous and non-homogeneous coordinates for Camera Projection Matrix
b] Part-1 of the assignment is modified using projection_matrix.m and it can be run by commenting line no. 39 and uncommenting line no. 40 which calls the projection_matrix() function.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------