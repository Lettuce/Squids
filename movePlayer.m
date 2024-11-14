function [playerX,playerY,playerTheta] = movePlayer (playerX,playerY,playerTheta,cmd);

  forwardMove = 50;
  thetaMove = pi/12;

  if (cmd == "w" )
    playerX = playerX + forwardMove*cos(playerTheta);
    playerY = playerY + forwardMove*sin(playerTheta);
  endif

  if (cmd == "c" )
    playerTheta = playerTheta + thetaMove;
  endif

  if (cmd == "a")
    playerTheta = playerTheta - thetaMove;
  endif

  if (cmd == "s")
    playerX = playerX + 2*forwardMove*cos(playerTheta);
    playerY = playerY + 2*forwardMove*sin(playerTheta);
  endif

 endfunction
