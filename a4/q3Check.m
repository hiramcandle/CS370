G = sparse(11, 11);
G(1, 4) = 1;
G(2, 3) = 1;
G(2, 4) = 1;
G(2, 5) = 1;
G(2, 6) = 1;
G(2, 7) = 1;
G(2, 8) = 1;
G(2, 9) = 1;
G(3, 2) = 1;
G(4, 5) = 1;
G(5, 6) = 1;
G(5, 7) = 1;
G(5, 8) = 1;
G(5, 9) = 1;
G(5, 10) = 1;
G(5, 11) = 1;
G(6, 5) = 1;
[P, d, p, e] = ConstructPdpe(G);
P
d
p
e