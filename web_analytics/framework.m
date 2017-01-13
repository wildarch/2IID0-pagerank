A = load('transition.txt', '-ascii');
% a = 1;
% B = A * 0; %an empty matrix to grow
% X = [];
% while B ~= A
%     randomEdgeNumber = randi(length(A));
%     randomEdge = A(randomEdgeNumber,:);
%     B(randomEdgeNumber,:) = randomEdge;
%     X(b,:) = power_without_teleport(B); %after every node added, calculate the pageRank and store it in a different row in X
% end
value_based_error(A)