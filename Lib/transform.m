function [ T ] = transform( x, y, z, teta )
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here

for n = 1:max(size(x))
    T(:,:,n) = rotz(teta(n));
    T(1:3,4,n) = [x(n), y(n), z(n)]';
end
end

