function level = getLevel()

    global cmd;

    levelLocation = [1000,500];
    % ask a user for level

    levelMessage = cstrcat("Choose The Level 1-9 ");
    levelMessageHandle = text(levelLocation(1),levelLocation(2), levelMessage, 'FontSize', 20, 'Color', [0 0.2 0]);


    while(true)
      if( cmd == '1' || cmd == '2' || cmd == '3' || cmd == '4' || cmd == '5' || cmd == '6' || cmd == '7' || cmd == '8' || cmd == '9')
      level = str2num(cmd);
        break;
      endif
      pause(1);
    endwhile

    delete(levelMessageHandle);
  endfunction
