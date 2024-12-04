function fishStunned = isFishStunned (lightningX, lightningY, lightningFlash, fishX, fishY, hitbox);

%  lightningBolts = length(lightningFlash);
%    for (i = 1: lightningBolts)
%        if(lightningFlash(i) == 1)
%          d = getDistance(fishX, fishY, lightningX(i), lightningY(i));
%
%        if(d < hitBoxSize)
%          fishStunned = 1;
%        endif
%
%        endif
%    endfor

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
