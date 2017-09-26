function [ DH ] = makeDHScara(L)
%MAKEDHSCARA Summary of this function goes here
%   Detailed explanation goes here

%      teta |l    |d   |alfa |el 
DH = [0     0    L(1)  0     % 0 
      0    L(2)   0    0     % 1
      0    L(3)   0    0     % 2
      0     0     0    0     % 3
      0     0   -L(4)  pi    % 4
      0     0   -L(4)  pi ]; % 5
end

