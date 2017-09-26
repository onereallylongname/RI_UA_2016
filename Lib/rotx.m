function [ m ] = rotx( ang )
%ROTX Summary of this function goes here
m = [1 0 0 0
    0 cos(ang) -sin(ang) 0
    0 sin(ang) cos(ang)  0
    0 0 0 1];

end

