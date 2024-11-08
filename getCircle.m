function circleMatrix = getCircle (radius,gapAngle)

 lineSegments = 50;
   angleResolution = 2*pi/lineSegments;

   theta = [gapAngle : angleResolution : 2*pi-gapAngle];

   sinTheta = sin(theta);
   cosTheta = cos(theta);

   x = radius*cosTheta;
   y = radius*sinTheta;
   z = ones(1,length(x));

   % call the translate

   circleMatrix = [x;y;z];

   %translated circle
  % circleMatrix = T*circleMatrix;

  % x = circleMatrix(1,:);
  % y = circleMatrix(2,:);



  % circleHandle = line(x,y);
  % set(circleHandle,'Color',circleColor);
  % set(circleHandle,'LineWidth',circleLineWidth);

 endfunction
