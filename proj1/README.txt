#README

Project 1: Image Filtering and Hybrid Images
Name: Nidhi N. Menon

****************************************************************************************************************************************************
1. What is included in my submission?

The folder 'code' contains the output images and following matlab files as per the given template:
a] my_imfilter.m : My implementation of the my_imfilter() function that imitates the built-in MATLAB function imfilter()
b] proj1_test_filtering.m : The code to test the my_imfilter.m file
c] proj1.m : The code for generating hybrid images
d] vis_hybrid_image.m : Supporting file for proj1.m

The folder 'html' contains all elements necessary for the html report, including images.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. How does the code work?

a] Part-1 of the assignment is in my_imfilter.m which has the main my_imfilter() function which calls the filtering() function which is in the same file
b] Part-2 of the assignment is in proj1.m

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. What do the function in my_imfilter.m do?

a] my_imfilter():
It carries out the following steps:
A. Check if filter has odd dimensions, else throw error
B. Check if image is RGB or grayscale and proceed accordingly
C. Call the filtering() function

b] filtering():
It carries out the following steps:
A. Pad the input image
B. Apply filter to the image
C. Un-pad the result to obtain final output image

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4. How does the proj1.m file generate hybrid images?

The code in proj1.m file uses the my_imfilter() function and a Gaussian filter to generate smoothened images for image-1 and image-2. The latter is subtracted from image-2 to obtain a sharpened image for image-2. A hybrid image is then constructed by adding smoothened image-1 and sharpened image-2.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. What extra work have I done?

a] My code for my_imfilter() uses padarray() for zero padding to imitate default behavior of imfilter(). However by changing line 88 of the file to add an extra parameter 'replicate', I have tried replicated padding which gives better results. The results are included in the html file.
b] I tried swapping the images for smoothening and sharpening in the process of generation of hybrid images. It was observed that the result varies and so does the cutoff-frequency. The results are included in the html file.
c] I tried experimenting with 2 separately tuned cutoff-frequencies for generating hybrid images and I concluded that it generates better results as compared to a single cutoff-frequency. The results are included in the html file.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------