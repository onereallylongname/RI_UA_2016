function [ DH ] = makeDHRRRRR(L)
%MAKEDHRRRRR Summary of this function goes here
%   Detailed explanation goes here



%     teta   |l          |d    |alfa |el 
 DH = [0    0    L(1)      pi/2;
       pi/2 L(2) 0         0;
       0    0    0         pi/2;
       pi   0    L(4)+L(3) pi/2;
       0    L(5) 0         0];






%DH=[0,     0,     L(1), pi/2
%       pi/2,  L(2),  0,    0
%       -pi/2, L(3),  0,    0
%       pi/2,  0,     0,    pi/2
%       0,     0,     L(4), -pi/2
%       0,     -L(5), 0,    0  ];
 end

