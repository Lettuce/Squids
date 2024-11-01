function animate ()

  % global parameters
    global cmd;
    global mouseCmd;
    global playerX;
    global playerY;
    global mousePreviousX;
    global mousePreviousY;


 [imageHeight, imageWidth] = drawOcean ("OceanImage.png");

  % Command parameters
  cmd = "null";
  mouseCmd = "null";

  % Player parameters
  playerX = round(imageWidth/2);
  playerY = round(imageHeight/2);
  playerTheta = pi/4;
  playerBodySize = 100;
  playerHeadSize = 30;
  netSize = 20;
  playerColor = [ 0 0 1 ];
  playerLineWidth = 3;
  playerSpearX = 0;
  playerSpearY = 0;

  % squid drawing parameters
  color = [.2 .1 .6];
  width = 2;
  squidSize = 100;
  squidStep = 30;
  squidCaught = 0; % squid is not caught



  % drawCircle(bubbleRadius(i),bubbleX(i),bubbleY(i),color,circleLineWidth);

  maxRadius = 20;
  radius = maxRadius*rand();
  xCenter = 500;
  yCenter = 1000;
  circleColor = [.2 .1 .7];
  circleLineWidth = 5;
  DyCircle = 50;

  squidX = 300;
  squidY = 200;
  Dx = 300;
  Dy = 200;

  bubbleMaxRadius= 50;
  bubbleLineWidth = 3;
  bubbleLineColor = [1 1 1];
  bubbleStep = 50;
  bubbleMinRadius = 5;
  numBubbles = 7;

  %remove later
  %figure(1)
  %axis ([-100, 100, -100, 100]);

  for i = 1:  numBubbles % bubble set
    bubbleRadius(i) = rand() * bubbleMaxRadius + bubbleMinRadius;
    bubbleX(i) = rand() * imageWidth;
    bubbleY(i) = imageHeight;

  endfor

    % create fish
  fishX = 200;
  fishY = 500;
  fishRadius = 50;
  fishForwardMove = 100;
  fishColor = [1 0 0];
  fishLineWidth = 3;


    % squid drawing parameters
    squidColor = [.2 .1 .6];
    squidWidth = 3;
    squidSize = 60;

    % squid movement resolutions
    squidForwardMove = 100;
    squidDeltaTheta = pi/3;

    % squid location and heading
    squidX = 300;
    squidY = 500;
    squidTheta = 0;

      % game Clock
  myClock = 0;

    % ******************************* Animate Loop *********************************
  while( true)

    myClock = myClock+1;


    % Move Player
    if( cmd == "w"  )
    [playerX,playerY,playerTheta] = movePlayer (playerX,playerY,playerTheta,cmd);
  endif

  if( mouseCmd == "a" || mouseCmd == "c" )
    [playerX,playerY,playerTheta] = movePlayer (playerX,playerY,playerTheta,mouseCmd);
  endif

  % check player
    [playerX,playerY] = checkBoundary(playerX,playerY,imageWidth,imageHeight,2*playerBodySize);

  % Draw player
    [playerHandle,playerSpearX,playerSpearY] = drawPlayer (playerX, playerY, playerTheta, playerBodySize, playerHeadSize, netSize, playerColor, playerLineWidth, myClock, cmd);

  % check if squid has been caught
  if(squidCaught == 0)
   squidCaught = isSquidCaught(playerSpearX, playerSpearY, squidX, squidY, squidSize);
  endif
  squidCaught

  % set player command back to null
    cmd = "null";
    mouseCmd = "null";



  % draw fish
    fishHandle = drawFish (fishRadius, fishX, fishY, fishColor, fishLineWidth, myClock);

  % move fish
    fishX = fishX + fishForwardMove;

  % check fish
    [fishX,fishY] = checkBoundary(fishX,fishY,imageWidth,imageHeight,2*fishRadius);


    yCenter = yCenter - DyCircle;







    % Change the X and Y step of the squid per movement
   %Dy = Dy - 100;
  %  Dx = Dx + 100;
  %  squidX = squidX + squidForwardMove

  if(squidCaught == 0)

    %  And Rotate ( Update the squid's heading and position
  % squidX = squidX + squidForwardMove*cos(squidTheta);
   squidX = squidX + 100;
  % squidY = squidY + 100;
 %  squidY = squidY + squidForwardMove*cos(squidTheta);

   squidTheta = squidTheta + squidDeltaTheta;
   squidX = squidX + squidForwardMove*cos(squidTheta);
   squidY = squidY + squidForwardMove*sin(squidTheta);

  % Rotate squid
    R = getRotate(squidTheta);
    squid = getSquid (squidSize, myClock);
    squid = R*squid;

   % draw the squid
   squidHandle = drawSquid(squidSize,squidColor,squidWidth, myClock,squidX,squidY,squidTheta);

   % check squid
   [squidX,squidY] = checkBoundary(squidX,squidY,imageWidth,imageHeight,3*squidSize);

 endif

    for i=1: numBubbles % bubble ascention
    bubbleY(i) = bubbleY(i) - rand()*bubbleStep;
 endfor


  %playerX = playerX + 100;




 for i=1: numBubbles % bubble check add
   if(bubbleY(i)<3*bubbleMaxRadius)
   bubbleY(i) = imageHeight - 3*bubbleMaxRadius;
   bubbleX(i) = rand() * imageWidth;
   bubbleRadius(i) = rand()*bubbleMaxRadius + bubbleMinRadius;
   endif

endfor


[xCenter,yCenter] = checkBoundary (xCenter,yCenter,imageWidth,imageHeight,radius);

%[Dx, Dy] = checkBoundary (Dx,Dy,imageWidth,imageHeight,2*squidSize);
 % squidHandle = drawSquid(squidSize,squidColor,squidWidth, myClock,squidX,squidY)



 % if (yCenter - 2*radius < 0) % circle return
 %   yCenter = imageHeight-2*radius;
 % endif
for i = 1: numBubbles
[bubbleX(i),bubbleY(i)] = checkBoundary (bubbleX(i),bubbleY(i),imageWidth,imageHeight,bubbleRadius(i));

  endfor

for i = 1:  numBubbles
    circleHandle(i) = drawCircle (bubbleRadius(i), bubbleX(i), bubbleY(i), bubbleLineColor, bubbleLineWidth);

  endfor



pause(.1);


   delete(circleHandle);
  if(squidCaught == 0)
    delete(squidHandle);
  endif
  delete(fishHandle);
  delete(playerHandle);



 % delete(h)


endwhile
 % **************************** END ANIMATE LOOP *****************************

 function keypress_callback(event)

          % Set the command
          cmd = event.Key;

          % Check for 'q' to quit
          if strcmp(cmd, 'q')
              disp('Quitting...');
              close(figureHandle); % Close the figure
          endif
  endfunction

 endfunction


