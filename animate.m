function animate ()

  % global parameters
    global cmd;
  %  global mouseCmd;
    global playerX;
    global playerY;
    global playerTheta;
  %  global mousePreviousX;
  %  global mousePreviousY;

  [smmvictory, Fs3] = audioread('SuperMachoVictory.mp3');
  [theworldstart, Fs2] = audioread('timestopstart.wav');
  [theworldend,Fs2] = audioread('timestopend.wav');
  [theworld, Fs2] = audioread('timestop.wav');
 % [lightningsound, Fs2] = audioread('lightningsound.wav');


      % Set up the game background to read keyboard events - prevents mousemotion callback?
 % figureHandle = figure('KeyPressFcn', @(src, event) keypress_callback(event), ...
 %               'Name', 'Keyboard Reader', ...
 %               'NumberTitle', 'off', ...
 %               'MenuBar', 'none', ...
 %               'Position', [100, 100, 300, 200]); %Set the figure size


 [imageHeight, imageWidth] = drawOcean ("OceanImage.png");
 [oceanMusic,soundSamplingRate] = getSound("waterMusic.wav");
 oceanBGMusic = audioplayer(oceanMusic, soundSamplingRate);

 % get player level
 level = getLevel();
 squids = level;




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
  playerHealth = 100;
  [hurtSound, soundSamplingRate] = getSound("hurtSound.wav");
  playerHurtSound = audioplayer(hurtSound, soundSamplingRate);

 [gameOverMusic,soundSamplingRate] = getSound("gameOver.wav");
 gameOver = audioplayer(gameOverMusic, soundSamplingRate);


  % squid drawing parameters
  color = [.2 .1 .6];
  width = 2;
  squidSize = 100;
  squidStep = 30;
  squidCaught = 0; % squid is not caught
  squidsCaught = 0;
  squidX = 300;
  squidY = 200;
  Dx = 300;
  Dy = 200;
  maxSquidsCaught = 10;
  [squidCaughtSound, soundSamplingRate] = getSound ("squidCaught.wav");
  squidCollect = audioplayer(squidCaughtSound,soundSamplingRate);

  % Lightning parameters
  lightningSize = 100;
  lightningWidth = 3;
  lightningColor = [1 1 0];
  lightningMove = imageWidth/10;
  lightningMaxFlashes = 10;
  lightningRows = 3;
  lightningColumns = 6;
  lightningX = zeros(1,lightningMaxFlashes);
  lightningY = zeros(1,lightningMaxFlashes);
  lightningFlash = zeros(1,lightningMaxFlashes);
  lightningTheta = zeros(1,lightningMaxFlashes);
  lightningHandle = zeros(5,lightningMaxFlashes);
  lightning = zeros(lightningRows, lightningColumns, lightningMaxFlashes);
  [lightningSound, soundSamplingRate] = getSound ("lightningsound.wav");
  lightningsnd = audioplayer(lightningSound,soundSamplingRate);



  % drawCircle(bubbleRadius(i),bubbleX(i),bubbleY(i),color,circleLineWidth);

  % Fish Parameters
  maxRadius = 20;
  radius = maxRadius*rand();
  xCenter = 500;
  yCenter = 1000;
  circleColor = [.2 .1 .7];
  circleLineWidth = 5;
  DyCircle = 50;

  % Bubble Parameters
  bubbleMaxRadius= 50;
  bubbleLineWidth = 3;
  bubbleLineColor = [1 1 1];
  bubbleStep = 50;
  bubbleMinRadius = 5;
  numBubbles = 7;

  %text location
  healthStatusLocation = [100, 200];
  squidsCaughtLocation = [100, 150];
  redColor = [1 0 0];



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
  fishBiteDamage = 10; % amount deducted from player's health when bitten
  fishStunTime = 10;
  stunTime = 50;
  stunClock = 0;
  timerStarted = 0;
  [fishShockSound, soundSamplingRate] = getSound ("fishShock.wav");
  fishShock = audioplayer(fishShockSound,soundSamplingRate);

  % create THE WORLD
  stunTimeMax = 45;
  allStunTime = stunTimeMax;
  theStunTime = 50;
  allStunTimerStarted = 0;
  allStunClock = 0;
  allStunned = 0;
  [theWorldSound, soundSamplingRate] = getSound ("timestop2.wav");
  worldSound = audioplayer(theWorldSound,soundSamplingRate);



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


  if(level == 1)
    fishForwardMove = 100;
    squidStep = 30;
    lightningMove = imageWidth/10;
    fishBiteDamage = 10;
  elseif(level == 2)
    fishForwardMove = 110;
    squidStep = 32;
    lightningMove = imageWidth/10.5;
    fishBiteDamage = 12;
  elseif(level == 3)
    fishForwardMove = 120;
    squidStep = 34;
    lightningMove = imageWidth/11;
    fishBiteDamage = 14;
  elseif(level == 4)
    fishForwardMove = 130;
    squidStep = 36;
    lightningMove = imageWidth/11.5;
    fishBiteDamage = 16;
  elseif(level == 5)
    fishForwardMove = 140;
    squidStep = 38;
    lightningMove = imageWidth/12;
    fishBiteDamage = 18;
  elseif(level == 6)
    fishForwardMove = 150;
    squidStep = 40;
    lightningMove = imageWidth/12.5;
    fishBiteDamage = 20;
  elseif(level == 7)
    fishForwardMove = 160;
    squidStep = 42;
    lightningMove = imageWidth/13;
    fishBiteDamage = 22;
  elseif(level == 8)
    fishForwardMove = 170;
    squidStep = 44;
    lightningMove = imageWidth/13.5;
    fishBiteDamage = 24;
  elseif(level == 9)
    fishForwardMove = 180;
    squidStep = 46;
    lightningMove = imageWidth/14;
    fishBiteDamage = 26;
  endif

    play(oceanBGMusic);

    % ******************************* Animate Loop *********************************
  while( true)





 % if(allStunTimerStarted == 1)
 %   [imageHeight, imageWidth] = drawOcean ("grayOceanImage.png");
 % else
 %   [imageHeight, imageWidth] = drawOcean ("OceanImage.png");
 % endif



    myClock = myClock+1;

    if(cmd == "q" || playerHealth <= 0)
      if(cmd == "q")
        disp("The Last Judgement Draweth Nigh.");
       else
        play(gameOver);
        text(imageWidth/4,imageHeight/2, "The Last Judgement Draweth Nigh.", 'FontSize', 50, 'Color',redColor);
       endif
       pause(15);
       close();
       break;
      endif


 %     text(800,800, 'Help!!!', 'FontSize', 16, 'Color', redColor);

    % Move Player
    if( cmd == "w" || cmd == "d" || cmd == "a" || cmd == "s")
    [playerX,playerY,playerTheta] = movePlayer (playerX,playerY,playerTheta,cmd);
  endif


  % move right and left
  if( mouseCmd == "a" || mouseCmd == "c" )
    [playerX,playerY,playerTheta] = movePlayer (playerX,playerY,playerTheta,mouseCmd);
  endif

  % check player
    [playerX,playerY] = checkPlayerBoundary(playerX,playerY,imageWidth,imageHeight,2*playerBodySize);

  % Draw player
    [playerHandle,playerSpearX,playerSpearY] = drawPlayer (playerX, playerY, playerTheta, playerBodySize, playerHeadSize, netSize, playerColor, playerLineWidth, myClock, cmd);

  % check if fish stunned
     fishStunned = 0;
    for(i = 1: lightningMaxFlashes)
        fishStunned = isFishStunned (lightning, lightningMaxFlashes, lightningFlash, fishX, fishY, fishRadius);
      if(fishStunned)
        break;
      endif
    endfor




  % check if squid has been caught
  %if(squidCaught == 0)
   squidCaught = isSquidCaught(playerSpearX, playerSpearY, squidX, squidY, squidSize);
  %endif
  squidCaught;


   % Squid Caught
    if(squidCaught == 1)
      play(squidCollect);
      squidsCaught = squidsCaught + 1;
      squidX = squidSize*2;
      %squidY = squidSize +squidForwardMove;
     % squidY = rand()*imageHeight;
        squidY = rand()*imageHeight;
      if(squidY > 800 || squidY < 300)
        squidY = rand()*imageHeight;
      endif
      squidY
      % squidsCaught = 0;
      squidColor = [rand rand rand];
    endif


  % set player command back to null
    mouseCmd = "null";

  % draw fish
    fishHandle = drawFish (fishRadius, fishX, fishY, fishColor, fishLineWidth, myClock, allStunTimerStarted);

  % move fish
  if(fishStunned == 1 && timerStarted == 0)
    play(fishShock);
    timerStarted = 1;
    fishStunned = 0;
  endif

  if(timerStarted == 1)
    stunTime = stunTime - 1;
  endif

  if(stunTime < 0)
    timerStarted = 0;
    stunTime = 50;
  endif

  if(timerStarted || allStunTimerStarted)
    fishX = fishX;
  else
    fishX = fishX + fishForwardMove;
  endif




  % check fish
    [fishX,fishY] = checkFishBoundary(fishX,fishY,imageHeight,imageWidth,fishRadius);





     % is palyer bitten

    playerBitten = isPlayerBitten(playerX, playerY, fishX, fishY, playerBodySize);

    if(playerBitten == 1)
      play(playerHurtSound);
      playerHealth = playerHealth - fishBiteDamage;
    endif


    yCenter = yCenter - DyCircle;

  % update the health and catch status
  myMessage = cstrcat('Health ', ' ');
  healthStatusMessage = cstrcat(myMessage, num2str(playerHealth));
  healthHandle       = text(healthStatusLocation(1), healthStatusLocation(2), healthStatusMessage,'FontSize', 20, 'Color', redColor);
  catchStatusMessage = cstrcat('Squids Caught ', num2str(squidsCaught));
  squidsCaughtHandle = text(squidsCaughtLocation(1), squidsCaughtLocation(2), catchStatusMessage, 'FontSize', 20, 'Color', redColor);




    % Change the X and Y step of the squid per movement
   %Dy = Dy - 100;
  %  Dx = Dx + 100;
  %  squidX = squidX + squidForwardMove

    %  And Rotate ( Update the squid's heading and position
  % squidX = squidX + squidForwardMove*cos(squidTheta);
  % squidY = squidY + 100;
 %  squidY = squidY + squidForwardMove*cos(squidTheta);

 if(allStunTimerStarted)
  squidTheta = squidTheta;
  squidX = squidX;
  squidY = squidY;
 else
   squidTheta = squidTheta + squidDeltaTheta;
   squidX = squidX + squidForwardMove*cos(squidTheta);
   squidY = squidY + squidForwardMove*sin(squidTheta);
   squidX = squidX + 100;
endif


   % draw the squid
   squidHandle = drawSquid(squidSize,squidColor,squidWidth, myClock,squidX,squidY,squidTheta, allStunTimerStarted );

   % check squid
   [squidX,squidY] = checkSquidBoundary(squidX,squidY,imageWidth,imageHeight,3*squidSize);






  %playerX = playerX + 100;





  % Bubbles
% for i=1: numBubbles % bubble check add
%   if(bubbleY(i)<3*bubbleMaxRadius)
%   bubbleY(i) = imageHeight - 3*bubbleMaxRadius;
%   bubbleX(i) = rand() * imageWidth;
%   bubbleRadius(i) = rand()*bubbleMaxRadius + bubbleMinRadius;
%   endif

% endfor


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


  % LIGHTNING Controls
  if (cmd == "l")
    play(lightningsnd);
    for (i=1:lightningMaxFlashes) % create a new lightning bolt
      if(lightningFlash(i) == 0)
   %   disp(" Creating Lightning");
       lightningFlash(i) = 1;
       lightningX(i) = playerSpearX;
       lightningY(i) = playerSpearY;
       lightningTheta(i) = playerTheta;
       break;
      endif
     endfor
  endif

  % move lightning
for(i = 1: lightningMaxFlashes)
  if(lightningFlash(i))
      lightningX(i) = lightningX(i) + lightningMove*cos(lightningTheta(i));
      lightningY(i) = lightningY(i) + lightningMove*sin(lightningTheta(i));
  endif
endfor

  % check lightning
for(i =1: lightningMaxFlashes)
  if(lightningFlash(i))
      [lightningX(i), lightningY(i), lightningFlash(i)] = checkLightningBoundary (lightningX(i), lightningY(i), imageWidth, imageHeight, 2*lightningSize, lightningFlash(i));
  endif
endfor

  % draw lightning
for(i = 1: lightningMaxFlashes)
  if(lightningFlash(i))
      [lightningHandle(:,i), lightning(:,:,i)] = drawLightning (lightningSize, myClock, lightningColor, lightningWidth, lightningX(i), lightningY(i), lightningTheta(i));
  endif
endfor

%  cmd = "null";


  % THE WORLD

if(cmd == "z")
  % play the world
  play(worldSound);
% sound(theworldstart, Fs3);
  allStunTimerStarted = 1;
endif

if(allStunned == 1 && allStunTimerStarted == 0)
    allStunTimerStarted = 1;
    allStunned = 0;
endif

if(allStunTimerStarted == 1)
    allStunTime = allStunTime - 1;
endif

if(allStunTime < 0)
    allStunTimerStarted = 0;
    allStunTime = stunTimeMax;
 endif

if(allStunTimerStarted)

  for (i=1: numBubbles) % bubble check add
    bubbleY(i) = bubbleY(i);
  endfor

else

 for i=1: numBubbles % bubble ascention
    bubbleY(i) = bubbleY(i) - rand()*bubbleStep;
 endfor


endif

cmd = "null";

 for (i=1: numBubbles) % bubble check add
   if(bubbleY(i)<3*bubbleMaxRadius)
    bubbleY(i) = imageHeight - 3*bubbleMaxRadius;
    bubbleX(i) = rand() * imageWidth;
    bubbleRadius(i) = rand()*bubbleMaxRadius + bubbleMinRadius;
   endif
 endfor

  % Wait For THIS Long ->
 pause(0.0167);
% pause(1);



  delete(squidHandle);
  delete(circleHandle);
  delete(fishHandle);
  delete(playerHandle);
  delete(healthHandle);
  delete(squidsCaughtHandle);




   for (i = 1: lightningMaxFlashes)
      if(lightningFlash(i) > 0)
        delete(lightningHandle(:,i));
      endif
   endfor


 % delete(h)

 if(squidsCaught == maxSquidsCaught)
        text(imageWidth/3,imageHeight/2, "Victory! Dinner Is Soon!", 'FontSize', 50, 'Color',redColor);
        pause(0.1);
        sound(smmvictory, Fs3);
        close();
        break;
 endif


endwhile
 % **************************** END ANIMATE LOOP *****************************



 endfunction


