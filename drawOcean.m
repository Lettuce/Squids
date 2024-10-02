function [imageHeight, imageWidth] = drawOcean (imageName)

  % remove all figures
  clf;

  % create a figure
  figure(1);1



  % read image
  image = imread(imageName);
  [imageHeight,imageWidth] = size(image);

  % display image
  imshow(imageName);


 endfunction
