function animate(t,P)
%
% Plot the trajectory of the pursuer and target.
%
% t is the vector of times
% P is the vector of (6d) with 4 points
%
figure(1); clf;
n = length(t);

xmin=min(P(:,1)); xmax=max(P(:,1));
ymin=min(P(:,2)); ymax=max(P(:,2));
zmin=min(t); zmax=max(t);

% make minimums and maximums just a bit bigger - looks better
xmin=xmin-0.1*(xmax-xmin); xmax=xmax+0.15*(xmax-xmin);
ymin=ymin-0.1*(ymax-ymin); ymax=ymax+0.15*(ymax-ymin);
zmin=zmin-0.1*(zmax-zmin); zmax=zmax+0.15*(zmax-zmin);

if zmax==zmin, zmin=-1; zmax=1; end;

% plot the first points of both the target and the pursuer
% TH = animatedline(P(1,4),P(1,5),t(1), 'color', 'b', 'marker', 'x', 'linewidth',2,'markersize',12);
% PH = animatedline(P(1,1),P(1,2),t(1), 'color', 'r', 'marker', 'o', 'linewidth',2,'markersize',9);
TH = animatedline(P(1,4),P(1,5),t(1), 'color', 'b', 'linewidth',2);
PH = animatedline(P(1,1),P(1,2),t(1), 'color', 'r', 'linewidth',2);
view(-37.5,20);
axis([xmin xmax ymin ymax zmin zmax]);

% let the chase begin - animation
for s = 1:n
  Tx=P(s,4); Ty=P(s,5); Tz=t(s);
  Px=P(s,1); Py=P(s,2); Pz=t(s);
  addpoints(TH, Tx, Ty, Tz);
  addpoints(PH, Px, Py, Pz);
  drawnow;
end



