function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

    %img=im2double(image);
    img=image;
    filter=im2double(filter);

    % 1:check if filters have odd dimensions
    fsize=size(filter);
    fxsize=fsize(1);  % fsize(1) returns no. of rows in filter matrix
    fysize=fsize(2);  % fsize(2) returns no. of columns in filter matrix
    if((mod(fxsize,2) ==0) || (mod(fysize,2) ==0))
      error('Filter must have odd dimensions.');
    end

    % 2:support grayscale and RGB images
    [rows, cols, channels] = size(img);
    if channels==3    % RGB image

      R=img(:,:,1);
      G=img(:,:,2);
      B=img(:,:,3);

      R1=filtering(R,filter);
      G1=filtering(G,filter);
      B1=filtering(B,filter);

      output=cat(3,R1,G1,B1);
      %output=opimg1;%*255);

    else

      gray=img(:,:,:);
      output=filtering(gray,filter);
      %output=o1;%*255);

    end
end


function res=filtering(img,filter)

    img1=img;
    filter1=filter;
    
    fsize=size(filter1);
    fxsize=fsize(1);
    fysize=fsize(2);

    % 3a:calculate padsize - padding needs to be at least half as long as the filter length
    padxsize = ((fxsize+1)/2) - 1;
    padysize = ((fysize+1)/2) - 1;

    % 3b:padding the image with zeroes
    image = padarray(img1, [padxsize,padysize]);
    imgsize=size(image);
    imgxsize=imgsize(1);
    imgysize=imgsize(2);

    myOutput=image;   
    
    % 4:apply filter to image
    for r=1:imgxsize-fxsize+1
      for c=1:imgysize-fysize+1
        myOutput(floor(fxsize/2)+r,floor(fysize/2)+c)=sum(sum(image(r:r+fxsize-1, c:c+fysize-1) .* filter));
      end
    end

    % 5:un-pad output image matrix
    res=myOutput(padxsize+1:end-padxsize, padysize+1:end-padysize);

end