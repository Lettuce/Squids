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

  % set listeners for keyboard and a mouse
 % set (gcf, 'KeyPressFcn',           @(src, event) keypress_callback(src,event));
 % set (gcf, 'WindowButtonMotionFcn', @(src, event) mouseMotion_callback(src,event));

 endfunction
