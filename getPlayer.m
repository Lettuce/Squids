function player = getPlayer (bodySize, headSize, netSize)

% 16 points




  % body
   pt1 = [-bodySize;0;1]; %top of neshnine
   pt6 = [0;0;1];
   pt7 = [-bodySize;0;1]; % hip
   pt8 = [-1.4*bodySize; -0.4*bodySize;1]% right foot
   pt9 = [-1.6*bodySize; -0.2*bodySize;1]% right flipper
   pt10 = [-1.4*bodySize; 0.4*bodySize;1]% left foot
   pt11 = [-1.6*bodySize; 0.2*bodySize;1]% left flipper

   pt12 = [0;0.5*bodySize;1]; %hand
   pt13 = [0.7*bodySize; 0.5*bodySize;1];

   % tank
  pt2 = [0.7*bodySize;0;1]; %top of the tank/shoulder
  pt3 = [0.27*bodySize; -0.2 * bodySize;1];
  pt4 = [-0.7*bodySize; -0.2 * bodySize;1];
  pt5 = [-0.7*bodySize;0;1];



   bodyPoints = [pt1,pt2];


  % headsponentials
  headRadius = bodySize/4;
  headPoints = getCircle(headRadius,0);
  T = getTranslate(headRadius+bodySize,0);

 % head = getCircle(headSize,0);
 % T = getTranslate(bodySize,0);
 % headPoints = T*head;

  # body =

  % arm

 # arm =


  % leg

 # leg =

  % hank the

 # tank =

  % inter

 # net =

  % combine

 # player = [headHandle, bodyHandle, legHandle, tankHandle, netHandle];

  player = [headPoints,pt1,pt2,pt3,pt4,pt5,pt6,pt7,pt8,pt9,pt10,pt11];

  endfunction
