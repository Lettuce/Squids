function fishStunned = isFishStunned (lightningX, lightningY, fishX, fishY, hitbox);

% compute the distance between the lightning and the fish
a = lightningX - fishX;
b = lightningY - fishY;

d = sqrt( a^2 + b^2);

  if(d < hitbox)
    fishStunned = 1;
   else
    fishStunned = 0;
   endif


  endfunction
