function [newX,newY] = checkFishBoundary (X, Y, oceanHeight, oceanWidth, fishBoundary)

global playerY;
fishExtension = 50;
% if fish is in the ocean do nothing
newX = X;
newY = Y;

  % make sure fishX stays in the ocean
  if(X > oceanWidth - fishBoundary)  % if the squid goes off the right bd
    newX = fishBoundary + fishExtension;
    newY = fishBoundary + playerY;
    %newY = fishBoundary  + rand*(oceanHeight - 2*fishBoundary );
   elseif(X < fishBoundary) % if the squid goes off the left bd
    newX = oceanWidth - fishBoundary;
    newY = Y;
  endif

  % make sure fishY stays in the ocean
  if(Y > oceanHeight - fishBoundary)
    newY = fishBoundary;
    newX = X;
   elseif(Y < fishBoundary)
    newY = oceanHeight - fishBoundary;
    newX = X;
   endif

  endfunction
