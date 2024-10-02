function lineHandle = drawLine (point1, point2, color, width)

  % extract yhr x and y coordinates for the points
  x = [ point1(1) ; point2(1)];
  y = [ point1(2) ; point2(2)];

  % draw the line
  lineHandle = line(x,y);

  %set the color and width
  set(lineHandle, 'Color',color);
  set(lineHandle, 'LineWidth',width);



endfunction
