function [R, P] = getRP(MM)

L1  = MM(1,1:4);
L2  = MM(2,:);
HS  = MM(3,1);
L   = MM(3,2);
H   = MM(3,3);
DSC = MM(4,1);
DSP = MM(4,2);
DSS = MM(4,3);
DAS = MM(4,4);
OX = 100;
OY = 100;

x = OX + 96 + DSP + DSC/2 - 45/2 + 45/2;
y = OY + 45 + DSS - 15 + L + (30-L)/2;
z = HS + 5 + (H-5)/2;
teta = 0;

P6   =[0  ,L  ,H ];
P7   =[45 ,L ,H ];
P10  =[45 ,30 ,5];

n = (P7-P10)/norm((P7-P10));
s = (P7-P6)/norm((P7-P6));
a = cross(n,s);

P=[x,y,z]';
R = [n' s' a'];

end