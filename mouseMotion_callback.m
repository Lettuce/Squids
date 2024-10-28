function mouseMotion_callback(src,event)
  global mouseX;
  global mouseY;
  global mousepreviousX;
  global mousePreviousY;
  global mouseCmd;

  %get the current mouse location
  coords = get(gca, 'CurrentPoint'); %get current mouse coordinates in the plot

  mouseX=coords(1,1);
  mouseY=coords(1,2);

  %get cross product of current and previous mouse locations relative to player
  mouseRotation = getCrossProduct();

  % set player rotation command
  if(mouseRotation > 0) mouseCmd = "c"; %rotate clockwise
    elseif(mouseRotation > 0) mouseCmd = "a"; %rotate counter-clockwise
  else mouseCmd = "n"; % no rotation
endif

% save old mouse spot
mousePreviousX = mouseX;
mousePreviousY = mouseY;

endfunction

