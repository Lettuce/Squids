function fishStunned = isFishStunned (lightning, lightningFlash, fishX, fishY, hitbox);

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
[rows,columns,flashes] = size(lightning);
for(k = 1: lightningMaxFlashes)
  fishStunned = 0;
  for(j = 1: columns)
    for(i = 1: rows)
      if(lightningFlash)
        a = lightning(i,j,k) - fishX;
        b = lightning(i,j,k) - fishY;
        d = sqrt( a^2 + b^2);

        if(d < hitbox)
          fishStunned = 1;
        endif
      endif
    endfor
  endfor
endfor

  endfunction
