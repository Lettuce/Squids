function playerBitten = isPlayerBitten (playerX, playerY,teethX,teethY, hitbox)

  % Compute the distance between the Player and the Fish

  a = playerX - teethX;
  b = playerY - teethY;

  d = sqrt( a^2 + b^2);

  if(d<hitbox);
      playerBitten = 1;
   else
      playerBitten = 0;
   endif
endfunction
