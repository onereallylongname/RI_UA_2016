function [ m ] = rotz( ang )
%ROTZ Summary of this function goes here
m = [cos(ang) -sin(ang) 0 0
    sin(ang) cos(ang) 0 0
    0 0 1 0
    0 0 0 1];
end


