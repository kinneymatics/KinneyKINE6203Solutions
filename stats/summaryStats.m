% Define the summaryStats function
function [output] = summaryStats(timedVar)
    meanVal = mean(timedVar, "omitnan");
    stdev = std(timedVar, "omitnan");
    medianVal = median(timedVar, "omitnan");
    stderr = stdev / sqrt(length(timedVar));
    minimum = min(timedVar);
    maximum = max(timedVar);
    output = table(meanVal, stdev, medianVal, stderr, minimum, maximum);
end