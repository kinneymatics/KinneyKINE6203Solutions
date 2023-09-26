function [logicalValue] = triangler(inputArray)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if length(inputArray) == 3
    inputArray = sort(inputArray);
    if sum(inputArray(1:2)) >= max(inputArray)
        logicalValue = true;
    else
        logicalValue = false;
    end
else
    error("Input must be a 3-element array. Try another input.")
end
end