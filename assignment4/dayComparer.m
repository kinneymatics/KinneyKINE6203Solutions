function [improvementMatrix] = dayComparer(SubjectID, FirstDay, SecondDay)
% DAYCOMPARER compares data between two days for a given subject to determine improvement.
% [improvementMatrix] = dayComparer(SubjectID, FirstDay, SecondDay) expects
% the user to provide three column vectors as inputs - the first being a
% character data type and the remaining inputs being numeric data types.
% The function first combines each of these column vectors into a table and
% adds a fourth row - the difference between the first inputted day and
% second inputted day, then applies a row-wise conditional statement to the
% table. The conditional statement determines if the difference was 
% positive (greater than zero) and returns only TRUE values. 
% dayComparer then returns an array of the SubjectIDs that showed
% improvements from the first inputted day to second inputted day.
% Function created on 10-17-2023 on MATLAB version 2023a


% Create a table with SubjectID, FirstDay, SecondDay, and the difference.
tempTable = table(SubjectID, FirstDay, SecondDay, SecondDay - FirstDay);

% Determine if there is improvement (positive difference).
isImproved = (tempTable{:, 4} > 0);

% Create an array by selecting rows where improvement exists and only
% returning the SubjectID of the invdividual(s) who improved
improvementMatrix = table2array(tempTable(isImproved, 1));
end


