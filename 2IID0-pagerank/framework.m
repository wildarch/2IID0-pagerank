A = load('transition.txt', '-ascii');
C = [];
for i = 1:10
    C(:,i) = frameworkfunction(A, 1);
    i
end

a = 1;
meanarray = [];
standarddeviation = [];
for i = C'
    meanarray(a, :) = mean(i);
    standarddeviation(a, :) = std(i);
    a = a + 1;
end