function [ m ] = trans3( x,y,z )
%TRANS3 Summary of this function goes here
m = [1 0 0 x
     0 1 0 y
     0 0 1 z
     0 0 0 1];
end

