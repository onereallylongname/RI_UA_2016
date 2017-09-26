function [ PPP ] = changecoord( obj1,obj2 )
%CHANGECOORD changecoord( obj1,obj2 )
%   Changes obj1's coordinates to obj2's coordenate system

PPP = obj2.T\coor2homo(obj1);

end

