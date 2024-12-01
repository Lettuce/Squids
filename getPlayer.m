function [player,firstHeadPoint] = getPlayer (bodySize, headSize, netSize, myClock, cmd)

  %Move legs
  legCycleTicks = 120;
  legAngle = (2 * pi/legCycleTicks)*myClock;
  legLength = 2*bodySize;

  % Flipper parameters
  flipperSize = bodySize/2;
  flipperAngle = pi/2;
  flipperMaxAngle = pi/4;
  flipperLagAngle = pi/180;


   % leg parameters
   legAngleMax = pi/4;
   legAngleTicks = 20;
   legLength = bodySize;

   if (cmd == "w")

     legAngleRight = pi + legAngleMax*sin(2*pi*myClock/legAngleTicks);
     legAngleLeft = pi - legAngleMax*sin(2*pi*myClock/legAngleTicks);

     if(cos(2*pi*myClock/legAngleTicks)>0)
      flipperAngleRight = legAngleRight - flipperMaxAngle;
     else
      flipperAngleRight = legAngleRight + flipperMaxAngle;
     endif

     if (-cos(2*pi*myClock/legAngleTicks)>0)
       flipperAngleLeft = legAngleLeft - flipperMaxAngle;
     else
       flipperAngleLeft = legAngleLeft + flipperMaxAngle;
     endif

    else
      legAngleRight = pi;
      legAngleLeft = pi;
      flipperAngleRight = legAngleRight - flipperMaxAngle;
      flipperAngleLeft = legAngleLeft + flipperMaxAngle;
   endif



   if( cmd == "a" || cmd == "d" || cmd == "w")
    legAngleRight = pi + legAngleMax*sin(2*pi*myClock/legAngleTicks);
    legAngleLeft  = pi + legAngleMax*cos(2*pi*myClock/legAngleTicks);
    flipperAngleRight = pi + flipperMaxAngle*sin(2*pi*myClock/legAngleTicks);
    flipperAngleLeft = pi + flipperMaxAngle*cos(2*pi*myClock/legAngleTicks);
   else
    legAngleRight = pi;
    legAngleLeft = pi + legAngleMax;

    flipperAngleRight = pi;
    flipperAngleLeft = pi + flipperMaxAngle;
   endif

   % body
   pt1 = [bodySize;0;1]; %top of neshnine
   pt6 = [0;0;1];
   pt7 = [-bodySize;0;1]; % hip

   % Right Leg
   pt8 = [pt7(1) + legLength*cos(legAngleRight); pt7(2) + legLength*sin(legAngleRight);1];% right foot
  %pt9 = [pt8(1) - 1.6*bodySize; pt8(2) - 0.8*bodySize;1]% right flipper
   pt9 = [pt8(1) - flipperSize*sin(flipperAngleLeft);pt8(2) + flipperSize*cos(flipperAngleLeft);1]; % right flipper

   % Left Leg
   pt10 = [pt7(1) + legLength*cos(legAngleRight); pt7(2) + legLength*sin(legAngleLeft);1];% left foot
   pt11 = [pt10(1) - flipperSize*sin(flipperLagAngle);pt10(2) - flipperSize*cos(flipperLagAngle);1];% left flipper

   % Arms
   pt12 = [0;0.5*bodySize;1]; %hand
   pt13 = [0.7*bodySize; 0.5*bodySize;1];
   pt14 = [2*bodySize; 0.5*bodySize;1];

   % tank
   pt2 = [0.7*bodySize;0;1]; %top of the tank/shoulder
   pt3 = [0.7*bodySize; -0.2*bodySize;1];
   pt4 = [-0.7*bodySize; -0.2*bodySize;1];
   pt5 = [-0.7*bodySize;0;1];

   % head
   headRadius = bodySize/4;
   headPoints = getCircle(headRadius,0);
   T = getTranslate(headRadius+bodySize,0);
   headPoints = T * headPoints;

  % lightning parameters
  if (cmd == "l")

  endif

  player = [pt1,pt2,pt3,pt4,pt5,pt6,pt7,pt8,pt9,pt10,pt11,pt12,pt13,pt14,headPoints];

  firstHeadPoint = 15; % update as more points are added to player

  endfunction
