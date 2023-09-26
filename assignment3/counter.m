function counter(num1,num2)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
order = sort([num1 num2])
[order(1):(order(1)/order(2)):order(2)]'
end