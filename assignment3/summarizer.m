function [s,d,p,m] = summarizer(numOne,numTwo)
% summarizer - this function accepts two numeric inputs and returns a range
% of summary functions that may be useful for statistical analysis. If the user 
% does not enter a numeric input, the function displays a custom error code.
if ~isnumeric(numOne) || ~isnumeric(numTwo)
    error('Enter two numbers, dummy!')
end
s = sum([numOne numTwo])
d = abs(numOne - numTwo)
p = numOne * numTwo
m = max([numOne numTwo])
end