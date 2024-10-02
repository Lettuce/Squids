function squid = getSquid (squidSize,clock)

  %squidPoints = getSquid(squidSize);
   %do modular division. mod(n,m) This gives the remainder after diviing n by m.

  %frame = 0
  frame = mod(clock,2);

 if( frame == 0)
    legSeparation = squidSize;
    %squid body points
    squidPoint1 = [ squidSize;0;1];
    squidPoint2 = [ 0;squidSize;1];
    squidPoint3 = [ 0;-squidSize;1];

    %left leg
     squidPoint4= [0;squidSize/2;1];
     squidPoint5= [-squidSize;-0;1];
     squidPoint6= [-2*squidSize;squidSize/2;1];

     %right leg

     squidPoint7= [0;squidSize/2 - legSeparation;1];
     squidPoint8= [-squidSize;- legSeparation;1];
     squidPoint9= [-2*squidSize;squidSize/2 - legSeparation;1];

 elseif( frame == 1)
   %squid body points
    legSeparation = squidSize;
    squidPoint1 = [ squidSize*1.5;0;1];
    squidPoint2 = [ 0;squidSize/1.5;1];
    squidPoint3 = [ 0;squidSize/-1.5;1];

    %left leg
     squidPoint4= [0;squidSize/2;1];
     squidPoint5= [-squidSize;legSeparation;1];
     squidPoint6= [-2*squidSize;squidSize/2;1];

     %right leg

     squidPoint7= [0;squidSize/2 - legSeparation;1];
     squidPoint8= [-squidSize;0;1];
     squidPoint9= [-2*squidSize;squidSize/2 - legSeparation;1];

 else
   % default case no animation. ie clock <0
    %squid body points
    legSeparation = squidSize;
    squidPoint1 = [ squidSize;0;1];
    squidPoint2 = [ 0;squidSize;1];
    squidPoint3 = [ 0;-squidSize;1];

    %left leg
     squidPoint4= [0;squidSize/2;1];
     squidPoint5= [-squidSize;-0;1];
     squidPoint6= [-2*squidSize;squidSize/2;1];

     %right leg

     squidPoint7= [0;squidSize/2 - legSeparation;1];
     squidPoint8= [-squidSize;- legSeparation;1];
     squidPoint9= [-2*squidSize;squidSize/2 - legSeparation;1];


   endif

   squid = [squidPoint1, squidPoint2, squidPoint3, squidPoint4, squidPoint5, squidPoint6, squidPoint7, squidPoint8, squidPoint9];


   endfunction
