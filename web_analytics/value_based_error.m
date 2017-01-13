function [ value_based_error ] = value_based_error( A )
%Calculates the value based error on input matrix A, where the first
%collumn is the actual pagerank and the second is the pagerank calculated
sum = 0;
for a = A'
    if a ~= [0 ; 0]
       error = abs(a(1,1) - a(2,1))/a(2,1);
       sum = sum + error;
    end
end
value_based_error = sum;

