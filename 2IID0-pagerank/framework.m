A = load('transition.txt', '-ascii');
A_preserved = A;
A_pagerank = power_without_teleport(A);
a = 1;
B = []; %an empty matrix to grow
X = []; %Will contain the pagerank for each iteration
V = zeros(length(A), 1);

%edge_indices = randperm(length(A));
uniq = unique(A(:,2));
freq = [uniq,histc(A(:,2),uniq)];
[not_used, I] = sort(freq(:,2));
order = freq(I,:);
A = [A, zeros(length(A),1)];
for i=1:length(order)
    matches = A(:,2) == order(i,1);
    A(:,3) = A(:,3) + (matches*order(i,2));
end

for i=2:length(A)
    A(i,3) = A(i-1,3)+A(i,3);
end

indices = [1:length(A)];
edge_indices = zeros(length(A),1);
for i=1:length(A)
   max = A(length(A(:,1)),3);
   random = randi(max);
   index = sum(A(:,3) < random);
   if index == 0
      index = 1; 
   end
   edge_indices(i) = indices(index);
   val = A(index,3);
   if index > 1
      val = val - A(index-1,3); 
   end
   A(index,:) = [];
   indices(index) = [];
   for j=index:length(A(:,1))
        A(j,3) = A(j,3)-val;
   end
end

A = A_preserved;
while length(B) ~= length(A)
    B(a,:) = A(edge_indices(a),:);
    X(:,a) = power_without_teleport(B); %after every node added, calculate the pageRank and store it in a different row in X
    V(a) = value_based_error(A_pagerank,X(:,a));
    a = a+1;
end