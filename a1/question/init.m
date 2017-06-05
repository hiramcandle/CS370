%%%%%%%%%%%%%%%%
% INSTRUCTIONS %
%%%%%%%%%%%%%%%%
%
% 1. Run init in MATLAB.
% 2. A window with an x-y plane will open on your screen.
% 3. Use your cursor to select various points on the x-y plane (once a point is
%    selected, it does not appear on your screen; rest assured that it has been
%    selected)
% 4. Press enter after having selected all of your points. This will save your
%    points to a file called data.mat, which you can load using the `load`
%    function in MATLAB.
%

% INPUT AND SAVE
figure('position', get(0,'screensize')) % create a fullscreen figure
axes('position', [0, 0, 1, 1]) % setup the axes
axis equal; % Tip: use axis equal to avoid scaling issues


% show picture
% pdata = imread('q5_figure.bmp');
% imsc = imagesc([0 1], [0 1], pdata);

[x,y] = ginput; % get input points from the screen
%v = axis; % store axes scaling for subsequent use
clf;                            % clear figure
close; % close figure
save('data.mat','x','y');

