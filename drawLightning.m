function lightningHandle = drawLightning(lightningSize, lightningClock, lightningColor, lightningWidth,
                                         lightningX, lightningY, lightningTheta)

  % Get Light
  lightning = getLightning(lightningSize, lightningClock);

  % Rotate Light
    R = getRotate(lightningTheta);
    lightning = R*lightning;

  % Get Translate Light Matrix
    T = getTranslate(lightningX, lightningY);
    lightning = T*lightning;

  % Light Body
  pt1 = lightning(:1);
  pt2 = lightning(:2);
  pt3 = lightning(:3);
  pt4 = lightning(:4);
  pt5 = lightning(:5);
  pt6 = lightning(:6);

  handle1 = drawLine(pt1 ,pt2 ,lightningColor,lightningWidth);
  handle2 = drawLine(pt2 ,pt3 ,lightningColor,lightningWidth);
  handle3 = drawLine(pt3 ,pt4 ,lightningColor,lightningWidth);
  handle4 = drawLine(pt4 ,pt5 ,lightningColor,lightningWidth);
  handle5 = drawLine(pt5 ,pt6 ,lightningColor,lightningWidth);
  handle6 = drawLine(pt7 ,pt8 ,lightningColor,lightningWidth);
  handle7 = drawLine(pt8 ,pt9 ,lightningColor,lightningWidth);

  lightningHandle = [handle1, handle2, handle3, handle4, handle5, handle6, handle7];



 endfunction
