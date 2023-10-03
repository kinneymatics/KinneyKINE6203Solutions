function [daysTill,currentAge] = whenIsBday()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
datePrompt = input('Enter your date you were born (e.g., I was born on the 14th): ');
monthPrompt = input('Enter the digit of the month you were born (e.g., I was born in July so I enter 7): ');
yearPrompt = input('Enter the year you were born: ');
birthday = [yearPrompt monthPrompt datePrompt];
birthdayFormatted = datetime(birthday);
todaysDate = datetime;
birthdayNext = datetime([(todaysDate.Year + 1) birthdayFormatted.Month birthdayFormatted.Day]);
daysTill = days(birthdayNext - todaysDate);
currentAge = years(todaysDate.Year - birthdayFormatted.Year);
end