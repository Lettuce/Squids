function circleHandle = drawCircle (radius, xCenter, yCenter, circleColor, circleLineWidth )

   lineSegments = 20;
   angleResolution = 2*pi/lineSegments;

   theta = [0 : angleResolution : 2*pi];

   sinTheta = sin(theta);
   cosTheta = cos(theta);



   x = radius*cosTheta;
   y = radius*sinTheta;
   z = ones(1,length(x));

   % call the translate
   T = getTranslate(xCenter,yCenter);

   circleMatrix = [x;y;z]
   %translated circle
   circleMatrix = T*circleMatrix;

   x = circleMatrix(1,:);
   y = circleMatrix(2,:);



   circleHandle = line(x,y);
   set(circleHandle,'Color',circleColor);
   set(circleHandle,'LineWidth',circleLineWidth);

  endfunction
