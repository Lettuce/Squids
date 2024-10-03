function fishHandle = drawFish (radius, xCenter, yCenter, lineColor, lineWidth)
    lineSegments = 50;
    deltaTheta = 2*pi/lineSegments;
    mouthTheta = pi/3;
    theta = [mouthTheta : deltaTheta : 2*pi - mouthTheta];

    % x and y coordinates of the unit circle/
    cosTheta = cos(theta);
    sinTheta = sin(theta);

    % x and y coordinates of the circle of radius r about the origin
    x = radius*cosTheta;
    y = radius*sinTheta;
    z = ones(1,length(x));

    % create a matrix with all the x coordinates on the first rows
    % all the y coordinates on the second row.
    circleMatrix = [x;y;z];

    % get the translation matrix
    T = getTranslate(xCenter, yCenter);

    %translate the circle
    circleMatrix = T*circleMatrix;

    % extract the x and y coordinates of the translate...
    x = circleMatrix(1,:);
    y  = circleMatrix(2,:);

    x = [x,xCenter,x(1)];
    y = [y,yCenter,y(1)];

    % circle of radius r about the xCenter, yCenter
    fishHandle = line(x,y);
    set(fishHandle,'Color',fishColor);
    set(fishHandle,'LineWidth',fishLineWidth);
