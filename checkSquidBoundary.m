function [newX,newY] = checkSquidBoundary (X,Y,oceanWidth,oceanHeight,objectRadius)

% in bounds
newX = X;
newY = Y;

% check if x is out of bounds
  if (X > oceanWidth - objectRadius) % right check
    newX = objectRadius;
  elseif (X < objectRadius) % left check
    newX = oceanWidth - objectRadius;
  endif
 % check if y is out of bounds
  if (Y < objectRadius) % top check
    newY = objectRadius;
  elseif (Y > oceanHeight - objectRadius) % bottom check
    newY =  oceanHeight - objectRadius;
  endif

  endfunction
