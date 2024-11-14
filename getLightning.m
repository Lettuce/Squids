function lightningHandle = getLightning(lightningSize, myClock, lightningClock)

  lightningColor [1 1 0];
  lightningMovement = 10;
  lightningShake = 5;

 if (mod(lightningClock,2) == 0)
   pt1 = [-1.5*lightningSize; -0.25*lightningSize; 1];
   pt2 = [-0.5*lightningSize; -0.25*lightningSize; 1];
   pt3 = [(lightningSize/2); (lightningSize/4); 1];
   pt4 = [0; 0; 1];
   pt5 = [2*lightningSize; (lightningSize/4); 1];
   pt6 = [(3*lightningSize/2); (lightningSize/2); 1];
   pt7 = [1.5*lightningSize; 0.25*lightningSize/2; 1];

 else
   pt1 = [lightningShake; -lightningSize; 1];
   pt2 = [lightningShake; 0; 1];
   pt3 = [lightningShake; lightningSize; 1];

   lightningSize = lightningSize + lightningMovement;

  % Lightning varibles


   lightningHandle = line(x,y);


endfunction
