function plotter(xVec,yVec)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
close(allchild(0));
figure
plot(xVec,yVec)
hold on
xlabel("Generic-X (Seconds)")
ylabel("Generic-Y (Meters)")
title("Wonderful Graph")
end