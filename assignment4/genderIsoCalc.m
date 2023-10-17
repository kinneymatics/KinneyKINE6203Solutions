function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender, Day1, Day2, Day3)
% GENDERISOCALC calculates individual means and group means for males and females
% [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] =
% genderIsoCalc(Gender, Day1, Day2, Day3) expects the user to provide 4
% column vectors - the first being categorical or character data type, the
% rest being of numerica data type. genderIsoCalc will then filter the
% data based on the categorical variable into the appropriate groups (Male
% or Female), combine the numeric data into a table, calculate each
% individual's average isokinetic strength across all training sessions, then calculate each
% group's average isokinetic strength across all individuals and all
% training sessions. The function provides four outputs - male and female
% inidividual isokinetic strength averages across all training sessions,
% male and female group isokinetic strength averages across all individuals
% and training sessions. 
% Function created on 10-17-2023 on MATLAB version 2023a

% create a logical index for males and females
isMale = Gender == "M";
isFemale = Gender == "F";

% extract data for males and females
maleData = [Day1(isMale) Day2(isMale) Day3(isMale)];
femaleData = [Day1(isFemale) Day2(isFemale) Day3(isFemale)];

% calculate individual row-wise means for males and females
maleIsoIndMeans = mean(maleData, 2);
femaleIsoIndMeans = mean(femaleData, 2);

% calculate group means for males and females
maleGroupIsoMean = mean(maleIsoIndMeans);
femaleGroupIsoMean = mean(femaleIsoIndMeans);
end
