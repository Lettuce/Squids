function [playerX,playerY,playerTheta] = movePlayer (playerX,playerY,playerTheta,cmd);

  forwardMove = 50;
  thetaMove = pi/12;

  if (cmd == "w" )
    playerX = playerX + forwardMove*cos(playerTheta);
    playerY = playerY + forwardMove*sin(playerTheta);
  endif

  if (cmd == "d" )
    playerTheta = playerTheta+thetaMove;
  endif

  if (cmd == "a" )
    playerTheta = playerTheta-thetaMove;
  endif

 endfunction
