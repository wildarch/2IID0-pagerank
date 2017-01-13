A = load('transition.txt', '-ascii');
A_pagerank = power_without_teleport(A);
a = 1;
B = []; %an empty matrix to grow
X = []; %Will contain the pagerank for each iteration
V = zeros(length(A), 1);
random_edge_indices = randperm(length(A));
while length(B) ~= length(A)
    B(a,:) = A(random_edge_indices(a),:);
    X(:,a) = power_without_teleport(B); %after every node added, calculate the pageRank and store it in a different row in X
    V(a) = value_based_error(A_pagerank,X(:,a));
    a = a+1;
end