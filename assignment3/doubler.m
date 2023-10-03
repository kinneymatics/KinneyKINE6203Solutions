function doubler(inputArg1)
% doubler - this function takes one numeric input and doubles it 
% That is, it multiplies the numeric input by two. If the user does not
% enter a numeric input, the function displays a custom error code.
% This function satisfies Problem 1
if ~isnumeric(inputArg1) % check if the input is NOT of the numeric class (double or integer)
    error("Enter a number, dummy!") % if the input is not a numeric, display an error message
end
inputArg1 * 2 % if the input is a numeric, multiplyu it by 2 and return an output
end