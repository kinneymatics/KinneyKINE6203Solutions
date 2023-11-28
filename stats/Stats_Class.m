% Load the data from the NFL Combine and pro day data file
% using the read table tool.
combineData = readtable('NFL_combine.csv');


% View a summary of the data in the table using the summary 
% function. 
summaryCombine = summary(combineData);

% Calculate summary statistics for the timed variables in the
% database using appropriate functions. (Shuttle, 40, 3 cone)

% Calculate summary statistics for the Shuttle variable
shuttleSummary = summaryStats(combineData.Shuttle);
FortyDashSummary = summaryStats(combineData.x40Yard);
ThreeConeSummary = summaryStats(combineData.x3Cone);


% Create a histogram showing all three distributions for these
% timed variables. Make sure to label your figure and add a legend. 
subplot(3,1,1);
histogram(combineData.Shuttle)
title('Histogram of Shuttle Run Times at NFL Combine')

subplot(3,1,2);
histogram(combineData.x40Yard)
title('Histogram of 40 yd Dash at NFL Combine')

subplot(3,1,3);
histogram(combineData.x3Cone)
title('Histogram of 3 Cone Drill at NFL Combine')

figure 
histogram(combineData.Shuttle)
hold on
histogram(combineData.x40Yard)
hold on 
histogram(combineData.x3Cone)


% Create a scatter plot in a new figure showing the relationship 
% between 40 yard dash performance and shuttle time).
figure
scatter(combineData.x40Yard, combineData.Shuttle)

% Calculate the correlation coefficient between these two variables.
corrFortyShuttle = corrcoef(combineData.x40Yard, combineData.Shuttle,"Rows","complete");


% If your correlation coefficient indicates a strong relationship,
% fit a linear model to your data and calculate the coefficient of
% variation (r-squared). Plot your model on your scatterplot. 
lmFortyShuttle = fitlm(combineData.x40Yard, combineData.Shuttle);
plot(lmFortyShuttle)
% Run a t-test to determine if there is a difference in means between
% the 40 yard dash and the shuttle run. 
[h,p,ci,stats] = ttest(combineData.x40Yard,combineData.Shuttle)

