function doubler(inputArg1)
% doubler - this function takes one numeric input and doubles it 
% That is, it multiplies the numeric input by two. If the user does not
% enter a numeric input, the function displays a custom error code.
if ~isnumeric(inputArg1)
    error("Enter a number, dummy!")
end
inputArg1 * 2
end