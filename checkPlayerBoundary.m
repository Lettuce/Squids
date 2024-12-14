function [newX,newY] = checkPlayerBoundary (X,Y,oceanWidth,oceanHeight,objectRadius)

% in bounds
newX = X;
newY = Y;

% check if x is out of bounds
  if (X > oceanWidth - objectRadius) % right check
    newX =  oceanWidth - objectRadius;
  elseif (X < objectRadius) % left check
    newX = objectRadius;
  endif
 % check if y is out of bounds
  if (Y < objectRadius) % top check
    newY = objectRadius;
  elseif (Y > oceanHeight - objectRadius) % bottom check
    newY =  oceanHeight - objectRadius;
  endif

  endfunction
