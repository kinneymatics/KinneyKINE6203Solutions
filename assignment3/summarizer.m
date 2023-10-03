function [s,d,p,m] = summarizer(numOne,numTwo)
% summarizer - this function accepts two numeric inputs and returns a range
% of summary functions that may be useful for statistical analysis. If the user 
% does not enter a numeric input, the function displays a custom error code.
% This function satisfies Problem 2.
if ~isnumeric(numOne) || ~isnumeric(numTwo) % check if the inputs are NOT of the numeric class
    error('Enter two numbers, dummy!') % if the inputs are not numeric, return an error message
end
s = sum([numOne numTwo]) % find the sum of the two inputs
d = abs(numOne - numTwo) % find the absolute value of the difference between inputs
p = numOne * numTwo % find the product of the two values
m = max([numOne numTwo]) % find the larger value of the two inputs
end