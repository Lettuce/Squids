function mouseMotion_callback(src,event)
 % global mouseX;
 % global mouseY;
 % global mousePreviousX;
 % global mousePreviousY;
 % global mouseCmd;
  global playerX;
  global playerY;
  global playerTheta;

  % save old mouse spot
  % mousePreviousX = mouseX;
  % mousePreviousY = mouseY;

  %get the current mouse location
  coords = get(gca, 'CurrentPoint'); %get current mouse coordinates in the plot

  mouseX = coords(1,1);
  mouseY = coords(1,2);

  % save previous mouse chords

  X = mouseX - playerX;
  Y = mouseY - playerY;

  if(X == 0)
    theta = playerTheta;
  else
    theta = atan(abs(Y/X));
  endif

  if( X >= 0 && Y >= 0)
    playerTheta = theta;
  elseif(X <= 0 && Y >= 0)
    playerTheta = pi - theta;
  elseif(X <= 0 && Y <= 0)
    playerTheta = pi + theta;
  elseif(X >= 0 && Y <= 0)
    playerTheta = 2*pi - theta;
  else
    playerTheta = playerTheta;
  endif




  %get cross product of current and previous mouse locations relative to player
 % mouseRotation = (mousePreviousX - playerX) * (mouseY - playerY) - (mouseX - playerX) * (mousePreviousY - playerY);


  % set player rotation command
 % if(mouseRotation > 0)
 %     mouseCmd = "c"; %rotate clockwise
 %  elseif(mouseRotation < 0)
 %     mouseCmd = "a"; %rotate counter-clockwise
 % else
 %     mouseCmd = "n"; % no rotation
%endif

  mousePreviousX = coords(1,1);
  mousePreviousY = coords(1,2);

endfunction

