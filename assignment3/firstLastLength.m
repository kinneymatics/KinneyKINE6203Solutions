function [outputArray] = firstLastLength(stringInput)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
if ischar(stringInput)
    first = stringInput(1);
    last = stringInput(length(stringInput));
    stringLength = string(length(stringInput));
    outputArray = [stringLength; first; last];
elseif isstring(stringInput)
    first = stringInput(1);
    last = stringInput(length(stringInput));
    stringLength = string(strlength(stringInput));
    outputArray = [stringLength; first; last];
else
    error('Enter a character array or string as input. Try Again...')
end