function fishStunned = isFishStunned (lightningX, lightningY, fishX, fishY, hitBox);

% compute the distance between the lightning and the fish
a = lightningX - fishX;
b = lightningY - fishY;

d = sqrt( a^2 + b^2);

  if(d < hitBox)
    fishStunned = 1;
   else
    fishStunned = 0;
   endif

  endfunction
