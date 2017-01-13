A = load('transition.txt', '-ascii');
a = 1;
b = 1;
B = []; %an empty matrix to grow
X = [];
while length(B) ~= length(A)
    randomEdgeNumber = randi(length(A));
    randomEdge = A(randomEdgeNumber,:);
    B(a,:) = randomEdge;
    a = a+1;
    X(b,:) = power_without_teleport(B); %after every node added, calculate the pageRank and store it in a different row in X
    b = b + 1;
end
value_based_error(A)