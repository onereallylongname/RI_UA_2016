function [  ] = setobjt(h, obj, objnum, kk , k)
%SETOBJT Summary of this function goes here
%   Detailed explanation goes here

 A = eye(4);
for j =1: size ( obj(kk).AAA(:,:,:,k) ,3)-1
    A = A * obj(kk).AAA(:,:,j,k);
end
obj(kk).AAA(1:3,4,j+1,k) = [0;0;0];
A = A*obj(kk).AAA(:,:,j+1,k);
P = homo2coor(A*coor2homo(obj(objnum).P(:,:,1)));
set (h(objnum),'Vertices', P);

end

