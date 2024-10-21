function readKeyboard()


    % Create a figure for the GUI
    f = figure('KeyPressFcn', @(src, event) keypress_callback(event), ...
                'Name', 'Keyboard Reader', ...
                'NumberTitle', 'off', ...
                'MenuBar', 'none', ...
                'Position', [100, 100, 300, 200]); %Set the figure size

     % Display the instructions
     uicontrol('Style', 'text', ...
               'String', 'Press A Key (Press "q" To Quit):', ...
               'Position', [20, 80, 260, 40], ...
               'FontSize', 12);

               disp('Press A Key (Press "q" To Quit):');

      % Wait fot the user to close the figure
      uiwait(f);

      function keypress_callback(event)
        % Callback function that triggers onn key press
        disp(['You Have Pressed: ', event.Key]);

        % Check for 'q' to quit
        if strcmp(event.Key, 'q')
          disp('Quitting...');
          close(f); % Close the figure
        endif

      endfunction

endfunction


      % Create a figure for the GUI
   %   f = figure('KeyPressFcn', @(src, event) keypress_callback(event);
