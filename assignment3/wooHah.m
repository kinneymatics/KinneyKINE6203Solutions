function wooHah(num1,num2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
value1 = num1 + num2;
if rem(value1,2) == 0
    textOut = "Woo!";
elseif rem(value1,2) == 1
    textOut = "Hah!";
else
    error("Enter two numbers, dummy!")
end
end