function squidHandle = drawSquid (squidSize, color, width,  myClock, Dx, Dy, squidTheta)


    % get the translate matrix
    squid = getSquid(squidSize, myClock);


    %rotate by 90 degrees *** Adding a negative sign to pi flips it vertical
    R = getRotate(squidTheta);
    squid = R*squid;

    % get the squid
    T = getTranslate(Dx,Dy);
    squid = T*squid;


  % draw squid body
  p1 = squid(:,1);
  p2 = squid(:,2);
  p3 = squid(:,3);

  % draw squid left leg
  p4 = squid(:,4);
  p5 = squid(:,5);
  p6 = squid(:,6);

  %draw squid right leg
  p7 = squid(:,7);
  p8 = squid(:,8);
  p9 = squid(:,9);

   squidHandle(1) = drawLine(p1,p2,color,width);
   squidHandle(2) = drawLine(p2,p3,color,width);
   squidHandle(3) = drawLine(p3,p1,color,width);
   squidHandle(4) = drawLine(p4,p5,color,width);
   squidHandle(5) = drawLine(p5,p6,color,width);
   squidHandle(6) = drawLine(p7,p8,color,width);
   squidHandle(7) = drawLine(p8,p9,color,width);



  %Old drawSquid

  %  squidPoints = getSquid(squidSize);

  %  squidPoint1 = squidPoints(:,1);
  %  squidPoint2 = squidPoints(:,2);
  %  squidPoint3 = squidPoints(:,3);
  %  squidPoint4 = squidPoints(:,4);
  %  squidPoint5 = squidPoints(:,5);
  %  squidPoint6 = squidPoints(:,6);
  %  squidPoint7 = squidPoints(:,7);
  %  squidPoint8 = squidPoints(:,8);
  %  squidPoint9 = squidPoints(:,9);


 %   pt1= [ squidSize;0;1];
  %  pt2= [ 0;squidSize;1];
  %  pt3= [ 0;-squidSize;1];

  %  handle1 = drawLine(pt1,pt2,color,width);
  %  handle2 = drawLine(pt2,pt3,color,width);
  %  handle3 = drawLine(pt3,pt1,color,width);

  %  %squid legs
  %  pt4= [0;squidSize/2;1];
  %  pt5= [-squidSize;0;1];
  %  pt6= [-2*squidSize;squidSize/2;1];



  %  %squid right leg
  %  legSeparation = squidSize;
  %  pt7= [0;squidSize/2-legSeparation;1];
  %  pt8= [-squidSize;0-legSeparation;1];
  %  pt9= [-2*squidSize;squidSize/2-legSeparation;1];
  %  pt10= [0;0;1];
  %  pt11= [0;7.5;1];
  %  pt12= [0;-7.5;1];
  %  pt13= [0;22.5;1];
  %  pt14= [0;-22.5;1];
    %pt11= [30;0;1];


  %  handle4 = drawLine(pt4,pt5,color,width);
  %  handle5 = drawLine(pt5,pt6,color,width);
  %  handle6 = drawLine(pt7,pt8,color,width);
  %  handle7 = drawLine(pt8,pt9,color,width);
    %handle8 = drawLine(pt10,pt1,color,width);
    %handle8 = drawLine(pt1,pt2,color,width);
    %handle9 = drawLine(pt1,pt2,color,width);

  %  red = [1 0 0];
    %drawLine (pt1,pt2,red,width);
    %drawLine (pt2,pt3,color,width);
    %drawLine (pt3,pt1,color,width);
    %drawLine (pt4,pt5,color,width);
    %drawLine (pt5,pt6,color,width);
    %drawLine (pt7,pt8,color,width);
    %drawLine (pt8,pt9,color,width);

    %Stripes
  %  handle8 = drawLine (pt10,pt1,red,width);
  %  handle9 = drawLine (pt4,pt1,red,width);
  %  handle10 = drawLine (pt7,pt1,red,width);
  %  handle11 = drawLine (pt11,pt1,red,width);
  %  handle12 = drawLine (pt12,pt1,red,width);
  %  handle13 = drawLine (pt13,pt1,red,width);
  %  handle14 = drawLine (pt14,pt1,red,width);



   % squidHandle = [ handle1, handle2, handle3, handle4, handle5, handle6, handle7, handle8, handle9, handle10, handle11, handle12, handle13, handle14];


endfunction

