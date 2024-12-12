function [handle, spearX, spearY] = drawPlayer (playerX, playerY, playerTheta, ...
                              playerBodySize, playerHeadSize, netSize, ...
                              playerColor, playerLineWidth, myClock, cmd)

  [player,firstHeadPoint] = getPlayer (playerBodySize, playerHeadSize, netSize, myClock,cmd);

  % rotate player
  R = getRotate(playerTheta);
  player = R*player;

  % translate player
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

  % net


  pt12 = player(:,12);
  pt14 = player(:,14);
  % arm
  pt13 = player(:,13);

  % spear

  spearX = pt14(1);
  spearY = pt14(2);

  testColor = [1 0 0];

  [rows,cols] = size(player);
  % head
  xHeadPoints = player(1,firstHeadPoint:cols);
  yHeadPoints = player(2,firstHeadPoint:cols);

  handle(1) = drawLine(pt1,pt7, playerColor, playerLineWidth); % body
  handle(2) = drawLine(pt7,pt8, playerColor, playerLineWidth); % right leg
  handle(3) = drawLine(pt8,pt9, playerColor, playerLineWidth); % right flipper
  handle(4) = drawLine(pt10,pt7, playerColor, playerLineWidth); % left leg
  handle(5) = drawLine(pt10,pt11, playerColor, playerLineWidth); % left flipper
  handle(6) = drawLine(pt5,pt4, playerColor, playerLineWidth); % tank bottom
  handle(7) = drawLine(pt4,pt3, playerColor, playerLineWidth); % tank side
  handle(8) = drawLine(pt3,pt2, playerColor, playerLineWidth); % tank top (cyrus)
  handle(9) = drawLine(pt12,pt14, playerColor, playerLineWidth); % stick
  handle(10) = drawLine(pt2,pt13, playerColor, playerLineWidth); % arm
  handle(11) = line(xHeadPoints,yHeadPoints); % head
  set(handle(11),'Color',playerColor);
  set(handle(11),'LineWidth',playerLineWidth);


  % get the player points for player at the origin
 % [player,firstHeadPoint] = getPlayer (playerBodySize);
 % [playerRows, lastHeadPoint] = size(player);


  % head fill

 % x = [pt13(1),pt14(1),pt15(1),pt16(1)];
 % y = [pt13(2),pt14(2),pt15(2),pt16(2)];
  handle(12) = patch(xHeadPoints,yHeadPoints,[0 0 1]);


  endfunction
