function playerHandle = drawPlayer (playerX, playerY, playerTheta, ...
                              playerBodySize, playerHeadSize, netSize, ...
                              playerColor, playerLineWidth)

  player = getPlayer (playerBodySize, playerHeadSize, netSize);

  x = player(1,:);
  y = player(2,:);

  playerHandle = line(x,y);




  endfunction
