load('math_uwaterloo.mat');

alpha = 0.85;
[p, iter] = MyPageRank(G, alpha);
[y I] = sort(p, 'descend');
for n = 1:min(length(I), 20)
    disp([num2str(n) ': '  U{I(n)}]);
end
