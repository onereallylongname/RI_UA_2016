function [ Qm ] = Multi_invkinScara(P,L,n)
%MULTI_INVKINRR Summary of this function goes here
%   Detailed explanation goes here
    
    for n=1:size(P,2)
        x = P(1,n);
        y = P(2,n);
        z = P(3,n);
        alf = P(4,n);
        Qm(:,:,n)=invkinScara0(x,y,z,alf,L,n); 
    end

end

