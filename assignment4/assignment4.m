% This file expects custom functions "importfile.m", "genderIsoCalc.m", and
% "dayComparer.m", and file "isok_data_6803.csv"  to be located within the 
% working directory.

% import csv file and create separate column vector for each column of file
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile("isok_data_6803.csv");

% calculate individual and group means of isokinetic data for the across
% the training session
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3);

% use a custom function that returns only the subject IDs of subjects who
% improved from day 1 to 2 or day 2 to 3
day1toDay2 = dayComparer(SubjectID,Day1,Day2);
day2toDay3 = dayComparer(SubjectID,Day2,Day3);

% calculate the average weight-normalized isokinetic strength of the 
% entire group on each day
normDay1mean = mean((Day1/Weight),2);
normDay2mean = mean((Day2/Weight),2);
normDay3mean = mean((Day3/Weight),2);

% determine the maximum length among the arrays
maxLen = max([length(SubjectID), length(Age), length(Gender), length(Weight), ...
    length(Day1), length(Day2), length(Day3)]);

% pad arrays with NaN to make them equal in length
maleIsoIndMeans = [maleIsoIndMeans; NaN(maxLen - length(maleIsoIndMeans), 1)];
femaleIsoIndMeans = [femaleIsoIndMeans; NaN(maxLen - length(femaleIsoIndMeans), 1)];
maleGroupIsoMean = [maleGroupIsoMean; NaN(maxLen - length(maleGroupIsoMean), 1)];
femaleGroupIsoMean = [femaleGroupIsoMean; NaN(maxLen - length(femaleGroupIsoMean), 1)];
day1toDay2 = [day1toDay2; repmat("NaN", maxLen - length(day1toDay2),1)]; % have to use repmat for character data types 
day2toDay3 = [day2toDay3; repmat("NaN", maxLen - length(day2toDay3),1)]; % NaN function returns numerical NaN
normDay1mean = [normDay1mean; NaN(maxLen - length(normDay1mean),1)];
normDay2mean = [normDay2mean; NaN(maxLen - length(normDay2mean),1)];
normDay3mean = [normDay3mean; NaN(maxLen - length(normDay3mean),1)];


% create a table with the padded data
iso_results = table(maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean,...
    day1toDay2, day2toDay3, normDay1mean, normDay2mean, normDay3mean, ...
    'VariableNames', {'MaleIsoIndMeans', 'FemaleIsoIndMeans', 'MaleGroupIsoMean',...
    'FemaleGroupIsoMean', 'day1toDay2', 'day2toDay3', 'normDay1mean', ...
    'normDay2mean', 'normDay3mean'});

% write table to a csv file
writetable(iso_results ,'iso_results.csv');