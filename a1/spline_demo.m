%clear figure
clf;

%create some arbitrary data points
y = [4 8 7 5 1 2 9 7 8 9 0];
N = length(y);

%index the points for t
t = 1:N;

%construct a cubic spline "object", y_cs
%via matlab's "csape" routine.
y_cs = csape(t,y, 'variational'); 

%subdivide the intervals by 3 
%similar to course notes 3.1/3.2
N = length(t);
tref = zeros(1,3*(N-1)+1);
for k = 1:N-1
    i = 3*(k-1)+1;
    dt = t(k+1) - t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/3 ;
    tref(i+2) = t(k)+2*dt/3;
end
tref(3*(N-1)+1) = t(N);

%evaluate the spline curve y_cs at
%the finer spacing given by tref
%and store into vector yy
yy = ppval(tref,y_cs);

%plot the results
plot(t,y,'b-','LineWidth',4) %plot piecewise linear
hold on; %retain current plot for adding more
plot(tref,yy, 'r-', 'LineWidth',4); %plot piecewise cubic
plot(t,y,'o', ... %plot points alone
    'MarkerSize',10, ...
    'MarkerEdgeColor','g', ...
    'MarkerFaceColor','g');


