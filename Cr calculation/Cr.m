%Example
fileID = fopen('Example.csv');
x = textscan(fileID,'%f %f %f %f %f %f %f %f %f %f %f %f %s %f','Delimiter',',');
fclose(fileID);
ce = x{1,end-1};
dif = x{1,end};
[N,~] = size(dif); 
J = 20;
s = zeros(J,1);
t = zeros(J,1);
e = zeros(J,1);
sum = 0;
for j = 1:N
    if dif(j) == 1
        s(J) = s(J) + dif(j);
        t(J) = t(J) + 1;
        if strcmp(ce(j) , 'Error')
            e(J) = e(J) + 1;
        end
        continue;
    end
    Y = floor(dif(j)*J) + 1;
    s(Y) = s(Y) + dif(j);
    t(Y) = t(Y) + 1;
    if strcmp(ce(j) , 'Error')
        e(Y) = e(Y) + 1;
    end
end
for k = 1:J
    if t(k)==0
        sum = sum;
    else
        savg = 1 - s(k)/t(k);
        eavg = e(k)/t(k);
        tavg = t(k)/N;
        sum = sum + savg * tavg * eavg;
    end
end
crValue = 1 - sum;
disp(crValue);

