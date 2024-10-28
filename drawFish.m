function fishHandle = drawFish (radius, xCenter, yCenter, fishColor, fishLineWidth,  myClock)

  % compute tickTock
    tickTock = mod( myClock,2);

    mouthAngle = pi/5;
    teethSize = 5;

    if(tickTock == 0)
      mouthAngle = pi/5;
     else
      mouthAngle = 0;
     endif

    circleMatrix = getCircle(radius,mouthAngle);

  % get the translation matrix
    T = getTranslate(xCenter, yCenter);

  %translate the circle
    circleMatrix = T*circleMatrix;

  % extract the x and y coordinates of the translate...
    x = circleMatrix(1,:);
    y = circleMatrix(2,:);

    x = [x,xCenter,x(1)];
    y = [y,yCenter,y(1)];
  %  z = ones(1,length(x));

  % circle of radius r about the xCenter, yCenter
    %fishBodyHandle = line(x,y);

  %mouth
    if(tickTock == 0)
    xMouth = [x(length(x) - teethSize), xCenter, x(teethSize)];
    yMouth = [y(length(y) - teethSize), yCenter, y(teethSize)];
  else
    xMouth = [xCenter,x(1)];
    yMouth = [yCenter,y(1)];
  endif

  fishMouthHandle = line(xMouth,yMouth);

    %tail
    xTail(1) = x(round(length(x)/2));
    yTail(1) = y(round(length(y)/2.1));

    xTail(2) = xTail(1)-radius;
    yTail(2) = yTail(1)+radius;

    xTail(3) = xTail(1)-radius;
    yTail(3) = yTail(1)-radius;

    xTail(4) = xTail(1);
    yTail(4) = yTail(1);

    fishBodyHandle = line(x,y);

    fishTailHandle = line(xTail, yTail);

    % fishHandle = line(x,y);
    fishHandle = [fishBodyHandle, fishMouthHandle, fishTailHandle];

    set(fishHandle,'Color',fishColor);
    set(fishHandle,'LineWidth',fishLineWidth);
