function [ P1] = coor2homo( P )
%COOR2HOMO P(:,3) = [x, y, z]
%   P1(4,:) = [x; y; z; 1]

    P1 = [P'; ones(1,size(P,1))];
        
end
        

