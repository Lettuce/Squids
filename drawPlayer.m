function playerHandle = drawPlayer (playerX, playerY, playerTheta, ...
                              playerBodySize, playerHeadSize, netSize, ...
                              playerColor, playerLineWidth)

  player = getPlayer (playerBodySize, playerHeadSize, netSize);

 T = getTranslate(playerX,playerY);
  player = T*player;

   % body
   pt1 = player(:,1); %top of neshnine
   pt6 = player(:,6);
   pt7 = player(:,7); % hip
   pt8 = player(:,8);% right foot
   pt9 = player(:,9);% right flipper
   pt10 = player(:,10);% left foot
   pt11 = player(:,11);% left flipper

   % tank
  pt2 = player(:,2); %top of the tank
  pt3 = player(:,3);
  pt4 = player(:,4);
  pt5 = player(:,5);

  handle(1) = drawLine(pt1,pt7, playerColor, playerLineWidth);
  handle(2) = drawLine(pt7,pt8, playerColor, playerLineWidth);
  handle(3) = drawLine(pt8,pt9, playerColor, playerLineWidth);
  handle(4) = drawLine(pt7,pt10, playerColor, playerLineWidth);
  handle(5) = drawLine(pt10,pt11, playerColor, playerLineWidth);
  handle(6) = drawLine(pt5,pt4, playerColor, playerLineWidth);
  handle(7) = drawLine(pt4,pt3, playerColor, playerLineWidth);
  handle(8) = drawLine(pt3,pt2, playerColor, playerLineWidth);

  x = player(1,:);
  y = player(2,:);

  playerHandle = line(x,y);




  endfunction
