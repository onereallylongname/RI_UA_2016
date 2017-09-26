function [ A ] = Tlink( invec)
%TLINK Tlink(?,l,d,?)
% Transforma¸c˜ao associada a um elo. Devolve a matriz respetiva e aceita
%os 4 parˆametros de D-H
theta = invec(1);
l = invec(2);
d = invec(3);
alpha = invec(4);
A = rotz(theta)*trans3(l,0,d)*rotx(alpha);
end

