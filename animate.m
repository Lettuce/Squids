function animate ()

  imageName = "OceanImage.png";
  [imageHeight,imageWidth] = drawOcean(imageName);

  color = [.2 .1 .6];
  width = 2;
  squidSize = 50;
  squidStep = 50;


  % drawCircle(bubbleRadius(i),bubbleX(i),bubbleY(i),color,circleLineWidth);

  maxRadius = 20;
  radius = maxRadius*rand();
  xCenter = 500;
  yCenter = 1000;
  circleColor = [.2 .1 .7];
  circleLineWidth = 5;
  DyCircle = 50;

  Dx = 300;
  Dy = 200;

  bubbleMaxRadius= 50;
  bubbleLineWidth = 3;
  bubbleLineColor = [1 1 1]
  bubbleStep = 50;
  bubbleMinRadius = 5;
  numBubbles = 7;

  %remove later
  %figure(1)
  %axis ([-100, 100, -100, 100]);

  for i = 1:  numBubbles % bubble set
    bubbleRadius(i) = rand() * bubbleMaxRadius + bubbleMinRadius;
    bubbleX(i) = rand() * imageWidth;
    bubbleY(i) = imageHeight;

    endfor

for( clock = 1:500 )


    yCenter = yCenter - DyCircle


    % Change the X and Y step of the squid per movement
   %Dy = Dy - 100;
    Dx = Dx + 100;

    %  And Rotate
   % squidTheta = squidTheta + squidDeltaTheta;
   % Dx = Dx + squidForwardMove*cos(squidTheta);
   % Dy = Dy + squidForwardMove*cos(squidTheta);

   % squidHandle = drawSquid(squidSize,squidColor,squidWidth,clock,squidX,squidY)

    for i=1: numBubbles % bubble ascention
    bubbleY(i) = bubbleY(i) - rand()*bubbleStep;
 endfor


 for i=1: numBubbles % bubble check add
   if(bubbleY(i)<3*bubbleMaxRadius)
   bubbleY(i) = imageHeight - 3*bubbleMaxRadius;
   bubbleX(i) = rand() * imageWidth;
   bubbleRadius(i) = rand()*bubbleMaxRadius + bubbleMinRadius;
   endif

endfor


[xCenter,yCenter] = checkBoundary (xCenter,yCenter,imageWidth,imageHeight,radius)

[Dx, Dy] = checkBoundary (Dx,Dy,imageWidth,imageHeight,2*squidSize)
 % squidHandle = drawSquid(squidSize,squidColor,squidWidth,clock,squidX,squidY)



  if (yCenter - 2*radius < 0) % circle return
    yCenter = imageHeight-2*radius
  endif



for i = 1:  numBubbles
    circleHandle(i) = drawCircle (bubbleRadius(i), bubbleX(i), bubbleY(i), bubbleLineColor, bubbleLineWidth)

  endfor


  h = drawSquid(squidSize,color,width,clock,Dx,Dy);

##c2 = drawCircle(radius,xCenter,yCenter,circleColor,circleLineWidth);

% numBubbles = 5;
% bubbleRadius = 20;
% minBubbleRadius = 5;
%
% createbubbles
% for i=1: numBubbles
%   bubbleRadius(i) = rand() * bubbleRadius + minBubbleRadius;
%   bubbleX(i) = rand() * imageWidth;
%   bubbleY(i) = rand() * imageHeight;
%

% bubbleMaxRadius= 50;
% bubbleMinRadius = 5;
%  numBubbles = 7;

%  for i = 1:  numBubbles
%    bubbleRadius(i) = rand() * bubbleMaxRadius + bubbleMinRadius;
%    bubbleX(i) = rand() * imageWidth;
%    bubbleY(i) = rand() * imageHeight;

pause(.1)


 for i=1: numBubbles
   delete(circleHandle(i));
 endfor


  delete(h)


  endfor

endfunction
