function circleHandle = drawCircle (radius, xCenter, yCenter, circleColor, circleLineWidth )

  %get circle points
  circleMatrix = getCircle(radius, 0);

  % get the translation matrix
  T = getTranslate(xCenter, yCenter);


   % call the translate
   T = getTranslate(xCenter,yCenter);

   %translated circle
   circleMatrix = T*circleMatrix;

   x = circleMatrix(1,:);
   y = circleMatrix(2,:);



   circleHandle = line(x,y);
   set(circleHandle,'Color',circleColor);
   set(circleHandle,'LineWidth',circleLineWidth);

  endfunction
