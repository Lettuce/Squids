function [newX, newY, newFlash] = checkLightningBoundary (X, Y, oceanWidth, oceanHeight, lightningBoundary, lightningFlash);

global playerY;
LightningExtension = 50;

% if lightning is in the ocean do nothing
newX = X;
newY = Y;
newFlash = lightningFlash;

  % make sure lightning stays in the ocean
  if(X > oceanWidth - lightningBoundary)  % if the squid goes off the right bd
    newX = 0;
    newY = 0;
    newFlash = 0;
    %newY = fishBoundary  + rand*(oceanHeight - 2*fishBoundary );
   elseif(X < lightningBoundary) % if the squid goes off the left bd
    newX = 0;
    newY = 0;
    newFlash = 0;
  endif

  % make sure fishY stays in the ocean
  if(Y > oceanHeight - lightningBoundary)
    newY = 0;
    newX = 0;
    newFlash = 0;
   elseif(Y < lightningBoundary)
    newY = 0;
    newX = 0;
    newFlash = 0;
   endif

  endfunction
