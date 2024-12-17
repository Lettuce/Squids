function [y, fs] = getSound (soundFile)

  [y,fs] = audioread(soundFile);

  endfunction
