function [P1, T] = transformobj( P, x, y, z, teta )
%TRANSFORMOBJ - transformobj( P, T )
%   T - transformation
%   P - Obj points
%   Output P1 - transformed obj.
    T  =  transform( x, y, z, teta );
    sp = ones(1,size(P,1));
    P  = [P';sp]; 
    P2 = T*P;
    P1 = P2(1:3,:)';
end




