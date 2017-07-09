% Pre-allocate
drop_ratio = double(zeros(4));
rel_error = double(zeros(4));

% Read picture & Convert it to double
X = imread('mountainous.jpg');
X = im2double(X);

figure(1);
% Drop = 0
[Y, drop] = Compress(X, 0);
Y(:,:) = min(Y(:,:), 1.0);
Y(:,:) = max(Y(:,:), 0.0);
subplot(2, 2, 1);
imshow(Y);
title('Drop ratio = 0 & tol = 0', 'FontSize', 10);
disp(drop);
% NMSE
drop_ratio(1) = drop;
rel_error(1) = sqrt(mean2((Y-X).^2)/(mean2(X).^2));

% Drop = 0.5
[Y, drop] = Compress(X, 0.00629);
Y(:,:) = min(Y(:,:), 1.0);
Y(:,:) = max(Y(:,:), 0.0);
subplot(2, 2, 2);
imshow(Y);
title('Drop ratio = 0.5 & tol = 0.00629', 'FontSize', 10);
disp(drop);
% NMSE
drop_ratio(2) = drop;
rel_error(2) = sqrt(mean2((Y-X).^2)/(mean2(X).^2));

% Drop = 0.7
[Y, drop] = Compress(X, 0.02068);
Y(:,:) = min(Y(:,:), 1.0);
Y(:,:) = max(Y(:,:), 0.0);
subplot(2, 2, 3);
imshow(Y);
title('Drop ratio = 0.7 & tol = 0.02068', 'FontSize', 10);
disp(drop);
% NMSE
drop_ratio(3) = drop;
rel_error(3) = sqrt(mean2((Y-X).^2)/(mean2(X).^2));

% Drop = 0.95
[Y, drop] = Compress(X, 0.139);
Y(:,:) = min(Y(:,:), 1.0);
Y(:,:) = max(Y(:,:), 0.0);
subplot(2, 2, 4);
imshow(Y);
title('Drop ratio = 0.95 & tol = 0.139', 'FontSize', 10);
disp(drop);
% NMSE
drop_ratio(4) = drop;
rel_error(4) = sqrt(mean2((Y-X).^2)/(mean2(X).^2));

% Plot NMSE
figure(2);
plot(drop_ratio, rel_error);
title('NMSE vs Drop Ratio');
xlabel('Drop Ratio');
ylabel('NMSE');
