function damageTaken = isDamageTaken (X, Y, damagerX, damagerY, hitBox);

  % Compute the distance between the Player and the Fish

  a = X - damagerX;
  b = Y - damagerY;

  d = sqrt( a^2 + b^2);

  if(d<hitbox)
      isDamaged = 1;
   else
      isDamaged = 0;
   endif
endfunction
