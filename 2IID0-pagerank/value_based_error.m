function value_based_error = value_based_error( A,B )
%Calculates the value based error on input vectors A and B, where the first
%is the reference pagerank and the second is the new pagerank
sum = 0;
for i=1:length(A)
    if A(i) ~= 0 && B(i) ~= 0
       error = abs(A(i) - B(i))/A(i);
       sum = sum + error;
    end
end
value_based_error = sum;

