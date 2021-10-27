
%Import an RGB image captured in low light.
A = imread('lowlight.jpg');


%returns image AB that is scale[300, 300] times the size of image A. 
%The input image A can be changes to grayscale, RGB, binary, or categorical image.
AB = imresize(A, [300, 300]); 


%Display the original image A in 'figure 1' 
figure, imshow(A);
%computes the complement of an intensity image A and returns the result in AInv.
AInv = imcomplement(A);
% Display the complement of the image in 'figure 2' 
figure, imshow(AInv);

% % 
% % 
% Invert the image and makes low-light areas in the original image appear hazy.
 BInv = imreducehaze(AInv);
 % Display the hazy image BInv as 'figure 3' 
figure, imshow(BInv);
%computes the complement of an intensity image BInv and returns the result in B.
 B = imcomplement(BInv);
%Display the original image and the enhanced images, side-by-side as figure
%as 'figure 4'
figure, montage({AB, B});
% 

%Improve Results Further Using imreducehaze Optional Parameters
%To get a better result, calling imreducehaze on the inverted image again, this time specifying some optional parameters.
BInv = imreducehaze(AInv, 'Method','approx','ContrastEnhancement','boost');
%computes the complement of an intensity image BInv and returns the result in BImp.
BImp = imcomplement(BInv);
% %Display the original image and the enhanced images, side-by-side as figure
%as 'figure 5'
figure, montage({AB, BImp});

%Low-light images can have high noise levels. Enhancing low-light images can increase this noise level.
%Denoising can be a useful post-processing step.
%Using the imguidedfilter function to remove noise from the enhanced image.
B = imguidedfilter(BImp); 
%Displays the BImp image and the noice removel image, side-by-side as figureas 'figure 6'
figure, montage({BImp, B});
