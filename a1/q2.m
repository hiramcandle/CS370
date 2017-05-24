disp('Compute answers: ');
for n = 2:50
    if n == 2
        c = -1/9+10/81*1;
        disp(c)
    elseif n == 3
        b = c;
        c = -b + 10/81*1/9;
        disp(c)
    elseif n > 3
        a = b;
        b = c;
        c = -b + 10/81*a;
        disp(c)
    end
end

disp('Correct answers: ');
d = 1/9;
for n = 2:50
    d = d * 1/9; 
    disp(d)
end
