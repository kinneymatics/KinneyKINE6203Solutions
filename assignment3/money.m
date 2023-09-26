function money(quarters,dimes,nickels,pennies)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

monies = [quarters*.25 dimes*.10 nickels*.05 pennies*.01];
total = sum(monies);
end